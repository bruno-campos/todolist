
function test() {
//  $.post("/api/users", {user: {login: "bruno2", password: "123", password_confirmation: "123"}}, function(r) {
//    console.log(r);
//  });

  $.get("/api/tasks", function(r) {
    console.log(r);
  });

//  $.post("/api/sessions", {login: "bruno@gmail.com", password: "AAA"}, function(r) {
//    console.log(r);
//  })
}