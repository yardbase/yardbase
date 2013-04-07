namespace :assets do
  task :silence_mongoid do
    module ::Mongoid
      def load!(config_file)
        puts "Skipping connection to Mongo DB"
      end
    end
  end

  task :environment => :silence_mongoid
end
