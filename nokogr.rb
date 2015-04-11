require 'rubygems'
require 'open-uri'
require 'nokogiri'

require 'mecab'


def get_html( url )
	doc = Nokogiri::HTML( open( url ) )
	return doc
end

class Document
	@title
	@content
	@url

	def open_html( url )
		@doc = Nokogiri::HTML( open( url ) )

		if @doc != nil 
			@title = @doc.title
			@url = url	
		end
	
		return @doc
	end	

	def get_title
		return @title
	end

end


def foo
#doc.xpath( '//p/a' ).each do |node|
#  pタグを見付しだい中身をnodeに入れる
#	puts node.text
#end
#

mecab = MeCab::Tagger.new()

#pタグで且つclass="ynDetailText"であるものをすべてnodeに入れる
#なぜかaタグがない状態じゃないとうまくいかない
doc.xpath( '//p[@class="ynDetailText"]' ).each do |node|
	m_node = mecab.parseToNode(node.text.to_s)

	while m_node do
			puts "#{m_node.surface}\t#{m_node.feature}"#.encode("UTF-8","EUC-JP", :invalid => :replace, :undef => :replace, :replace => '?' )
			m_node = m_node.next
	end		
	#puts node.text
end

end

doc = Document.new

doc.open_html("https://www.google.co.jp")
p doc.get_title



