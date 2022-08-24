class NotesController < ApplicationController
    before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


    def index
        notes = Note.all()
        render json: notes
    end

    def create 
        note = Note.create(note_params)
        render json:note, status: :created
    end

    def show
        note = Note.find_by(id: params[:id])
        render json: note, status: :ok
    end

    def destroy
        note = Note.find_by(id: params[:id])
        note.destroy
        head :no_content
    end



    private

    def record_not_found
      render json: { error: "Note not found" }, status: :not_found
    end
  
    def authorize
      render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
  
    def note_params
        params.permit(:title, :description, :user_id)
    end
end
