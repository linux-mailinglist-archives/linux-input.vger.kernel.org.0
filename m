Return-Path: <linux-input+bounces-7947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D889C00DE
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 10:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F8961C2148C
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92B1DFE17;
	Thu,  7 Nov 2024 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8ZRjGlJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BC1E0DA7
	for <linux-input@vger.kernel.org>; Thu,  7 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970451; cv=none; b=a5/qs/vFJHqzaV7OXATWnl5nSgFjXuxIN84TNmxZG1YyfDJ0ig4+mZrgPPp+gRy7j58/0BPJHndX3GqarP9Rq918rIuO6+pw5E0vSKJAbyrxgEa2yXG81gC/d/qZBghOLFS7Qg86cloc8FrGkxqEFKaIji6AWv3nfwDds4YPuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970451; c=relaxed/simple;
	bh=rHa4JUYkTRoVbNWM7/0+422JEDbdr9NvoiCqOdA6zO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nrzmt+70Xr9D2ZK2uBaAHD63hPmDuZXemSfKFcDRPbDIOXNharwM8/3EgC2LC/qZAuzc5TlCaCuXKokz1apjeCSyyvfivzBtW74R9wc1QgSOyP1EK8iFLaXL2nnx9oIP8ELM137DMqIFucj+fquFPWPQlFO/DiC1pIgDDWgJ1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8ZRjGlJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730970447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sm3aPEQccl2iQvvqICUb7Dh39IEQqDPUROzWEO0/Qu8=;
	b=B8ZRjGlJWbtE8+fzKg4Z77hzkdMeuAWvxguTBwYdGlnWooI2ZyfZSp8Xa3pSGD5vImBRC8
	jU4un4cr5wmSfvJPM1Q7oGolOHAGBPSUiMSIp8+9Mbrph5HnEPq+kw6j0iU9JRDjvEPoUG
	BfY32SXHwTM0UJ4jogIMigEOJUwqPXo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-RPtP2xrPPPCY7Kgj2GmUXw-1; Thu, 07 Nov 2024 04:07:26 -0500
X-MC-Unique: RPtP2xrPPPCY7Kgj2GmUXw-1
X-Mimecast-MFC-AGG-ID: RPtP2xrPPPCY7Kgj2GmUXw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d589138a9so351127f8f.1
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 01:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730970445; x=1731575245;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm3aPEQccl2iQvvqICUb7Dh39IEQqDPUROzWEO0/Qu8=;
        b=iMcjLAN16eKGifUuyT944J7ei9ELdHUNwIzhrTSLik8VByHUXseouZJ38LHJKstxtr
         zLnjoDVhnoICHgShILpvYfY3Sm4xXUD2i5enNBjS0UvcqjLmVfn2I1WU65iSi8UtnyMv
         33O4GvlAKwczvlqgWs5DaBTMWg8ZY9LCptzvHzEjTMMmacT/LSOU/fE1tkkBecdqqrIH
         F1+UNP3G6i+AlJOPSWvPETOgmpEaKN5vueO0FkMgUIKE3faJDSW+uUKBBRIqVjzJ50Qp
         nn+iq6KPNcatsDInKmkkPIey+YnIPSgWTX0wsu6mrxh1ajuZsKUogdrUzL1YtEW2C5c4
         8XXg==
X-Forwarded-Encrypted: i=1; AJvYcCVy6YbjjfdHSmu08Ua/Qu6flJkQ5U8MKzuLnVh+pjLnECYlOpmhdZ7CXJuy1PvnvWyUettpNBilbT296w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kKD6E84tlBFGxHmhPegRuQtq4XHcYgrViQfEol+u5qlIDpaL
	GJn5UTc4xeOcyE8a4MP6DLZorB30IriwBGWxWgzYXTvfMFYQsT2ftJIGfBLf03EL1nZCEloXQSr
	ApcKF8ITyddP+/K5Dh65Y+lctOVj1nwEYyx8ie+3SsePPB4LBHLMgya8Ov80q
X-Received: by 2002:adf:e0c8:0:b0:37d:43f1:57fc with SMTP id ffacd0b85a97d-3806120606dmr26800285f8f.58.1730970445274;
        Thu, 07 Nov 2024 01:07:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvSSjeW5diJ9dadQ02Rae4ZIBArGattZD9Ki/8yU0Eyq4I41M3S0Pf3EYkc67tAOu7WZ+D2Q==
X-Received: by 2002:adf:e0c8:0:b0:37d:43f1:57fc with SMTP id ffacd0b85a97d-3806120606dmr26800255f8f.58.1730970444782;
        Thu, 07 Nov 2024 01:07:24 -0800 (PST)
Received: from fedora ([213.235.133.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ec272sm1154112f8f.85.2024.11.07.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:07:24 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, Saurabh Singh Sengar
 <ssengar@linux.microsoft.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei
 Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH] HID: hyperv: streamline driver probe to avoid devres
 issues
In-Reply-To: <SN6PR02MB415716F2A1EB3B106E685701D45C2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20241104164824.1213529-1-vkuznets@redhat.com>
 <20241105171141.GA13863@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <877c9htw1n.fsf@redhat.com>
 <SN6PR02MB41577BB0B8724ED058E94F92D4532@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB415716F2A1EB3B106E685701D45C2@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Thu, 07 Nov 2024 10:07:21 +0100
Message-ID: <87fro3v2d2.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michael Kelley <mhklinux@outlook.com> writes:

> From: Michael Kelley Sent: Wednesday, November 6, 2024 10:36 AM
>> From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Tuesday, November 5, 2024
>> 9:45 AM
>> >
>> > Saurabh Singh Sengar <ssengar@linux.microsoft.com> writes:
>> >
>> > > On Mon, Nov 04, 2024 at 05:48:24PM +0100, Vitaly Kuznetsov wrote:
>> > >> It was found that unloading 'hid_hyperv' module results in a devres
>> > >> complaint:
>> > >>
>> > >>  ...
>> > >>  hv_vmbus: unregistering driver hid_hyperv
>> > >>  ------------[ cut here ]------------
>> > >>  WARNING: CPU: 2 PID: 3983 at drivers/base/devres.c:691
>> devres_release_group+0x1f2/0x2c0
>> > >>  ...
>> > >>  Call Trace:
>> > >>   <TASK>
>> > >>   ? devres_release_group+0x1f2/0x2c0
>> > >>   ? __warn+0xd1/0x1c0
>> > >>   ? devres_release_group+0x1f2/0x2c0
>> > >>   ? report_bug+0x32a/0x3c0
>> > >>   ? handle_bug+0x53/0xa0
>> > >>   ? exc_invalid_op+0x18/0x50
>> > >>   ? asm_exc_invalid_op+0x1a/0x20
>> > >>   ? devres_release_group+0x1f2/0x2c0
>> > >>   ? devres_release_group+0x90/0x2c0
>> > >>   ? rcu_is_watching+0x15/0xb0
>> > >>   ? __pfx_devres_release_group+0x10/0x10
>> > >>   hid_device_remove+0xf5/0x220
>> > >>   device_release_driver_internal+0x371/0x540
>> > >>   ? klist_put+0xf3/0x170
>> > >>   bus_remove_device+0x1f1/0x3f0
>> > >>   device_del+0x33f/0x8c0
>> > >>   ? __pfx_device_del+0x10/0x10
>> > >>   ? cleanup_srcu_struct+0x337/0x500
>> > >>   hid_destroy_device+0xc8/0x130
>> > >>   mousevsc_remove+0xd2/0x1d0 [hid_hyperv]
>> > >>   device_release_driver_internal+0x371/0x540
>> > >>   driver_detach+0xc5/0x180
>> > >>   bus_remove_driver+0x11e/0x2a0
>> > >>   ? __mutex_unlock_slowpath+0x160/0x5e0
>> > >>   vmbus_driver_unregister+0x62/0x2b0 [hv_vmbus]
>> > >>   ...
>> > >>
>> > >> And the issue seems to be that the corresponding devres group is not
>> > >> allocated. Normally, devres_open_group() is called from
>> > >> __hid_device_probe() but Hyper-V HID driver overrides 'hid_dev->driver'
>> > >> with 'mousevsc_hid_driver' stub and basically re-implements
>> > >> __hid_device_probe() by calling hid_parse() and hid_hw_start() but not
>> > >> devres_open_group(). hid_device_probe() does not call __hid_device_probe()
>> > >> for it. Later, when the driver is removed, hid_device_remove() calls
>> > >> devres_release_group() as it doesn't check whether hdev->driver was
>> > >> initially overridden or not.
>> > >>
>> > >> The issue seems to be related to the commit 62c68e7cee33 ("HID: ensure
>> > >> timely release of driver-allocated resources") but the commit itself seems
>> > >> to be correct.
>> > >>
>> > >> Fix the issue by dropping the 'hid_dev->driver' override and the
>> > >> now unneeded hid_parse()/hid_hw_start() calls. One notable difference of
>> > >> the change is hid_hw_start() is now called with HID_CONNECT_DEFAULT which
>> > >> implies HID_CONNECT_HIDRAW. This doesn't seem to cause any immediate issues
>> > >> but 'HID_CONNECT_HIDINPUT | HID_CONNECT_HIDDEV' combo was used in the
>> > >> driver for a long time and it is unclear whether hidraw was excluded on
>> > >> purpose or not.
>> > >>
>> > >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> > >
>> > > A fixme tag would be helpful.
>> >
>> > I concluded that it's the unusual 'hid_dev->driver' override in
>> > hid-hyperv to blame and not the 62c68e7cee33 ("HID: ensure timely
>> > release of driver-allocated resources") but the override was there since
>> > the inception of the driver so I'm not sure, mentioning 62c68e7cee33
>> > probably makes more sense...
>> 
>> I've finished looking at the linux-next issue in detail, and I agree that
>> the hid_dev->driver override is the underlying cause. I was
>> commenting out that line Monday night, but had not gotten as far as
>> removing the the hid_parse() and hid_hw_start().  Then your patch
>> came out, Vitaly, which is great!
>> 
>> >
>> > >
>> > >> ---
>> > >>  drivers/hid/hid-hyperv.c | 17 -----------------
>> > >>  1 file changed, 17 deletions(-)
>> > >>
>> > >> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
>> > >> index f33485d83d24..1609a56ffa7c 100644
>> > >> --- a/drivers/hid/hid-hyperv.c
>> > >> +++ b/drivers/hid/hid-hyperv.c
>> > >> @@ -431,8 +431,6 @@ static const struct hid_ll_driver mousevsc_ll_driver = {
>> > >>  	.raw_request = mousevsc_hid_raw_request,
>> > >>  };
>> > >>
>> > >> -static struct hid_driver mousevsc_hid_driver;
>> > >> -
>> > >>  static int mousevsc_probe(struct hv_device *device,
>> > >>  			const struct hv_vmbus_device_id *dev_id)
>> > >>  {
>> > >> @@ -473,7 +471,6 @@ static int mousevsc_probe(struct hv_device *device,
>> > >>  	}
>> > >>
>> > >>  	hid_dev->ll_driver = &mousevsc_ll_driver;
>> > >> -	hid_dev->driver = &mousevsc_hid_driver;
>> > >>  	hid_dev->bus = BUS_VIRTUAL;
>> > >>  	hid_dev->vendor = input_dev->hid_dev_info.vendor;
>> > >>  	hid_dev->product = input_dev->hid_dev_info.product;
>> > >> @@ -488,20 +485,6 @@ static int mousevsc_probe(struct hv_device *device,
>> > >>  	if (ret)
>> > >>  		goto probe_err2;
>> > >>
>> > >> -
>> > >> -	ret = hid_parse(hid_dev);
>> > >> -	if (ret) {
>> > >> -		hid_err(hid_dev, "parse failed\n");
>> > >> -		goto probe_err2;
>> > >> -	}
>> > >> -
>> > >> -	ret = hid_hw_start(hid_dev, HID_CONNECT_HIDINPUT |
>> HID_CONNECT_HIDDEV);
>> 
>> As you noted, using HID_CONNECT_DEFAULT in the default probe function
>> __hid_device_probe() ends up adding HID_CONNECT_HIDRAW and HID_CONNECT_FF.
>> The latter is benign as it only affects devices that support force-feedback. As best I
>> can tell, HID_CNNECT_HIDRAW causes /dev/hidraw0 to appear, which provides a raw
>> interface to the mouse device. See https://docs.kernel.org/hid/hidraw.html. It doesn't
>> seem like making this interface visible hurts anything, but I'm not 100% sure.
>> 
>> The alternative is to keep the "struct hid_driver mousevsc_hid_driver;" line
>> and to populate it with a name, id_table, and an HID probe function specific
>> to the Hyper-V mouse. Then instead of the incorrect assignment to
>> hid_dev->driver, add a
>> 
>> 	module_hid_driver(mousevsc_hid_driver);
>> 
>> statement, which registers the driver. The new HID probe function does
>> the hid_parse() and hid_hw_start() which have been removed from
>> mousevsc_probe() as your patch does. With this arrangement, the
>> hid_hw_start() can be done with the desired HID_CONNECT_*
>> options so that /dev/hidraw0 won't appear. It's only a few lines
>> of code.
>> 
>> I can try to code up this approach if it is preferred. But I'm likely tied
>> up with some personal things for the next few days, so might not get
>> to it for a little while. Feel free to try it yourself if you want.
>
> Here's what I had in mind. It appears to work and preserves the
> custom aspects of the current code in mousevsc_probe(). Turns
> out I can't use module_hid_driver() because it conflicts with the
> existing module_init() and module_exit() use, so I've directly
> coded hid_register/unregister_driver().

Thanks! I'll give it a try. As an alternative, I was thinking of introducing
something like HID_QUIRK_NO_HIDRAW to make hid_connect() do what we want.

>
> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
> index f33485d83d24..98a7fa09c4ee 100644
> --- a/drivers/hid/hid-hyperv.c
> +++ b/drivers/hid/hid-hyperv.c
> @@ -422,6 +422,25 @@ static int mousevsc_hid_raw_request(struct hid_device *hid,
>  	return 0;
>  }
>  
> +static int mousevsc_hid_probe(struct hid_device *hid_dev, const struct hid_device_id *id)
> +{
> +	int ret;
> +
> +	ret = hid_parse(hid_dev);
> +	if (ret) {
> +		hid_err(hid_dev, "parse failed\n");
> +		return ret;
> +	}
> +
> +	ret = hid_hw_start(hid_dev, HID_CONNECT_HIDINPUT | HID_CONNECT_HIDDEV);
> +	if (ret) {
> +		hid_err(hid_dev, "hw start failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct hid_ll_driver mousevsc_ll_driver = {
>  	.parse = mousevsc_hid_parse,
>  	.open = mousevsc_hid_open,
> @@ -431,7 +450,16 @@ static const struct hid_ll_driver mousevsc_ll_driver = {
>  	.raw_request = mousevsc_hid_raw_request,
>  };
>  
> -static struct hid_driver mousevsc_hid_driver;
> +static const struct hid_device_id mousevsc_devices[] = {
> +	{ HID_DEVICE(BUS_VIRTUAL, HID_GROUP_ANY, 0x045E, 0x0621) },
> +	{ }
> +};
> +
> +static struct hid_driver mousevsc_hid_driver = {
> +	.name = "hid-hyperv",
> +	.id_table = mousevsc_devices,
> +	.probe = mousevsc_hid_probe,
> +};
>  
>  static int mousevsc_probe(struct hv_device *device,
>  			const struct hv_vmbus_device_id *dev_id)
> @@ -473,7 +501,6 @@ static int mousevsc_probe(struct hv_device *device,
>  	}
>  
>  	hid_dev->ll_driver = &mousevsc_ll_driver;
> -	hid_dev->driver = &mousevsc_hid_driver;
>  	hid_dev->bus = BUS_VIRTUAL;
>  	hid_dev->vendor = input_dev->hid_dev_info.vendor;
>  	hid_dev->product = input_dev->hid_dev_info.product;
> @@ -488,20 +515,6 @@ static int mousevsc_probe(struct hv_device *device,
>  	if (ret)
>  		goto probe_err2;
>  
> -
> -	ret = hid_parse(hid_dev);
> -	if (ret) {
> -		hid_err(hid_dev, "parse failed\n");
> -		goto probe_err2;
> -	}
> -
> -	ret = hid_hw_start(hid_dev, HID_CONNECT_HIDINPUT | HID_CONNECT_HIDDEV);
> -
> -	if (ret) {
> -		hid_err(hid_dev, "hw start failed\n");
> -		goto probe_err2;
> -	}
> -
>  	device_init_wakeup(&device->device, true);
>  
>  	input_dev->connected = true;
> @@ -579,11 +592,21 @@ static struct  hv_driver mousevsc_drv = {
>  
>  static int __init mousevsc_init(void)
>  {
> -	return vmbus_driver_register(&mousevsc_drv);
> +	int ret;
> +
> +	ret = vmbus_driver_register(&mousevsc_drv);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_register_driver(&mousevsc_hid_driver);
> +	if (ret)
> +		vmbus_driver_unregister(&mousevsc_drv);
> +	return ret;
>  }
>  
>  static void __exit mousevsc_exit(void)
>  {
> +	hid_unregister_driver(&mousevsc_hid_driver);
>  	vmbus_driver_unregister(&mousevsc_drv);
>  }
>
> Michael
>
>
>
>

-- 
Vitaly


