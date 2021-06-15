require 'ostruct'

class BackgroundFacade
  class << self
    def get_background(location)
      background = UnsplashService.get_image(location)
      return background if background.class == String

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