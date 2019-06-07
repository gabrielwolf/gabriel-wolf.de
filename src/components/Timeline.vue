<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <v-timeline>
    <v-timeline-item
      v-for="(event, i) in json.events"
      :key="i"
      color="primary"
      small
    >
      <div>
        <figure>
          <div class="date">{{ event.datetime }} Uhr</div>
          <image-item
            v-if="event.extension === 'jpg'"
            :width="event.width"
            :height="event.height"
            :src="imagePreloadSrc(event.url)"
            :lazy-src="imageLazySrc(event.url)"
            :lazy-srcset="imageLazySrcSet(event.url)"
            :title="event.title"
            class="timeline-image"
          />
          <div v-if="event.extension === 'wav'">
            <audio
              controls
              preload="metadata"
              :title="event.title"
              class="timeline-audio"
            >
              <source :src="audioSrc(event.url, 'mp3')" type="audio/mpeg" />
              <source :src="audioSrc(event.url, 'ogg')" type="audio/ogg" />
              Dein Browser unterstützt leider kein natives Streaming. Versuche
              einen Downloadlink.
            </audio>
            <div class="download-links">
              Download:
              <a :href="audioSrc(event.url, 'flac')" download>flac</a> |
              <a :href="audioSrc(event.url, 'mp3')">mp3</a> |
              <a :href="audioSrc(event.url, 'ogg')">ogg</a>
            </div>
          </div>
          <div v-if="event.extension === 'mp4'">
            <video
              controls
              class="timeline-video"
              preload="metadata"
              :poster="videoPosterSrc(event.url)"
            >
              <source :src="videoSrc(event.url, 'webm')" type="video/webm" />
              <source :src="videoSrc(event.url, 'mp4')" type="video/mp4" />
              <source :src="videoSrc(event.url, 'ogg')" type="video/ogg" />
            </video>
            <div class="download-links">
              Download:
              <a :href="videoSrc(event.url, 'webm')">webm</a> |
              <a :href="videoSrc(event.url, 'mp4')">mp4</a> |
              <a :href="videoSrc(event.url, 'ogg')">ogg</a>
            </div>
          </div>
          <figcaption>{{ event.title }}</figcaption>
        </figure>
      </div>
    </v-timeline-item>
  </v-timeline>
</template>

<script>
import ImageItem from "@/components/ImageItem.vue";

let baseUrl = "https://gabriel-wolf.test/";

export default {
  methods: {
    imagePreloadSrc: function(url) {
      let clean_url = url.replace(" ", "%20");
      return baseUrl + clean_url.replace(".jpg", "-preload.jpg");
    },
    imageLazySrc: function(url) {
      let clean_url = url.replace(" ", "%20");
      return baseUrl + clean_url.replace(".jpg", "-400x.jpg");
    },
    imageLazySrcSet: function(url) {
      let clean_url = url.replace(" ", "%20");
      let output = "";
      output += baseUrl + clean_url.replace(".jpg", "-400w.jpg") + " 400w,";
      output += baseUrl + clean_url.replace(".jpg", "-600w.jpg") + " 600w,";
      output += baseUrl + clean_url.replace(".jpg", "-800w.jpg") + " 800w,";
      output += baseUrl + clean_url.replace(".jpg", "-1000w.jpg") + " 1000w,";
      output += baseUrl + clean_url.replace(".jpg", "-1500w.jpg") + " 1500w,";
      output += baseUrl + clean_url.replace(".jpg", "-2000w.jpg") + " 2000w,";
      output += baseUrl + clean_url.replace(".jpg", "-2500w.jpg") + " 2500w";
      return output;
    },
    audioSrc: function(url, extension) {
      let clean_url = url.replace(" ", "%20");
      return baseUrl + clean_url.replace(".wav", "." + extension);
    },
    videoSrc: function(url, extension) {
      let clean_url = url.replace(" ", "%20");
      return baseUrl + clean_url.replace(".mp4", "." + extension);
    },
    videoPosterSrc: function(url) {
      let clean_url = url.replace(" ", "%20");
      return baseUrl + clean_url.replace(".mp4", "-preload.jpg");
    }
  },
  data: () => ({
    json: []
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
  }
};
</script>

<style scoped lang="stylus">
.v-timeline-item__body > div
  display block

.timeline-image, .timeline-video, .timeline-audio
  max-width 100%
  margin 0 auto
  vertical-align middle

.timeline-audio
  display inline-block !important

.not-visible
  visibility hidden

.date, figcaption
  color #777
</style>
