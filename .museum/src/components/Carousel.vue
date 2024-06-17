<script setup>
  import { ref, defineProps } from 'vue';
  const props = defineProps(['title']);
</script>

<template>
  <div>
    CAROUSEL {{ props }}
  </div>
</template>
