class LikesController < ApplicationController
    before_action :authenticate_user, only: [:create, :destroy]
    
    def create
        
        Like.create(gossip: Gossip.find(params["gossip_id"]), user: current_user)  
        redirect_back(fallback_location: root_path)   
     end

    def destroy

        Like.find(params["id"]).destroy
        redirect_back(fallback_location: root_path)
        end

    private

    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
    end

    def publish
        post = Post.find params[:id]
        post.publish!
    
        redirect_back(fallback_location: root_path)
      end
end