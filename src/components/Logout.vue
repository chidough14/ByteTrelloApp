<template>

	<div>

		<h2>You are logged out!</h2>
	</div>

</template>


<script>

	export default {

		created () {
    let token= localStorage.getItem('token');

    if(!token) {
    				return false;
    			}

    axios.get('http://localhost:8000/logout?api_token='+token)
       			.then(response => { console.log(response) });

       			localStorage.removeItem('token');
       			Event.$emit('logout');
		}

	}
</script>
