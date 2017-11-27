<template>

	<div>

		<h2>Your Boards</h2>
      <v-container >
		   <v-layout row justify-space-around>

            <v-flex xs4 v-for='board in boards' :key='board.id'>
		   <router-link :to="{name:'SingleBoard', params: {id:board.id}}">
            <v-card dark color="primary" style="cursor:pointer"  class="mr-1 ml-1">
                  <v-card-text>{{board.name}}</v-card-text>
                </v-card>
                </router-link>
            </v-flex>

            </v-layout>
            </v-container>

</div>

</template>


<script>
import boardDataMixin from '../mixins/boardDataMixin'
export default {
    data() {
    			return {
    				boards:''
    			}
    		},
   mounted () {


   			this.fetchBoardsData();



   		},
   	mixins:[boardDataMixin]

}
</script>
