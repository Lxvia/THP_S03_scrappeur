require 'pry'
require 'nokogiri'
require 'open-uri'





def get_townhall_email(townhall_url)

    url = URI.open(townhall_url).read
    page = Nokogiri::HTML(url)

    name = page.xpath("/html/body/div/main/section[1]/div/div/div/h1")
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
    name_email = {name.text[0..-9] => email.text}
   
end

def get_townhall_urls
    urls_array = []
    url = URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html').read
    page = Nokogiri::HTML(url)
    townhall_urls = page.xpath("//table//tr[2]//a[@class='lientxt']")
    townhall_urls.each do |url|
        urls_array << url.to_s.split('"')[3][1..-1].insert(0, 'https://www.annuaire-des-mairies.com/')
    end  
    return urls_array  
end


def perform
    final_list = []
    urls_array = get_townhall_urls
    get_townhall_urls.each do |url|
      final_list << get_townhall_email(url)
    end
    puts final_list
end

perform