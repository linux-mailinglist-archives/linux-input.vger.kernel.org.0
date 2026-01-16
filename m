Return-Path: <linux-input+bounces-17155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E866D3882D
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 22:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E68F3033B85
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 21:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ACB2F6160;
	Fri, 16 Jan 2026 21:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z+haQZ43"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B926CE3F
	for <linux-input@vger.kernel.org>; Fri, 16 Jan 2026 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597991; cv=none; b=QaFHWPPN7O/4/dUDRLzf2hornNfShArwdU2I4xlBM6pmgABuf7vy8pGSoBBME1LOF+oGxcQyxLxVWYKD8prIDVeT8rrCKip3F2e5W10tBpouybiWLRuU1TQXDxBC534hO9civbPGkxOUll8y+sF7IK+qZDJOBTH6aWcnINDpork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597991; c=relaxed/simple;
	bh=1eMQMvQMUX3WviZI9RRmD2QGt8EuKriEu4POAuPiFv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhlgK4BDkiikGI/in2TanJjb/T7/FVue8tRq30f1MK353ErRkLsEGGgKgGlQeV5DYHY84CNAo3Aq0/WT1AxV7NtcD1np0mMKbpVICPFlzVOZAHIPFyZCQP9o7aYJiz9EUsTFvrbVUzQTv84YNKmqnxGOye+OcyCnYUh+yVh/tuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z+haQZ43; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4ba41ce6-f0c0-4517-b249-7856ca6cdf71@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768597987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTmiIFrbD2jb4epFlYZOjE4j30nXaITa8/UjhX4q5sQ=;
	b=Z+haQZ43DvqU5S8Qjbin9Bqwcss5H5PDyML/XRgVIkCy2u2m+PwxZYHnpTlKiXqAe52OUr
	epW0wi3JtWwakKdnX6WguVThtzbfOxtFs9GaBFym58+BfHNY7vt6ZbVDUSNCiBSDrsDpE+
	mNeFMQ04UOPAEkeMeSPrkUpiKLJiBOQ=
Date: Fri, 16 Jan 2026 22:13:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 06/11] HID: asus: early return for ROG devices
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-7-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260116133150.5606-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/16/26 14:31, Antheas Kapenekakis wrote:
> Some ROG devices have a new dynamic backlight interface for control by
> Windows. This interface does not create an ->input device, causing the
> kernel to print an error message and to eject it. In addition, ROG
> devices have proper HID names in their descriptors so renaming them is
> not necessary.
>
> Therefore, if a device is identified as ROG, early return from probe to
> skip renaming and ->input checks.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 428481aa2083..90dc1fcd54ac 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1232,6 +1232,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	    asus_kbd_register_leds(hdev))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
>  	/*
>  	 * Check that input registration succeeded. Checking that
>  	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices

