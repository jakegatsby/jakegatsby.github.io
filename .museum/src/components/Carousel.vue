<script setup>
  import { ref } from 'vue';
  const props = defineProps(['images']);
  const images = ref(props.images);
</script>

<template>
  <div class="carousel" data-flickity='{ "imagesLoaded": true, "percentPosition": false, "wrapAround": true, "pageDots": true, "prevNextButtons": false }'>
    <img v-for="image in images" :src="image" />
  </div>
</template>
