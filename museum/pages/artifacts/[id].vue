<template>
    <v-responsive class="align-centerfill-height mx-auto" max-width="900">
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

	    <v-row v-if="artifact.images">
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
    </v-responsive>
</template>

<script setup lang="ts">

	import { ref, onMounted } from 'vue'
	import { useRoute } from 'vue-router'

	const artifact = ref({
		id: null,
		title: null,
		images: null,
		description: null,
		audio: null
	})

	async function getArtifact() {
        const route = useRoute();
        const artifact_id = route.params.id;
	    console.log(`Fetching artifact ${artifact_id}`);
	    const getArtifactResponse = await $fetch(`/artifacts/${artifact_id}/data.json?nocache=${Math.floor(Math.random() * 1000000)}`);
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
