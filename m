Return-Path: <linux-input+bounces-6485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B29778CC
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 08:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75EFD1C20DAD
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 06:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C05B1AD26C;
	Fri, 13 Sep 2024 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="GOHbq1PT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AFkHrx4P"
X-Original-To: linux-input@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723113D296;
	Fri, 13 Sep 2024 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208894; cv=none; b=uLunscnAPSEXn4ALsfWcRl6QwXwWhrej7c4jnvyMZiHunXon6bdsqjAHEolExsW6xCexl8yodzwXDeOr4J6QgkIHejKaupQ0mcN4J9lm/hOrOs3jZAL2WifoCsPGsg2nCWo7rGKUUtQ9TnMNnfCnw+dFdtrbisseNfOxfOHISKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208894; c=relaxed/simple;
	bh=O+/sjBYLhm3mBdcT0xVhIY3U8O/2U8jos4sAjKlWCXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYsZx4Tmh9ETkYDgf4Mm0aUK3fdzXE0FbmKCakaj0iMnuBkBGiR02FYbK+6tOEyRO9bzrVjxRLKLuVE1xQ5qQmeEOfpNzI+AukabZDjMEL/DlZC8LyNAWRcyGZlsxm9RB3jBJYDtgnHGykXtPgvwphEu+aX7+yTiHMZ+zLxzlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=GOHbq1PT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AFkHrx4P; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2318313805E5;
	Fri, 13 Sep 2024 02:28:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 13 Sep 2024 02:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1726208891; x=1726295291; bh=y+UY/L5U6r
	LWQiKI0HbRdQ+AWB2/ztTvS8aCHnKzHSQ=; b=GOHbq1PT4DqVUlJIQvFDA5yLKB
	uwEpeBP43ieZoA3+uzj3MtRqo9I/TgyV0af5Ah54c3v7F2oRTdgQYeTK/4T+E5NH
	JbwYyHoHXoJPVcyJ8202b+uzDqr+XR+/xlKU4GRvmm70fZrXw99EfndCkONNlsJ9
	Vu/ahHSkAhkndMXZ8ZyxGzT5k8vIVfmSwPuvHe5FUO3vSvwBci16YoeBrWxMljjp
	KoiXyhd9XNqDm0F820KSZY9sPjkOPFGuRfbgb8QjXbbpMopCGL4don00tVzx6lfK
	CRktUYig15qqoJ3/1F8PSzWgZ20kAYTqa+JYG2OEtMlb0cS8cKdbYII9rf7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726208891; x=1726295291; bh=y+UY/L5U6rLWQiKI0HbRdQ+AWB2/
	ztTvS8aCHnKzHSQ=; b=AFkHrx4PG8/8v2jTpZx8UwwP9ZQevK3+kix/kcdGXFF0
	YD5som2qdmMfthec8nv8jZIGbsaDw0wyBgh9saqEPhTiM6/6w8iwrvLmoMs3DgVe
	pVa35TTwRxgeXHNo1CctlWJ22/NO0s96CA25gW0f4ysRRzP2KjIPWYbJykQc7mCC
	0Ge4Wb/er1KLfyUU8PMl9MjIaXHBJKYuaThpBE6YC+RkD7Mjf2s8/N1xJCDfaKAG
	/fTBg0CN+VGIK8j1bH5cMBL5pDi2NPXL8owlKtPgARdfPvMg8ApJfbjF4DLqwx8B
	hY28zhj/a6XdtcrAerhawSrIOcVrwggauFyN1BNSuw==
X-ME-Sender: <xms:etvjZtc5TsapdbglGS6X0p0NY8cVmAonFJ-pV7Gxb9DJljmOQ39eiA>
    <xme:etvjZrPmb8M65j5DciV-bkyqAfWRtuF9JbM6naX_YaBSd9qMyatAYuB-xbg2S1Jzp
    NXl6RtHTdg9jg>
X-ME-Received: <xmr:etvjZmhkTp7oWHisv1SnZyj51uUgKXvaqCWFox3no_FnRD6PFHORtA9qlWEziR7bo_y2SyP5c1lZo5Y9Jif2sWiIqGfx991ym40Wbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepfigruggvrdifrghngheshhhprdgtohhmpdhrtghpth
    htohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhsshes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:etvjZm-cWdo-4DIQfwRvCuCwnMTQYwP_jDFwg45Kv-o-wydxSQeMBw>
    <xmx:etvjZpsZSy_8XddwcuBj3m1wVshQ-DB8dbeVNiYkKHJNT7x47wiwHA>
    <xmx:etvjZlHFxSEXbbLVRk8SVZOMMuSV-aVod_EFQkte3n84oJjTRJiBvQ>
    <xmx:etvjZgNbxacMW8hFwUKrqZyrxaabkV0618dK3_KKpFWhsAunAkRBPw>
    <xmx:e9vjZiEi2ieghyznf-RPsf05Hn1f-ZghRkNiK08kE8ZyAO_cgNQhZyzm>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 02:28:10 -0400 (EDT)
Date: Fri, 13 Sep 2024 08:28:07 +0200
From: Greg KH <greg@kroah.com>
To: Wade Wang <wade.wang@hp.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Message-ID: <2024091355-antitrust-retiree-1299@gregkh>
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

On Fri, Sep 13, 2024 at 02:07:10PM +0800, Wade Wang wrote:
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
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

