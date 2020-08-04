class RecordController < ApplicationController
  def find
    @books= Book.find([2, 5, 10])
    render 'hello/list'
  end

  def find_by
    @book = Book.find_by(publish: '技術評論社')
    render 'books/show'
  end

  def page
    page_size = 3
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
    @books = Book.order(published: :desc).limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end

  def last
    @book = Book.order(publish: :desc).last
    render 'books/show'
  end

  def groupby
    @books = Book.select('publish, AVG(price) AS avg_price').group(:publish)
  end

  def exists
    flag = Book.where(publish: '技術評論社').exists?
  end

  def scope
    @books = Book.gihyo.top10
  end

  def def_scope
    render plain: Review.all.inspect
  end

  def count
    cnt = Book.count
    render plain: "#{cnt}件です"
  end

  def average
    price = Book.where(publish: '技術評論社').average(:price)
  end

  def literal_sql
    @books = Book.find_by_sql(['SELECT publish, AVG(price) AS avg_price FROM "books" GROUP BY publish HAVING AVG(price) >= ?', 2500])
    render 'record/groupby'
  end
end
