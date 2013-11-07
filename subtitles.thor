require 'open-uri'
require 'net/http'
require 'nokogiri'
require 'debugger'
class Subtitles < Thor
  desc "searcher tal cual se busca en subdivx", "regexp para encontrar la release de la scene"
  def searcher(subtitulo_a_buscar,release = '.+', search_regexp = /thesubfactory|argenteam/mi )
    system("rm -f bajar*")
    system("rm -f temp/*.srt")
    system("rm -f *.srt")
    release_regexp = Regexp.new(release,'i')


    sanatize_search = subtitulo_a_buscar.gsub("\ ", '+')
    doc =Nokogiri::HTML(open( "http://www.subdivx.com/index.php?buscar=#{sanatize_search}&accion=5&masdesc=&subtitulos=1&realiza_b=1"))
    texto_descripcion = doc.css('div#buscador_detalle_sub')
    download_links = doc.css('div#buscador_detalle_sub_datos a[rel=nofollow]')
    link_hash = Hash[texto_descripcion.zip(download_links)]
    links_to_download = buscar_potables(link_hash,search_regexp,release_regexp)
    download(links_to_download)
    clean_directory
  end

  def buscar_potables(hash_of_links_with_description,search_regexp,release_regexp)
    links_potables = []
    hash_of_links_with_description.each do |texto, link|
      if texto.content.match(search_regexp) && texto.content.match(release_regexp)
        links_potables.push(link.values[2])
      end
    end
    links_potables
  end

  def download(links)
    links.each do |link|
      system("wget '#{link}' ")
    end
  end

  def clean_directory
    files = Dir['*']
    files.each do |file|
      system("unrar e '#{file}'")
      system("unzip '#{file}'")
    end
    system("rm -r bajar*")
  end
end
