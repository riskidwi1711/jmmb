{**
 * templates/frontend/pages/userSubscriptions.tpl
 *
 *****************************************
 *
 * Epsilon Theme
 * Copyright (c) Hasan Syaiful Rizal | HSR
 *
 *****************************************
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.mySubscriptions"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="page page_custom" id="main">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey={$pageTitle|escape}}
		<div class="page-header">
			<h3>{translate key="user.subscriptions.mySubscriptions"}</h3>
		</div>

			{include file="frontend/components/subscriptionContact.tpl"}

			{if $paymentsEnabled}
				<section>
					<h5>{translate key="user.subscriptions.subscriptionStatus"}</h5>
					<p>{translate key="user.subscriptions.statusInformation"}</p>
					<table>
						<thead>
						<tr>
							<th>{translate key="user.subscriptions.status"}</th>
							<th>{translate key="user.subscriptions.statusDescription"}</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>{translate key="subscriptions.status.needsInformation"}</td>
							<td>{translate key="user.subscriptions.status.needsInformationDescription"}</td>
						</tr>
						<tr>
							<td>{translate key="subscriptions.status.needsApproval"}</td>
							<td>{translate key="user.subscriptions.status.needsApprovalDescription"}</td>
						</tr>
						<tr>
							<td>{translate key="subscriptions.status.awaitingManualPayment"}</td>
							<td>{translate key="user.subscriptions.status.awaitingManualPaymentDescription"}</td>
						</tr>
						<tr>
							<td>{translate key="subscriptions.status.awaitingOnlinePayment"}</td>
							<td>{translate key="user.subscriptions.status.awaitingOnlinePaymentDescription"}</td>
						</tr>
						</tbody>
					</table>
				</section>
			{/if}

			{if $individualSubscriptionTypesExist}
				<section>
					<h5>{translate key="user.subscriptions.individualSubscriptions"}</h5>
					<p>{translate key="subscriptions.individualDescription"}</p>
					{if $userIndividualSubscription}
						<table>
							<thead>
							<tr>
								<th>{translate key="user.subscriptions.form.typeId"}</th>
								<th>{translate key="subscriptions.status"}</th>
								{if $paymentsEnabled}
									<th></th>
								{/if}
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>{$userIndividualSubscription->getSubscriptionTypeName()|escape}</td>
								<td>
									{assign var="subscriptionStatus" value=$userIndividualSubscription->getStatus()}
									{assign var="isNonExpiring" value=$userIndividualSubscription->isNonExpiring()}
									{if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
										<span>
										{translate key="subscriptions.status.awaitingOnlinePayment"}
									</span>
									{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
										<span>
										{translate key="subscriptions.status.awaitingManualPayment"}
									</span>
									{elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
										<span>
										{translate key="subscriptions.inactive"}
									</span>
									{else}
										{if $isNonExpiring}
											{translate key="subscriptionTypes.nonExpiring"}
										{else}
											{assign var="isExpired" value=$userIndividualSubscription->isExpired()}
											{if $isExpired}
												<span>
												{translate key="user.subscriptions.expired" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}
											</span>
											{else}
												<span>
												{translate key="user.subscriptions.expires" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}
											</span>
											{/if}
										{/if}
									{/if}
								</td>
								{if $paymentsEnabled}
									<td>
										{if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
											<a href="{url op="completePurchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
												{translate key="user.subscriptions.purchase"}
											</a>
										{elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
											{if !$isNonExpiring}
												<a href="{url op="payRenewSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
													{translate key="user.subscriptions.renew"}
												</a>
											{/if}
											<a href="{url op="purchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
												{translate key="user.subscriptions.purchase"}
											</a>
										{/if}
									</td>
								{/if}
							</tr>
							</tbody>
						</table>
					{elseif $paymentsEnabled}
						<p>
							<a class="btn rounded-sm btn-primary" href="{url op="purchaseSubscription" path="individual"}">
								{translate key="user.subscriptions.purchaseNewSubscription"}
							</a>
						</p>
					{else}
						<p>
							<a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">
								{translate key="user.subscriptions.viewSubscriptionTypes"}
							</a>
						</p>
					{/if}
				</section>
			{/if}

			{if $institutionalSubscriptionTypesExist}
				<section>
					<h5>{translate key="user.subscriptions.institutionalSubscriptions"}</h5>
					<p>
						{translate key="subscriptions.institutionalDescription"}
						{if $paymentsEnabled}
							{translate key="subscriptions.institutionalOnlinePaymentDescription"}
						{/if}
					</p>
					{if $userInstitutionalSubscriptions}
						<table>
							<thead>
							<tr>
								<th>{translate key="user.subscriptions.form.typeId"}</th>
								<th>{translate key="user.subscriptions.form.institutionName"}</th>
								<th>{translate key="subscriptions.status"}</th>
								{if $paymentsEnabled}
									<th></th>
								{/if}
							</tr>
							</thead>
							<tbody>
								{iterate from=userInstitutionalSubscriptions item=userInstitutionalSubscription}
									<tr>
										<td>{$userInstitutionalSubscription->getSubscriptionTypeName()|escape}</td>
										<td>{$userInstitutionalSubscription->getInstitutionName()|escape}</td>
										<td>
											{assign var="subscriptionStatus" value=$userInstitutionalSubscription->getStatus()}
											{assign var="isNonExpiring" value=$userInstitutionalSubscription->isNonExpiring()}
											{if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
												<span>
											{translate key="subscriptions.status.awaitingOnlinePayment"}
										</span>
											{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
												<span>
											{translate key="subscriptions.status.awaitingManualPayment"}
										</span>
											{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_NEEDS_APPROVAL}
												<span>
											{translate key="subscriptions.status.needsApproval"}
										</span>
											{elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
												<span>
											{translate key="subscriptions.inactive"}
										</span>
											{else}
												{if $isNonExpiring}
													<span>
												{translate key="subscriptionTypes.nonExpiring"}
											</span>
												{else}
													{assign var="isExpired" value=$userInstitutionalSubscription->isExpired()}
													{if $isExpired}
														<span>
													{translate key="user.subscriptions.expired" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}
												</span>
													{else}
														<span>
													{translate key="user.subscriptions.expires" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}
												</span>
													{/if}
												{/if}
											{/if}
										</td>
										{if $paymentsEnabled}
											<td>
												{if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
													<a href="{url op="completePurchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
														{translate key="user.subscriptions.purchase"}
													</a>
												{elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
													{if !$isNonExpiring}
														<a href="{url op="payRenewSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
															{translate key="user.subscriptions.renew"}
														</a>
													{/if}
													<a href="{url op="purchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
														{translate key="user.subscriptions.purchase"}
													</a>
												{/if}
											</td>
										{/if}
									</tr>
								{/iterate}
							</tbody>
						</table>
					{/if}
					<p>
						{if $paymentsEnabled}
							<a class="btn rounded-sm btn-primary" href="{url page="user" op="purchaseSubscription" path="institutional"}">
								{translate key="user.subscriptions.purchaseNewSubscription"}
							</a>
						{else}
							<a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">
								{translate key="user.subscriptions.viewSubscriptionTypes"}
							</a>
						{/if}
					</p>
				</section>
			{/if}
		
</div>

{include file="frontend/components/footer.tpl"}
