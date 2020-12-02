class Users::RelationshipsController < ApplicationController
	before_action :set_user

      def create
        following = current_user.follow(@user)
        following.save
      end

      def destroy
        following = current_user.unfollow(@user)
        following.destroy
      end

      def following
        @user = User.find(params[:id])
        @users = @user.followings
        redirect_back(fallback_location: root_path)
      end

      def followers
        @user = User.find(params[:id])
        @users = @user.followers
        redirect_back(fallback_location: root_path)
      end

      private
      def set_user
        @user = User.find(params[:id])
      end

end
