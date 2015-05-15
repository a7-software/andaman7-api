module Jekyll
  class VerbClass < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
        case context[@text]
            when 'GET'
              return 'info'
            when 'POST'
              return 'success'
            when 'PUT'
              return 'warning'
            when 'DELETE'
              return 'danger'
            else
              return ''
        end
    end
  end
end

Liquid::Template.register_tag('verbclass', Jekyll::VerbClass)