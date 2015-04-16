require "sinatra"

get "/" do
  erb :index
end

post "/submit" do

  wwd = Wwd.new(params)
  @outcome = wwd.response
  erb :results
end

class Wwd
  def initialize(params)
    @reu = params["reu"]
    @bbgc = params["bbgc"]
    @mat = params["mat"]
    @day = Date.today.strftime("%A")
  end

  def response
    if reu? && dancer? && !bbgc?
      return "Since it's Thursday and Reu is going, you're wwd'ing at Dancer."
    elsif reu? && dancer? && bbgc?
      return "Since it's Thursday and Reu is bringing BBGC, you're wwd'ing at Dancer and then being dragged to Max Fish to break some legs."
    elsif mat?
     return "Mat is going, so you're wwd'ing at Tile bar."
    else
      return "You're wwd'ing at Library."
    end
  end

  private

  def reu?
    @reu == "1"
  end

  def mat?
    @mat == "1"
  end

  def bbgc?
    @bbgc == "1"
  end

  def dancer?
    @day == "Thursday"
  end
end
