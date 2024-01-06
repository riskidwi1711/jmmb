{**
 * templates/frontend/pages/catalogCategory.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a category of the catalog.
 *
 * @uses $category Category Current category being viewed
 * @uses $publishedSubmissions array List of published submissions in this category
 * @uses $parentCategory Category Parent category if one exists
 * @uses $subcategories array List of subcategories if they exist
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published submissions in this category
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$category->getLocalizedTitle()}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="page page_catalog_category">

	{* Breadcrumb *}
	{include file="frontend/components/breadcrumbs_catalog.tpl" type="category" parent=$parentCategory currentTitle=$category->getLocalizedTitle()}

	{* Count of articles in this category *}
	<div class="article_count mt-4">
		<h5>{translate key="catalog.browseTitles" numTitles=$total}</h5>
	</div>
	
	{* Image and description *}
	{assign var="image" value=$category->getImage()}
	{assign var="description" value=$category->getLocalizedDescription()|strip_unsafe_html}
	<div class="row{if $image} has_image{/if}{if $description} has_description{/if}">
		{if $image}
			<div class="col-md-2" href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="fullSize" type="category" id=$category->getId()}">
				<img class="img-fluid" src="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="thumbnail" type="category" id=$category->getId()}" alt="{$category->getLocalizedTitle()|escape}" />
			</div>
		{/if}
		<div class="col-md-10 small">
			{$description|strip_unsafe_html}
		</div>
		<div class="clearfix"></div>
		<hr class="border-secondary mt-0" style="border-style:dashed"/>
	</div>
	
	{if !$subcategories->wasEmpty()}
	<nav class="subcategories mt-3" role="navigation">
		<div class="page-header">
		<h4>
			{translate key="catalog.category.subcategories"}
		</h4>
		</div>
		<ul style="list-style-type: square;">
			{iterate from=subcategories item=subcategory}
				<li>
					<a href="{url op="category" path=$subcategory->getPath()}">
						{$subcategory->getLocalizedTitle()|escape}
					</a>
				</li>
			{/iterate}
		</ul>
	</nav>
	{/if}
	
	<div class="page-header mt-3">
		<h4>{translate key="catalog.category.heading"}</h4>
	</div>
	
	{* No published titles in this category *}
	{if empty($publishedSubmissions)}
		<div class="alert alert-info" role="alert">{translate key="catalog.category.noItems"}</div>
	{else}
		<div class="cmp_article_list">
			{foreach from=$publishedSubmissions item=article}
				{include file="frontend/objects/article_summary.tpl"}
			{/foreach}
		</div>

		{* Pagination *}
		{if $prevPage > 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$prevPage}{/capture}
		{elseif $prevPage === 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()}{/capture}
		{/if}
		{if $nextPage}
			{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$nextPage}{/capture}
		{/if}
		{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
		}
	{/if}

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
