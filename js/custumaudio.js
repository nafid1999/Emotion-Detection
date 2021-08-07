const track = document.getElementById("track");
const background = document.getElementById("background");
const trackArtist = document.getElementById("track-artist");
const trackTitle = document.getElementById("track-title");
const progressBar = document.getElementById("progressBar");
const currentTime = document.getElementById("currentTime");
const durationTime = document.getElementById("durationTime");

let play = document.getElementById("play");
let pause = document.getElementById("pause");
let next = document.getElementById("next-track");
let prev = document.getElementById("prev-track");
let stop = document.getElementById("stop");
let back = document.getElementById("back10");
let forward = document.getElementById("forward10");
trackIndex = 0;

// trackArtists = ["Harry Styles", "Justin Bieber", "Loud Luxury ft. Brando"];
// trackTitles = ["Watermelon Sugar", "Yummy", "Body"];

let playing = true;

function pausePlay() {
  if (playing) {
    play.style.display = "none";
    pause.style.display = "block";

    track.play();
    playing = false;
  } else {
    pause.style.display = "none";
    play.style.display = "block";

    track.pause();
    playing = true;
  }
}

play.addEventListener("click", pausePlay);
pause.addEventListener("click", pausePlay);

function stoptrack() {
  playing = false;
  pausePlay();
  track.currentTime = 0;
}
stop.addEventListener("click", stoptrack);

function back10() {
  track.currentTime = track.currentTime - 10;
}
back.addEventListener("click", back10);

function forward10() {
  track.currentTime = track.currentTime + 10;
}
forward.addEventListener("click", forward10);

track.addEventListener("ended", nextTrack);

function nextTrack() {
  trackIndex++;
  if (trackIndex > tracks.length - 1) {
    trackIndex = 0;
  }

  track.src = tracks[trackIndex];

  trackArtist.textContent = trackArtists[trackIndex];
  trackTitle.textContent = trackTitles[trackIndex];

  playing = true;
  pausePlay();
}

next.addEventListener("click", nextTrack);

function prevTrack() {
  trackIndex--;
  if (trackIndex < 0) {
    trackIndex = tracks.length - 1;
  }

  track.src = tracks[trackIndex];

  trackArtist.textContent = trackArtists[trackIndex];
  trackTitle.textContent = trackTitles[trackIndex];

  playing = true;
  pausePlay();
}

prev.addEventListener("click", prevTrack);

function progressValue() {
  progressBar.max = track.duration;
  progressBar.value = track.currentTime;

  currentTime.textContent = formatTime(track.currentTime);
  if (Number.isNaN(track.duration)) {
    durationTime.textContent = "--:--";
  } else {
    durationTime.textContent = formatTime(track.duration);
  }
}

setInterval(progressValue, 500);

function formatTime(sec) {
  let minutes = Math.floor(sec / 60);
  let seconds = Math.floor(sec - minutes * 60);
  if (seconds < 10) {
    seconds = `0${seconds}`;
  }
  return `${minutes}:${seconds}`;
}

function changeProgressBar() {
  track.currentTime = progressBar.value;
}

progressBar.addEventListener("click", changeProgressBar);
