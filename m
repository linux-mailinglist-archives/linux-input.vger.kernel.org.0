Return-Path: <linux-input+bounces-16800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D210BCF956F
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 17:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35D8A3019BF8
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706D13126CD;
	Tue,  6 Jan 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOmVlLxP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E42DA75C;
	Tue,  6 Jan 2026 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716336; cv=none; b=dvQa1sphphcxsLKlY8MZjRHAAejn6SR2wxLqYeE+eIBB9qZGQ1ZqOihb5TCU6qCVoov5+btz3lod3Xur9mPzgTZvw3ByLgwxsNJKZpfWWTaGQpLZl6qhUMJ66q1tHIKlUF8UYe0eHywFMoKLrHOiyicu0km12Qbb/o5IgTrFSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716336; c=relaxed/simple;
	bh=Vl8OnBqRKgCkT7M0lMJiqh8z3Zs8hxzwPS8AYooRyGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixFiUa92KaHyeooC+h2qZANb9K1Qq2RHw4bkn4BaKYaLnrPHDR9LndDA42cdu4MYyn9wfrbU0IKudAINtKUqy3NQ17kS9teSjxQ4WY2DUhgeUMSpplQbVvXISRiU779i2q+wKsxoTa+b/p4azmSV+ztYin1oJRRtqsCypQ6bjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOmVlLxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17E5C116C6;
	Tue,  6 Jan 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767716335;
	bh=Vl8OnBqRKgCkT7M0lMJiqh8z3Zs8hxzwPS8AYooRyGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lOmVlLxPGcqBXs4GhdaJR7pom8aY3zuRbakRfkINisX0NavIHqs93SCOE0SfS+0i/
	 pXMzpPE5SS2CALfiXqqRH96xN+G+J+OjuTkjhjqh9wfxMcpRLRRRbkMqFZFWOZaYnT
	 0zCkTbgP+iy4Jyq2lu/YFaolL8ppPOyDwTx8jInqL+SxV0pqf8WkH44VLPHfKJBB+d
	 CUuTWlkKAgWM30okeQSj6w0PtCIGwWYsdnNMOFMs5boccDkcLYo8TjN5xyB7QtG7bQ
	 LwO8cnXBeJuODLTQn6AsM8h3b6hr06+bCPEtMpCbFEGexsfMPWEbw29lfnXOBsduRS
	 lRmrrq7hNpmLg==
Message-ID: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
Date: Tue, 6 Jan 2026 10:18:53 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: asus: Filter HID vendor codes and add WMI fan
 control support for ROG laptops
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Ionut Nechita <ionut_n2001@yahoo.com>,
 Denis Benato <benato.denis96@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106140449.90506-3-sunlightlinux@gmail.com>
 <20260106140449.90506-5-sunlightlinux@gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260106140449.90506-5-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+ Denis Benato

On 1/6/2026 8:04 AM, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
> 
> On Asus ROG G14 and G15 laptops, several HID vendor usage codes are sent
> during normal operation without a clear purpose, generating unwanted
> "Unmapped Asus vendor usagepage code" warnings in dmesg.
> 
> Additionally, the Fn+F5 fan control key (code 0xae) needs to communicate
> with the asus-wmi driver to toggle between fan modes, but this was not
> previously handled.
> 
> Changes:
> - Filter out spurious HID codes (0xea, 0xec, 0x02, 0x8a, 0x9e) for
>    QUIRK_ROG_NKEY_KEYBOARD devices to prevent kernel log spam
> - Add asus_wmi_send_event() function to communicate with asus-wmi driver
> - Implement Fn+F5 (0xae) fan control key handler that triggers WMI events
> - Replace magic number 0xff310000 with HID_UP_ASUSVENDOR constant for
>    better code clarity

I feel these should be split into smaller logical patches.

> 
> This eliminates unnecessary kernel warnings and enables proper fan control
> functionality on affected Asus ROG laptops.
> 
> Tested on Asus ROG G14/G15 series laptops.
> 
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>   drivers/hid/hid-asus.c                     | 48 +++++++++++++++++++++-
>   include/linux/platform_data/x86/asus-wmi.h |  2 +
>   2 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 472bca54642b9..cd8d0e495a75a 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -26,6 +26,8 @@
>   #include <linux/dmi.h>
>   #include <linux/hid.h>
>   #include <linux/module.h>
> +
> +#include <linux/acpi.h>

Shouldn't this be in alphabetical order before linux/dmi.h above?

>   #include <linux/platform_data/x86/asus-wmi.h>
>   #include <linux/platform_data/x86/asus-wmi-leds-ids.h>
>   #include <linux/input/mt.h>
> @@ -314,10 +316,33 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>   	return 0;
>   }
>   
> +/*
> + * This enables triggering events in asus-wmi
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
> +{
> +	int err;
> +	u32 retval;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> +		ASUS_WMI_METHODID_NOTIF, code, &retval);
> +	if (err) {
> +		pr_warn("Failed to notify asus-wmi: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval != 0) {
> +		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static int asus_event(struct hid_device *hdev, struct hid_field *field,
>   		      struct hid_usage *usage, __s32 value)
>   {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>   	    (usage->hid & HID_USAGE) != 0x00 &&
>   	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>   		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -330,6 +355,7 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>   static int asus_raw_event(struct hid_device *hdev,
>   		struct hid_report *report, u8 *data, int size)
>   {
> +	int ret;
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>   
>   	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
> @@ -348,6 +374,26 @@ static int asus_raw_event(struct hid_device *hdev,
>   	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
>   		return -1;
>   	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		/* Additional report filtering */
> +		if (report->id == FEATURE_KBD_REPORT_ID) {
> +			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
> +			if (data[1] == 0xae) {

As this has a meaning you've identified shouldn't it have a #define as well?

> +				ret = asus_wmi_send_event(drvdata, 0xae);
> +				if (ret < 0) {
> +					hid_warn(hdev, "Asus failed to trigger fan control event");
> +				}
> +				return -1;
> +			/*
> +			 * G14 and G15 send these codes on some keypresses with no
> +			 * discernable reason for doing so. We'll filter them out to avoid
> +			 * unmapped warning messages later
> +			 */
> +			} else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
> +					data[1] == 0x8a || data[1] == 0x9e) {
> +				return -1;
> +			}
> +		}
> +
>   		/*
>   		 * G713 and G733 send these codes on some keypresses, depending on
>   		 * the key pressed it can trigger a shutdown event if not caught.
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 419491d4abca1..8ed6f603735d1 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -30,6 +30,8 @@
>   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
>   
> +#define ASUS_WMI_METHODID_NOTIF                0x00100021 /* Notify method ?? */
> +
>   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>   
>   /* Wireless */


