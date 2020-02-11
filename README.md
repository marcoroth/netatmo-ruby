# Netatmo

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/netatmo`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'netatmo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install netatmo

## Usage

```ruby

client = Netatmo::Client.new

station_data = client.get_station_data
# => #<Netatmo::Weather::StationData @devices=[...] @user=#<Netatmo::User> ...>

station_data.devices

# => [
#      #<Netatmo::Weather::BaseStation @id="00:11:22:00:11:22", @modules=[...] ...>,
#      #<Netatmo::Weather::BaseStation @id="12:23:34:45:56:67", @modules=[...] ...>
#    ]


base_station = station_data.devices.first
# => #<Netatmo::Weather::BaseStation @id="00:11:22:00:11:22", @code="NAMain", @data_types=["Temperature", "CO2", "Humidity", "Noise", "Pressure"], @modules=[...]>


base_station.modules
# => [
#      #<Netatmo::Weather::OutdoorModule @code="NAModule1", @data_types=["Temperature", "Humidity"], ...>,
#      #<Netatmo::Weather::WindGauge @code="NAModule2", @data_types=["Wind"], ...>,
#      #<Netatmo::Weather::IndoorModule @code="NAModule4", @data_types=["Temperature", "CO2", "Humidity"], ...>,
#      #<Netatmo::Weather::RainGauge @code="NAModule3", @data_types=["Rain"], ...>
#    ]

outdoor = base_station.modules.first

# =>  #<Netatmo::Weather::OutdoorModule
#       @id="11:22:33:44:55:66",
#       @code="NAModule1",
#       @data_types=["Temperature", "Humidity"],
#       @module_name="Module",
#       @reachable=true,
#       @firmware=44,
#       @last_setup=2014-12-24 21:57:28 +0100,
#       @last_message=2020-02-11 10:49:33 +0100,
#       @last_seen=2020-02-11 10:49:27 +0100,
#       @rf_status=66,
#       @battery_vp=5440,
#       @battery_percent=77,
#       @battery_status=#<Netatmo::BatteryStatus::OutdoorBatteryStatus @value=5440>,
#       @humidity=#<Netatmo::DashboardData::Humidity @time=2020-02-11 10:48:36 +0100, @value=62.0, @unit="%">,
#       @temperature=#<Netatmo::DashboardData::Temperature @time=2020-02-11 10:48:36 +0100, @value=13.6, @min=7.6,
#       @max=13.6, @min_date=2020-02-11 07:12:25 +0100, @max_date=2020-02-11 10:48:36 +0100,
#       @trend=#<Netatmo::Util::TempTrend @value=1>,
#       @unit="°C">
#     >

outdoor.temperature?
# => true

outdoor.temperature
# => #<Netatmo::DashboardData::Temperature @value=13.6, @min=7.6, @max=13.6, @unit="°C", @time=2020-02-11 10:48:36 +0100, @trend=#<Netatmo::Util::TempTrend @value=1>, ...>

outdoor.noise?
# => false

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcoroth/netatmo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
