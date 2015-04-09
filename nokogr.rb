require 'rubygems'
require 'open-uri'
require 'nokogiri'

require 'mecab'


doc = Nokogiri::HTML( open( "http://headlines.yahoo.co.jp/hl?a=20150201-00002622-bengocom-soci" ) )
#doc = Nokogiri::HTML( open( "http://www.yahoo.co.jp" ) )

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


#puts doc.at('body').content

#puts doc.body



