# frozen_string_literal: true

# Handles the schools controller
class Api::V1::RecipientsController < ApplicationController
  def index
    school = School.find(params[:school_id])

    render json: school.recipients, status: :ok
  end

  def create
    school = School.find(params[:school_id])
    recipient = school.recipients.new(recipient_params)
    if recipient.save
      render json: recipient, status: :created
    else
      render json: recipient.errors, status: :unprocessable_entity
    end
  end

  def recipient_params
    params.require(:recipient).permit(:name, :address)
  end
end
