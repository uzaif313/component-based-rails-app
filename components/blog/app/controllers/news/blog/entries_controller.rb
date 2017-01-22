module News
  module Blog
    class EntriesController < ApplicationController
      before_action :set_entry, only: [:show, :edit, :update, :destroy]

      def index
        @entries = Entry.all.order(published_at: :desc)
      end

      def new
        @enrty = Entry.new
      end

      def create
        @entry = Entry.new(entry_params)
        @entry.user = current_user

        if @entry.save
          redirect_to [news,@entry]
        else
          render :new
        end
      end



      def show
      end

      def edit
      end

      def update
        if @entry.update(entry_params)
          redirect_to [news,@entry]
        else
          render :edit
        end
      end

      def destroy
        @entry.destroy
        redirect_to news.entries_url
      end

      private
        def set_entry
          @entry = Entry.find(params[:id])
        end

        def entry_params
          parmit.require(:entry).permit(:title, :published_at, :body)
        end
    end
  end
end
