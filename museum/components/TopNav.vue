<template>
  <div>
    <v-app-bar color="grey-darken-4" density="compact">
      <template v-slot:prepend>
        <v-app-bar-nav-icon></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title><span class="text-h5 nav-bar-title">26 RCA Museum</span></v-app-bar-title>
    </v-app-bar>
  </div>
</template>


<script setup lang="ts">
const route = useRoute()

console.log(route.params.id)
</script>
