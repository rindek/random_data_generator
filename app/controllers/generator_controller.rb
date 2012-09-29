class GeneratorController < ApplicationController
  def index

  end

  def generate
    Faker::Config.locale = params[:locale].to_sym
    @output = []
    params[:how_many].to_i.times do 
      @output << %[INSERT INTO #{params[:table]} (#{column_names(params[:columns])}) VALUES (#{values(params[:types])});]
    end
  end

  def column_names(columns)
    columns.map{|c| "`#{c}`"}.join(", ")
  end

  def values(types)
    values = []
    types.each do |t|
      klass = t.gsub(/\..+/, '').capitalize
      fun = t.gsub(/^.+\./, '')

      values << "Faker::#{klass}".constantize.send(fun)
    end
    values.map{|v| %["#{v}"]}.join(", ")
  end
end