{**
 * templates/frontend/objects/issue_summary_table.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
	{* Retrieve separate entries for $issueTitle and $issueSeries *}
	{assign var=issueTitle value=$issue->getLocalizedTitle()}
	{assign var=issueSeries value=$issue->getIssueSeries()}
    <tr>
		<td>
			<a class="title" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
				{if $issueTitle}
					{$issueTitle|escape}
				{else}
					{$issueSeries|escape}
				{/if}
			</a>
		</td>
		<td>
			{if $issueTitle}
				{$issueSeries|escape}
			{/if}
		</td>
		<td>
			{$issue->getDatePublished()|escape|date_format:$dateFormatShort}
		</td>
    </tr>
    

