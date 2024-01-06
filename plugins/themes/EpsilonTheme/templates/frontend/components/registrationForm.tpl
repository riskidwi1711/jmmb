{**
* templates/frontend/components/registrationForm.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Display the basic registration form fields
*
* @uses $locale string Locale key to use in the affiliate field
* @uses $firstName string First name input entry if available
* @uses $middleName string Middle name input entry if available
* @uses $lastName string Last name input entry if available
* @uses $countries array List of country options
* @uses $country string The selected country if available
* @uses $email string Email input entry if available
* @uses $username string Username input entry if available
*}
<div class="reg-form row">

	<fieldset class="identity col-md-6">
		<h4 class="registration-heading text-start">
			{translate key="user.profile"}
		</h4>
		<div class="row">
			<div class="input-group mb-3 col-md-12 given_name">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="First Name" type="text" name="givenName" id="givenName" value="{$givenName|escape}" maxlength="255" required aria-required="true">
					<label for="givenName" class="form-label">{translate key="user.givenName"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 family_name">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="Last Name" type="text" name="familyName" id="familyName" value="{$familyName|escape}" maxlength="255">
					<label for="familyName" class="form-label">{translate key="user.familyName"}</label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 affiliation">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key="user.affiliation"}" type="text" name="affiliation" id="affiliation" value="{$affiliation|escape}" required aria-required="true">
					<label for="affiliation" class="form-label">{translate key="user.affiliation"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
			{*
			<div class="input-group mb-3 col-md-12 phone">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key="user.phone"}" type="text" name="phone"
					id="phone" value="{$phone|escape}" maxlength="40">
					<label for="country" class="form-label">{translate key="user.phone"}</label>
				</div>
			</div>
			*}
			<div class="input-group mb-3 col-md-12 country">
				<div class="form-floating">
					<select class="form-select shadow-none" name="country" id="country" required aria-required="true">
						<option>{translate key="common.country"}</option>{html_options options=$countries selected=$country}
					</select>
					<label for="country" class="form-label">{translate key="common.country"} <strong class="text-danger">*</strong></label>
				</div>
			</div>

		</div>
	</fieldset>

	<fieldset class="login col-md-6">
		<h4 class="registration-heading text-start">
			{translate key="user.login"}
		</h4>
		<div class="fields row">
			<div class="input-group mb-3 col-md-12 email">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key=" user.email"}" type="text" name="email" id="email" value="{$email|escape}" maxlength="90" required aria-required="true">
					<label for="email" class="form-label">{translate key=" user.email"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 username">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key=" user.username"}" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required aria-required="true">
					<label for="username" class="form-label">{translate key=" user.username"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 password">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key=" user.password"}" type="password" name="password" id="password" password="true" maxlength="32" required aria-required="true">
					<label for="password" class="form-label">{translate key=" user.password"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 password">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="{translate key=" user.repeatPassword"}" type="password" name="password2" id="password2" password="true" maxlength="32" required aria-required="true">
					<label for="password2" class="form-label">{translate key=" user.repeatPassword"} <strong class="text-danger">*</strong></label>
				</div>
			</div>
		</div>
	</fieldset>
	<p class="pkp_screen_reader text-danger text-start"><strong class="text-danger">*</strong> {translate key="common.required"}</p>
</div>
