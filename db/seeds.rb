Product.create(name: "Coding", description: "10 hours of web development!", image_url:"codingpx.jpg", price: "100")

Product.create(name: "Diamond 1", description: "Rose gold diamond ring", image_url:"https://images.unsplash.com/photo-1514846376753-cd076d84e2f7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2ecbda9d6b5680393603857ddeadc747&auto=format&fit=crop&w=750&q=80", price: "100")

Product.create(name: "Diamond 2", description: "White diamond ring", image_url:"https://images.unsplash.com/photo-1470321386428-4b1668f21ad3?ixlib=rb-0.3.5&s=b5e2892fd762c1b7cd53304b72e2a230&auto=format&fit=crop&w=750&q=80", price: "100")

Order.create(user_id: 1, product_id: 1, total: 10.0)

Order.create(user_id: 1, product_id: 2, total: 5.0)
