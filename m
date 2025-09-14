Return-Path: <linux-input+bounces-14691-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB6B5642A
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B356A42589E
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10171EF0B9;
	Sun, 14 Sep 2025 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh0YXpkC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDE1E7C2E
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757812133; cv=none; b=Tfz6mQDwRCiWZaVdUvNcKHZ8i2wPlnWTqRCljHptPOEjBwWASNJK6u8TlAajMKDApSI/ah2m+GmC1DXb5bXWrbZiOJURsyOZrIvgwtWzWrXOaTWdBIsxKeB+ThpucyJ+orOsz7huu4q5CYrFqKbzPs47O+oZ+R3niePJ12vAdS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757812133; c=relaxed/simple;
	bh=hgJHY4HXKWPcYNFn7GqdDSqEsVBrQ1LT0l8yuSdhhPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWlVzNdi43HdcB9VtK6AzLN6ESee3W4N34zJ+uK/n/EcEvdKhuaFbZISqVIeFXM6jO5VvHDIpQ35xB3B++p9IsHYbtZwJyrAOGkadIGIj5hUFBwpxhH0O0aUlVzxH8N084v8mZ8E9+EaluDHHiiPiLYA9KmV/SMslALHIVNXokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh0YXpkC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-323266cdf64so2668326a91.0
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757812132; x=1758416932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGHMCvuH4zOHmVeqcJ1jMNNY6PE4UL0+eswFIMy02ao=;
        b=jh0YXpkCLQPEmViD2exP9Fz8aLyRzINyVPrXtBkADdB5UIj/oKd2905VZN157wi0kj
         hBM9Fxl6EBGk7OQbVDhoCwvWKABGiUWDhFxgfGFMQSMH2Ek6GhMKDpLasrwhGLtHiAKE
         KRJPVg8HWFaUFhzH5rD3YsiADZ3jLld06br3+qfJDroZOzd6RYnV7U0bxJEmlZ9o/GHS
         sTAezNOp5TKL7tA582qjIvBVG/gdWtnFuebwhuMuyEhxoubx0bWhRNgvuFZ/x9wNLUl+
         sFYit4NaXuDg55YLfeIHPA76LkFc57SdBzLEX9ddWiAGuyEDCoiWRVW+MBrHZX1diNnC
         BIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757812132; x=1758416932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGHMCvuH4zOHmVeqcJ1jMNNY6PE4UL0+eswFIMy02ao=;
        b=W/27eB+RC+JWRP5O6TB4VFLzkz48yaQAz6ev/XHT0Gjc75u6EIE1Zu/fUCw1R8fVWW
         ubuyEJfEahQr/lhMzRTgyFLI7PkXCXL80gapPd84RuGuPFaO3300cnPa9sO6QvOZs+/z
         S0v/g7ZkKFAjKFziWs8P1S3aFxWrs3RdyPHYUTu/vv0TQ/Ydm9n1ItPcExH3vnvZsBr4
         NPdSyo8zAQZlUdZbFrTl6p7/HN9g2Lv1PNAF1kBvwSWaPCSJxF84jZsViS0whwD+0Sm/
         s9H9MyC+kfZ8cCcfQGs46MPQ3ZrA/V2/HsllN0naGioi2aFVrK2Q6Ybh0expqgbVn74V
         VWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGtjNnaedq7HTtf/zRji4Uu7amgmAyf6WQPYS+FXqkpj796cpgwoPG42x05BfYP+lL1Un5I/nJFUqoMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynzVNWra7ahE0WmvwNDJjDdDyx7+G2YntDOqq0pq0gOtwOvCvP
	v/OiNZED7uZAb7L7c1+jkJWM8dj4bT7wHdjcG6JpgCRyZvsw5BMHRyV8TzIlhw==
X-Gm-Gg: ASbGncsfw6JXQ7xEewBTYidnA1kof+430xutjpPeshR3xq91DtQmDGzrgb+huOiEwcl
	OT7a4zznwc5J6aH7VgFDHGziAmxssmFaD1i1WQzL11nhyhZegSjoXdl6cVr3rgIN9IKUt+2PwVX
	zJTWk6T2bS/oxdbTr2qsLCN/uPpBe0UzrQNQmLYsBElCncIXU0CevX4cc0FoiVOFJGpHAgimwsD
	jXlPrSVeExUz2StwZEIIqMbI26pPcLLHYQ855PQbcDQDdN/vtne+z6jnsj27GyKU5EE48kBmy3W
	XshcwUOO1UoYQCvRU5i351yVKX6uls0YB6zDI28oOfnR1MR1gFVg7qdFrW97Alp8otdU5xvFUeT
	6yHikBJThS6IyplfoJ+N6b8wu92PYS5DW
X-Google-Smtp-Source: AGHT+IFL97kM3TaaKeksNS9Jbrgo+sfiDPUaWN9rzL8adPKJTZQ5LMrTbVcu8j2ZlunCSLPcdH9n5A==
X-Received: by 2002:a17:90a:d60d:b0:32a:e706:b7b6 with SMTP id 98e67ed59e1d1-32de4f895efmr8852090a91.11.1757812131523;
        Sat, 13 Sep 2025 18:08:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm9303308b3a.81.2025.09.13.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:08:51 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:08:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <vt2xibzzfbq2aq4kuyl3557kqazqusnxe75ps6idn6xpcxhous@u562qeztmaqb>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
 <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
 <aLqhcu-zjpyeYMly@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLqhcu-zjpyeYMly@google.com>

On Fri, Sep 05, 2025 at 08:38:10AM +0000, Tzung-Bi Shih wrote:
> On Thu, Sep 04, 2025 at 07:06:23AM -0700, Dmitry Torokhov wrote:
> > On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> > > On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > > > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > > > probed at the same time.
> > > > > > 
> > > > > > Example:
> > > > > > 
> > > > > > + -----------------------------------------------------------------+
> > > > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > > > + -----------------------------------------------------------------+
> > > > > > | Probe cros-ec-keyb.            |                                 |
> > > > > > | - Decide to defer[1].          |                                 |
> > > > > > |                                | A device bound to a driver[2].  |
> > > > > > | Probe cros_ec_lpc.             |                                 |
> > > > > > | - Init the struct[3].          |                                 |
> > > > > > |                                | Retry cros-ec-keyb from the     |
> > > > > > |                                | deferred list[4].               |
> > > > > > |                                | - Won't defer again as [3].     |
> > > > > > |                                | - Access uninitialized data in  |
> > > > > > |                                |   the struct.                   |
> > > > > > | - Register the device.         |                                 |
> > > > > > + -----------------------------------------------------------------+
> > > > > > 
> > > > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > > > 
> > > > > > Note that the device link[5] can't help as in the observed environment,
> > > > > > the devices are already added via device_add()[6].
> > > > > > 
> > > > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > > > 
> > > > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > > > before continuing to probe cros-ec-keyb.
> > > > > 
> > > > > Why is the keyboard platform device instantiated before the transport
> > > > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > > > issue...
> > > > 
> > > > I may misunderstand but it seems to me:
> > > > 
> > > > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > > > 
> > > > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> > > >   registered.  It deferred as its parent's drvdata was NULL[1].
> > > > 
> > > > - The transport platform device was probed when `cros_ec_lpc_driver`
> > > >   registered.  It set the drvdata[3].
> > > > 
> > > > - The keyboard platform device was probed again from retrying the deferred
> > > >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> > > >   wasn't NULL and cros_ec_register() for the transport device weren't
> > > >   finished.  The race happened.
> > > 
> > > Hi Dmitry,
> > > 
> > > Does it make sense to you?
> > 
> > I'll have to research how MFD mixes up statically described and
> > DT-described platform devices and makes sure that children are not
> > probed before the parent is ready - I think we need to make cros_ec
> > behave the same way.
> 
> I may misunderstand but FWIW:
> 
> I failed to find relevant code in MFD [7] that guarantees the probe order.
> Also, I'm curious about wouldn't code at [7] results in duplicate platform
> devices?  E.g., 1 populated from OF; 1 created by MFD.
> 
> Note: current cros_ec_dev.c doesn't use `of_compatible` in struct mfd_cell.
> 
> If we're looking at how cros_ec_dev.c guarantees the order:
> 
> - The transport platfrom device is probed first.  It calls cros_ec_register().
> - In cros_ec_register(), it registers the MFD device "cros-ec-dev".  And the
>   children devices are added via mfd_add_devices().
> 
> 
> Back to the issue we observed:
> 
> - The platform devices are created when it scans the tree in ACPI[6].  We
>   probably have no way to prevent the devices from adding unless specifying
>   `enumeration_by_parent`[8].
> 
> - When some of them are modules, the driver registrations are tied to the
>   module insertion.  They can be arrived by anytime unless we use something
>   similar to soft dependency[9].  A Kconfig dependency will also
>   be needed to prevent cros_ec_lpcs=m but cros_ec_keyb=y.  However,
>   cros_ec_keyb would need to specify 2 possible dependencies "cros_ec_lpcs"
>   and "cros_ec_spi"[10].  I'm not sure what would be happening if a system
>   has no cros_ec_spi module at all.

Sorry for the delay. I think we need to figure out how to delay device
registration until after the transport device is registered and probed.
Unfortunately I have not had time to look at this properly so I acked
the changes to cros_ec_keyb so that we can close the hole for now and
later we can try to see if there is a reasonable better solution.

Thanks.

-- 
Dmitry

