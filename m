Return-Path: <linux-input+bounces-6937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D398BBE4
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D867E1F22AD8
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 12:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E8C19DFB5;
	Tue,  1 Oct 2024 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu7Ol15N"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC11865E0
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784979; cv=none; b=V6G4/w4aFjZFNv1o9oPmUkHBC+8La6uOj7IQxW2L78COTDGtN92UWUr8eKeCjwf5sUpCQt5ym/o5he6U1gJm/Kb/QPoTnfEfPOQcYlCCPWzdMPefpHg052+QxBEBQq6S2F7oWH+a2kYPIfwXwvto0E4NQO0PGX72VtZAx1ftCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784979; c=relaxed/simple;
	bh=8sL+0zXoUFzn8vtsl0mnYQvbeh+1pPSy5gRP664V7vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOqlfhhO6pbubbCwCZ4SYyJn27iZHTAsdbMamqpZTphHMMxSGwdauAidKEhZ4sH+DOHN7wgQOb0k/AIKJxyknY1dBMnFJBxoHIeTesmDCq95S9kf3Hl3RP+x4Kp8BjarTiWPcqoje1aH/+eZMpEeX2XfqJ5b9JgUhH3s3cJsf3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu7Ol15N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F77C4CEC6
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727784978;
	bh=8sL+0zXoUFzn8vtsl0mnYQvbeh+1pPSy5gRP664V7vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hu7Ol15NxK4MHptZOdnWEbladYtvOiRIh+u1IDDM0+ledpbFYXtCLRMyxH3i7niqO
	 L5UEgOLVjNDtmo1qpDgAMd6LtAR93kyh6O+ektYUea94ZSaCX523COSLSJmYVDNps7
	 cATqeSl3L5oWkFGj1VM9OwQ49+N+MiKXfbyBI3uZlwwhzVOHg+EPXYxWTlvIQ+ilrG
	 L41/xYCJFOWExHPPpdUiJcR8EWIToczEibxswk5YJQPAOg3o+l6wtPga6kKGY4VRUT
	 IWe3qaPs+TNH77MGkh/RuOUh1oEpUzmAO3S4PmQHIcb6ACrmwCBoqQw3gcVk8JE5vw
	 u9gsYCNM8XNBQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a90349aa7e5so804042466b.0
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 05:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgAIaJH9/WoW7udIJjvp5zIUcJiAp/gwS4duYY5uGc6Ub64O6CLD7Jz71WDhv6REd/pd3hTvUV1FLVsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdKljCBEpzDxrnA3+DEy6QQSS5mWLTc4eItC4lMcWPQrhvitZ
	YoNAzEWnbtx/8CMbWcHem80aJKtkL4Iq/skUwdUxa7MTr+X5ZEpAw9/q5ebTJa6ZFATyIPmuhow
	JwLabVKeYOA6kjuLjyufVXSGUnWY=
X-Google-Smtp-Source: AGHT+IH2/jP5wadPe/Idfuu9py+Hj+hvLEZJ+H1rvdE7WQ/a5WfOBwF/8IStGZdU5315q3kAcFxnUfvGYQInx0fvpTw=
X-Received: by 2002:a17:907:9812:b0:a91:1634:9e92 with SMTP id
 a640c23a62f3a-a93c4919832mr1574320866b.21.1727784977222; Tue, 01 Oct 2024
 05:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com> <Zvu7JOw0N6XB4ON6@google.com>
 <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj> <Zvvh_tiWQ9Ig7du3@google.com>
In-Reply-To: <Zvvh_tiWQ9Ig7du3@google.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 1 Oct 2024 20:16:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6WuYVa=X08NV+2XtDrcxDNfT8ti9zQ0Kc+tWM7m9iLQQ@mail.gmail.com>
Message-ID: <CAAhV-H6WuYVa=X08NV+2XtDrcxDNfT8ti9zQ0Kc+tWM7m9iLQQ@mail.gmail.com>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Dmitry,

On Tue, Oct 1, 2024 at 7:50=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Oct 01, 2024 at 11:21:10AM +0200, Benjamin Tissoires wrote:
> > On Oct 01 2024, Dmitry Torokhov wrote:
> > > On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > > > Hi,
> > > > >
> > > > > On Jul 04 2024, Binbin Zhou wrote:
> > > > > > This patch introduces a driver for the PixArt PS/2 touchpad, wh=
ich
> > > > > > supports both clickpad and touchpad types.
> > > > > >
> > > > > > At the same time, we extended the single data packet length to =
16,
> > > > > > because according to the current PixArt hardware and FW design,=
 we need
> > > > > > 11 bytes/15 bytes to represent the complete three-finger/four-f=
inger data.
> > > > > >
> > > > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > >
> > > > > It looks like this new driver made in v6.12-rc1 but is already br=
eaking
> > > > > other touchpads in fedora:
> > > > >
> > > > > https://bugzilla.redhat.com/show_bug.cgi?id=3D2314756
> > > > >
> > > > > The reported touchpads used to work properly but are now directed=
 to use
> > > > > the PixArt PS2 driver instead of the old one (I would say it shou=
ld be
> > > > > using Synaptics).
> > > > >
> > > > > I haven't touched PS/2 in a long time, so it's going to be hard t=
o
> > > > > pinpoint the error from my side, but it seems that the new driver=
 is a
> > > > > little bit too greedy.
> > > >
> > > > OK, I gonna revert it and hope PixArt folks will figure out less gr=
eedy
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
> > [    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x=
92, buttons: 3/3
> > [    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042=
/serio1/input/input5
> > ...
> > [    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:0=
0/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/i=
nput/input7
> > [    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci000=
0:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.000=
2/input/input9
> > [    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID =
v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> > ...
> > [    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:0=
0/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/i=
nput/input10
> > [    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci000=
0:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.000=
2/input/input12
> > [    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C H=
ID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> >
> >
> > So the touchpad seems to have the PS/2 fallback, and then switches to
> > i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
> > doesn't answered to i2c-hid (or is too much initialized, not sure).
>
> I see. It is interesting that the first probe fails:
>
> [    1.649119] psmouse serio1: pixart_ps2: init: Unable to query PixArt t=
ouchpad hardware.
>
>
> but then it goes and detects it a bit later:
>
> [    1.945075] input: PS/2 PixArt clickpad as /devices/platform/i8042/ser=
io1/input/input5
>
> It would be curious to get the logs of the failing case with
> i8042.debug=3D1
>
> Anyway, I reverted the patch adding the driver and will send a pull
> request to Linus soon.
Don't revert now, I found the root cause:
In pixart_read_tp_type(), we can see

+       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+       if (error)
+               return error;
+
+       *type =3D param[0] =3D=3D 0x0e ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE=
_CLICKPAD;
+
+       return 0;

This means, a non-pixart device will also be detected as "pixart
clickpad" and return 0,  unless the ps2 doesn't work at all.

And then in pixart_detect(), we can see

+       if (set_properties) {
+               psmouse->vendor =3D "PixArt";
+               psmouse->name =3D (type =3D=3D PIXART_TYPE_TOUCHPAD) ?
+                               "touchpad" : "clickpad";
+       }

This will confuse the later logic.

Huacai

>
> Thanks.
>
> --
> Dmitry

