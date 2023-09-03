const ACCESS_TOKEN = "발급받은 ACCESS_TOKEN 입력";
const HOST = "https://openapi.band.us";
const API = "/v2/band/album/photos";

// parameters
const BAND_KEY = "검색할_밴드_키";
const PHOTO_ALBUM_KEY = "검색할_포토_앨범_키";

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
  "GET",
  `${HOST}${API}?access_token=${ACCESS_TOKEN}&band_key=${BAND_KEY}&photo_album_key=${PHOTO_ALBUM_KEY}`
);
xhr.setRequestHeader("Content-Type", "application/json");
xhr.responseType = "json";
xhr.send();
