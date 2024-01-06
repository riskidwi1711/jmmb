<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="sidebarOffcanvas" aria-labelledby="sidebarOffcanvasLabel">
	
	<div class="offcanvas-header bg-primary-lighten-2 text-dark">
		<h4 class="offcanvas-title" id="sidebarOffcanvasLabel">{translate|escape key="common.navigation.sidebar"}</h4>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	
	<div class="offcanvas-body">
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
		<div id="sidebar" class="pkp_structure_sidebar" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
			<div class="row g-3">
				{$sidebarCode}
			</div>
		</div>
		{/if}
	</div>
	
	
</div> 
