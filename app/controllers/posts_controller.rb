class PostsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]
    #обработка главной странички
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        #для проверки данных
        #render plain: params[:post].inspect
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, status: :see_other
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
