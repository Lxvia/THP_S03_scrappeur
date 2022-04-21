require 'pry'
require 'nokogiri'
require 'open-uri'



def scrapping
    html_data = URI.open('https://coinmarketcap.com/all/views/all/').read
    page = Nokogiri::HTML(html_data)
    names = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]")
    price = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td/div/a/span")
    crypto_names = Array.new
    crypto_values = Array.new
    crypto_names_values = Array.new

    names.each do |names|
        crypto_names << names.text
    end
    price.each do |price|
        crypto_values << price.text.delete('$,').to_f
    end

    for i in 0..crypto_values.length-1
        crypto_names_values << {crypto_names[i] => crypto_values[i]}
    end

    puts crypto_names_values 

    return crypto_names_values
end

scrapping
