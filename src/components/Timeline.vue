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
      <div class="py-5">
        <img
          :src="`media/${event.datetime}_${event.title}.${event.extension}`"
        />
        <h2 :class="`headline font-weight-light mb-0 ${event.title}--text`">
          {{ event.title }}
        </h2>
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

<style scoped lang="stylus"></style>
