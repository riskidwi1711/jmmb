{**
 * plugins/blocks/subscription/block.tpl
 *
 * Copyright (c) 2013-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the logged-in user's subscriptions
 *
 *}
{if $individualSubscription}
	{assign var=individualSubscriptionValid value=$individualSubscription->isValid()}
	{assign var=subscriptionStatus value=$individualSubscription->getStatus()}
{/if}


<div class="pkp_block block_subscription accordion" id="blockSubs">
	<div class="accordion-item">
		<h4 class="accordion-header" id="subsHead">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#subsBody" aria-expanded="false" aria-controls="subsBody">
                {translate key="plugins.block.subscription.blockTitle"}
              </button>
            </h4>
	
	</div>
	
	<div id="subsBody" class="accordion-collapse collapse" aria-labelledby="subsHead" data-bs-parent="blockSubs">
	<div class="accordion-body">
		{if $institutionalSubscription}
			<p>
				{translate key="plugins.block.subscription.providedBy" institutionName=$institutionalSubscription->getInstitutionName()|escape}
			</p>
			<p>
				{translate key="plugins.block.subscription.comingFromIP" ip=$userIP|escape}
			</p>
		{elseif $individualSubscription}
			<p class="subscription_name">
				{$individualSubscription->getSubscriptionTypeName()|escape}
			</p>
			{if $individualSubscription->getMembership()}
				<p class="subscription_membership">({$individualSubscription->getMembership()|escape})</p>
			{/if}
			{if $paymentsEnabled && $acceptSubscriptionPayments && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
				<p class="subscription_disabled">{translate key="subscriptions.status.awaitingOnlinePayment"}</p>
			{elseif $paymentsEnabled && $acceptSubscriptionPayments && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
				<p class="subscription_disabled">{translate key="subscriptions.status.awaitingManualPayment"}</p>
			{elseif $individualSubscription->isNonExpiring()}
				<p class="subscription_active">{translate key="subscriptionTypes.nonExpiring"}</p>
			{elseif $individualSubscription->isExpired()}
				<p class="subscription_disabled">{translate key="user.subscriptions.expired" date=$individualSubscription->getDateEnd()|date_format:$dateFormatShort}</p>
			{else}
				<p class="subscription_active">{translate key="user.subscriptions.expires" date=$individualSubscription->getDateEnd()|date_format:$dateFormatShort}</p>
			{/if}
		{elseif !$userLoggedIn}
			<p>{translate key="plugins.block.subscription.loginToVerifySubscription"}</p>
		{/if}
		{if $userLoggedIn}
			<p>
				{if $institutionalSubscription || $individualSubscription}
					<a href="{url page="user" op="subscriptions"}">{translate key="user.subscriptions.mySubscriptions"}</a>
				{else}
					{translate key="plugins.block.subscription.subscriptionRequired"}
					<a href="{url page="about" op="subscriptions"}">{translate key="plugins.block.subscription.subscriptionRequired.learnMore"}</a>
				{/if}
			</p>
		{/if}
	</div>
</div>
</div>