{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
<div class="issue-toc">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* Issue introduction area above articles *}
	<div class="card card-body border-primary-lighten-2 bg-light heading animate__animated animate__fadeInUp">
		<div class="">
			{* Issue cover image and description*}
			{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
			{if $issueCover}
			
				<a class="cover-journal" href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}">
					<img class="img-fluid rounded me-3" src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
				</a>
			
			{* if issue cover not found then *}
			{else}
			
				<a class="cover-journal" href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}">
					<img class="img-fluid rounded me-3" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/cover.png" {if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
				</a>
			
			{/if}
			
			<h5 class="issue-title mt-0">{$issue->getIssueIdentification()|strip_unsafe_html}</h5>
			
				{if $issueGalleys}
				
				
				
				<div class="row g-0">
					<div class="col-lg-9">
						
				{* Published date *}
				{if $issue->getDatePublished()}
				<p class="published mt-3">
					{translate key="submissions.published"}: <i class="fa fa-calendar-check-o mx-1"></i>{$issue->getDatePublished()|escape|date_format:$dateFormatShort}	
				</p>
				{/if}
				
						{* Issue Description *}
						{if $issue->hasDescription()}
						<div class="description">
							{$issue->getLocalizedDescription()|strip_unsafe_html}
						</div>
						{/if}
				
						{* PUb IDs (eg - DOI) *}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{if $issue->getPublished()}
								{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
							{else}
								{assign var=pubId value=$pubIdPlugin->getPubId($issue)}
								{* Preview pubId *}
							{/if}
						{if $pubId}
							{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							<p class="text-muted mt-3 pub_id {$pubIdPlugin->getPubIdType()|escape}">
								<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-icon.png"> 
								{if $doiUrl}
									<a href="{$doiUrl|escape}">{$doiUrl}</a>
								{else}
									{$pubId}
								{/if}
							</p>
						{/if}
						{/foreach}
					</div>
					
					
					{* Full-issue galleys *}
			<div class="col-lg-3">
				<h5 class="my-3 animate__animated animate__fadeInUp delay-1s">
					<i class="fa fa-bookmark-o me-2"></i>{translate key="issue.fullIssue"}
				</h5>
				<div class="btn-toolbar galleys">
					{foreach from=$issueGalleys item=galley}
						<span class="mb-1">
						{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
						</span>
					{/foreach}
				</div>
			</div>
				</div>
				
			{else}
			<div class="col">
						
				{* Published date *}
				{if $issue->getDatePublished()}
				<p class="published mt-3">
					{translate key="submissions.published"}: <i class="fa fa-calendar-check-o mx-1"></i>{$issue->getDatePublished()|escape|date_format:$dateFormatShort}	
				</p>
				{/if}
				
						{* Issue Description *}
						{if $issue->hasDescription()}
						<div class="description">
							{$issue->getLocalizedDescription()|strip_unsafe_html}
						</div>
						{/if}
				
						{* PUb IDs (eg - DOI) *}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{if $issue->getPublished()}
								{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
							{else}
								{assign var=pubId value=$pubIdPlugin->getPubId($issue)}
								{* Preview pubId *}
							{/if}
						{if $pubId}
							{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							<p class="text-muted mt-3 pub_id {$pubIdPlugin->getPubIdType()|escape}">
								<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-icon.png"> 
								{if $doiUrl}
									<a href="{$doiUrl|escape}">{$doiUrl}</a>
								{else}
									{$pubId}
								{/if}
							</p>
						{/if}
						{/foreach}
					</div>
			{/if}
			
		</div><!-- row -->
		
	</div>
	
	{* Articles *}
	<div class="sections">
		{foreach name=sections from=$publishedSubmissions item=section}
			{if $section.articles}
			<div class="section">
				{if $section.title}
				<h5 class="mt-4 mb-3 animate__animated animate__fadeInUp delay-1s">
					<i class="fa fa-files-o me-2"></i>{$section.title|escape}
				</h5>
				{/if}
				<div class="row g-3">
					{foreach from=$section.articles item=article}
						{include file="frontend/objects/article_summary.tpl"}
					{/foreach}
				</div>
			</div>
			{/if}
		{/foreach}
	</div><!-- .sections -->

</div><!-- .issue-toc -->
