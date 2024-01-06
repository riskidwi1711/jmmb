	{* Wrapper for page content and sidebars *}
	<div id="wrapperContainer" class="pkp_structure_content container-sm animate__animated animate__fadeInUp">
		<div class="row g-3">
			{if empty($isFullWidth) && $requestedPage|escape != "article" && $requestedPage|escape != "user" && $requestedPage|escape != "login"}
			<main class="pkp_structure_main col-sm-12 col-md-8 col-lg-9 animate__animated animate__fadeInUp" role="main">
			{else}
			<main class="pkp_structure_main col-sm-12 animate__animated animate__fadeInUp" role="main">
			{/if}