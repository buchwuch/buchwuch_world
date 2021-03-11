class ArticlesController < ApplicationController
    def index
        @articles = Article.active.alphabetical
      end
    
      def show
        @article = Article.find(params[:id])
      end
    
      def new
        @article = Article.new
      end
    
      def edit
        @article = Article.find(params[:id])
      end
    
      def create
        @article = Article.new(article_params)
        if @article.save
          redirect_to articles_path, notice: "Successfully added #{@article.title}."
        else
          render action: 'new'
        end
      end
    
      def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
          redirect_to @article, notice: "Updated article information" 
        else
          render :action => "edit"
        end
      end
    
      def destroy
        @article = Article.find(params[:id])
        if @article.destroy
          redirect_to articles_path, notice: "Removed #{@article.title} from the system."
        else
          render action: 'index'
        end
      end

end
