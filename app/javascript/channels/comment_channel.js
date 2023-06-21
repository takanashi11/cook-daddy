import consumer from "./consumer"

if(location.pathname.match(/\/recipes\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    item_id: location.pathname.match(/\d+/)[0]
  }, {

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="comment">
     <div class="comments-text">
      <p class="user-info">${data.user.nickname}： </p>
      <p class="comment-text">>${data.comment.comment_text}</p>
     </div>
    </div>`
  const comments = document.getElementById("comments")
  comments.insertAdjacentHTML('beforeend', html)
  const commentForm = document.getElementById("comment-form")
  commentForm.reset();
  }
})
}
