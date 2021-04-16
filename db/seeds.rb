Profile.destroy_all
Post.destroy_all
Circle.destroy_all
Tag.destroy_all
ProfileTag.destroy_all

@profile1 = Profile.create(user_id: 10000001, zipcode: '80021', profile_picture: 'http://www.google.com')
@profile2 = Profile.create(user_id: 10000002, zipcode: '80022', profile_picture: 'http://www.google.com')
@profile3 = Profile.create(user_id: 10000003, zipcode: '80023', profile_picture: 'http://www.google.com')
@profile4 = Profile.create(user_id: 10000004, zipcode: '80024', profile_picture: 'http://www.google.com')
@profile5 = Profile.create(user_id: 10000005, zipcode: '80025', profile_picture: 'http://www.google.com')

@tag1 = Tag.create(name: 'Painter')
@tag2 = Tag.create(name: 'Musician')
@tag3 = Tag.create(name: 'Sculpter')
@tag4 = Tag.create(name: 'Photographer')
@tag5 = Tag.create(name: 'Drummer')

ProfileTag.create(user_id: @profile1.user_id, tag_id: @tag1.id)
ProfileTag.create(user_id: @profile1.user_id, tag_id: @tag3.id)
ProfileTag.create(user_id: @profile2.user_id, tag_id: @tag4.id)
ProfileTag.create(user_id: @profile2.user_id, tag_id: @tag5.id)
ProfileTag.create(user_id: @profile3.user_id, tag_id: @tag1.id)
ProfileTag.create(user_id: @profile3.user_id, tag_id: @tag2.id)
ProfileTag.create(user_id: @profile4.user_id, tag_id: @tag1.id)
ProfileTag.create(user_id: @profile5.user_id, tag_id: @tag2.id)

Circle.create(user_id: @profile1, following_id: @profile2)
Circle.create(user_id: @profile1, following_id: @profile3)
Circle.create(user_id: @profile1, following_id: @profile4)
Circle.create(user_id: @profile1, following_id: @profile5)
Circle.create(user_id: @profile2, following_id: @profile1)
Circle.create(user_id: @profile2, following_id: @profile3)
Circle.create(user_id: @profile2, following_id: @profile4)
Circle.create(user_id: @profile2, following_id: @profile5)
Circle.create(user_id: @profile3, following_id: @profile1)
Circle.create(user_id: @profile3, following_id: @profile2)
Circle.create(user_id: @profile3, following_id: @profile4)
Circle.create(user_id: @profile3, following_id: @profile5)

@post1 = Post.new(user_id: @profile1.user_id, content: "hey did you see that lil nas X video?" , link:"photoURL.com")
@post2 = Post.new(user_id: @profile1.user_id, content: "hey did you see that new meme?" , link:"photoURL.com")
@post3 = Post.new(user_id: @profile1.user_id, content: "hey did you see that riot footage?")
@post4 = Post.new(user_id: @profile2.user_id, content: "hey did you see that headline?" , link:"photoURL.com")
@post5 = Post.new(user_id: @profile2.user_id, content: "hey checkout my new shoes?" , link:"photoURL.com")
@post6 = Post.new(user_id: @profile3.user_id, content: "hey did you see software update?" , link:"photoURL.com")
@post7 = Post.new(user_id: @profile3.user_id, content: "hey did you see your mom called?")
@post8 = Post.new(user_id: @profile4.user_id, content: "hey did you see that we're not friends on FB anymore?" , link:"photoURL.com")
@post9 = Post.new(user_id: @profile4.user_id, content: "hey did you see hear about that new app called 'level'?" , link:"photoURL.com")
@post10 = Post.new(user_id: @profile5.user_id, content: "hey i just got hired at a sick new comapny")
