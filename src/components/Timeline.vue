<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <v-timeline dense>
    <v-timeline-item
      v-for="(event, i) in json.events"
      :key="i"
      color="primary"
      small
    >
      <div>
        <figure>
          <div class="date">{{ event.datetime }} Uhr</div>
          <img
            v-if="event.extension == 'jpg'"
            :src="`media/${event.url}`"
            :title="event.title"
            class="timeline-image"
          />
          <audio
            v-if="event.extension == 'wav'"
            controls
            preload="metadata"
            :title="event.title"
            class="timeline-audio"
          >
            <source :src="`media/${event.url}`" stype="audio/wav" />
          </audio>
          <video
            v-if="event.extension == 'mp4'"
            controls
            class="timeline-video"
          >
            <source :src="`media/${event.url}`" type="video/mp4" />
          </video>
          <figcaption>{{ event.title }}</figcaption>
        </figure>
      </div>
    </v-timeline-item>
  </v-timeline>
</template>

<script>
export default {
  data: () => ({
    json: []
  }),
  created: function() {
    fetch("/media/media.json")
      .then(r => r.json())
      .then(json => {
        this.json = json;
      });
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
