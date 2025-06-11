Return-Path: <linux-input+bounces-12814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6888AD5D63
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 19:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244773A8474
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 17:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400E2223DE1;
	Wed, 11 Jun 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2WjWVwW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCE17A2F3;
	Wed, 11 Jun 2025 17:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663867; cv=none; b=h6MC5ZRFbFpAX7JTlN4V1mAQc8O0ZvrQIOzLDWQlpubR6Ecl+OAxy52PrVOt1DHR/sG1TEg8hCm1hzVtThH5jLDJlXSo9esX90IbNwMfNHj9P9RAB4Ccxf6jQxjRwDcGNJKMzIZbPLTb391fCDfXHvPF330RWmfjUTz4HU0Tyi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663867; c=relaxed/simple;
	bh=wxRnIznPD14SyjaHIq6492HvK18W59ktwYnXxxaPDu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIvVHvjZu1pxZZ+4XkU67YW38DsG9IGK/cuYQYmIRCj57ql1wj6qk/QG1dVs8fmGY41wAg/PXJBvyXviqdDXxjnMiw0dW1OfQXkY/QJHj6AxUBOEL97YChuKGBep6/rM8eezfbcoEMwSn+BYApT+uycd4MCWGXnbYrsEwiusIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2WjWVwW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234d3261631so968265ad.1;
        Wed, 11 Jun 2025 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749663865; x=1750268665; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fATdB3ysd5Gc7mFVZxyvlUfXC/v/xKLNDS5jIKGi8YM=;
        b=S2WjWVwWbI4LmKkQ0tZyNOh62C1usWXW3hdW9kw6DmRrhWEOhQ1Ir/umqiGuSLw+h9
         +zXyP0IQ944HkGCvXlQT/7yM+fxEn3xSoFWuQOGemm/oucGc+EOeW8a+XjXpGN2hHOlu
         GmYhkc7pQ9PbP0g3vK2ZlRxZFml1qsm9tkD0PK2EUfHHBElyJZF96C5PUK9YDW0hgGup
         pMOkTdqJ/mqt74vGhJG/UJfDNqRq/gnczzpa/L0nHdVZlxn3Z+AR7rISUnZF6IJroORh
         TukMvpS5l4FPKatcS+Ke6OsoQvK1FxXA0KHky9O9eME2L1o2EzZF3bz20N6QztNe16zk
         7Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749663865; x=1750268665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fATdB3ysd5Gc7mFVZxyvlUfXC/v/xKLNDS5jIKGi8YM=;
        b=g/j+x5Ik4hFZ/EdSYv7mC0PTflNLxCwv+sOpMuLV7ICiFd2d/Ua84cCJ1tHbP3lWAZ
         C5v9Uaq30l3O34FxQd9fgEkgLalinxdg8dn5GjKCDsj0fcdJxo8ztpCDleQAa5SbAR3K
         6ySH5N3j3Cau6/F7JKaDwLsIqQGxKt0tBUIhk65zgtBQlWMkLjkzMukolKCoXZShPK3r
         eP6WekdFFkY23nSjsu00PqA7U8NRe3h7w7jwQlgT2XduxPLCY+2PVLCIS5Se88W6rUuB
         Pw7q29SdsB8qeiVblwDcTd/FRULA6sZW3tCf+fDDbVkhTlvh4iRILlVUk92npZw9MBrs
         g7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUQpOuXmCvNH9Tu/dWex+MqeiVpn8qizy04LrxoxVBF0ysrmRJjiHOkdanHKzkFLSV1B3iz1xQt/Dq/9JQ=@vger.kernel.org, AJvYcCWdEJxmuAsUMd5mPjn6vCqdiGP2P9Iwte480NRyq9FFkOZ46W0Ii5aFWna/u+oksUutRS1Hx7/iQbh5Zfg6@vger.kernel.org, AJvYcCXePcWJV+G5y60dqJj/YJ5YhO3oLYOpY3J+yJ6KWbzCYd1qPUprTdO4x3VNbrVAZOpAu3LP43M3WzCs@vger.kernel.org
X-Gm-Message-State: AOJu0YxhpadtHpy2Lc2C0GUHpBhlL00hppidfVrywLZkC29ahFCXSgGC
	2xaDau9aVRcO/0FBeZ3wMrmETW++rIvePJbByWf7iZPvgqIw2AJF1aMUkYpcEQ==
X-Gm-Gg: ASbGncvWzetROTB3TM/oOpCuIAJVVb3ETL7EkbNvymWtPoQf551Dqfrib5+JS+BD9Pv
	tzc0OFUc6xGIFoHIY3Rm6tgG6xC74OCdQ4lf3NsqLyPGXmt5Qff3AQDcbEBvIOsvWuSw8TSwJch
	6gxDYCZeKiKBpT3tjka+CErwtbG62soOVmuJe/Nsoruy/dBqszv7K4bBfKLyF6AD8v8bzEdbXav
	rjgsb43MfcOi2d4zbD4OvZJgk2mVMPPd95LeKzDeopgaOJNwNXaG4m3lyyzTVASI5KfgJvdSx8v
	pG3BBB924fQsIjoqaNkB1SZnB0a/yvneTyd6QeSdVzzPwMRHGDvmc/J1mtPvfg==
X-Google-Smtp-Source: AGHT+IHcTwwqbtfEoVMcnp+UYCcnkDILrvdfSoCYSoSBBvznRic2SHesMrX/Q+9ylgxTys0m4BPjxw==
X-Received: by 2002:a17:902:f54b:b0:235:225d:3087 with SMTP id d9443c01a7336-2364ca853d1mr4988905ad.30.1749663864866;
        Wed, 11 Jun 2025 10:44:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cc6e:a0f4:a9c8:328])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360341097fsm91030495ad.214.2025.06.11.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 10:44:24 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:44:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomas Jurena <jurenatomas@gmail.com>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <meakn5o4tjnl55ykk5fvrpc3f7g4ov2gqfdsxzzy44p7zvrrit@53y6xkkhwcmx>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
 <20250610181542.GA2396962-robh@kernel.org>
 <aEmp57H3Tk6DnJty@jurenat-workstationFai>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEmp57H3Tk6DnJty@jurenat-workstationFai>

On Wed, Jun 11, 2025 at 06:08:07PM +0200, Tomas Jurena wrote:
> On Tue, Jun 10, 2025 at 01:15:42PM -0500, Rob Herring wrote:
> > On Tue, Jun 10, 2025 at 05:46:10PM +0200, Tomáš Juřena wrote:
> > > From: Tomas Jurena <jurenatomas@gmail.com>
> > > 
> > > Adds support for instantiating the tca6416-keypad driver via
> > > Device Tree. If no platform data is present, the driver can now be
> > > probed based on OF bindings.
> > > 
> > > A corresponding Device Tree binding document is added at:
> > >   Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> > > 
> > > This allows the driver to be used in systems that rely solely on the
> > > Device Tree for hardware description, such as embedded ARM platforms.
> > > 
> > > Tested on Toradex Ixora 1.3A board and Apalis imx8 SOM.
> > 
> > We already have a GPIO driver for this chip. Would the 
> > gpio-keys driver work here instead? Seems to work for 
> > arch/arm/boot/dts/ti/omap/am3517-evm-ui.dtsi.
> >
> I was not aware of this. Anyway, I tested this today, and it seems to work just fine with my hardware. There is no need for this change from my side.

I wonder if we should simply remove tca6416-keypad driver. I guess it
was created before we has a gpio driver for this block.

Thanks.

-- 
Dmitry

