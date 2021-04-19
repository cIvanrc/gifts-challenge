# frozen_string_literal: true

# Handles the schools controller
class Api::V1::RecipientsController < ApplicationController
  def index
    school = School.find(params[:school_id])

    render json: school.recipients, status: :ok
  end
end
