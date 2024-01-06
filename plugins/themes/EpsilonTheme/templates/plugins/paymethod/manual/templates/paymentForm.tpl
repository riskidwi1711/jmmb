{**
 * plugins/paymethod/manual/templates/paymentForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Manual payment page
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.paymethod.manual"}

<div class="page page-institutional-subscription">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle={$title|escape}}
	
	{* Page Title *}
	<div class="page-header">
		<h3>{translate key="plugins.paymethod.manual"}</h3>
	</div>
	{* /Page Title *}
	
	<div class="justify-content-md-center">
		<table class="table table-sm table-hover">
			<thead>
				<tr>
					<th>{translate key="plugins.paymethod.manual.purchase.title"}</th>
					<td>{$itemName|escape}</td>
				</tr>
			</thead>
			{if $itemAmount}
			</tbody>
				<tr>
					<th>{translate key="plugins.paymethod.manual.purchase.fee"}</th>
					<td>{$itemAmount|string_format:"%.2f"}{if $itemCurrencyCode} ({$itemCurrencyCode|escape}){/if}</td>
				</tr>
			</tbody>
			{/if}
		</table>

		<p>{$manualInstructions|nl2br}</p>

		<p>
			<a class="btn rounded-sm btn-warning btn-sm" href="{url page="payment" op="plugin" path="ManualPayment"|to_array:"notify":$queuedPaymentId|escape}" class="action">
				<i class="fa fa-credit-card me-2 aria-hidden="true"></i>{translate key="plugins.paymethod.manual.sendNotificationOfPayment"}
			</a>
		</p>	
		
	</div>
</div>

{include file="frontend/components/footer.tpl"}
