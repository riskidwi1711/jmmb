{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentJournal Journal The current journal
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div id="main-content" class="page page_submissions">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.submissions"}

	{* Page Title *}
	<div class="page-header">
		<h1>{translate key="about.submissions"}</h1>
	</div>

	{* Login/register prompt *}
	{if $isUserLoggedIn}
		{capture assign="newSubmission"}<a class="btn rounded-sm btn-primary shadow-none me-2 my-3" href="{url page="submission" op="wizard"}"><i class="fa fa-plus me-2" aria-hiden="true"></i>{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
		{capture assign="viewSubmissions"}<a class="btn rounded-sm btn-outline-primary shadow-none mx-3 my-3" href="{url page="submissions"}"><i class="fa fa-eye me-2" aria-hiden="true"></i>{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
		<div class="card text-center">
		<div class="card-body">
			{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
		</div>
		</div>
	{else}
		{capture assign="login"}<a class="btn rounded-sm btn-primary shadow-none me-2 my-3" href="{url page="login"}"><i class="fa fa-sign-in me-2" aria-hiden="true"></i>{translate key="about.onlineSubmissions.login"}</a>{/capture}
		{capture assign="register"}<a class="btn rounded-sm btn-outline-primary shadow-none mx-3 my-3" href="{url page="user" op="register"}"><i class="fa fa-user-plus me-2" aria-hidden="true"></i>{translate key="about.onlineSubmissions.register"}</a>{/capture}
		<div class="card text-center">
		<div class="card-body">
			{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
		</div>
		</div>
	{/if}

	{* Submission Checklist *}
	{if $submissionChecklist}
		<div class="submission_checklist">
			<div class="page-header mt-5">
				<h4 class="mt-5">
					{translate key="about.submissionPreparationChecklist"}
					{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission" aria-selected="true" sectionTitleKey="about.submissionPreparationChecklist"}
				</h4>
			</div>
			<p>
				{translate key="about.submissionPreparationChecklist.description"}
			</p>
			<table class="table">
			    <tbody>
				{foreach from=$submissionChecklist item=checklistItem}
					<tr>
						<th scope="row" class="align-middle text-primary">
						    <i class="fa fa-check fa-1" aria-hidden="true"></i>
					    </th>
						<td >{$checklistItem.content|nl2br}</td>
					</tr>
				{/foreach}
				</tbody>
			</table>

		</div>
	{/if}
	{* /Submission Checklist *}
	<div class="clearfix my-3"></div>
	{* Author Guidelines *}
	{if $currentJournal->getLocalizedSetting('authorGuidelines')}
		<div class="author_guidelines mt-5">
			<h3>
				{translate key="about.authorGuidelines"}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="journal" anchor="guidelines" sectionTitleKey="about.authorGuidelines"}
			</h3>
			{$currentJournal->getLocalizedSetting('authorGuidelines')}
		</div>
	{/if}
	{* /Author Guidelines *}

	{* Copyright Notice *}
	{if $currentJournal->getLocalizedSetting('copyrightNotice')}
		<div class="copyright-notice mt-5">
			<h3>
				{translate key="about.copyrightNotice"}
				</span>{include file="frontend/components/editLink.tpl" page="management" op="settings" path="journal" anchor="policies" sectionTitleKey="about.copyrightNotice"}
			</h3>
			{$currentJournal->getLocalizedSetting('copyrightNotice')}
		</div>
	{/if}
	{* /Copyright Notice *}

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
