{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

{if $prevUrl || $nextUrl}
	<nav class="mt-4" aria-label="{translate|escape key="common.pagination.label"}">
		<ul class="pagination pagination-sm justify-content-center animate__animated animate__fadeInUp">
			{if $prevUrl}
				<li class="page-item previous">
					<a class="page-link shadow-none" href="{$prevUrl}">
						<i class="fa fa-angle-left me-1" aria-hidden="true"></i>
						{translate key="help.previous"}
					</a>
				</li>
			{/if}
			<li class="page-item active" aria-current="page">
				<a class="page-link shadow-none" href="#">{translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}</a>
			</li>
			{if $nextUrl}
			<li class="page-item next">
				<a class="page-link shadow-none" href="{$nextUrl}">
					{translate key="help.next"}
					<i class="fa fa-angle-right ms-1" aria-hidden="true"></i>
				</a>
			</li>
			{/if}
		</ul>
	</nav>
{/if}
