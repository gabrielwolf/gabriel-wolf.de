<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <v-timeline :dense="denseMode">
    <v-timeline-item
      v-for="(event, i) in json.events"
      :key="i"
      color="primary"
      small
    >
      <div>
        <figure>
          <div class="pt-4"></div>
          <div class="date mb-2">{{ event.datetime }} Uhr</div>
          <image-item
            v-if="event.extension === 'jpg'"
            :width="event.width"
            :height="event.height"
            :src="imagePreloadSrc(event.url)"
            :lazy-src="imageLazySrc(event.url)"
            :lazy-srcset="imageLazySrcSet(event.url)"
            class="timeline-image mb-2"
          />
          <div v-if="event.extension === 'wav'">
            <audio
              controls
              preload="metadata"
              :title="event.title"
              class="timeline-audio mb-2"
            >
              <source :src="audioSrc(event.url, 'mp3')" type="audio/mpeg" />
              <source :src="audioSrc(event.url, 'ogg')" type="audio/ogg" />
              Dein Browser unterstützt leider kein natives Streaming. Versuche
              einen Downloadlink.
            </audio>
            <div class="download">
              Download:
              <a :href="audioSrc(event.url, 'flac')" download>flac</a> |
              <a :href="audioSrc(event.url, 'mp3')">mp3</a> |
              <a :href="audioSrc(event.url, 'ogg')">ogg</a>
            </div>
          </div>
          <div v-if="event.extension === 'mp4'">
            <video
              controls
              class="timeline-video mb-2"
              preload="metadata"
              :poster="videoPosterSrc(event.url)"
            >
              <source :src="videoSrc(event.url, 'webm')" type="video/webm" />
              <source :src="videoSrc(event.url, 'mp4')" type="video/mp4" />
              <source :src="videoSrc(event.url, 'ogg')" type="video/ogg" />
            </video>
            <div class="download">
              Download:
              <a :href="videoSrc(event.url, 'webm')">webm</a> |
              <a :href="videoSrc(event.url, 'mp4')">mp4</a> |
              <a :href="videoSrc(event.url, 'ogg')">ogg</a>
            </div>
          </div>
          <div v-if="event.extension === 'txt'" class="timeline-text mb-3">
            <div class="timeline-text-container">
              <input :id="'ch' + i" type="checkbox" />
              <label :for="'ch' + i"></label>
              <div class="timeline-text-content" :id="i">
                {{ getTextContent(event.url, i) }}
              </div>
            </div>
          </div>
          <div v-if="event.extension === 'pdf'">
            <image-item
              :src="scorePreviewSrc(event.url)"
              :lazy-src="scorePreviewSrc(event.url)"
              class="mb-2"
            />
            <div class="download">
              Download:
              <a :href="scoreSrc(event.url, 'pdf')">pdf</a>
            </div>
          </div>
          <figcaption v-html="getEventTitle(event.title)"></figcaption>
        </figure>
      </div>
    </v-timeline-item>
  </v-timeline>
</template>

<script>
import ImageItem from "@/components/ImageItem.vue";

// let baseUrl = "https://gabriel-wolf.test/";
let baseUrl = "https://gabriel-wolf.de/media/";

export default {
  methods: {
    imagePreloadSrc: function(url) {
      return encodeURI(baseUrl + url).replace(".jpg", "-preload.jpg");
    },
    imageLazySrc: function(url) {
      return encodeURI(baseUrl + url).replace(".jpg", "-400x.jpg");
    },
    imageLazySrcSet: function(url) {
      let output = "";
      output += encodeURI(baseUrl + url).replace(".jpg", "-400w.jpg 400w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-600w.jpg 600w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-800w.jpg 800w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-1000w.jpg 1000w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-1500w.jpg 1500w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-2000w.jpg 2000w,");
      output += encodeURI(baseUrl + url).replace(".jpg", "-2500w.jpg 2500w");
      return output;
    },
    audioSrc: function(url, extension) {
      return encodeURI(baseUrl + url).replace(".wav", "." + extension);
    },
    videoSrc: function(url, extension) {
      return encodeURI(baseUrl + url).replace(".mp4", "." + extension);
    },
    videoPosterSrc: function(url) {
      return encodeURI(baseUrl + url).replace(".mp4", "-preload.jpg");
    },
    scoreSrc: function(url) {
      return encodeURI(baseUrl + url);
    },
    scorePreviewSrc: function(url) {
      return encodeURI(baseUrl + url).replace(".pdf", ".png");
    },
    getTextContent: function(url, id) {
      url = url.replace(" ", "%20");
      url = baseUrl + url.replace(".txt", ".json");
      fetch(url)
        .then(r => r.json())
        .then(json => {
          document.getElementById(id).innerHTML = json.text;
        });
    },
    getEventTitle: function(title) {
      return title.replace("©", "<br />©").replace("--", "<br >");
    }
  },
  data: () => ({
    json: [],
    dense: true
  }),
  created: function() {
    fetch("/media/media.json")
      .then(r => r.json())
      .then(json => {
        this.json = json;
      });
  },
  components: {
    "image-item": ImageItem
  },
  computed: {
    denseMode() {
      let w = Math.max(
        document.documentElement.clientWidth,
        window.innerWidth || 0
      );
      if (w < 560) {
        return true;
      } else {
        return false;
      }
    }
  }
};
</script>

<style scoped lang="stylus">
/* General */

.not-visible
  visibility hidden

/* Timeline */

.date, figcaption
  color #777

.v-timeline-item__body > div
  display block

.v-timeline-item
  margin-bottom 8rem


/* Audio and Video */

.timeline-image, .timeline-video, .timeline-audio
  max-width 100%
  margin 0 auto
  vertical-align middle

.timeline-audio
  display inline-block !important

/* Text */

.timeline-text
  text-align left

.timeline-text-container
  position relative
  margin-bottom 2.5rem

  label
    position absolute
    top 100%
    width 100%
    padding-top 0.5rem
    cursor pointer
    color #1976d2
    text-align left

  input
    display none

  label:after
    content "mehr lesen"

  input:checked+label:after
    content "weniger lesen"

  input:checked~div
    height 100%

.timeline-text-content
  height 100px
  overflow hidden
</style>
