Return-Path: <linux-input+bounces-11135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A777A6D9D8
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AFF0188F693
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AC419C542;
	Mon, 24 Mar 2025 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGwmxknA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96628E7;
	Mon, 24 Mar 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818216; cv=none; b=BuBxMB0cBMOazc8PCFRIRg35thXIT9ES2PJ/+fU5gaz1vD+68J5zdfqq7eWZaBs0JvUkbkJ+C2qSmbucnbduVOxldjQSmj/9FMfQ/mcdcsB6FT2Lc38wMvQjeP9702PeyN7Ob+tYfcjaaAGT+RO1rSrCtNyBzTsQWUkfhiIIOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818216; c=relaxed/simple;
	bh=TZ/bjmULzUc368XSG6wqoRlNNvZVRDr974YDSjdgGxQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HwtOd2J6W8VOTz5mPewugEbo6bMfAhBO1lP7aoBfKdOLN6NdZnNQ+ICcffcyGxuvKJ0geMBa4mekzTEJthleUK6UGVIGSSGizxneg9ORsYNXUupIIWYyIZ8XAPdeg1KWHAXj6Ko+30m0co1gHfZx+6W5fQxTVHR6B5sBmCmhb6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGwmxknA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742818214; x=1774354214;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TZ/bjmULzUc368XSG6wqoRlNNvZVRDr974YDSjdgGxQ=;
  b=EGwmxknAQcaXQkjsdIGlEpugdEUyVfYXhKM2aSF5JeFN44RKG9Feorkh
   VwP2BDK6/0kWsEoVhwn7BFKa8MvgWjr8zrMK+sA8S1ILBWBJMcMNN6DyV
   ZKM2V9oSrZA8Weg87e8NE5LNufPtraEb/USexvu8EmZZ4Uvv07ZEJi+PZ
   KRDuAiOd9EC2ZiIJV/qzblDudLlNilqE0z8coGvCkzbcd66tv1bZ1ZII0
   xtCuzfc9BwTFpwyqA0FoGJ9knULaR3EBYATVu0LVESibCJmW6ganjBBME
   vNh9v8me4H/CIyFe7VLL5R9XW7gqyqfn14EhQRJCcTiH0o1ZMcVA57fsQ
   A==;
X-CSE-ConnectionGUID: L3cWXCFnT/u4bj/PE9ehyw==
X-CSE-MsgGUID: pddmhYKsTb+lD15bmGLMkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="69373771"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="69373771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 05:10:13 -0700
X-CSE-ConnectionGUID: zDzdePVmTXufEtBvKtajRw==
X-CSE-MsgGUID: /nxY4V70SqyikFdSo0d3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="124487995"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.251])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 05:10:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Mar 2025 14:10:07 +0200 (EET)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    bentiss@kernel.org, jikos@kernel.org, mario.limonciello@amd.com, 
    lkml@antheas.dev
Subject: Re: [PATCH v4 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
In-Reply-To: <20250323023421.78012-3-luke@ljones.dev>
Message-ID: <c1fb9727-e7f7-6871-5fc1-577d96799cc3@linux.intel.com>
References: <20250323023421.78012-1-luke@ljones.dev> <20250323023421.78012-3-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Mar 2025, Luke Jones wrote:

> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Adjust how the CSEE direct call hack is used.
> 
> The results of months of testing combined with help from ASUS to
> determine the actual cause of suspend issues has resulted in this
> refactoring which immensely improves the reliability for devices which
> do not have the following minimum MCU FW version:
> - ROG Ally X: 313
> - ROG Ally 1: 319
> 
> For MCU FW versions that match the minimum or above the CSEE hack is
> disabled and mcu_powersave set to on by default as there are no
> negatives beyond a slightly slower device reinitialization due to the
> MCU being powered off.
> 
> As this is set only at module load time, it is still possible for
> mcu_powersave sysfs attributes to change it at runtime if so desired.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

This series update lost Mario's rev-bys (given in replies to v3). Was that 
intentional??

-- 
 i.

> ---
>  drivers/hid/hid-asus.c                     |   4 +
>  drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>  include/linux/platform_data/x86/asus-wmi.h |  19 +++
>  3 files changed, 117 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 599c836507ff..4b45e31f0bab 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>  		hid_warn(hdev,
>  			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
>  			min_version);
> +	} else {
> +		set_ally_mcu_hack(ASUS_WMI_ALLY_MCU_HACK_DISABLED);
> +		set_ally_mcu_powersave(true);
>  	}
>  }
>  
> @@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
>  };
>  module_hid_driver(asus_driver);
>  
> +MODULE_IMPORT_NS("ASUS_WMI");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..27f11643a00d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
>  #define ASUS_MINI_LED_2024_STRONG	0x01
>  #define ASUS_MINI_LED_2024_OFF		0x02
>  
> -/* Controls the power state of the USB0 hub on ROG Ally which input is on */
>  #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> -/* 300ms so far seems to produce a reliable result on AC and battery */
> -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> +/*
> + * The period required to wait after screen off/on/s2idle.check in MS.
> + * Time here greatly impacts the wake behaviour. Used in suspend/wake.
> + */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT	600
> +#define ASUS_USB0_PWR_EC0_CSEE_OFF	0xB7
> +#define ASUS_USB0_PWR_EC0_CSEE_ON	0xB8
>  
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>  
>  static int throttle_thermal_policy_write(struct asus_wmi *);
>  
> -static const struct dmi_system_id asus_ally_mcu_quirk[] = {
> +static const struct dmi_system_id asus_rog_ally_device[] = {
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> @@ -274,9 +278,6 @@ struct asus_wmi {
>  	u32 tablet_switch_dev_id;
>  	bool tablet_switch_inverted;
>  
> -	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> -	bool ally_mcu_usb_switch;
> -
>  	enum fan_type fan_type;
>  	enum fan_type gpu_fan_type;
>  	enum fan_type mid_fan_type;
> @@ -335,6 +336,9 @@ struct asus_wmi {
>  	struct asus_wmi_driver *driver;
>  };
>  
> +/* Global to allow setting externally without requiring driver data */
> +static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
> +
>  /* WMI ************************************************************************/
>  
>  static int asus_wmi_evaluate_method3(u32 method_id,
> @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>  	return 0;
>  }
>  
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
>  				 u32 *retval)
>  {
>  	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
> @@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
>  static DEVICE_ATTR_RW(nv_temp_target);
>  
>  /* Ally MCU Powersave ********************************************************/
> +
> +/*
> + * The HID driver needs to check MCU version and set this to false if the MCU FW
> + * version is >= the minimum requirements. New FW do not need the hacks.
> + */
> +void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> +{
> +	use_ally_mcu_hack = status;
> +	pr_debug("%s Ally MCU suspend quirk\n",
> +		 status == ASUS_WMI_ALLY_MCU_HACK_ENABLED ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> +
> +/*
> + * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
> + * - v313 for Ally X
> + * - v319 for Ally 1
> + * The HID driver checks MCU versions and so should set this if requirements match
> + */
> +void set_ally_mcu_powersave(bool enabled)
> +{
> +	int result, err;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
> +	if (err) {
> +		pr_warn("Failed to set MCU powersave: %d\n", err);
> +		return;
> +	}
> +	if (result > 1) {
> +		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> +		return;
> +	}
> +
> +	pr_debug("%s MCU Powersave\n",
> +		 enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> +
>  static ssize_t mcu_powersave_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -4711,6 +4753,21 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform;
>  
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_INIT) {
> +		if (acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +					&& dmi_check_system(asus_rog_ally_device))
> +			use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_ENABLED;
> +		if (dmi_match(DMI_BOARD_NAME, "RC71")) {
> +			/*
> +			 * These steps ensure the device is in a valid good state, this is
> +			 * especially important for the Ally 1 after a reboot.
> +			 */
> +			acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +						   ASUS_USB0_PWR_EC0_CSEE_ON);
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +		}
> +	}
> +
>  	/* ensure defaults for tunables */
>  	asus->ppt_pl2_sppt = 5;
>  	asus->ppt_pl1_spl = 5;
> @@ -4723,8 +4780,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>  	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> -						&& dmi_check_system(asus_ally_mcu_quirk);
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4910,34 +4965,6 @@ static int asus_hotk_resume(struct device *device)
>  	return 0;
>  }
>  
> -static int asus_hotk_resume_early(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to prevent USB0 being yanked then reappearing rapidly */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> -			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
> -static int asus_hotk_prepare(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to ensure USB0 is disabled before sleep continues */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> -			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
>  static int asus_hotk_restore(struct device *device)
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(device);
> @@ -4978,11 +5005,34 @@ static int asus_hotk_restore(struct device *device)
>  	return 0;
>  }
>  
> +static void asus_ally_s2idle_restore(void)
> +{
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_ON);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_OFF);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +	return 0;
> +}
> +
> +/* Use only for Ally devices due to the wake_on_ac */
> +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
> +	.restore = asus_ally_s2idle_restore,
> +};
> +
>  static const struct dev_pm_ops asus_pm_ops = {
>  	.thaw = asus_hotk_thaw,
>  	.restore = asus_hotk_restore,
>  	.resume = asus_hotk_resume,
> -	.resume_early = asus_hotk_resume_early,
>  	.prepare = asus_hotk_prepare,
>  };
>  
> @@ -5010,6 +5060,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +	if (ret)
> +		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +
>  	return asus_wmi_add(pdev);
>  }
>  
> @@ -5042,6 +5096,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>  
>  void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>  {
> +	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>  	platform_device_unregister(driver->platform_device);
>  	platform_driver_unregister(&driver->platform_driver);
>  	used = false;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861..8a515179113d 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -157,9 +157,28 @@
>  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
>  #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>  
> +enum asus_ally_mcu_hack {
> +	ASUS_WMI_ALLY_MCU_HACK_INIT,
> +	ASUS_WMI_ALLY_MCU_HACK_ENABLED,
> +	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
> +};
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> +void set_ally_mcu_powersave(bool enabled);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  #else
> +static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> +{
> +}
> +static inline void set_ally_mcu_powersave(bool enabled)
> +{
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  					   u32 *retval)
>  {
> 

