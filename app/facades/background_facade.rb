require 'ostruct'

class BackgroundFacade
  class << self
    def get_background(location)
      background = UnsplashService.get_image(location)
      return 'Location Invalid' if background[:results].empty?

      OpenStruct.new(
        id: nil,
        image: {
          location: location,
          image_url: background[:results][0][:urls][:regular],
          credit: {
            source: 'unsplash.com',
            author: background[:results][0][:user][:username],
            logo: background[:results][0][:user][:profile_image][:medium]
          }
        }
      )
    end
  end
end