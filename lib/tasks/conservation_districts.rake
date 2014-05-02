require 'rgeo/shapefile'

namespace :conservation_districts do
  desc "Load Conservation Districts into database"
  task :load => :environment do

    ConservationDistrict.destroy_all
    shpfile = "#{Rails.root}/lib/assets/SNeighborhoodConservationDistricts/NeighborhoodConservationDist.shp"
    
    RGeo::Shapefile::Reader.open(shpfile, {:srid => -1}) do |file|
      puts "File contains #{file.num_records} records"
      file.each do |n|
         record = n.attributes
         ConservationDistrict.create(:name => record["Name"], 
                                    :ordinance => record["Ordinance"],
                                    :ordinance_date => record["OrdinanceD"],
                                    :shape_leng => record["Shape_Leng"],
                                    :shape_area => record["Shape_Area"], 
                                    :geom => n.geometry)
      end
    end
  end

  desc "Empty Conservation Districts table"  
  task :drop => :environment  do |t, args|
    ConservationDistrict.destroy_all
  end

end
