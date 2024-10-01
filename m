Return-Path: <linux-input+bounces-6936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C298BB7F
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D86284160
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384CD198E99;
	Tue,  1 Oct 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkPhYGCg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846043209
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783428; cv=none; b=makL009pKRMF/oTiO2pSq5RSqvGW7eRQCntIlJQDHs58ka7UcG6T+z1GpaWQKDrw2Cb9YGi/vtvGJRICcrI6z7ulnGk9CPIKXzZ+lFl4mZVP5gjuibRs1SFj1o2PqeP4Bvt190Zd2bWbRyiZEZvL5TEzv1AVoIuXJFelkf/1u5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783428; c=relaxed/simple;
	bh=09f+AsypI9vxrhY6fUtbGyFnMrpvL6O4fJlw787uqjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oa05apK1/4a/cwnAljGvjNgkK/+mmYFWWIVHFw/KjzY0gXrBK5eVT5oSjipnuZPNXA/OKrAoruSiNeq7xWFvymaDczr94mqvvx/2X51gC0BWSBKuaUfBnAPYFClhIGHB5gm2DxsFlBmtJ18kATjSsiEhKxSJC/t+nZBlDVnmV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkPhYGCg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71b8d10e990so2469960b3a.3
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727783426; x=1728388226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8oVKquhm/mQNGgt+aADNuOYzFWRbCI0i61hk4KCW0o=;
        b=kkPhYGCgacLePUAMnbUt0Z+S5USOLg+4M/l5vQRIKCTy93x4gnDvgugjKqAEk2ObJJ
         ceyVGxZ+BlsDBgPWFipSYUQ18d3kNaagFK1yoJ5ctbnOtakGbeaGxtnN+g5u06BlN4OX
         GVCn616n6ESNJZiH+6jZ7KoxLCKCGo20zotKqVV1sdDxQLQRW0+e/6CNaKJrYNlugf5P
         m1bMWOxRjLAi4a9nMqgyTXXyGXhJ6I4ONVcI6B9ui7ekVAZvmjEi4Zy9A+oVii3RS6Uj
         kPd1QZ6/mQjFde3Zbo1IWkz3UBQIhedBfB4XlIx/oLoFbN0rIYApkVWL+9RexrO6nYj1
         sq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783426; x=1728388226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8oVKquhm/mQNGgt+aADNuOYzFWRbCI0i61hk4KCW0o=;
        b=Cb8sr7tmVRKsNFSFRwX8YSgz6YGb5NUQMkp5WlA5rM96d8F9VEt17RL3xbkXBeLLS5
         j8s88mk/y81+g1UG8cUNcxgDPzeDW4fwWv6h/sIt49l7j6DK6XYB/v6Z3zrtJahAPjYO
         vALTWnamusytjfIfSN3QfPSKzSOUIZjzwQ3LWhyjAnvAYLUz/rdprqJaGxKKbCJ8b4Pg
         qDKPeqRKfZv/z5SmWlNNegXwO6tiJV7IH2etg6IFNQ39ikN7QICNbUCGIdfqMrGv216U
         dxJPSk7Gfh00cLz4K0NfwTy8YJOtM983yMocojREoC+3go5qHTPBLvWaOsfJTGx8S35K
         sswQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAeeMUxWcBQb89aC4HsZT7AmY9cB4dxv8BxYbUaaywtxT9d6pSp7SIgeXzswrcqozrhBUPZuXPxQkQdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVeYv0PK4s4CtnCg6jQQfO/vtj2tRBnjguAGd3r8YK49y/0e0/
	zhcuDpPgMxObS2mzljUIRUUBpXswkskTtteSMXMLVhVEkpl1I2iEtOrO2D7K
X-Google-Smtp-Source: AGHT+IHiSjf+OeHCO5ZsKHx11+lA0idwQNY3zp1jhd3FmAOtpyydr2tQBUnWo0SAjvvZ9Ts+B3mK8g==
X-Received: by 2002:a05:6a20:d808:b0:1d2:f0e2:4ad6 with SMTP id adf61e73a8af0-1d4fa69ed75mr21868827637.18.1727783425721;
        Tue, 01 Oct 2024 04:50:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db612f6fsm8199081a12.86.2024.10.01.04.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:50:25 -0700 (PDT)
Date: Tue, 1 Oct 2024 04:50:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zvvh_tiWQ9Ig7du3@google.com>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com>
 <Zvu7JOw0N6XB4ON6@google.com>
 <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>

On Tue, Oct 01, 2024 at 11:21:10AM +0200, Benjamin Tissoires wrote:
> On Oct 01 2024, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > > Hi,
> > > > 
> > > > On Jul 04 2024, Binbin Zhou wrote:
> > > > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > > > supports both clickpad and touchpad types.
> > > > > 
> > > > > At the same time, we extended the single data packet length to 16,
> > > > > because according to the current PixArt hardware and FW design, we need
> > > > > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > > > > 
> > > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > 
> > > > It looks like this new driver made in v6.12-rc1 but is already breaking
> > > > other touchpads in fedora:
> > > > 
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > > > 
> > > > The reported touchpads used to work properly but are now directed to use
> > > > the PixArt PS2 driver instead of the old one (I would say it should be
> > > > using Synaptics).
> > > > 
> > > > I haven't touched PS/2 in a long time, so it's going to be hard to
> > > > pinpoint the error from my side, but it seems that the new driver is a
> > > > little bit too greedy.
> > > 
> > > OK, I gonna revert it and hope PixArt folks will figure out less greedy
> > > probing sequence (or maybe we need to push it down a few sports).
> > 
> > Although, as I am trying to read the referenced bug, one of the
> > reporters are saying that they touchpad is USB:
> > 
> > SysFS ID: /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0
> > ysFS BusID: 3-3:1.0
> > Hardware Class: unknown
> > Model: "Synaptics Unclassified device"
> > Hotplug: USB
> > Vendor: usb 0x06cb "Synaptics, Inc."
> 
> I guess this must be the fingerprint reader or some other synaptics
> device.
> 
> In the 6.11 logs (now publicly available), we can see:
> [    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x92, buttons: 3/3
> [    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input5
> ...
> [    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input7
> [    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input9
> [    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> ...
> [    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input10
> [    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input12
> [    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> 
> 
> So the touchpad seems to have the PS/2 fallback, and then switches to
> i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
> doesn't answered to i2c-hid (or is too much initialized, not sure).

I see. It is interesting that the first probe fails:

[    1.649119] psmouse serio1: pixart_ps2: init: Unable to query PixArt touchpad hardware.


but then it goes and detects it a bit later:

[    1.945075] input: PS/2 PixArt clickpad as /devices/platform/i8042/serio1/input/input5

It would be curious to get the logs of the failing case with
i8042.debug=1

Anyway, I reverted the patch adding the driver and will send a pull
request to Linus soon.

Thanks.

-- 
Dmitry

