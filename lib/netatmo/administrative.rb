# frozen_string_literal: true

module Netatmo
  class Administrative
    attr_accessor :unit, :windunit, :pressureunit, :lang, :reg_locale, :country, :feel_like

    def initialize(data)
      self.unit = Netatmo::Util::Unit.value(data['unit'])
      self.windunit = Netatmo::Util::Windunit.value(data['windunit'])
      self.pressureunit = Netatmo::Util::Pressureunit.value(data['pressureunit'])
      self.feel_like = Netatmo::Util::FeelLike.value(data['feel_like_algo'])
      self.lang = data['lang']
      self.reg_locale = data['reg_locale']
      self.country = data['country']
    end
  end
end
