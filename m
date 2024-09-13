Return-Path: <linux-input+bounces-6497-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E6978221
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 16:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BB0FB2276A
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 14:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259221D9326;
	Fri, 13 Sep 2024 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgXU3Q1a"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87F2E419;
	Fri, 13 Sep 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236080; cv=none; b=qRg4y/5XutSwGeGrkM6pTQYkqNNyoT32EP7wtV3J8Ky+V9rM1NMLGkuIpiPUuQokkLt9G0ZsX+YK0AIazC1m4NVfHieG8lDNg2mVVp8oK9O1fWaAOB5nM6Fr9aPzZf9Na5y3MT2/mUL7DCDhpWDs8ur6kGL0IUrsGqG2PBttveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236080; c=relaxed/simple;
	bh=ZxGjiwZDKq8/YBFmAdBNCBZA8mh1AZpAUvogJCJMdAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTjKxlpwiZBAwGAAHHSWmqm9dIBd8ymOju31qHcsl4pGCgnOO3xNu6M1LYJh9PgTU+f2Z2z9tHtsab0hFC5nOZ8cU2WrJ8MLcQaclgtqrKLyM/23b42DNkczYXDZXbp4RfMgMBuuFAJ73weGAGB99JTJ8AoumuW1qhEggWqKlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgXU3Q1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A75FC4CEC7;
	Fri, 13 Sep 2024 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726236079;
	bh=ZxGjiwZDKq8/YBFmAdBNCBZA8mh1AZpAUvogJCJMdAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgXU3Q1ajx3+U30ahpa1or5YAv1B8ruilxqDwWPvhVpZLju7H/jHLmbmaVGiC3nCJ
	 uXSrPolxON/+IcByaWhmZT9F7WwXglFCEez/QOP9l0FJE3fkcYrY5+ydVY0ORYDEQl
	 KtpXdcWPciKfwZ5bJ8SgRx4Yb6Ze7fuJIlF8ZZr82Ocs8YdFFjtuHadz/CdRwDb0h/
	 PHTUSKFJbkWH3xDGfbPBeqhUcsl9KO6XOAZ1N4I4FAvCLsH4fkYe2WmW5//X1ZsULI
	 PGh5LoKTZENi/yMPqTzAMMotqK2muIlUANZvv9PL0BthhAFcf9gevBEWYuKOLS/S80
	 Izs8l/aNqDmCQ==
Date: Fri, 13 Sep 2024 16:01:15 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Wade Wang <wade.wang@hp.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Message-ID: <kn7ykebpcapwnwhof2wlquko6zzjtfgn3xdwcfd2e6eyytzu32@wh3tck74weut>
References: <20240913060710.1325640-1-wade.wang@hp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913060710.1325640-1-wade.wang@hp.com>

On Sep 13 2024, Wade Wang wrote:
> Add the below headsets for double volume key presses quirk
>         Plantronics EncorePro 500 Series  (047f:431e)
>         Plantronics Blackwire_3325 Series (047f:430c)
> 
> Quote from previous patch by Maxim Mikityanskiy and Terry Junge
> 	'commit f567d6ef8606 ("HID: plantronics: Workaround for double volume
> 	 key presses")'
> 	'commit 3d57f36c89d8 ("HID: plantronics: Additional PIDs for double
> 	 volume key presses quirk")'
> These Plantronics Series headset sends an opposite volume key following
> each volume key press. This patch adds a quirk to hid-plantronics for this
> product ID, which will ignore the second opposite volume key press if it
> happens within 250 ms from the last one that was handled.

This commit message is very confusing:
- you mention that you are quoting 2 commits,
- but then you don't quote them but slightly reword the content
- and then, and most of all, you insert in the driver a new timeout of
  250 ms, which seems to not be with the same bases than f567d6ef8606
  where it is mentioned that "Auto-repeat (when a key is held pressed)
  is not affected, because the rate is about 3 times per second, which
  is far less frequent than once in 5 ms." -> 250 ms gets in the roughly
  same range than 3 times per seconds, so some more explanations is
  required

Please also follow Greg's advice and, as you replied in your last message
that didn't made the list (HTML), please resubmit the series with a
clear v3 indicator and a description of changes.

Ideally, I'd like to also have the other plantronics patch you sent
today in the same series, so I know which order I should apply them, in
case one rely on the other.

Cheers,
Benjamin
  
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-ids.h         |  2 ++
>  drivers/hid/hid-plantronics.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 781c5aa29859..a0aaac98a891 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1050,6 +1050,8 @@
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES	0xc056
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES	0xc057
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES	0xc058
> +#define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES	0x430c
> +#define USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES		0x431e
>  
>  #define USB_VENDOR_ID_PANASONIC		0x04da
>  #define USB_DEVICE_ID_PANABOARD_UBT780	0x1044
> diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
> index 3d414ae194ac..2a19f3646ecb 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -38,8 +38,10 @@
>  			    (usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER)
>  
>  #define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
> +#define PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS BIT(1)
>  
>  #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
> +#define PLT_FOLLOWED_KEY_TIMEOUT 250 /* ms */
>  
>  struct plt_drv_data {
>  	unsigned long device_type;
> @@ -134,6 +136,9 @@ static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
>  		cur_ts = jiffies;
>  		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_DOUBLE_KEY_TIMEOUT)
>  			return 1; /* Ignore the repeated key. */
> +		if ((drv_data->quirks & PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS)
> +		 && jiffies_to_msecs(cur_ts - prev_ts) <= PLT_FOLLOWED_KEY_TIMEOUT)
> +			return 1; /* Ignore the followed volume key. */
>  
>  		drv_data->last_volume_key_ts = cur_ts;
>  	}
> @@ -210,6 +215,12 @@ static const struct hid_device_id plantronics_devices[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
>  					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES),
>  		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> +					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES),
> +		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> +					 USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES),
> +		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>  	{ }
>  };
> -- 
> 2.34.1
> 

