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
            <div>
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
            <div>
              Download:
              <a :href="videoSrc(event.url, 'webm')">webm</a> |
              <a :href="videoSrc(event.url, 'mp4')">mp4</a> |
              <a :href="videoSrc(event.url, 'ogg')">ogg</a>
            </div>
          </div>
          <div v-if="event.extension === 'txt'" class="timeline-text">
            <div class="timeline-text-container">
              <input id="ch" type="checkbox" />
              <label for="ch"></label>
              <div class="timeline-text-content" :id="i">
                {{
                  getTextContent(event.url, i)
                }}Er<br />&nbsp;&nbsp;&nbsp;&nbsp;An wen richte ich meine
                Gedanken?<br />&nbsp;&nbsp;&nbsp;&nbsp;Bist Du es ...?<br />&nbsp;&nbsp;&nbsp;&nbsp;Weil
                ich Dich als erste im Sinn hatte?<br />&nbsp;&nbsp;&nbsp;&nbsp;Was,
                wenn ich die Nachricht verfasst hätte,<br />&nbsp;&nbsp;&nbsp;&nbsp;und
                am Ende die Adresse austauschte?<br />&nbsp;&nbsp;&nbsp;&nbsp;Hätte
                ich Dich damit betrogen?<br /><br />Sie<br />&nbsp;&nbsp;&nbsp;&nbsp;Fuck
                klingt das nach Bergpredigt.<br /><br />Er<br />&nbsp;&nbsp;&nbsp;&nbsp;Manches
                mal nehme ich den Hörer, wähle,<br />&nbsp;&nbsp;&nbsp;&nbsp;es
                leutet hin, und - keiner geht ran.<br />&nbsp;&nbsp;&nbsp;&nbsp;Dann
                kommt die nächste Person ...<br />&nbsp;&nbsp;&nbsp;&nbsp;...
                und wird mit meinen Gedanken befeuert.<br /><br />Sie<br />&nbsp;&nbsp;&nbsp;&nbsp;Für
                Dich wohl kaum, aber für mich stellt sich die Frage:<br />&nbsp;&nbsp;&nbsp;&nbsp;Hat
                es diese Person besser oder schlechter als Du?<br /><br />Er<br />&nbsp;&nbsp;&nbsp;&nbsp;Ach
                geh hol dir einen runter!<br /><br />Sie<br />&nbsp;&nbsp;&nbsp;&nbsp;Geduld
                mein Guter. Dir wird bei Zeiten das Lachen schon vergehen.<br /><br />Er<br />&nbsp;&nbsp;&nbsp;&nbsp;Oh,
                /das/ wäre spannend.<br /><br />Sie (leise)<br />&nbsp;&nbsp;&nbsp;&nbsp;Wo
                hab ich dich verloren? (Pause)<br /><br />Er (leise)<br />&nbsp;&nbsp;&nbsp;&nbsp;Gerade
                eben, unten an der Treppe.<br /><br />Sie (küsst ihn)<br />&nbsp;&nbsp;&nbsp;&nbsp;Du
                Schmerzkeks.
              </div>
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

// let baseUrl = "https://gabriel-wolf.test/";
let baseUrl = "https://gabriel-wolf.de/media/";

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
    },
    getTextContent: function(url, id) {
      url = url.replace(" ", "%20");
      url = baseUrl + url.replace(".txt", ".json");
      fetch(url)
        .then(r => r.json())
        .then(json => {
          document.getElementById(id).innerHTML = json.text;
        });
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
/* General */

.not-visible
  visibility hidden

/* Timeline */

.date, figcaption
  color #777

.v-timeline-item__body > div
  display block

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

.timeline-text-content
  height 100px
  overflow hidden

label
  position absolute
  top 100%
  width 100%
  padding-top 0.5rem
  cursor pointer
  color #42b983
  text-align left

input
  display none

label:after
  content "mehr lesen"

input:checked+label:after
  content "weniger lesen"

input:checked~div
  height 100%
</style>
