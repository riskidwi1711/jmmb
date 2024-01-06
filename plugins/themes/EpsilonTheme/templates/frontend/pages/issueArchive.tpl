{**
* templates/frontend/pages/issueArchive.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Display a list of recent issues.
*
* @uses $issues Array Collection of issues to display
* @uses $prevPage int The previous page number
* @uses $nextPage int The next page number
* @uses $showingStart int The number of the first item on this page
* @uses $showingEnd int The number of the last item on this page
* @uses $total int Count of all published monographs
*}
{capture assign="pageTitle"}
{if $prevPage}
{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
{else}
{translate key="archive.archives"}
{/if}
{/capture}

{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div id="main-content" class="page page_issue_archive">
	{if empty($issues)}
	<div class="alert alert-info text-center alert-dismissible show animate__animated animate__fadeInUp animate__delay-1s" role="alert">
		{translate key="current.noCurrentIssueDesc"}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	{else}
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}
	
	{if $activeTheme->getOption('issueArchiveLayout')}	
	<div class="d-block clearfix mb-3">
		<!-- Nav tabs -->
		<ul class="nav nav-pills float-end">
			<li class="nav-item">
				<a class="nav-link active" title="{translate key="plugins.themes.EpsilonTheme.grid-view"}" data-bs-toggle="pill" href="#grid"><i class="fa fa-th-large" aria-hidden="true"></i></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" title="{translate key="plugins.themes.EpsilonTheme.table-view"}" data-bs-toggle="pill" href="#listTable"><i class="fa fa-th-list" aria-hidden="true"></i></a>
			</li>
		</ul>
	</div>
	
	<!-- Tab panes -->
	<div class="tab-content">
		{* Issue Summary Grid *}
		<div class="tab-pane active" id="grid">
			
			{* List issues *}
			<div class="row g-3">
			
				{foreach from=$issues item="issue"}
				{include file="frontend/objects/issue_summary.tpl"}
				{/foreach}
			</div>
			
			{* Pagination *}
			{capture assign="prevUrl"}
			{if $prevPage > 1}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
			{elseif $prevPage === 1}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
			{/if}
			{/capture}
			{capture assign="nextUrl"}
			{if $nextPage}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
			{/if}
			{/capture}
			{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
			}
			
		</div>
		
		{* Issue Summary Table *}
		<div class="tab-pane fade" id="listTable">
			<div class="mb-3"></div>
			{* List issues *}
			<div class="issues animate__animated animate__fadeInUp">
				<div class="">
					<table id="tableSort" class="table table-responsive display">
						<thead>
							<tr>
								<th scope="col">{translate key="plugins.themes.EpsilonTheme.edition"}</th>
								<th scope="col">{translate key="plugins.themes.EpsilonTheme.issue"}</th>
								<th scope="col">{translate key="plugins.themes.EpsilonTheme.published"}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$issues item="issue"}
							{include file="frontend/objects/issue_summary_table.tpl"}
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	{else}
		<div>
		<div class="row g-3">
		{foreach from=$issues item="issue"}
			{include file="frontend/objects/issue_summary_classic.tpl"}
		{/foreach}
		</div>
		
		{* Pagination *}
			{capture assign="prevUrl"}
			{if $prevPage > 1}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
			{elseif $prevPage === 1}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
			{/if}
			{/capture}
			{capture assign="nextUrl"}
			{if $nextPage}
			{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
			{/if}
			{/capture}
			{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
			}
			
		</div>
	{/if}
	
	{/if}
</div>
{include file="common/frontend/footer.tpl"}