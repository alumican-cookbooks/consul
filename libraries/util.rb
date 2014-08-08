
class Chef
  class Recipe
    def consul_helper
      ConsulHelper.new(self.node)
    end
  end

  class Node
    def consul_helper
      ConsulHelper.new(self.node)
    end
  end
end

class ConsulHelper
  def initialize(node)
    @node = node
  end

  def ipaddresses_ipv4
    @node['network']['interfaces'].values.map do |i|
      i['addresses'].select do |address, detail|
        "inet".include?(detail['family'])
      end
    end.flatten
  end

  def private_ipaddresses_ipv4
    ipaddresses_ipv4.select do |address|
      address.keys.first =~ /^192\.168\.[0-9]+\.[0-9]+/
    end.collect do |address|
      address.keys.first
    end
  end
end

