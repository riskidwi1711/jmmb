{**
 * plugins/blocks/browse/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site sidebar menu for browsing the catalog.
 *
 * @uses $browseNewReleases bool Whether or not to show a new releases link
 * @uses $browseCategoryFactory object Category factory providing access to
 *  browseable categories.
 * @uses $browseSeriesFactory object Series factory providing access to
 *  browseable series.
 *
 *}

<div class="pkp_block block_browse accordion" id="blockBrowse">
	<div class="accordion-item">
		<h4 class="accordion-header" id="browseHead">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#browseBody" aria-expanded="false" aria-controls="browseBody">
                {translate key="plugins.block.browse"}
              </button>
		</h4>
	
	<div id="browseBody" class="accordion-collapse collapse" aria-labelledby="browseHead" data-bs-parent="#blockBrowse">
	<div class="accordion-body">
	{*
	{include file="frontend/components/searchForm_sidebar.tpl"}
	*}
	<nav role="navigation" aria-label="{translate|escape key="plugins.block.browse"}">
		<ul class="list-unstyled">
			{if $browseCategoryFactory && $browseCategoryFactory->getCount()}
				<li class="has_submenu">
				<strong>{translate key="plugins.block.browse.category"}</strong>
					<ul class="small ps-3 list-unstyled">
						{iterate from=browseCategoryFactory item=browseCategory}
							<li class="category_{$browseCategory->getId()}{if $browseCategory->getParentId()} is_sub{/if}{if $browseBlockSelectedCategory == $browseCategory->getPath()} current{/if}">
								<a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$browseCategory->getPath()|escape}">
									{$browseCategory->getLocalizedTitle()|escape}
								</a>
							</li>
						{/iterate}
					</ul>
				</li>
			{/if}
		</ul>
	</nav>
</div>
</div>
</div>
</div>