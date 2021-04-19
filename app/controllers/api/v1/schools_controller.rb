# frozen_string_literal: true

# Handles the schools controller
class Api::V1::SchoolsController < ApplicationController
  def index
    @schools = School.all
    render json: @schools
  end
end
