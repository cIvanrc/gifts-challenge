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

  def update
    recipient = Recipient.find(params[:id])

    if recipient.update(recipient_params)
      render json: recipient, status: :accepted
    else
      render json: recipient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    recipient = Recipient.find(params[:id])

    if recipient.destroy
      render json: { message: 'Recipient deleted successfully' }, status: :accepted
    else
      render json: { errors: recipient.errors }, status: :unprocessable_entity
    end
  end

  private
  def recipient_params
    params.require(:recipient).permit(:name, :address)
  end
end
