Return-Path: <linux-input+bounces-261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122F7FA32F
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 15:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711A51C20DE1
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A891C1E501;
	Mon, 27 Nov 2023 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="d7iKkuCt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6D3C2
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701096136; x=1701355336;
	bh=wfYjajjY9wslIQCWTKNeP7Xh9Ur1JRbyGZS0/4rZegQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d7iKkuCtCUdl8UpLHyjWKAVdi7Y85TKtL5udywlFJ7TPdUJtBTVbtjmg28oCCzqO9
	 lXR522flj7Q+iDgIKPy2ihzKNw7LWfawTccl+cpc8HuXKqJl8o1QSslSQ+xtJQUa1D
	 2h9MqAsAcYS/4JNcju+LE2KmQjoFTAsbK9ThC7684cm1TgAbTruHkDkY6MBywe9+cy
	 XX/48SjgbEOzXsNy1nlqjQLfIVhOJOs/vNAv8SEivKAgsLeVBexiRfjraCYPJrskeR
	 nlGSdnAndOABJbgKx3eQodbp/4+xWMSLG9PP+WD7rJZlyGqzyJIQuVYn3kyU72Ltt1
	 q5tlr+UUn9JhA==
Date: Mon, 27 Nov 2023 14:41:42 +0000
To: Roderick Colenbrander <thunderbird2k@gmail.com>
From: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "roderick.colenbrander@sony.com" <roderick.colenbrander@sony.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: Wrong inputs on DualSense Edge Wireless Controller
Message-ID: <ivOCP7WJIYExbRiOtMQq1_X5Lrm691_Jzu2MB_EoHi94WQwoWQtn0YUt2Bf20BQ6BSNuIOZBrrJ5rYTzag5mWGlrn2Yfis9TziSb6VfPxbY=@protonmail.com>
In-Reply-To: <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com>
References: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com> <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com>
Feedback-ID: 37836827:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I was testing this in the Steam controller test, Cyberpunk 2077 (through GO=
G, not through Steam), and SuperTuxKart. All of these have wrong mappings f=
or the Edge controller exclusively.
For additional context I have a PS5 controller (non Edge) and it works out =
of the box. This just seems to be an issue with the Edge variant.


On Monday, November 27th, 2023 at 9:37 AM, Roderick Colenbrander <thunderbi=
rd2k@gmail.com> wrote:


>=20
>=20
> Hi Alexander,
>=20
> Sorry for the late reply, but I have been out for a few days. I'm not
> aware of any button/axis mapping change between Edge and regular
> DualSense. The HID reports stayed the same.
>=20
> I just did a quick check on my laptop also on Fedora 38 / kernel 6.5
> and the mapping seems to be fine. In evtest, triangle reports
> BTN_NORTH, square BTN_WEST, etcetera.
>=20
> The sticks, triggers and buttons seem to be fine as well. How are you
> testing this?
>=20
> Thanks,
> Roderick
>=20
> On Wed, Nov 22, 2023 at 4:18=E2=80=AFPM Alexander Koskovich
> AKoskovich@protonmail.com wrote:
>=20
> > [Resending email due to lack HTML message rejected]
> >=20
> > Hello,
> >=20
> > I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am noticing =
that the inputs for this controller are wrong primarily on the right side o=
f the controller.
> >=20
> > playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 Gamepad =
[DualSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
> > playstation 0005:054C:0DF2.000C: Registered DualSense controller hw_ver=
sion=3D0x01000208 fw_version=3D0x01000036
> >=20
> > This is the current mapping that I'm seeing with the hid_playstation mo=
dule loaded:
> > "X" is actually "Square"
> > "Square" is "Triangle"
> > "Triangle" is "Circle"
> > "Circle" is "X"
> >=20
> > Also the right joystick seems to be controlling "R2" instead of the rig=
ht joystick. "L2" and "R2" triggers control the joystick instead. It's over=
all very weird. Has there been any similar reports to this?

