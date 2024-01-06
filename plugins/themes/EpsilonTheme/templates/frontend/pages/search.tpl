{**
* templates/frontend/pages/search.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Display the page to search and view search results.
*
* @uses $query Value of the danger search query
* @uses $authors Value of the authors search filter
* @uses $dateFrom Value of the date from search filter (published after).
*  Value is a single string: YYYY-MM-DD HH:MM:SS
* @uses $dateTo Value of the date to search filter (published before).
*  Value is a single string: YYYY-MM-DD HH:MM:SS
* @uses $yearStart Earliest year that can be used in from/to filters
* @uses $yearEnd Latest year that can be used in from/to filters
*}
{include file="frontend/components/header.tpl" pageTitle="common.search"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}
<div  id="main-content" class="page page_search animate__animated fadeIn delay-1s">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.search"}
	<div class="page-header"><h1>{translate key="common.search"}</h1></div>
	
	{* Main Search From *}
	{capture name="searchFormUrl"}{url op="search" escape=false}{/capture}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form method="get" class="search-form" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
	{*
		{csrf}
	*}
	{foreach from=$formUrlParameters key=paramKey item=paramValue}
	<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
	{/foreach}
	
	<div class="">
		{* Repeat the label text just so that screen readers have a clear label/input relationship *}
		<label class="sr-only" for="query">{translate key="search.searchFor"}</label>
		<div class="card text-bg-light">
			<div class="card-body">
				<div class="input-group input-group-lg">
					<input type="text" id="query" name="query" value="{$query|escape}" class="query form-control " placeholder="{translate key="common.search"}">
					<button type="submit" class="btn btn-primary "><i class="fa fa-search fa-2 me-2" aria-hidden="true"></i>{translate key="common.search"}</button>
				</div>
				<div class="text-center my-2">
					<button class="btn btn-link" type="button" data-bs-toggle="collapse" data-bs-target="#advSearchCollapse" aria-expanded="false" aria-controls="advSearchCollapse"><i class="fa fa-filter me-2" aria-hidden="true"></i>{translate key="search.advancedFilters"}</button>
					<!--
					<a class="stretched-link" data-bs-toggle="collapse" href="#advSearchCollapse" role="button" aria-expanded="false" aria-controls="advSearchCollapse"><i class="fa fa-filter me-2" aria-hidden="true"></i>{translate key="search.advancedFilters"}</a>
					-->
				</div>
				<div class="collapse" id="advSearchCollapse">
					<div class="row px-auto g-3">
						<div class="col-md-6 mb-3">
							<label for="dateFromYear">{translate key="search.dateFrom"}</label>
							<div class="row px-2">
								{html_select_date class="col form-select   mx-1" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
							<div class="mt-3">
								<label for="dateToYear">{translate key="search.dateTo"}</label>
								<div class="row px-2">
									{html_select_date class="col form-select mx-1" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
								</div>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="authors">{translate key="search.author"}</label>
							<input class="form-control  " type="text" for="authors" name="authors" value="{$authors|escape}">
						</div>
						<!--
						<div class="col-md-6">
							<label for="dateToYear">{translate key="search.dateTo"}</label>
							<div class="row px-2">
								{html_select_date class="col form-select  mx-1" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
						</div>
						-->
					</div>
				</div>
			</div>
		</div> <!-- card -->
		
		
		{call_hook name="Templates::Search::SearchResults::PreResults"}
		
		{* Search results *}
		<div class="search-results mt-5">
			<h4>{translate key="search.searchResults"}</h4>
			{* No results found *}
			{if $results->wasEmpty()}
			
			{* Results pagination *}
			{else}
			<div class="cmp_pagination mt-3">
				{page_info iterator=$results}
				{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
			</div>
			{/if}
		
			<div class="">
				<table id="tableSort" class="table table-responsive display">
					<thead>
						<tr>
							<th scope="col">{translate key="plugins.themes.EpsilonTheme.title.n.author"}</th>
							<th scope="col">{translate key="plugins.themes.EpsilonTheme.published"}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							{iterate from=results item=result}
								{include file="frontend/objects/article_summary_table.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
							{/iterate}
						</tr>
					</tbody>
				</table>
			</div> <!-- container -->
			
			
			{* No results found *}
			{if $results->wasEmpty()}
			<div class="my-3">
				{if $error}
					{include file="frontend/components/notification.tpl" type="error" message=$error|escape}
				{else}
				{include file="frontend/components/notification.tpl" type="notice" messageKey="search.noResults"}
			</div>
			{/if}
			
			{* Results pagination *}
			
			{else}
			<div class="cmp_pagination mt-3">
				{page_info iterator=$results}
				{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
				</div>
			{/if}
		</div>
	</form>
</div>
<!-- .page -->
{include file="common/frontend/footer.tpl"}