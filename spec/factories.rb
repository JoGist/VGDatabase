FactoryBot.define do
    factory :user do
        username    {"John Doe"}
        email       {"example@mail.com"}
        password    {"secret"}
        avatar      {"Avatars/avatar_0"}
        id          {1}
    end

    factory :game do
        title       {"Rspec_game"}
        serial      {12345}
        id          {1}
    end

    factory :review do
        user_id     {}
        game_id     {}
    end

end

# default call to factory
#user1 = create(:user)
#user1 attributes will be username: John Doe, password: secret

# override default arguments
#user2 = create(:user, username: "Bob")
#user2 attributes will be username: Bob, password: secret