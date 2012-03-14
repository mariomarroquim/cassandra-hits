# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Cluster
  def self.call(env)
    session = env["rack.session"]
    session["dados_grafico"] ||= []

    if env["PATH_INFO"] == "/cluster/hit"
      cassandra = Cassandra.new("CassandraHits", SERVIDORES)
      cassandra.insert("Hits", Time.now.to_f.to_s, {"teste" => "teste"})
      [200, {"Content-Type" => "text/html"}, ["Ok"]]

    elsif env["PATH_INFO"] == "/cluster/hits"
      cassandra = Cassandra.new("CassandraHits", SERVIDORES)
      session["dados_grafico"] << [Time.now.to_f, hits_do(cassandra)]
      saida = session["dados_grafico"].collect{|hit| "[#{hit[0]},#{hit[1]}]"}.join(",")
      [200, {"Content-Type" => "text/html"}, ["[#{saida}]"]]

    elsif env["PATH_INFO"] == "/cluster/distribuicao"
      itens_servidores = []
      SERVIDORES.each_with_index do |servidor, index|
        cassandra = Cassandra.new("CassandraHits", servidor)
        itens_servidores << "{label: 'Servidor ##{index + 1}', data: #{hits_do(cassandra)}}"
      end
      [200, {"Content-Type" => "text/html"}, ["[#{itens_servidores.join(',')}]"]]

    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end

  def self.hits_do(servidor)
    hits_servidor = 0
    servidor.each_key("Hits"){|chave| hits_servidor += 1}
    hits_servidor
  end
end
