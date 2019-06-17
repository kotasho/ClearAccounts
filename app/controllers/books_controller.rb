class BooksController < ApplicationController

def index
  @name = current_user.name
end

def new
end

def show
end

end
