Return-Path: <linux-input+bounces-6820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79C98889F
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 17:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44357B21788
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFAD1C0DFB;
	Fri, 27 Sep 2024 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4u1xYTg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707718B1A;
	Fri, 27 Sep 2024 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452746; cv=none; b=qJWG57uKrP0lnqKUwsCTymurponA/hS+GgbL8vOruSGHkyPt96VhqCSoO6zEZE2Mnh9hOvv9QWSHhlhP+Sx2erg/A1tZ1Egsvgm0+5BeR2Wgdf4yVy/FP3shrjU9WjsiYWDuSOsTCB76WtRbHhtEV0EwG4EpErsRmPzra/11GTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452746; c=relaxed/simple;
	bh=cWE8BmZFHMepVrtWTAC86oVYAiBjKmog8NM4odRkDkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzQJmZJy9cH5K8I4OremAlgBBklczDq9BniSs4oRUqWOPaF64Qna+S6Q6P+kUtDK1whWsNaR5C3ZJYlSAsofotUQIw+wLl3OiUb5P2+YevKTMW73GtGg9ruxoN89P0T5ft5bEfQBEfChH6wRHP8XNdl4XeLAECFVR5kEY+FDu4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4u1xYTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33019C4CEC4;
	Fri, 27 Sep 2024 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727452745;
	bh=cWE8BmZFHMepVrtWTAC86oVYAiBjKmog8NM4odRkDkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4u1xYTgU9uL2wo2Iw1JRMqvbNHEARccGWeO0JOIwYloJA25+G503q1DHB4QM0znO
	 oySkHFj0sl7mCnU140TSCrWzIznewF34uYBdsNK/nswWKCb7EkFQ6fBYpT6F9CcTzB
	 8TH+mlw741LE6kGAVvBQIH5U+ooV4EaPm7EMs66ZMqe14Zl+p5xbF1PFmNPFBIVCwr
	 cBRcmAdCtDHvAOPMINMoyEyUd42YlPVHo1xvp1UcvNAVug/n7fqDiP5xh2rSUNQ6EU
	 i0yEnORLk/BKtLVSVsoJBcWNWsoYDrSYIxoL6oLFCnumxgcVUu5F63JeGdjFzZx37C
	 cmS7rJOnzW8ug==
Date: Fri, 27 Sep 2024 17:59:00 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 7/10] HID: multitouch: allow specifying if a device is
 direct in a class
Message-ID: <73tdfypdlvpgavq4vnlya3os3nniwxktqhpju4luiec3mpqfwl@7j57v4gzf37h>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <013F1B8B-F187-4A9B-9882-0FD174B73860@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013F1B8B-F187-4A9B-9882-0FD174B73860@live.com>

On Aug 17 2024, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> Currently the driver determines the device type based on the
> application, but this value is not reliable on Apple Touch Bars, where
> the application is HID_DG_TOUCHPAD even though the devices are direct,
> so allow setting it in classes.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

So that one commit breaks the HID selftests.

For a reproducer:

./tools/testing/selftests/hid/vmtest.sh -- \
  "pip3 install hid-tools attrs pyroute2; \
   pytest -v tools/testing/selftests/hid/tests/ --udevd -k Topseed"

In summary: Topseed devices are weird, and I guess this patch makes them
weirder. Please ensure you do not regress on any known devices (so by
removing '-k Topseed' once this is fixed).

Cheers,
Benjamin

> ---
>  drivers/hid/hid-multitouch.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 60b675cd1..2948fbcbc 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -146,6 +146,7 @@ struct mt_class {
>  	__s32 sn_height;	/* Signal/noise ratio for height events */
>  	__s32 sn_pressure;	/* Signal/noise ratio for pressure events */
>  	__u8 maxcontacts;
> +	bool is_direct;	/* true for touchscreens */
>  	bool is_indirect;	/* true for touchpads */
>  	bool export_all_inputs;	/* do not ignore mouse, keyboards, etc... */
>  };
> @@ -563,13 +564,13 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
>  	mt_application->application = application;
>  	INIT_LIST_HEAD(&mt_application->mt_usages);
>  
> -	if (application == HID_DG_TOUCHSCREEN)
> +	if (application == HID_DG_TOUCHSCREEN && !td->mtclass.is_indirect)
>  		mt_application->mt_flags |= INPUT_MT_DIRECT;
>  
>  	/*
>  	 * Model touchscreens providing buttons as touchpads.
>  	 */
> -	if (application == HID_DG_TOUCHPAD) {
> +	if (application == HID_DG_TOUCHPAD && !td->mtclass.is_direct) {
>  		mt_application->mt_flags |= INPUT_MT_POINTER;
>  		td->inputmode_value = MT_INPUTMODE_TOUCHPAD;
>  	}
> @@ -1317,6 +1318,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
>  	if (td->serial_maybe)
>  		mt_post_parse_default_settings(td, app);
>  
> +	if (cls->is_direct)
> +		app->mt_flags |= INPUT_MT_DIRECT;
> +
>  	if (cls->is_indirect)
>  		app->mt_flags |= INPUT_MT_POINTER;
>  
> -- 
> 2.43.0
> 

