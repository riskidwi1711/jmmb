{**
* templates/frontend/objects/issue_summary.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief View of an Issue which displays a summary for use in lists
*
* @uses $issue Issue The issue
*}
<div class="col-12">
	<div class="issue-summary animate__animated animate__fadeInUp">
	<div class="card">
		<div class="row g-0">
			{* Retrieve separate entries for $issueTitle and $issueSeries *}
			{assign var=issueTitle value=$issue->getLocalizedTitle()}
			{assign var=issueSeries value=$issue->getIssueSeries()}
			{* Show cover image and use cover description *}
			{if $issue->getLocalizedCoverImage()}
			<div class="col-3 col-md-3 col-lg-2 issue-summary-img">
				<a href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
				<img class="img-fluid" src="{$issue->getLocalizedCoverImageUrl()|escape}">
				</a>
			</div>
			{else}
			<div class="col-3 col-md-3 col-lg-2 issue-summary-img">
				<a href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
				<img class="img-fluid" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/no-cover.png">
				</a>
			</div>
			{/if}
			<div class="col-9 col-md-9 col-lg-10 issue-summary-txt">
				<div class="card-body">
					<h3 class="mt-0">
						<a class="title stretched-link" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
						{if $issueTitle}
						{$issueTitle|escape}
						{else}
						{$issueSeries|escape}
						{/if}
						</a>
					</h3>
					{if $issueTitle}
					<h5 class="my-2 series">
						{$issueSeries|escape}
					</h5>
					{/if}
					<p class=="my-0 text-monospace publish-date">{translate key="submissions.published"}: {$issue->getDatePublished()|escape|date_format:$dateFormatShort}</p>
					<div class="description">
						{$issueDescription|strip_unsafe_html|nl2br}
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</div>
</div>
<!-- .issue-summary -->
