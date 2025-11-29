Return-Path: <linux-input+bounces-16400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E6C94008
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 15:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EEDC3A5E6E
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 14:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B6F274FD3;
	Sat, 29 Nov 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj84wY9c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C46262FC1;
	Sat, 29 Nov 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427742; cv=none; b=DdSnaGzSoWABmTuJ5zRtBRztX/B8Ji1J3KZpy2WgDKtJQp4ghaNMRmZdJavkBj/0tPaxseBrlL34TFVsCzPzPNK4FjNHfwCXFsjbse2iFJVITiLOIzLfuwnzDzevme2f68Z0P/zD2Z2xjASMViUuRQnpr3+VSgIs5AidlB4CxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427742; c=relaxed/simple;
	bh=ZGaY1UMQFcaWR//+oyKixU40+cjodIS95PP9QfpxBXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ekl+mmwGuBWVZCxDkv1uZ5nEA2lxZsQReLwBdVKqu5LGltR/JncVgbwWkwIZ2gNkL03VEUWZRMzcBh6pWf8aZ2CxUtmhqKsLmL4np3+BtU2DnXKFEWw/DAtSwwo0sooSTBulQtu3xKM1itpxX21ed1RuO8VWU8lLyRlL4KcAGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj84wY9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B7AC4CEF7;
	Sat, 29 Nov 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764427742;
	bh=ZGaY1UMQFcaWR//+oyKixU40+cjodIS95PP9QfpxBXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uj84wY9cihudCcWOBhUhN6CVKeFkLTVeYDRe/eN28FqOvjWM4Jhrnq3R5JAHooSIZ
	 p8AdyqBWE3csNDufZwkEqRvR1iAZwrKClzQ000k9kLcvE31CR0I08GFeRv4eXdIb+f
	 xvElFPtPWJDPsR3rpvFxFu4Bou4MFD5+alUW7y5T+tr/KAVMtRln8e+eS/3eRfFhBd
	 o/IJ8yjU8ETQ8b50MycqO5RY9LnY9J8J4VGAwrENcq/pCpi1b97EE6QQowzCXdHw3y
	 sb/TjipLHXDxXfx1vjtZV3mazt8QZfCBIXHRtx1f7V0CShR5Qti5jw0Fn4/x2vs1jj
	 RzlWYSSjMfG0g==
Message-ID: <6ebeb4e7-e446-45aa-a0bb-fc96d1431580@kernel.org>
Date: Sat, 29 Nov 2025 15:48:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] platform/x86: thinkpad_acpi - Add doubletap_filter
 sysfs interface
To: Vishnu Sankar <vishnuocv@gmail.com>, corbet@lwn.net,
 dmitry.torokhov@gmail.com, hmh@hmh.eng.br, derekjohn.clark@gmail.com,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 vsankar@lenovo.com
References: <20251129002533.9070-1-vishnuocv@gmail.com>
 <20251129002533.9070-3-vishnuocv@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251129002533.9070-3-vishnuocv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vishnu,

On 29-Nov-25 1:25 AM, Vishnu Sankar wrote:
> Add sysfs interface for controlling TrackPoint doubletap event filtering.
> This allows userspace to enable/disable doubletap functionality and
> query the current state.
> 
> The attribute is available at:
> /sys/devices/platform/thinkpad_acpi/doubletap_filter
> 
> When set to 1, doubletap events are filtered out (ignored).
> When set to 0, doubletap events are processed (default).
> 
> This complements the automatic hardware enablement in the trackpoint
> driver by providing user control over event processing at the kernel level.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
> - Updated commit message to clarify dependency on trackpoint driver
> - Now handling sysfs read/write of trackpoint driver using file read/write
> - Removed sysfs attribute creation of trackpoint double tap here
> - Reversed the logic and return false right away
> - Dropped unnecessary debug messages
> - Using dev_dbg() instead of pr_xxxx()
> 
> Changes in v3:
> - No changes
> 
> Changes in v4:
> - Simplified approach: single sysfs attribute for user control
> - Clear naming: doubletap_filter instead of doubletap_enabled
> - Intuitive behavior: 0=process events, 1=filter events
> - No cross-driver dependencies or complex interactions
> - Minimal code changes using existing thinkpad_acpi infrastructure
> ---
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 54 +++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..9b646ecff452 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -373,7 +373,7 @@ static struct {
>  	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
> -	u32 trackpoint_doubletap:1;
> +	u32 trackpoint_doubletap_filter:1;

Why the rename? The new name suggests that events will be filtered
when trackpoint_doubletap_filter = 1, so inverted of the old name
but when processing events events are let through when
trackpoint_doubletap_filter == 1 so 1 means _not_ filtering which
makes the name weird:

> +		/* Only send the event if kernel-level filtering allows it */
> +		if (tp_features.trackpoint_doubletap_filter)
>  			tpacpi_input_send_key(hkey, send_acpi_ev);

Maybe you forgot to add an '!' here, iow this should become:

		/* Only send the event if kernel-level filtering allows it */
		if (!tp_features.trackpoint_doubletap_filter)
			tpacpi_input_send_key(hkey, send_acpi_ev);

?

>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -3104,8 +3104,35 @@ static void tpacpi_send_radiosw_update(void)
>  	hotkey_radio_sw_notify_change();
>  }
>  
> +static ssize_t doubletap_filter_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", tp_features.trackpoint_doubletap_filter);
> +}
> +
> +static ssize_t doubletap_filter_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	bool filter;
> +	int err;
> +
> +	err = kstrtobool(buf, &filter);
> +	if (err)
> +		return err;
> +
> +	tp_features.trackpoint_doubletap_filter = filter;
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(doubletap_filter);
> +
>  static void hotkey_exit(void)
>  {
> +	if (tpacpi_pdev)
> +		device_remove_file(&tpacpi_pdev->dev, &dev_attr_doubletap_filter);
> +

New code should not use device_create_file() / device_remove_file() instead
the attribute should be added to hotkey_attributes[] and then the driver
core will automatically add/remove it.

>  	mutex_lock(&hotkey_mutex);
>  	hotkey_poll_stop_sync();
>  	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
> @@ -3557,8 +3584,22 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  
>  	hotkey_poll_setup_safe(true);
>  
> -	/* Enable doubletap by default */
> -	tp_features.trackpoint_doubletap = 1;
> +	/*
> +	 * Enable kernel-level doubletap event filtering by default.
> +	 * This allows doubletap events to reach userspace.
> +	 */
> +	tp_features.trackpoint_doubletap_filter = 1;

Again this seems to be inverted, or if you really want
trackpoint_doubletap_filter to work as an enable flag
then please rename it to trackpoint_doubletap_enable.


> +
> +	/* Create doubletap_filter sysfs attribute */
> +	if (tpacpi_pdev) {
> +		int err = device_create_file(&tpacpi_pdev->dev, &dev_attr_doubletap_filter);
> +		if (err) {
> +			pr_warn("Unable to create doubletap_filter sysfs attribute\n");
> +			/* Continue even if sysfs creation fails */
> +		} else {
> +			pr_info("ThinkPad ACPI doubletap_filter sysfs attribute created\n");
> +		}
> +	}

This can be dropped (replaced by adding the attr to hotkey_attributes[].

Regards,

Hans


