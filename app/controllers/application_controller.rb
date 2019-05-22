class ApplicationController < ActionController::Base

  helper :layout
  include AuthenticationHelper

  before_action :set_locale

  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  protected

  def current_ability
    @current_ability ||= Ability.new current_user
  end

  private

  def fix_wg_hash
    return unless params[:grid]
    params.permit!
    params[:grid] = params.to_unsafe_hash[:grid]
  end

  def set_locale    # rubocop:disable Metrics/AbcSize
    I18n.locale =
      if params[:locale] and I18n.available_locales.include? params[:locale].to_sym
        params[:locale]
      else
        preferred_language
      end
    logger.debug "ApplicationController@#{__LINE__}#set_locale locale is #{I18n.locale.inspect}" if logger.debug? # rubocop:disable Metrics/LineLength
  end

  def set_wg_filter
    @wg_filter = params[:grid]&.[](:f) || {}
  end

  def user_preferred_languages
    request.headers['Accept-Language'].split(',').collect do |l|
      l += ';q=1.0' unless l =~ /;q=\d+\.\d+$/
      l.split(';q=')
    end.sort do |x, y|
      raise 'Not correctly formatted' unless x.first =~ /^[a-z\-]+$/i
      y.last.to_f <=> x.last.to_f
    end.collect do |l|
      l.first.downcase.gsub(/-[a-z]+$/i) { |x| x.upcase }
    end
  rescue # Just rescue anything if the browser messed up badly.
    []
  end

  def preferred_language
    (user_preferred_languages & I18n.available_locales.map(&:to_s)).first || I18n.default_locale
  end

end
