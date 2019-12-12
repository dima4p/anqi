# Model Model defines Collection's Model
#
class Model
  # model types
  MODEL_STD = 0
  MODEL_CLOZE = 1

  extend ActiveModel::Translation
  # include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :vers
  attr_accessor :name
  attr_accessor :tags
  attr_accessor :did
  attr_accessor :usn
  attr_accessor :req
  attr_accessor :flds
  attr_accessor :sortf
  attr_accessor :latexPre
  attr_accessor :tmpls
  attr_accessor :latexPost
  attr_accessor :type
  attr_accessor :id
  attr_accessor :css
  attr_accessor :mod

  def initialize(attributes = {})
    set_defaults
    attributes ||= {}
    attributes.each do |attr, value|
      send "#{attr}=", value
    end
  end

  private

  def set_defaults
    @sortf = 0
    @did = 1
    @latexPre = "\\documentclass[12pt]{article}\n\\special{papersize=3in,5in}\n\\usepackage[utf8]{inputenc}\n\\usepackage{amssymb,amsmath}\n\\pagestyle{empty}\n\\setlength{\\parindent}{0in}\n\\begin{document}\n"
    @latexPost = "\\end{document}"
    @mod = 0
    @usn = 0
    @vers = []
    @type = MODEL_STD
    @css = ".card {\n font-familiy: arial;\n font-size: 20px;\n text-align: left;\n color: black;\n background-color: white;\n}"
  end
end
