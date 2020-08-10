class UsersController < ApplicationController
    def show
        @id = params[:id]
    end

    def create
        puts params
        #@user = User.new(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
        @user = User.new(post_params)
        if u = City.all.any? {|v| v.name == params[:city]}
            @user.city = City.find_by(name: params[:city])    
        else
            @user.city = City.create(name: params["city"])
        end

        if @user.save
            login(@user)
            @user.remeber_user = params["remember_user"]
            if @user.remember_user
                remember(@user)
            else
                @user.remember_user = nil
            end
            redirect_to  gossips_path
        else
            render :new
        end
    end

    def new
       # @cities = City.all
        @user = User.new
    end   

    private
        
    def post_params
        post_params = params.permit(:first_name, :last_name, :email, :password, :age, :description, :remember_user)
        return post_params
    end

end