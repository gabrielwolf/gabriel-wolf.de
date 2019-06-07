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
            :width="400"
            :height="400"
            :src="preloadSrc(event.url)"
            :lazy-src="lazySrc(event.url)"
            :lazy-srcset="lazySrcSet(event.url)"
            :title="event.title"
            class="timeline-image"
          />
          <audio
            v-if="event.extension === 'wav'"
            controls
            preload="metadata"
            :title="event.title"
            class="timeline-audio"
          >
            <source
              :src="`https://gabriel-wolf.test/${event.url}`"
              stype="audio/wav"
            />
          </audio>
          <video
            v-if="event.extension === 'mp4'"
            controls
            class="timeline-video"
          >
            <source
              :src="`https://gabriel-wolf.test/${event.url}`"
              type="video/mp4"
            />
          </video>
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
    preloadSrc: function(url) {
      return baseUrl + url.replace(".jpg", "-preload.jpg");
    },
    lazySrc: function(url) {
      return baseUrl + url.replace(".jpg", "-400x.jpg");
    },
    lazySrcSet: function(url) {
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
.v-timeline-item__body *
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
