Return-Path: <linux-input+bounces-16351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA409C8AA14
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF9D3B1835
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42006331A53;
	Wed, 26 Nov 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpGPM9Ma"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19725331A50;
	Wed, 26 Nov 2025 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170815; cv=none; b=m9oMoGMZBQpti/o7DyXc6uzJAXe4xCCKbY7JOtJnf5j05yufPBPVB6eI5a0TUTP6UBHKwcIA0GiayjO4bzjnXvi+q46tPp3HXbFPeHxbyT71ACn7VOW48kVNCW1hniLxbnuo+jaqkezKX4Zho+ueEGcVUepTjEtXDrK76tDWXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170815; c=relaxed/simple;
	bh=lPPy9VPezAPM30pbtlvEOtskreY3OwhH5Y30J9jbugc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SH1RjBPOIijMkaMWGmkDlU7cqQAwXkH5OD0TQu4Mu5QU2ColnqLeGIRIPfw/PY4AH4TTIwdGSi14ZEKzSBHHz9dRhuLsI9e7Kr+84WNymaH4JPhaSEeyZIx7Z6VIOJu2F+6pb4vw+QMwRi92MThlCfSEJxY2DAKR0uGc4e7JV6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpGPM9Ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13053C4CEF7;
	Wed, 26 Nov 2025 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170814;
	bh=lPPy9VPezAPM30pbtlvEOtskreY3OwhH5Y30J9jbugc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jpGPM9Ma1Xa3ltOm/B+bgV8TYIr2GGo5jZfQ9nLI9xv4EwYCSrNvwhHl8x96QpQco
	 UjzqaqZ39+oJ0jAn0a4Y7A9ACr3Fi9M6WHVnPp6SIjKEoqAMuHtJKCan1UpPIOD0gK
	 RyJwGzg6sISPFFYtWSa6GUg4UhWxDloOqjb5MDhZSMvtvUYHfc/iRdhBDS+XiL8VCB
	 Mb4GvqWI3ihvsGk5jt3vK/OqZ6fYkVzWVSY8nWcRq5zSTUiwIlLDhblDY+DTRjfq8a
	 bPFL3/sJq7NzBnd1/MFDkp89bApRl2W3LhRn62Z/vfBz5nA7U/pZN9rmpsr23BvkAX
	 U+SI4BCgVUvFQ==
Date: Wed, 26 Nov 2025 16:26:51 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Brian Howard <blhoward2@gmail.com>
cc: Andrei Shumailov <gentoo1993@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: add quirks for Lenovo Yoga Book 9i
In-Reply-To: <20251118020723.6600-1-blhoward2@gmail.com>
Message-ID: <6243251s-2rp7-7092-r489-1n4531qn0826@xreary.bet>
References: <20251118020723.6600-1-blhoward2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, Brian Howard wrote:

> Add required quirks for Lenovo Yoga Book 9i Gen 8 to Gen 10 models, 
> including a new quirk providing for custom input device naming and 
> dropping erroneous InRange reports.
> 
> The Lenovo Yoga Book 9i is a dual-screen laptop, with a single composite
> USB device providing both touch and tablet interfaces for both screens.
> All inputs report through a single device, differentiated solely by report
> numbers. As there is no way for udev to differentiate the inputs based on
> USB vendor/product ID or interface numbers, custom naming is required to
> match against for downstream configuration. A firmware bug also results
> in an erroneous InRange message report (with everything other than X/Y 
> as 0) being received after the stylus leaves proximity, blocking later 
> touch events. 
> 
> Signed-off-by: Brian Howard <blhoward2@gmail.com>
> Tested-by: Brian Howard <blhoward2@gmail.com>
> Reported-by: Andrei Shumailov <gentoo1993@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220386
> ---
>  drivers/hid/hid-ids.h        |  1 +
>  drivers/hid/hid-multitouch.c | 73 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0723b4b1c9ec..e896a6310bb2 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -833,6 +833,7 @@
>  #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
>  #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
>  #define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
> +#define USB_DEVICE_ID_LENOVO_YOGABOOK9I	0x6161
>  #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
>  #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
>  #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 179dc316b4b5..a828aac59cb2 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
>  #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
>  #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
>  #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
> +#define MT_QUIRK_YOGABOOK9I		BIT(24)
>  
>  #define MT_INPUTMODE_TOUCHSCREEN	0x02
>  #define MT_INPUTMODE_TOUCHPAD		0x03
> @@ -229,6 +230,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>  #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
>  #define MT_CLS_SMART_TECH			0x0113
>  #define MT_CLS_APPLE_TOUCHBAR			0x0114
> +#define MT_CLS_YOGABOOK9I			0x0115
>  #define MT_CLS_SIS				0x0457
>  
>  #define MT_DEFAULT_MAXCONTACT	10
> @@ -424,6 +426,14 @@ static const struct mt_class mt_classes[] = {
>  		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
>  			MT_QUIRK_ALWAYS_VALID |
>  			MT_QUIRK_CONTACT_CNT_ACCURATE,
> +	},
> +	{ .name = MT_CLS_YOGABOOK9I,
> +		.quirks = MT_QUIRK_ALWAYS_VALID |
> +			MT_QUIRK_FORCE_MULTI_INPUT |
> +			MT_QUIRK_SEPARATE_APP_REPORT |
> +			MT_QUIRK_HOVERING |
> +			MT_QUIRK_YOGABOOK9I,
> +		.export_all_inputs = true
>  	},
>  	{ }
>  };
> @@ -1557,6 +1567,7 @@ static void mt_report(struct hid_device *hid, struct hid_report *report)
>  	struct mt_device *td = hid_get_drvdata(hid);
>  	struct hid_field *field = report->field[0];
>  	struct mt_report_data *rdata;
> +	int f, i;
>  
>  	if (!(hid->claimed & HID_CLAIMED_INPUT))
>  		return;
> @@ -1565,6 +1576,38 @@ static void mt_report(struct hid_device *hid, struct hid_report *report)
>  	if (rdata && rdata->is_mt_collection)
>  		return mt_touch_report(hid, rdata);
>  
> +	/* Lenovo Yoga Book 9i requires consuming and dropping certain bogus reports */
> +	if (rdata && rdata->application &&
> +		(rdata->application->quirks & MT_QUIRK_YOGABOOK9I)) {
> +
> +		bool all_zero_report = true;

Minor nit: why do you declare this variable in this scope, but the f and i 
iterators in the global function scope?

Thanks,

-- 
Jiri Kosina
SUSE Labs


