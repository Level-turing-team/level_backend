Profile.destroy_all
Post.destroy_all
Circle.destroy_all
Tag.destroy_all
ProfileTag.destroy_all

@profile1 = Profile.create(username: 'cool guy', user_id: 10000001, zipcode: '80021', profile_picture: 'http://www.google.com')
@profile2 = Profile.create(username: 'hella tight', user_id: 10000002, zipcode: '80022', profile_picture: 'http://www.google.com')
@profile3 = Profile.create(username: 'dudeski', user_id: 10000003, zipcode: '80023', profile_picture: 'http://www.google.com')
@profile4 = Profile.create(username: 'broski', user_id: 10000004, zipcode: '80024', profile_picture: 'http://www.google.com')
@profile5 = Profile.create(username: 'boner champ', user_id: 10000005, zipcode: '80025', profile_picture: 'http://www.google.com')

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

Circle.create(user_id: @profile1.user_id, following_id: @profile2.user_id)
Circle.create(user_id: @profile1.user_id, following_id: @profile3.user_id)
Circle.create(user_id: @profile1.user_id, following_id: @profile4.user_id)
Circle.create(user_id: @profile1.user_id, following_id: @profile5.user_id)
Circle.create(user_id: @profile2.user_id, following_id: @profile1.user_id)
Circle.create(user_id: @profile2.user_id, following_id: @profile3.user_id)
Circle.create(user_id: @profile2.user_id, following_id: @profile4.user_id)
Circle.create(user_id: @profile2.user_id, following_id: @profile5.user_id)
Circle.create(user_id: @profile3.user_id, following_id: @profile1.user_id)
Circle.create(user_id: @profile3.user_id, following_id: @profile2.user_id)
Circle.create(user_id: @profile3.user_id, following_id: @profile4.user_id)
Circle.create(user_id: @profile3.user_id, following_id: @profile5.user_id)

@post1 = Post.create(user_id: @profile1.user_id, content: "hey did you see that lil nas X video?" , link:"photoURL.com", created_at: 2021-02-27)
@post2 = Post.create(user_id: @profile1.user_id, content: "hey did you see that create meme?" , link:"photoURL.com", created_at: 2021-01-27)
@post3 = Post.create(user_id: @profile1.user_id, content: "hey did you see that riot footage?", created_at: 2021-02-15)
@post4 = Post.create(user_id: @profile2.user_id, content: "hey did you see that headline?" , link:"photoURL.com", created_at: 2021-03-27)
@post5 = Post.create(user_id: @profile2.user_id, content: "hey checkout my create shoes?" , link:"photoURL.com", created_at: 2021-03-01)
@post6 = Post.create(user_id: @profile3.user_id, content: "hey did you see software update?" , link:"photoURL.com", created_at: 2021-03-21)
@post7 = Post.create(user_id: @profile3.user_id, content: "hey did you see your mom called?", created_at: 2021-03-25)
@post8 = Post.create(user_id: @profile4.user_id, content: "hey did you see that we're not friends on FB anymore?" , link:"photoURL.com", created_at: 2021-03-23)
@post9 = Post.create(user_id: @profile4.user_id, content: "hey did you see hear about that create app called 'level'?" , link:"photoURL.com", created_at: 2021-03-13)
@post10 = Post.create(user_id: @profile5.user_id, content: "hey i just got hired at a sick new comapny", created_at: 2021-04-13)
