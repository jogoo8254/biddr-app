class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show]

  def new
    @auction = Auction.new
  end


  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction.id)
    else
      render :new
    end
  end

  def show
    # @auction = Auction.find(params[:id])
    @bid = Bid.new
    # For the list of bids
    @bids = @auction.bids.order(created_at: :desc)
  end

  def index
    @auctions = Auction.all.order(created_at: :desc)
  end
  private

  def auction_params
   params.require(:auction).permit(:title, :description, :ends_at, :reserve_price)
 end

  def find_auction
   @auction = Auction.find(params[:id])
 end
end
