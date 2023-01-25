Blueprinter.configure do |config|
  config.datetime_format = lambda { |datetime|
    datetime.nil? ? datetime : datetime.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
  }
end
