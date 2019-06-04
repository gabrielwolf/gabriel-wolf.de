<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <v-timeline>
    <v-timeline-item
      v-for="(event, i) in json.events"
      :key="i"
      :color="event.title"
      small
    >
      <template v-slot:opposite>
        <span>{{ event.datetime }} Uhr</span>
      </template>
      <div>
        <img
          v-if="event.extension == 'jpg'"
          :src="`media/${event.url}`"
          :title="event.title"
          class="img-responsive ma-0"
        />
        <audio
          v-if="event.extension == 'wav'"
          controls
          preload="metadata"
          :title="event.title"
        >
          <source :src="`media/${event.url}`" type="audio/wav" />
        </audio>
        <video v-if="event.extension == 'mp4'" class="img-responsive">
          <source :src="`media/${event.url}`" type="video/mp4" />
        </video>
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
    fetch("/media.json")
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

.img-responsive
  max-width 100%
</style>
