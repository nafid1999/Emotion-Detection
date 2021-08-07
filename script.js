const video = document.getElementById("video");

// vwTOpx("50");
// vhTOpx("60");
document.getElementById("video").setAttribute("width", vwTOpx("75"));
document.getElementById("video").setAttribute("height", vhTOpx("75"));

//
const startVideo = async () => {
  try {
    video.srcObject = await navigator.mediaDevices.getUserMedia({
      video: true,
      audio: false,
    });
    tracks = video.srcObject.getTracks();
  } catch (e) {
    console.error(e);
  }
};

Promise.all([
  faceapi.nets.tinyFaceDetector.loadFromUri("./models"),
  faceapi.nets.faceLandmark68Net.loadFromUri("./models"),
  faceapi.nets.faceRecognitionNet.loadFromUri("./models"),
  faceapi.nets.faceExpressionNet.loadFromUri("./models"),
]).then(startVideo);

video.addEventListener("playing", () => {
  const canvas = faceapi.createCanvasFromMedia(video);
  document.body.append(canvas);
  const displaySize = { width: video.width, height: video.height };
  //const displaySize = { width: "60vw", height: "60vh" };

  faceapi.matchDimensions(canvas, displaySize);
  setInterval(async () => {
    const detections = await faceapi
      .detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
      .withFaceLandmarks()
      .withFaceExpressions();
    // const resizedDetections = faceapi.resizeResults(detections, displaySize);
    // canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
    // faceapi.draw.drawDetections(canvas, resizedDetections);
    // faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);
    // faceapi.draw.drawFaceExpressions(canvas, resizedDetections);

    /*my code */

    var partone = faceapi.resizeResults(detections, displaySize)[0];
    if (partone !== undefined) {
      var mytest = partone.expressions;

      let arr = Object.values(mytest);
      let min = Math.min(...arr);
      let max = Math.max(...arr);
      let exp = "";
      console.log(mytest);

      console.log(max);
      for (const [key, value] of Object.entries(mytest)) {
        if (value === max) {
          exp = key;
        }
      }
      let id = 0;
      if (exp === "happy") {
        id = 1;
      } else if (exp === "sad") {
        id = 2;
      } else if (exp === "angry") {
        id = 3;
      } else {
        id = 4;
      }
      console.log(exp);
      clearInterval(this);
      tracks[0].stop();
      var url = "emotion.php?emot=" + exp + "&id=" + id;
      window.open(url, "").focus();
    }

    /*end my */
  }, 300);
});

/* my fonctions */
function vwTOpx(value) {
  var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName("body")[0],
    x = w.innerWidth || e.clientWidth || g.clientWidth,
    y = w.innerHeight || e.clientHeight || g.clientHeight;

  var result = (x * value) / 100;
  console.log(result);
  return result;
}

function vhTOpx(value) {
  var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName("body")[0],
    x = w.innerWidth || e.clientWidth || g.clientWidth,
    y = w.innerHeight || e.clientHeight || g.clientHeight;

  var result = (y * value) / 100;
  console.log(result);
  return result;
}

/*----add event listners   ----*/
