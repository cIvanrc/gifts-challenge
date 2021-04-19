# frozen_string_literal: true

# Handles the schools controller
class Api::V1::SchoolsController < ApplicationController
  def create
    school = School.new(school_params)

    if school.save
      render json: school, status: :created
    else
      render json: { errors: school.errors }, status: :unprocessable_entity
    end
  end

  def update
    school = School.find(params[:id])

    if school.update(school_params)
      render json: school, status: :accepted
    else
      render json: { errors: school.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    school = School.find(params[:id])

    if school.destroy
      render json: { message: 'School deleted successfully' }, status: :accepted
    else
      render json: { errors: school.errors }, status: :unprocessable_entity
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :address)
  end
end
