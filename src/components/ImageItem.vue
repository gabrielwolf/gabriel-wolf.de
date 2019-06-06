<template>
  <picture>
    <source
      :data-srcset="
        `${w400Src}-400x.webp 400w,
                    ${w800Src}-800x.webp 800w,
                    ${w600Src}-600x.webp 600w,
                    ${w1000Src}-1000x.webp 1000w,
                    ${w1500Src}-1500x.webp 1500w,
                    ${w2000Src}-2000x.webp 2000w,
                    ${w2500Src}-2500x.webp 2500w`
      "
      type="image/webp"
    />
    <img
      data-srcset="${w400Src}-400x.jpg 400w,
                    ${w800Src}-800x.jpg 800w,
                    ${w600Src}-600x.jpg 600w,
                    ${w1000Src}-1000x.jpg 1000w,
                    ${w1500Src}-1500x.jpg 1500w,
                    ${w2000Src}-2000x.jpg 2000w,
                    ${w2500Src}-2500x.jpg 2500w"
      type="image/jpg"
      data-src="${w1000Src}-1000x.jpg"
      src="${}-400x.jpg"
      alt="Portrait Benediktbeuern"
      class="AppImage"
    />
  </picture>
</template>

<script>
import lozad from "lozad";

export default {
  name: "ImageItem",
  props: {
    title: String,
    src: String,
    backgroundColor: {
      type: String,
      default: "#efefef"
    },
    height: {
      type: Number,
      default: null
    },
    width: {
      type: Number,
      default: null
    }
  },
  data() {
    return {
      loading: true
    };
  },
  computed: {
    preloadSrc: function() {
      return this.src.split(".jpg")[0] + "-preload.jpg";
    },
    w1000Src: function() {
      return this.src.split(".jpg")[0] + "-1000x.jpg";
    },
    w2000Src: function() {
      return this.src.split(".jpg")[0] + "-2000x.jpg";
    },
    aspectRatio() {
      // Calculate the aspect ratio of the image
      // if the width and the height are given.
      if (!this.width || !this.height) return null;

      return (this.height / this.width) * 100;
    },
    style() {
      // The background color is used as a
      // placeholder while loading the image.
      // You can use the dominant color of the
      // image to improve perceived performance.
      // See: https://manu.ninja/dominant-colors-for-lazy-loading-images/
      const style = { backgroundColor: this.backgroundColor };

      if (this.width) style.width = `${this.width}px`;

      // If the image is still loading and an
      // aspect ratio could be calculated, we
      // apply the calculated aspect ratio by
      // using padding top.
      const applyAspectRatio = this.loading && this.aspectRatio;
      if (applyAspectRatio) {
        // Prevent flash of unstyled image
        // after the image is loaded.
        style.height = 0;
        // Scale the image container according
        // to the aspect ratio.
        style.paddingTop = `${this.aspectRatio}%`;
      }

      return style;
    }
  },
  mounted() {
    // As soon as the <img> element triggers
    // the `load` event, the loading state is
    // set to `false`, which removes the apsect
    // ratio we've applied earlier.
    const setLoadingState = () => {
      this.loading = false;
    };
    this.$el.addEventListener("load", setLoadingState);
    // We remove the event listener as soon as
    // the component is destroyed to prevent
    // potential memory leaks.
    this.$once("hook:destroyed", () => {
      this.$el.removeEventListener("load", setLoadingState);
    });

    // We initialize Lozad.js on the root
    // element of our component.
    const observer = lozad(this.$el);
    observer.observe();
  }
};
</script>

<style scoped lang="stylus">
.AppImage
  max-width: 100%;
  max-height: 100%;
  width: auto;
  height: auto;
  vertical-align: middle;
</style>
