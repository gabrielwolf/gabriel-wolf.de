<template>
  <v-container>
    <v-layout text-xs-center wrap>
      <v-flex>
        <ol>
          <li
            v-for="event in json.events"
            v-bind:key="event.datetime"
            class="mb-3"
          >
            <time v-bind:datetime="event.datetime"
              >{{ event.datetime }} Uhr</time
            >
            <br />
            {{ event.title }}
          </li>
        </ol>
      </v-flex>
    </v-layout>
  </v-container>
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
ol
  list-style none
</style>
