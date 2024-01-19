Return-Path: <linux-input+bounces-1336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B88325AC
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 09:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E541C20EFD
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 08:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC020B04;
	Fri, 19 Jan 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c0Rmrfs7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157ADF6C
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652583; cv=none; b=OihW12SDV/RhBcA0ZxbySOl2opBwaBZgamlm/WT2WLD/yIc9hT6zvZIu0xtRzFqD1ZC0+GcdtZB2jTO/VoH/NdPME4uRWe/CmwAwKvXXzN+iadEurheCFtTMph0T0F76zbNXs+tORxkWxkiaLkLfnOq5HzBWjdpYtE3flOTvXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652583; c=relaxed/simple;
	bh=rNH5w9MEnm/L7pSlhbE5K6ub+H7WRRZ8uvcVydL82jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8heX0IbeudI21SD3qFQPG7Kt9JuHOOx8elNXLZ3cs+Xe5wuDWzTc8Qjom7m+y6jxB/IQ5JT26Bvn1vY8HNZCymoHrVqVh6H94XAWiH7LGi2Xr9ZjTaRePpy+TszsHJDbcYI0gOb6L5tICfzJzgPtflGdqPbpbFLuNbOAHoILNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c0Rmrfs7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e880121efso5287005e9.3
        for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705652579; x=1706257379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G8u3jZmSnI6t8T7vybwiOVPsXxP7J+QmNG1+oPGSI8=;
        b=c0Rmrfs7K62dXC+q6wHSPktn5wUNm03WVZRFXinrc8s0vKAzTSyuK5+6IvQxtmfdJi
         394z7WSgkr6fPzsVB+VWQcD97/snYcChI9MF10mal1AOK/3oGXXuD3OiVKvn8J0EMG0Q
         plSgvILisaKj6zNK0EOapB4vJFcIlcH+gjWlRcT/weRUm/WJOk3UE7WNSEbXPwcQmJRV
         XkZqTW6+66wwgy/ZpXctsGegnKm11CnzzUCtd7t91VrgCuf29UOm3zayKbQmAePgyl1x
         5Q52sF6PlWRpUONKf+D8ArMbjHBlvstbMJ7PrRtxPwplZaGn+1jphghWM1Db6hQm6Vl+
         L/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652579; x=1706257379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7G8u3jZmSnI6t8T7vybwiOVPsXxP7J+QmNG1+oPGSI8=;
        b=xTOieWoDyWQmSi2JTRAeD8LtN+hX8QP9/XjiUg5cL8gxPkPBaj/6YdElBZFrQLaMvg
         rabOBLm54vDOBJjtSv5GxKCjdrjvHHNKviZTvTy+cBCXlwMrMliFN/mDnZzOiKB5TT8v
         DnIT3DjVdXWwdPgZaXGJjgNJQ1SayvaZ9Yla3UKwhYE3uarelaJua4kzENYP9Qnq6cnc
         4Xk99DGXOuanEioWM0jrp3UTvymrT0+Leqk28T/D8SqUS49mQDIdWSO6xx7boH3SnFjt
         7EyO5eye8f14XEMK/d6Nieix6tvJGcqUTTyf6bAbLrPynEp2ChgTbU6RXjSASmsAoOZb
         KxjQ==
X-Gm-Message-State: AOJu0Yz0lkQLDLvwrxWS1GGCexsvMYHfdhGCagNfwi3eXwde9WDNY6AW
	jqgO1HxDvwVByUw0QjJdV1aEPi8uuUIq9FPgf8gK5Dxsu5wq6rU+vuOospfviA1S3wtbPBGSjRu
	0LVHRx2oiqbm1HLGgqrae/d3rD+MTPzxby/22
X-Google-Smtp-Source: AGHT+IEtwGqCg6+G8tWJ+B+4jKLxhzzARtXT4xjsqIeERHh1fxV6MbmzUNh4SeVxsqSRMXUDSrDp9LewThDiLbVF3PE=
X-Received: by 2002:a05:600c:3414:b0:40e:88b3:8918 with SMTP id
 y20-20020a05600c341400b0040e88b38918mr1232159wmp.52.1705652578931; Fri, 19
 Jan 2024 00:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
 <20240118183546.418064-1-appsforartists@google.com> <da6f1483-1ae2-40b5-9c1e-684321e12288@endrift.com>
In-Reply-To: <da6f1483-1ae2-40b5-9c1e-684321e12288@endrift.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Fri, 19 Jan 2024 00:22:45 -0800
Message-ID: <CAAL3-=-RRWyCbq_B=Lh7tnG2i3MOLL+2bqPOUS54oTC4+vVk_g@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - add Lenovo Legion Go controllers
To: Vicki Pfau <vi@endrift.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Cameron Gutman <aicommander@gmail.com>, Erica Taylor <rickytaylor26@gmail.com>, 
	Ismael Ferreras Morezuelas <swyterzone@gmail.com>, Jonathan Frederick <doublej472@gmail.com>, 
	Matthias Benkmann <matthias.benkmann@gmail.com>, Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org, 
	Sam Lantinga <slouken@libsdl.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Vicki.  I didn't realize they were meant to be sorted.

Would it be appropriate to add comments explaining the sorting?  The
second stanza, in particular, is sorted by the IDs rather than
lexicographically.  If someone sorted it naively, they'd end up with a
bigger diff than expected.

It looks like a few others have escaped sorting; for instance,
"Microsoft X-Box One Elite 2 pad" appears in the wrong place.

If Dmitry wants to land this and then follow on with a sort + comment
commit (or do that first and then rebase this on top), that would be
great.  I can take a stab too if that's helpful.


On Thu, Jan 18, 2024 at 10:16=E2=80=AFPM Vicki Pfau <vi@endrift.com> wrote:
>
> Hi Brenton,
>
> On 1/18/24 10:35, Brenton Simpson wrote:
> > The Lenovo Legion Go is a handheld gaming system, similar to a Steam De=
ck.
> > It has a gamepad (including rear paddles), 3 gyroscopes, a trackpad,
> > volume buttons, a power button, and 2 LED ring lights.
> >
> > The Legion Go firmware presents these controls as a USB hub with variou=
s
> > devices attached.  In its default state, the gamepad is presented as an
> > Xbox controller connected to this hub.  (By holding a combination of
> > buttons, it can be changed to use the older DirectInput API.)
> >
> > This patch teaches the existing Xbox controller module `xpad` to bind t=
o
> > the controller in the Legion Go, which enables support for the:
> >
> > - directional pad,
> > - analog sticks (including clicks),
> > - X, Y, A, B,
> > - start and select (or menu and capture),
> > - shoulder buttons, and
> > - rumble.
> >
> > The trackpad, touchscreen, volume controls, and power button are alread=
y
> > supported via existing kernel modules.  Two of the face buttons, the
> > gyroscopes, rear paddles, and LEDs are not.
> >
> > After this patch lands, the Legion Go will be mostly functional in Linu=
x,
> > out-of-the-box.  The various components of the USB hub can be synthesiz=
ed
> > into a single logical controller (including the additional buttons) in
> > userspace with [Handheld Daemon](https://github.com/hhd-dev/hhd), which
> > makes the Go fully functional.
> >
> > Signed-off-by: Brenton Simpson <appsforartists@google.com>
> > ---
> >   drivers/input/joystick/xpad.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index f5c21565bb3c..ecfcea8740a0 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -127,6 +127,7 @@ static const struct xpad_device {
> >       u8 mapping;
> >       u8 xtype;
> >   } xpad_device[] =3D {
> > +     { 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYP=
E_XBOX360 },
> >       { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 =
},
> >       { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
> >       { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
>
> Please keep the items in this list sorted.
>
>  > @@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] =3D {
> >
> >   static const struct usb_device_id xpad_table[] =3D {
> >       { USB_INTERFACE_INFO('X', 'B', 0) },    /* Xbox USB-IF not-approv=
ed class */
> > +     XPAD_XBOX360_VENDOR(0x17ef),            /* Lenovo */
> >       XPAD_XBOX360_VENDOR(0x0079),            /* GPD Win 2 controller *=
/
> >       XPAD_XBOX360_VENDOR(0x03eb),            /* Wooting Keyboards (Leg=
acy) */
> >       XPAD_XBOXONE_VENDOR(0x03f0),            /* HP HyperX Xbox One con=
trollers */
>
> Ditto here.
>
> Dmitry will sometimes take patches and fix the sorting after they're
> submitted so you might not to resubmit, but for future reference, this
> list is intended to be sorted.
>
> Vicki

