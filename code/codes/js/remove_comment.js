const ACCESS_TOKEN = "발급받은 ACCESS_TOKEN 입력";
const HOST = "https://openapi.band.us";
const API = "/v2/band/post/comment/remove";

// parameters
const BAND_KEY = "검색할_밴드_키";
const POST_KEY = "검색할_포스트_키";
const COMMENT_KEY = "검색할_댓글_키";

const xhr = new XMLHttpRequest();

xhr.onload = function () {
  if (xhr.status != 200) {
    // Error!
    return;
  }
  var responseObj = xhr.response;
  console.log(responseObj); // response!
};
xhr.open(
  "POST",
  `${HOST}${API}?access_token=${ACCESS_TOKEN}&band_key=${BAND_KEY}&post_key=${POST_KEY}&comment_key=${COMMENT_KEY}`
);
xhr.setRequestHeader("Content-Type", "application/json");
xhr.responseType = "json";
xhr.send();
