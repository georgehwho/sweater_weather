require 'rails_helper'

describe WeatherFacade, :vcr do
  describe 'class methods' do
    context '.get_forecast' do
      it 'happy path: returns current weather, daily weather, and hourly weather' do
        forecast = WeatherFacade.get_forecast('denver,co')

        expect(forecast.id).to eq(nil)

        expect(forecast.current_weather).to be_an_instance_of(Hash)
        expect(forecast.current_weather).to have_key(:datetime)
        expect(forecast.current_weather).to have_key(:sunrise)
        expect(forecast.current_weather).to have_key(:sunset)
        expect(forecast.current_weather).to have_key(:temperature)
        expect(forecast.current_weather).to have_key(:feels_like)
        expect(forecast.current_weather).to have_key(:humidity)
        expect(forecast.current_weather).to have_key(:uvi)
        expect(forecast.current_weather).to have_key(:visibility)
        expect(forecast.current_weather).to have_key(:conditions)
        expect(forecast.current_weather).to have_key(:icon)

        expect(forecast.daily_weather).to be_an_instance_of(Array)
        expect(forecast.daily_weather[0]).to have_key(:date)
        expect(forecast.daily_weather[0]).to have_key(:sunrise)
        expect(forecast.daily_weather[0]).to have_key(:sunset)
        expect(forecast.daily_weather[0]).to have_key(:max_temp)
        expect(forecast.daily_weather[0]).to have_key(:min_temp)
        expect(forecast.daily_weather[0]).to have_key(:conditions)
        expect(forecast.daily_weather[0]).to have_key(:icon)

        expect(forecast.hourly_weather).to be_an_instance_of(Array)
        expect(forecast.hourly_weather[0]).to have_key(:time)
        expect(forecast.hourly_weather[0]).to have_key(:temperature)
        expect(forecast.hourly_weather[0]).to have_key(:conditions)
        expect(forecast.hourly_weather[0]).to have_key(:icon)
      end

      it 'sad path: returns invalid location if location is empty' do
        forecast = WeatherFacade.get_forecast('')

        expect(forecast).to be_an_instance_of(String)
        expect(forecast).to eq('Invalid Location')
      end
    end
  end
end