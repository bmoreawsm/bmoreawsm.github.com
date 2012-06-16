module Jekyll
  class NavLinkTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @link = markup.split(' ').first
      @text = markup.split(' ').slice(1..-1).join(' ')
    end
    
    def render(context)
      url = context['page']['url']
      css_class = url == @link ? 'active' : ''
      puts "Compare #{url} vs #{@link} = #{url == @link}"
      %{<li class="#{css_class}"><a href="#@link">#@text</a></li>}
    end
  end
end

Liquid::Template.register_tag('nav_link', Jekyll::NavLinkTag)
