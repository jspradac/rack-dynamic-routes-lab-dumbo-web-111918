class Application



  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match("/items/")

      item = req.path.split("/items/").last
      Item.all.each do |i|
        if i.name == item
          resp.write i.price
        else
          resp.write "Item not found"
          resp.status = 404
        end
      end
    else
      resp.write "Whoops"
      resp.status = 400
    end
    resp.finish
  end
end
