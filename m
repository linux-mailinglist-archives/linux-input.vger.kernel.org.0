Return-Path: <linux-input+bounces-15095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A34B9D61B
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 06:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9D5423DAF
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 04:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3B7157480;
	Thu, 25 Sep 2025 04:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb3xX8bl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F22E62A4
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758774389; cv=none; b=KfVzqP4+Hhjs7GdYB6JZoug6MvAYqRV3WH3S9TNDtKBeg76TZ27dNQVdB5DrN28K2p25+Hj6L7SE4s59xXAyJQhNfKU20BhIhBGCnJbjS8cXiRLCi4pKaenBFHahSL6GzfuiynAmCRumuELkYYTKQlLDGTiIVp0yHxrEtXpg9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758774389; c=relaxed/simple;
	bh=TnwL3wW6ND4oXS5Mi9CT/bAi7SSOk03vjEo2r585Y8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUoqLzaBW+2+Y9G+H3Ty/AbHPdfeC/R5wO2MYvYA/LbanOXCtXKvTMnssjQuEwaLz8SoMs6bQ1pGZXgCcGJ+TaSJTfg92gatuXWKatSsyuw1b1lUOU7/1n8Zd6rHw4vKRRhgriafAsejZnOrZDxNYFLq1QznrLPXn3rbhJj2Xag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb3xX8bl; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso507296a12.3
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758774387; x=1759379187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dteHME797snk+vQ+oj+419/4Ny1lqVzO4IVh/XVnaDc=;
        b=gb3xX8blc8W/YcpCQoFh6krYr53inmfIEiNDJUkZ8AO2rT8/I4UF7QG7Zc6bBmPjX+
         p9DlzNbVmVGITVOnL2xGHsqKcQlesiGJNTVsmfjy6Yg6mFpM4KncJ2/72aOjd9nvz0ZK
         crUMVL4dIoyzGF5kZM7ls5N3B2RzdPVB64mNiieah/JRcIp5Lm76Cd8Y8XnWqW/crCNN
         IbzrZW4VFDnfLbf7nEqFk6ynjKxY3SG65iBCXYUP/+J/0j9bqWkr5o8Pxi8pTO9N4rMl
         qJ9dgLDldzL6vWNk308B/IC3ceoa8jRgaLGEEB+36fNQRPi7vhyL/VY6Xu/qTx7uQjFP
         O/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758774387; x=1759379187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dteHME797snk+vQ+oj+419/4Ny1lqVzO4IVh/XVnaDc=;
        b=EhvINzegbV+4uc6PlQN0xuH6bJfyzOdPbgVRRrWL2Eyb7gqaJ09ezXNARYP25zujhG
         TyqdYqLpy7oexFSCpeZEF4blOeWtYEemAuXXZ8k2PRRqepFviIKYVIwZafcAu6tHZe5P
         jCX+OBTyHC4udPB6XmDdE7QxPYzAV5emZMXhkTX6Zq5uAfFY77kghT7+4/K1844C/s2I
         G3dN7CkCRjZbMKpbSAP9ayoSoo+u22Nz5bUu87W8/AXYHriW86IRvwNN/Ib2f0pHe6no
         FGa74jJxavp8hy0g8WutQkaLjmL22e3++kg2YG1gqi48leuYTHm76RP5oUHSClLwnJ3V
         rp3w==
X-Forwarded-Encrypted: i=1; AJvYcCXwkxDor6uoL41rlO2rlpTMK91v1Ay1dYG6LvYBDG9Fn2pGDb20RlhF6Yi4IWt8CjIZmbbVhMAgqvVrVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLsrRnm76k8tF6Uxjt2jx3LwdI8BPUrA0XEyohe7W0zsvjumFg
	SEBwl5S3qGEUul8twllNf/ix0atDV4617jjDuQ8JOa5Q2wYdSYBN39lG
X-Gm-Gg: ASbGncu5LL6urH2M8ZtXg2+gWN7Boo5kYzOGrEBc+bnLSyM6Hw03vZlJkEnWEtuSjwh
	VVdzJQ+J0qp88nrp/sUPP0HqAuV1w0b5SuvJ6LqPCy/aUy75MLkB5xKQXpFETKmW4Jbxm0P4A7C
	20oLng91PlDb+qkhod2pFl2HKg+pgmfUnMkTlJ43Uo308KZNfynqlzpTvFYvhQVT0eWEm/sL5ke
	tT09Q11uQvawdgad71BkYajp0+6jgbGgAGRPoXflHGtAO8NsI9jMRg+EaGnCT9KP3j7JlnUDxEa
	lDdLmMRW90OTdvThCbg8gcltOKEYUkkquIMK2qQYgiXyCRDMpG1jldWSFviXtBL+SfSScjmEOPk
	HEmGLW/1iaYq4qlXbM1wizg==
X-Google-Smtp-Source: AGHT+IHd9AD0WUJe6lma/pk2ZJ7vMQmFnh30eaf4733oJA4ty+tQEiixSvr2w0wQzfGa4MLok2dpiQ==
X-Received: by 2002:a17:903:298f:b0:269:91b2:e9d6 with SMTP id d9443c01a7336-27ed4a6f290mr21024385ad.46.1758774387456;
        Wed, 24 Sep 2025 21:26:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdd76sm9734935ad.4.2025.09.24.21.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 21:26:27 -0700 (PDT)
Date: Wed, 24 Sep 2025 21:26:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, 
	=?utf-8?B?5p2O6bmP?= <lipeng43@xiaomi.com>, Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>, 
	=?utf-8?B?5a6L5a+G5a+G?= <songmimi@xiaomi.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFpbF1SZTogVGhlIHplcm8g?=
 =?utf-8?Q?power_level_of_the_HID_device_in_kerne?= =?utf-8?Q?l?= 6.12 is not
 reported from the kernel to the upper layer.
Message-ID: <vkm32giijggtzv7hudsvqg34utpqvw4nnccfi7d4txj5tlzstp@4bu2ox2lmtm5>
References: <d2cada7efe8d4436b6e638fa1e0aaefb@xiaomi.com>
 <aM0XBudxlXuzALbg@fedora>
 <px5t2iedrrqhcrpdvmu5pznp53d3e5jp55dm72phlsti2rmt4j@rj2pajkavuir>
 <91e0d952fd774e769e2d24ce2165df18@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91e0d952fd774e769e2d24ce2165df18@xiaomi.com>

On Mon, Sep 22, 2025 at 09:29:20AM +0000, 卢国宏 wrote:
> 
> What kind of action are we talking about? Section 31 of the HID
> specification defines events for "Smart Battery" ("To comply with the
> Smart Battery Specification, the Battery System must support the
> functions defined in the Battery and Charger usage tables. For details,
> see Section 4.2, “Battery System Page (x85).”) and is typically used for
> "battery pack for cellular phones (principal source), the battery
> pack(s) for notebook computers (auxiliary source), and the sealed
> batteries in uninterruptible power supplies (auxiliary source)."
> 
> Is your use case main battery or battery in a stylus or some other
> peripheral?
> 
> 
> --->>>
> What we are discussing is the code implementation of Section 31 of the
> HID protocol: 31 Battery System Page (0x85). Our scenario is: an
> Android phone is connected to a handle via USB. The handle is a HID
> device with a battery. The power of the battery in the handle is sent
> to the bottom layer (kernel) of the phone via USB. The bottom layer of
> the phone then reports this power to the upper layer of Android
> through the HID driver.

I see. I guess we can try only filtering out 0 reports for the
digitizers, leaving other devices with batteries alone. Something like
this:


diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a4..ba3f6655af9e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -595,14 +595,18 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 	dev->battery = NULL;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev,
+				    unsigned int usage, int value)
 {
 	int capacity;
 
 	if (!dev->battery)
 		return;
 
-	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
+	if ((usage & HID_USAGE_PAGE) == HID_UP_DIGITIZER && value == 0)
+		return;
+
+	if (value < dev->battery_min || value > dev->battery_max)
 		return;
 
 	capacity = hidinput_scale_battery_capacity(dev, value);
@@ -1518,7 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
 
 		if (!handled)
-			hidinput_update_battery(hid, value);
+			hidinput_update_battery(hid, usage->hid, value);
 
 		return;
 	}


Thanks.

-- 
Dmitry

