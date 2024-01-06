{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}




	</main>

	{* Sidebars *}
	{if empty($isFullWidth) && $requestedPage|escape != "article" && $requestedPage|escape != "user" && $requestedPage|escape != "login"}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div id="sidebar" class="d-none d-md-block d-lg-block pkp_structure_sidebar col-md-4 col-lg-3 animate__animated animate__fadeInUp animate__delay-1s" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				<div class="row g-3">
					{if $activeTheme->getOption('sidebarSearch')}
					{include file="frontend/components/searchForm_sidebar.tpl"}
					{/if}
					
					{$sidebarCode}
				</div>
			</div>
		{/if}
	{/if}
	
	</div><!-- row -->
	</div><!-- pkp_structure_content container -->
	
	{include file="frontend/components/additional_home_content.tpl"}
	
	<footer class="footer" role="contentinfo">
		<div id="footerContainer" class="container-fluid">			
				{if $pageFooter}
					{$pageFooter}
				{/if}
				
		</div><!-- .container -->
		
	</footer>
	{if $activeTheme->getOption('bottomNav')}
	{include file="frontend/components/navbar-bottom.tpl"}
	{/if}
</div><!-- pkp_structure_page -->

{* Sidebar Button *}
<a class="btn btn-primary sidebar_btn d-xs-block d-sm-block d-md-none d-lg-none" data-bs-toggle="offcanvas" href="#sidebarOffcanvas" role="button" aria-controls="sidebarOffcanvas" title="{translate|escape key="common.navigation.sidebar"}">
	<i class="fa fa-bars" aria-hidden="true"></i>
</a>

{* Back to top button *}
<a href="https://api.whatsapp.com/send/?phone=6281313134124&text&app_absent=0" class="float d-flex justify-content-center align-items-center" target="_blank">
<i class="fa fa-whatsapp my-float"></i>
</a>
{if $activeTheme->getOption('backTopButton')}
<a href="javascript:void(0);" class="btn btn-primary btn-sm rounded-circle js-back-to-top back-to-top">
	<i class="fa fa-chevron-up"></i>
</a>
{/if}

<span id="myCopyright"><a href="https://hsr-share.blogspot.com/" target="_blank">{translate|escape key="plugins.themes.EpsilonTheme.name"}</a></span>

{if $activeTheme->getOption('bgPattern')}
{include file="frontend/components/bg_pattern.tpl"}
{/if}

{load_script context="frontend" scripts=$scripts}
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
