Return-Path: <linux-input+bounces-6928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81C98B83C
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491091F22D8E
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 09:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B501C693;
	Tue,  1 Oct 2024 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN2dIGqG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D37B67D
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774476; cv=none; b=GEUsY0y27llpZmYXBlGejQqf8oeohXF2aEVJusSM7nuceSnLzmfpnUuo/hxDjMDJ8GIw3t0GTjNGN72furn7UC/bdmLtNSl/ctMVmn4jj9Spaba9fKvN7YVBVOKzmieAWl5+tS6A3s0194zod9vLyG4nAuziWnanJ7sU8Z6uiR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774476; c=relaxed/simple;
	bh=rXCD+JoZ/qmR2mRPqjBjPwLw/sAH/g4JY4fxrdPUrNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHsHgLu7dPJ6PNLZELnR7OYZmp7QoDYTUlX2HbN5tBQ6ODmlrBqgN1Ch/BTpoTsLM2D71fpOlibBzEvx60T57jxIwHbZf60IKUbTkrjr4tK2i5Xo6laAkV+KojseWhBVcrjIdwhRm70qaEbWWduUqtqTDEEObwEoPWgIgZk/IIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN2dIGqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0960C4CEC6;
	Tue,  1 Oct 2024 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727774475;
	bh=rXCD+JoZ/qmR2mRPqjBjPwLw/sAH/g4JY4fxrdPUrNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aN2dIGqGwUjfTHIUS/AtLFME4nR48b3xhlTVou0bMEgAGGXMFg2tGNwEUOwNtsVa6
	 QnI0aHKIInzogzwHYcmcynXEnyx8gt3WKwGqaryQY2BcPLehsYj6wbVGUw4UqwGeKi
	 af7QWuJMfuqh6vC2pCOs+r0TQxounE/8E+Lbx+mgDiqcdKE6fMwnO8BnNAsJWldvNf
	 qK6X9OjpnSFhLV2RCqg+wXAkO59yyTgQCb0yWLTWVk6Kq4alRRkPt65rSNlMAXeJHX
	 EjcnDB589Q26ariHAUY+yZbPDVyrs0fWX3Ej14KyKzx3VzCn8r0tVI9JUK6lB9Rs2x
	 x69sXnI2EJeFw==
Date: Tue, 1 Oct 2024 11:21:10 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, 
	Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com>
 <Zvu7JOw0N6XB4ON6@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zvu7JOw0N6XB4ON6@google.com>

On Oct 01 2024, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > Hi,
> > > 
> > > On Jul 04 2024, Binbin Zhou wrote:
> > > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > > supports both clickpad and touchpad types.
> > > > 
> > > > At the same time, we extended the single data packet length to 16,
> > > > because according to the current PixArt hardware and FW design, we need
> > > > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > > > 
> > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > 
> > > It looks like this new driver made in v6.12-rc1 but is already breaking
> > > other touchpads in fedora:
> > > 
> > > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > > 
> > > The reported touchpads used to work properly but are now directed to use
> > > the PixArt PS2 driver instead of the old one (I would say it should be
> > > using Synaptics).
> > > 
> > > I haven't touched PS/2 in a long time, so it's going to be hard to
> > > pinpoint the error from my side, but it seems that the new driver is a
> > > little bit too greedy.
> > 
> > OK, I gonna revert it and hope PixArt folks will figure out less greedy
> > probing sequence (or maybe we need to push it down a few sports).
> 
> Although, as I am trying to read the referenced bug, one of the
> reporters are saying that they touchpad is USB:
> 
> SysFS ID: /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0
> ysFS BusID: 3-3:1.0
> Hardware Class: unknown
> Model: "Synaptics Unclassified device"
> Hotplug: USB
> Vendor: usb 0x06cb "Synaptics, Inc."

I guess this must be the fingerprint reader or some other synaptics
device.

In the 6.11 logs (now publicly available), we can see:
[    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x92, buttons: 3/3
[    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input5
...
[    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input7
[    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input9
[    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
...
[    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input10
[    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input12
[    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00


So the touchpad seems to have the PS/2 fallback, and then switches to
i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
doesn't answered to i2c-hid (or is too much initialized, not sure).

> 
> so I am not sure how PS/2 device would interfere with that.
> 
> Could you give me access to the attachments on the bug so I can take a
> closer look? And hopefully the original reporter will submit their data.

Sure, done!

Cheers,
Benjamin

