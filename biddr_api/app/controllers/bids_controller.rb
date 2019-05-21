class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new bid_params
    @bid.auction = @auction
    if @bid.save
      redirect_to auction_path(@auction)
    else
      @bids = @auction.bids.order(created_at: :desc)
      render 'auctions/show'
    end
  end
  private

  def bid_params
   params.require(:bid).permit(:body)
 end
end
