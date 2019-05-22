PASSWORD = "supersecret"
Bid.delete_all
Auction.delete_all
User.delete_all

super_user = User.create(
    first_name: "Qwerty",
    last_name: "Jones",
    email: "qj@keyboard.meh",
    password: PASSWORD
  )

  10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
      password: PASSWORD
    )
  end

  users = User.all
  200.times do
    created_at = Faker::Date.backward(365 * 5)
    q = Auction.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::ChuckNorris.fact,
      ends_at: "December 31, 2019",
      reserve_price: rand(100_000),
      created_at: created_at,
      updated_at: created_at,
      user: users.sample
    )
    if q.valid?
        q.bids = rand(0..15).times.map do
          Bid.new(price: Faker::GreekPhilosophers.quote, user: users.sample)
        end    
      end
    end
    
    auctions = Auction.all
    bids = Bid.all
    
    puts Cowsay.say("Generated #{ auctions.count } auctions", :ghostbusters)
    puts Cowsay.say("Generated #{ bids.count } bids", :stegosaurus)
    puts Cowsay.say("Generated #{ users.count } users", :beavis)
    puts Cowsay.say("Login with #{super_user.email} and password: #{PASSWORD}", :moose)
