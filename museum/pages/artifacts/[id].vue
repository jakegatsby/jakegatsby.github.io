<template>
     <v-main v-if="artifact.title">
        <v-container>
          <v-row>
            <v-col cols="12" class="artifact-title text-center text-h4 font-weight-bold my-4">
              {{ artifact.title }}
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" class="artifact-title text-center text-h5 font-weight-bold my-4">
              <audio class="audio" controls :src="artifact.audio"></audio>
            </v-col>
          </v-row>

          <v-row>
            <v-col>
                <v-card class="mb-6" variant="outlined" elevation="16">
                  <v-carousel height="auto">
                    <v-carousel-item v-for="image in artifact.images" :src="image" eager cover></v-carousel-item>
                  </v-carousel>
                </v-card>
              </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-card color="grey-darken-4">
                <v-card-text class="text-h5 artifact-description">
                  {{ artifact.description }}
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
       </v-container>
     </v-main>
</template>

<script setup>

  import '~/assets/css/main.css'

	import { ref, onMounted } from 'vue'
	import { useRoute } from 'vue-router'

	const artifact = ref({
		id: '',
		title: '',
		images: [],
		description: '',
		audio: ''
	})

	async function getArtifact() {
	    const route = useRoute();
	    const artifact_id = route.params.id;
	    console.log(`Fetching artifact ${artifact_id}`);
	    const getArtifactResponse = await $fetch(`/artifacts/${artifact_id}/data.json?nocache=${Math.floor(Math.random() * 1000000)}`);
	    console.log(getArtifactResponse.title);
	    artifact.value = {
	    	id: artifact_id,
	    	title: getArtifactResponse.title,
	    	images: getArtifactResponse.images,
	    	description: getArtifactResponse.description,
	    	audio: `/artifacts/${artifact_id}/audio.mp3`
	    }
	}

	onMounted(async () => {
		await getArtifact();
	})

</script>
