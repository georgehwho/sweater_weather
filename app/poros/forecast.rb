class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @current_weather = data[:current]
    @daily_weather = data[:daily][0..4]
    @hourly_weather = data[:hourly][0..7]
  end
end