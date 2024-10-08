Return-Path: <linux-input+bounces-7153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB42994BF6
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 14:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59FD7B20C9C
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD431C4613;
	Tue,  8 Oct 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSYpPLMl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6471C2420
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391695; cv=none; b=f3fxi4er8N7wZ0CcL/YucK9YToTT36RvVo6eLxxZybYuYzw1FPRSkshtderFzeXvueKq4w6/z9+xUlG9BH2EgvcKqKrvG/CJuaKum4UXHVx+Yo0PFAWNAjEVX4psE/bgcu4EApnN1K6VtpdtcASqzHgCJ+QhjIh/+5EvDC0ezNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391695; c=relaxed/simple;
	bh=tbGDIEzqPEgl4TtbQO83hxicvmXaGyFwIazX8kUAmEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZnMAphERBbhr6BDZAM6brVgYImO9qcFC34VXk3L10vipZTjtHe6UsxWwd1IOik8ikRZM+bhJX5qFOUNlEYxHpz37KkP2u50HPcF7/xXw3ItgqKFg8bGLqOsNuVem1LolLGF3tfKJaBZ6WYE5uCWOMlmaUHXVM301X/iN3JW7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSYpPLMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B1AC4CECC;
	Tue,  8 Oct 2024 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728391695;
	bh=tbGDIEzqPEgl4TtbQO83hxicvmXaGyFwIazX8kUAmEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSYpPLMl2ESygMtiA1fTvqzFtZP/YjMQDBnnCjdh7Mj9MXDMYsjqZxaapFMRm8KQS
	 IU+eFGe52TBojpiY0wwAkRnZtb+S58jZQrajX7ZBg0HpNzsg3hatMawAtqdI+ToW9U
	 qr7CKJvvGFauaiMwV2Z0dfnp04vL8gN8DUWdu36te0nU/+k2e30buo/yQZYd+30Uzm
	 c9Rsdpwig0JLUVqUo10Trq79cepdmwiQGW7dUVTehYkufeuPE0F7KV6JQKZzQNJFQW
	 mu1+m1ijyQZjUqBMVu/L1LV9B6lfivx7KEyDSyz0V/ce5J6TPEOdugEb+HoaPvblg3
	 AWCrOv643PT1w==
Date: Tue, 8 Oct 2024 14:48:10 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <2p4pu5sk5oitteldaav3kydp7xnasbzw5tofjbwqfiwy76xng6@knorzluqepep>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com>
 <Zvu7JOw0N6XB4ON6@google.com>
 <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
 <CAMpQs4+viiCnErRLTK33-_189DY=XwfRMjUWLSCk3d=vvDg+Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4+viiCnErRLTK33-_189DY=XwfRMjUWLSCk3d=vvDg+Ug@mail.gmail.com>

On Oct 08 2024, Binbin Zhou wrote:
> Hi Benjamin:
> 
> First of all, I'm very sorry that PixArt has caused other drivers to
> have anomalies.

No worries. These things happens, and that's why we revert patches when
there is an issue.

Also, note that this issue is 2 fold:
- for sure, your driver was too greedy
- but also Fedora disabled i2c-designware which is used in many machines
	disabling the touchpad entirely

So you didn't break all of the other touchpads. The Fedora config change
did. Your driver just prevented the fallback mode to happen.

> 
> On Tue, Oct 1, 2024 at 3:21 PM Benjamin Tissoires <bentiss@kernel.org> wrote:
> >
> > On Oct 01 2024, Dmitry Torokhov wrote:
> > > On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > > > Hi,
> > > > >
> > > > > On Jul 04 2024, Binbin Zhou wrote:
> > > > > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > > > > supports both clickpad and touchpad types.
> > > > > >
> > > > > > At the same time, we extended the single data packet length to 16,
> > > > > > because according to the current PixArt hardware and FW design, we need
> > > > > > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > > > > >
> > > > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > >
> > > > > It looks like this new driver made in v6.12-rc1 but is already breaking
> > > > > other touchpads in fedora:
> > > > >
> > > > > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > > > >
> > > > > The reported touchpads used to work properly but are now directed to use
> > > > > the PixArt PS2 driver instead of the old one (I would say it should be
> > > > > using Synaptics).
> > > > >
> > > > > I haven't touched PS/2 in a long time, so it's going to be hard to
> > > > > pinpoint the error from my side, but it seems that the new driver is a
> > > > > little bit too greedy.
> > > >
> > > > OK, I gonna revert it and hope PixArt folks will figure out less greedy
> > > > probing sequence (or maybe we need to push it down a few sports).
> > >
> > > Although, as I am trying to read the referenced bug, one of the
> > > reporters are saying that they touchpad is USB:
> > >
> > > SysFS ID: /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0
> > > ysFS BusID: 3-3:1.0
> > > Hardware Class: unknown
> > > Model: "Synaptics Unclassified device"
> > > Hotplug: USB
> > > Vendor: usb 0x06cb "Synaptics, Inc."
> >
> > I guess this must be the fingerprint reader or some other synaptics
> > device.
> >
> > In the 6.11 logs (now publicly available), we can see:
> > [    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x92, buttons: 3/3
> > [    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input5
> > ...
> > [    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input7
> > [    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input9
> > [    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> > ...
> > [    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input10
> > [    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input12
> > [    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> >
> >
> > So the touchpad seems to have the PS/2 fallback, and then switches to
> > i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
> > doesn't answered to i2c-hid (or is too much initialized, not sure).
> >
> 
> Now, we hope to solve this issue further with your help.
> 
> As you can see in the logs:
> 
> [    1.649119] psmouse serio1: pixart_ps2: init: Unable to query
> PixArt touchpad hardware.

Yes. And this is already too far. If you are in the ->init(), that means
that you are dealing with a PixArt touchpad. If it's not, that means
that you should have stopped at ->detect() before.

> 
> We are failing in the pixart_query_hardware() function, guessing that
> it is an error in probing the type value. Can you please add the
> following patch to the problematic kernel to see the actual type value
> being fetched.

I was merely the messenger here. But that debug patch will not help
you IMO. In pixart_read_tp_mode() you call ps2_command(ps2dev, param,
PIXART_CMD_REPORT_FORMAT); assuming that no other brand will answer that
command.

Turns out that it's not the case, so you can not rely on this only to
detect your touchpads. Especially because the test after looks for the
value "1" in the first byte, which is definitely not special.

A safe way to get this driver in (but painful as hell) is to rely on
dmi_matching. This way you have an allowlist of platforms where the
devices are known to be there, and then you can be sure you are talking
to your devices.

Or you have a safe magic sequence like elantech.c or alps.c where you do
a set of commands or expect a command to return a set of data that you
can be sure only PixArt touchpads will have.

Ideally if one commands returns the vendor name "PixArt" in ascii, that
would be perfect :)

Cheers,
Benjamin

> 
> diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pixart_ps2.c
> index 1993fc760d7b..73ec6926d07d 100644
> --- a/drivers/input/mouse/pixart_ps2.c
> +++ b/drivers/input/mouse/pixart_ps2.c
> @@ -69,6 +69,8 @@ static int pixart_read_tp_type(struct ps2dev
> *ps2dev, u8 *type)
>         if (error)
>                 return error;
> 
> +       pr_info("pixart_read_tp_type code is %x\n", param[0]);
> +
>         *type = param[0] == 0x0e ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
> 
>         return 0;
> 
> Thanks.
> Binbin
> > >
> > > so I am not sure how PS/2 device would interfere with that.
> > >
> > > Could you give me access to the attachments on the bug so I can take a
> > > closer look? And hopefully the original reporter will submit their data.
> >
> > Sure, done!
> >
> > Cheers,
> > Benjamin

