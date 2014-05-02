class CreateConservationDistricts < ActiveRecord::Migration
  def change
    create_table  :conservation_districts do |t|
        t.string    :name
        t.string    :ordinance
        t.string    :ordinance_date
        t.float     :shape_leng
        t.float     :shape_area
        t.geometry  :geom
        t.timestamps
    end
  end
end
