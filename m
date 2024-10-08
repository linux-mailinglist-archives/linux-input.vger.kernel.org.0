Return-Path: <linux-input+bounces-7149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D49945C6
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C15528368F
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882A0191F8C;
	Tue,  8 Oct 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRgzHwkm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970518CC07
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728384447; cv=none; b=hIwD/VBVylKAGtVM6sE1TIwUqlAks1rRQZDD9EGc8L66rFShxCd7kQERzqxxfckGdBV9Dufz/1R7Umg0ba0UVVxNQ63v6YMAYKw59DBHLCE44IKLXaOSt554qFldPlqXRbt4Hoj9A8bbMde6ymuGg++iEQ+ra1wJizpbranod2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728384447; c=relaxed/simple;
	bh=5//Qmy3FtWIUCiIwJOrcIx5p6UnF1YYjQVG/VlKACac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcomDGKQWlMrDmAHvvbPkl1GLcIF6Nj09tSkbAQ7zpaD8xra2UoqcNSNe5kgkYLpIj79oU42Xh7Peyn6/qhkRczX6RbhPI2DZFvYAArqKJAp1d/3hSeteICOGm/nkHQ31CXLdBIbPI+duEQBxgqHUhrCq0ys+48AoeNBXxgJeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRgzHwkm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9943897c07so402658766b.3
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2024 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728384444; x=1728989244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9CBhqdCutaMVDbSbEDAWUSjh7S2Hrfvn24IyzCajTw=;
        b=hRgzHwkmWQbX+Ez57p+iXbKnO1GED5Kc/KakeQo6ebsZapsuf1kbGGt4X/28wcD9V8
         bKYS3K8ob9kL1gtlyZwtyTbslKQOLGnc2FYFEZpcOqbHN5/4w7NT7G78G0Lvv5aXpEVk
         GhLNPd0JAb+Wd3VsgwyiL5OCozy2TkGaV58pJR8INUdMUyRmhVww4vngcyyTqPseK0SY
         31fxXS62ivnMYG5dCAeNqIsfGqIKG1489m5wt+dsnVlXfTfuSJCQENgehOXVxQWX1cPI
         fVOJPCNKrHBJ4ru4pT53puLwQmiA9MO2kCLJc8im1jlln6iX1Y26QghOTqZ0K+nZKnJP
         a+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728384444; x=1728989244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9CBhqdCutaMVDbSbEDAWUSjh7S2Hrfvn24IyzCajTw=;
        b=ZjbYWVOTPn4GjDeyxN2I7Y67QoOvpAtwZmHtk477oPzHCNBcz53rGVum04A4/wQ5bS
         Ub31sGEUgAoYNTtETIVXsXoOQok0CkQlcvUDZH28ixXOVMgaKRFBiFzIMYiUYAI1AHIz
         KZ/tnUMzqxnyglgGoLKnZQmVXQ9j5RDVZohO7VdSOpLIXoF79ln+VnsSYE8Afi6IbOKv
         eUXESyPPu63Ta1Z09tXXriFT1JG8UV4pXeCxnvhVJxzN7pUrLMMp9Ch4DjENzoz+Pn0n
         EAi5555ZE2sWgkLzmh9p/iNHxWWPvZDIaIB2KGKcCKhq8BYZi7mNJnl+XzvbCqUTOgqU
         Wafg==
X-Forwarded-Encrypted: i=1; AJvYcCVSaET3ju5a8lnXP7flBQ5NxMaeYahWtA2+EkFY+nN6FsiBjg7qoxroFeW3ArhNptesHrdroNaaO3gKjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhlKY8a+q/tp/HAOJI8nQzfXwKNt486GA+yk6+TtcSd0+0qWA
	oVHP8FL35LIcd+7ilNE1mjfcgk7pDKiH1MvPkgt3x1qnWMNVIl4aLp0lueRGfCdK81+zR0QlUjb
	xGwQ2WGJMj82upUH53G+LmnGJXOaIiXaS
X-Google-Smtp-Source: AGHT+IGhnfcps1wM/KgWJ44vkV6+AS2w0uGwxPj8K/9x4kG3XMP1MW68LDa61BwV4chgz/sBhPvcs0rax+DDP66VTic=
X-Received: by 2002:a17:907:743:b0:a77:c95e:9b1c with SMTP id
 a640c23a62f3a-a991bd79527mr1586009966b.27.1728384443584; Tue, 08 Oct 2024
 03:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com> <Zvu7JOw0N6XB4ON6@google.com> <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
In-Reply-To: <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 8 Oct 2024 16:47:10 +0600
Message-ID: <CAMpQs4+viiCnErRLTK33-_189DY=XwfRMjUWLSCk3d=vvDg+Ug@mail.gmail.com>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>, 
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin:

First of all, I'm very sorry that PixArt has caused other drivers to
have anomalies.

On Tue, Oct 1, 2024 at 3:21=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.o=
rg> wrote:
>
> On Oct 01 2024, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > > Hi,
> > > >
> > > > On Jul 04 2024, Binbin Zhou wrote:
> > > > > This patch introduces a driver for the PixArt PS/2 touchpad, whic=
h
> > > > > supports both clickpad and touchpad types.
> > > > >
> > > > > At the same time, we extended the single data packet length to 16=
,
> > > > > because according to the current PixArt hardware and FW design, w=
e need
> > > > > 11 bytes/15 bytes to represent the complete three-finger/four-fin=
ger data.
> > > > >
> > > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > >
> > > > It looks like this new driver made in v6.12-rc1 but is already brea=
king
> > > > other touchpads in fedora:
> > > >
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=3D2314756
> > > >
> > > > The reported touchpads used to work properly but are now directed t=
o use
> > > > the PixArt PS2 driver instead of the old one (I would say it should=
 be
> > > > using Synaptics).
> > > >
> > > > I haven't touched PS/2 in a long time, so it's going to be hard to
> > > > pinpoint the error from my side, but it seems that the new driver i=
s a
> > > > little bit too greedy.
> > >
> > > OK, I gonna revert it and hope PixArt folks will figure out less gree=
dy
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
> [    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x92=
, buttons: 3/3
> [    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/s=
erio1/input/input5
> ...
> [    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/=
0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/inp=
ut/input7
> [    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:=
00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/=
input/input9
> [    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID v1=
.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> ...
> [    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/=
0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/inp=
ut/input10
> [    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:=
00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/=
input/input12
> [    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C HID=
 v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
>
>
> So the touchpad seems to have the PS/2 fallback, and then switches to
> i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
> doesn't answered to i2c-hid (or is too much initialized, not sure).
>

Now, we hope to solve this issue further with your help.

As you can see in the logs:

[    1.649119] psmouse serio1: pixart_ps2: init: Unable to query
PixArt touchpad hardware.

We are failing in the pixart_query_hardware() function, guessing that
it is an error in probing the type value. Can you please add the
following patch to the problematic kernel to see the actual type value
being fetched.

diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pixart_=
ps2.c
index 1993fc760d7b..73ec6926d07d 100644
--- a/drivers/input/mouse/pixart_ps2.c
+++ b/drivers/input/mouse/pixart_ps2.c
@@ -69,6 +69,8 @@ static int pixart_read_tp_type(struct ps2dev
*ps2dev, u8 *type)
        if (error)
                return error;

+       pr_info("pixart_read_tp_type code is %x\n", param[0]);
+
        *type =3D param[0] =3D=3D 0x0e ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE=
_CLICKPAD;

        return 0;

Thanks.
Binbin
> >
> > so I am not sure how PS/2 device would interfere with that.
> >
> > Could you give me access to the attachments on the bug so I can take a
> > closer look? And hopefully the original reporter will submit their data=
.
>
> Sure, done!
>
> Cheers,
> Benjamin

