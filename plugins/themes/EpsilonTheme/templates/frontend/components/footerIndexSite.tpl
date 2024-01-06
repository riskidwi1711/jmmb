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

	</div><!-- row -->
	</div><!-- pkp_structure_content container -->
	
	<footer class="footer animate__animated animate__fadeInUp delay-1s" role="contentinfo">
		<div class="container">			
				{if $pageFooter}
					{$pageFooter}
				{/if}
		</div><!-- .container -->
		
	</footer>
</div><!-- pkp_structure_page -->

{* Back to top button *}
{if $activeTheme->getOption('backTopButton')}
<a href="javascript:void(0);" class="btn btn-primary btn-sm rounded-circle js-back-to-top back-to-top">
	<i class="fa fa-chevron-up"></i>
</a>
{/if}

<span id="myCopyright"><a href="https://hsr-share.blogspot.com/" target="_blank">{translate|escape key="plugins.themes.EpsilonTheme.name"}</a></span>
{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
