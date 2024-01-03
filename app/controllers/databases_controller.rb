class DatabasesController < ApplicationController
  def index
    @databases = Database.all.order(:id)
  end

  def new
    @database = Database.new
    @faker_types = [Faker::Creature::Cat, Faker::Creature::Dog, Faker::Creature::Horse]
  end

  def create
    Rails.logger.info(params)
    faker_class = params.dig(:database, :type).safe_constantize
    database_name = faker_class.name
    Database.create(name: database_name, table_count: rand(1000), row_count: rand(100_000))
    redirect_to databases_path
  end
end