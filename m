Return-Path: <linux-input+bounces-270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C92077FAFC5
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F1A2814D0
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 01:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EFC1FBA;
	Tue, 28 Nov 2023 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="KaVeXtGS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A42319D
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 17:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701136244; x=1701395444;
	bh=AirMyX3dBa1wArg7EpJAWM9h7dJPskZzUKRvAaRcvXA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KaVeXtGSmEJ12A7Y45e5wW96D3wIoRM7jiZGjklNSrZsj/+7Jb8tjcBbfhqbdPcla
	 1IfElE5VOYP/KISoW7lpJdsiLnuknF/FqbHZbwcqVoTv4KBpCWQ2ycToW/jG811K14
	 Si9d7YihNKUNIsduYKiMYBqt9TqSbkSa4bj9x7iNT0nFv6x0ZjIe1kETZ35kGfOB1l
	 Q9xrjwUCRBPUXyr6gP0F7MUB60LoMZmZ1RFKJ2SrMmNgDZrFWsP+yIvIBRvMIZatQ4
	 hXk8kZ4i1MeZcD0jW7iw4tMAhOpHPO/qwwaIAMKfJBAVj4jgWFj/jPeo9VvxecPOj/
	 qqcgJC11jmp1w==
Date: Tue, 28 Nov 2023 01:50:37 +0000
To: Roderick Colenbrander <thunderbird2k@gmail.com>
From: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "Colenbrander, Roelof" <roderick.colenbrander@sony.com>, linux-input <linux-input@vger.kernel.org>
Subject: Re: Wrong inputs on DualSense Edge Wireless Controller
Message-ID: <P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQuqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=@protonmail.com>
In-Reply-To: <CAEc3jaCSUWXPZo=nvYkWhvOuJYT7xmh4QcBajmrs4GWY6u5OVw@mail.gmail.com>
References: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com> <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com> <ivOCP7WJIYExbRiOtMQq1_X5Lrm691_Jzu2MB_EoHi94WQwoWQtn0YUt2Bf20BQ6BSNuIOZBrrJ5rYTzag5mWGlrn2Yfis9TziSb6VfPxbY=@protonmail.com> <CAEc3jaCSUWXPZo=nvYkWhvOuJYT7xmh4QcBajmrs4GWY6u5OVw@mail.gmail.com>
Feedback-ID: 37836827:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I tested in evtest, and it's reporting sane results (cross south, square we=
st, etc). So this seems to be an issue outside of the playstation driver it=
self?


On Monday, November 27th, 2023 at 2:40 PM, Roderick Colenbrander <thunderbi=
rd2k@gmail.com> wrote:


> This seems a little weird to me. Would you be able to test in using evtes=
t? It would rule out some of the other middle layers which can do their own=
 remapping.
> Thanks,
> Roderick
>=20
> On Mon, Nov 27, 2023, 6:42=E2=80=AFAM Alexander Koskovich <AKoskovich@pro=
tonmail.com> wrote:
>=20
> > I was testing this in the Steam controller test, Cyberpunk 2077 (throug=
h GOG, not through Steam), and SuperTuxKart. All of these have wrong mappin=
gs for the Edge controller exclusively.
> > For additional context I have a PS5 controller (non Edge) and it works =
out of the box. This just seems to be an issue with the Edge variant.
> >=20
> >=20
> > On Monday, November 27th, 2023 at 9:37 AM, Roderick Colenbrander <thund=
erbird2k@gmail.com> wrote:
> >=20
> >=20
> > >
> > >
> > > Hi Alexander,
> > >
> > > Sorry for the late reply, but I have been out for a few days. I'm not
> > > aware of any button/axis mapping change between Edge and regular
> > > DualSense. The HID reports stayed the same.
> > >
> > > I just did a quick check on my laptop also on Fedora 38 / kernel 6.5
> > > and the mapping seems to be fine. In evtest, triangle reports
> > > BTN_NORTH, square BTN_WEST, etcetera.
> > >
> > > The sticks, triggers and buttons seem to be fine as well. How are you
> > > testing this?
> > >
> > > Thanks,
> > > Roderick
> > >
> > > On Wed, Nov 22, 2023 at 4:18=E2=80=AFPM Alexander Koskovich
> > > AKoskovich@protonmail.com wrote:
> > >
> > > > [Resending email due to lack HTML message rejected]
> > > >
> > > > Hello,
> > > >
> > > > I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am notic=
ing that the inputs for this controller are wrong primarily on the right si=
de of the controller.
> > > >
> > > > playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 Game=
pad [DualSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
> > > > playstation 0005:054C:0DF2.000C: Registered DualSense controller hw=
_version=3D0x01000208 fw_version=3D0x01000036
> > > >
> > > > This is the current mapping that I'm seeing with the hid_playstatio=
n module loaded:
> > > > "X" is actually "Square"
> > > > "Square" is "Triangle"
> > > > "Triangle" is "Circle"
> > > > "Circle" is "X"
> > > >
> > > > Also the right joystick seems to be controlling "R2" instead of the=
 right joystick. "L2" and "R2" triggers control the joystick instead. It's =
overall very weird. Has there been any similar reports to this?

