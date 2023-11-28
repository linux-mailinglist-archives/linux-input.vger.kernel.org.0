Return-Path: <linux-input+bounces-275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3B7FB017
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0768D1F20F4D
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C5610A13;
	Tue, 28 Nov 2023 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2p6uxcY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BA31A3
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:31:00 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so2430112a12.0
        for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701138658; x=1701743458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeKS8HGlgFSHjaenelbTo8BY2nzZxjOk81XgVWef4pQ=;
        b=D2p6uxcY1rrfzTmk/5HJM1SknVWKSfak0wfyrravmHsaa77zTFCF36/vzX6JZEfj0X
         DxoDtV0BygCm0vFortY+iM0AR5MtesVNmoyRMA1Kn5hiGmBqBgeslZbuILLLzt9oTFsA
         tj3WmKs4GHytEsqhObFpjvBbDIkWyQNGBEDZcFcG3AJGYiTqqvCgn21uKTw/3WbHyatA
         vcIBhGt10y6u8fvny7Ygy18CGLYMy5aWaEUSbayXm4Y7JrGi8qGaRHyvGhdj4snhqhhS
         rHmPiVWAgaBTo/dpcB4SuchrEyM3IZdSRfRlsPOmD7mFOd8TlMFn7phypa0/y9qYKXKn
         jE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701138658; x=1701743458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeKS8HGlgFSHjaenelbTo8BY2nzZxjOk81XgVWef4pQ=;
        b=LRgxLy9z6Z7nzIBHSstPyK3xBUJrX1Z5theVS+emzUewGEvsD/kTfwPdesxcbxpO21
         44PssCLQ4/HK2p4oXF0qKNWN4CHz+twmMNS9MaxKy4vkq18zqfSfbCcQAyF76EOOLVzh
         ZoM5IqRKbpNz4j5zE6Dp64vliwV1q4Ok3ZZdjurtdKh1cVCT6kLH6VMbcwm8VC4KK6Co
         mviTsSm16o/imiQ2rCEfzQi6ZC6Fl/Tvryre9xNAt8RPeybg/r3o676psyzlXfid2bU5
         FZvwSs2orHYklhn3woq8pqrlcN9t8/n4RYA5F+E2/whO1VDlVp1mFFpS8QN9c3TVoBg5
         djIQ==
X-Gm-Message-State: AOJu0Yyl7DDIfz9oY4siPsztnuLnGL7ZLXxP8c8clCc8tUnl6vXRyMfI
	UvnCZ6Z/q9xVcKHCtNRw/929zJKyJ5VHAT0A6ZtVjGDt+Rk=
X-Google-Smtp-Source: AGHT+IEfI+Yo3N+bpyUwwwgLPqoRgAaxOLY+hkabU3UgK0mFfBonoGzYABYMjDvodFcKLyj3mBz9mHue8s32MXqzG+A=
X-Received: by 2002:a17:907:9007:b0:a03:a2fa:4aab with SMTP id
 ay7-20020a170907900700b00a03a2fa4aabmr7317075ejc.30.1701138658263; Mon, 27
 Nov 2023 18:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com>
 <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com>
 <ivOCP7WJIYExbRiOtMQq1_X5Lrm691_Jzu2MB_EoHi94WQwoWQtn0YUt2Bf20BQ6BSNuIOZBrrJ5rYTzag5mWGlrn2Yfis9TziSb6VfPxbY=@protonmail.com>
 <CAEc3jaCSUWXPZo=nvYkWhvOuJYT7xmh4QcBajmrs4GWY6u5OVw@mail.gmail.com>
 <P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQuqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=@protonmail.com>
 <CAEc3jaCrpbBADiAgSy-kTXqOj_XLy8QuV88GxqY38=2BvG0QZw@mail.gmail.com>
In-Reply-To: <CAEc3jaCrpbBADiAgSy-kTXqOj_XLy8QuV88GxqY38=2BvG0QZw@mail.gmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 27 Nov 2023 18:30:46 -0800
Message-ID: <CAEc3jaCj46RUCD=tL3Gk3ahu487r1+kya=OqzJRFAW+2kp_aiw@mail.gmail.com>
Subject: Re: Wrong inputs on DualSense Edge Wireless Controller
To: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "Colenbrander, Roelof" <roderick.colenbrander@sony.com>, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Many applications use SDL2 and don't use evdev directly. Latest SDL2
from git doesn't have the mappings for dualsense edge, but only
regular dualsense. Though usually on SDL2 it would use hidraw.
Depending on what version of the library was used, it may not support
the controller.

See e.g. https://github.com/libsdl-org/SDL/blob/8d47e3bb82288321eb15a0708d1=
311cbd25a11d6/src/joystick/SDL_gamecontrollerdb.h#L765

On Mon, Nov 27, 2023 at 6:25=E2=80=AFPM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Alexander,
>
> Thanks for testing. This indeed confirms the kernel side mapping
> (hid-playstation) is right. Different software layers e.g. SDL2 and
> others tend to do their own mappings. This type of mapping seems to be
> incorrect (or even missing for DualSense Edge resulting in a default
> fallback).
>
> Thanks,
> Roderick
>
> On Mon, Nov 27, 2023 at 5:50=E2=80=AFPM Alexander Koskovich
> <AKoskovich@protonmail.com> wrote:
> >
> > I tested in evtest, and it's reporting sane results (cross south, squar=
e west, etc). So this seems to be an issue outside of the playstation drive=
r itself?
> >
> >
> > On Monday, November 27th, 2023 at 2:40 PM, Roderick Colenbrander <thund=
erbird2k@gmail.com> wrote:
> >
> >
> > > This seems a little weird to me. Would you be able to test in using e=
vtest? It would rule out some of the other middle layers which can do their=
 own remapping.
> > > Thanks,
> > > Roderick
> > >
> > > On Mon, Nov 27, 2023, 6:42=E2=80=AFAM Alexander Koskovich <AKoskovich=
@protonmail.com> wrote:
> > >
> > > > I was testing this in the Steam controller test, Cyberpunk 2077 (th=
rough GOG, not through Steam), and SuperTuxKart. All of these have wrong ma=
ppings for the Edge controller exclusively.
> > > > For additional context I have a PS5 controller (non Edge) and it wo=
rks out of the box. This just seems to be an issue with the Edge variant.
> > > >
> > > >
> > > > On Monday, November 27th, 2023 at 9:37 AM, Roderick Colenbrander <t=
hunderbird2k@gmail.com> wrote:
> > > >
> > > >
> > > > >
> > > > >
> > > > > Hi Alexander,
> > > > >
> > > > > Sorry for the late reply, but I have been out for a few days. I'm=
 not
> > > > > aware of any button/axis mapping change between Edge and regular
> > > > > DualSense. The HID reports stayed the same.
> > > > >
> > > > > I just did a quick check on my laptop also on Fedora 38 / kernel =
6.5
> > > > > and the mapping seems to be fine. In evtest, triangle reports
> > > > > BTN_NORTH, square BTN_WEST, etcetera.
> > > > >
> > > > > The sticks, triggers and buttons seem to be fine as well. How are=
 you
> > > > > testing this?
> > > > >
> > > > > Thanks,
> > > > > Roderick
> > > > >
> > > > > On Wed, Nov 22, 2023 at 4:18=E2=80=AFPM Alexander Koskovich
> > > > > AKoskovich@protonmail.com wrote:
> > > > >
> > > > > > [Resending email due to lack HTML message rejected]
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am n=
oticing that the inputs for this controller are wrong primarily on the righ=
t side of the controller.
> > > > > >
> > > > > > playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 =
Gamepad [DualSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
> > > > > > playstation 0005:054C:0DF2.000C: Registered DualSense controlle=
r hw_version=3D0x01000208 fw_version=3D0x01000036
> > > > > >
> > > > > > This is the current mapping that I'm seeing with the hid_playst=
ation module loaded:
> > > > > > "X" is actually "Square"
> > > > > > "Square" is "Triangle"
> > > > > > "Triangle" is "Circle"
> > > > > > "Circle" is "X"
> > > > > >
> > > > > > Also the right joystick seems to be controlling "R2" instead of=
 the right joystick. "L2" and "R2" triggers control the joystick instead. I=
t's overall very weird. Has there been any similar reports to this?

