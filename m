Return-Path: <linux-input+bounces-226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17F7F68D4
	for <lists+linux-input@lfdr.de>; Thu, 23 Nov 2023 23:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22F0281869
	for <lists+linux-input@lfdr.de>; Thu, 23 Nov 2023 22:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B273E461;
	Thu, 23 Nov 2023 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Mctgan7g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2AA10C9
	for <linux-input@vger.kernel.org>; Thu, 23 Nov 2023 14:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1700777546; x=1701036746;
	bh=B0nDUCCc/9uAjOJNodziQT/GZceyc0SBQRRLgxTUQNA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Mctgan7gGzEAOcJ8zOaWABlAzkJTBr8DVYCzOCRktmanjkuT7EG1WXo9V6lvAGAcH
	 Uok0mzUwR56aVFBu2rdu2Gx09z+0PzMsRrrssmDiYiIwyMijEmxpvQQ6PJADRl3+zj
	 M2DB7Oh9NTy4DvuL4VbsZd598pR+NmBeoiY45QeXnKcfkX4c3b7x8BNJYU6ajAKtdz
	 bU7Gjh/E0303HazIJ7kBGNNy2McPUkKxxkP1lYffQsS2EL727gdJrSDM9PJQq1I++1
	 ed97fDxrZ6totSRyN+qeoCpeBNDIUmhe/xdQSKNM0obwpn6sy9OxJ8wwmHimL4dYCB
	 FAyDWMmmVP8/g==
Date: Thu, 23 Nov 2023 22:12:22 +0000
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
From: David Revoy <davidrevoy@protonmail.com>
Cc: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, jason.gerecke@wacom.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
Message-ID: <evHI05gyKuWwynY1WdyVvXqKPUaPE8W34cc3tFfp9FWh94TWfA9FWfHun7AAscF9lqfbiYsLKGC7kTSZ9xWNZg88-PTpbGTLcFMc9D3P2HE=@protonmail.com>
In-Reply-To: <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com>
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm> <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com> <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com> <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com> <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com> <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com> <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com> <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com> <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com>
Feedback-ID: 5460171:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

Sorry for late reply.

> So it would be nice if you could try the artifacts of job 51600738[4].
> Again, download them (udev-hid-bpf_0.1.0-4-g5ab02ec.tar.xz), unpack,
> sudo ./install --verbose, then unplug/replug the artist Pro 24.

Ok, the main change I experienced after installing is xsetwacom=20
listing the ID name of the device with twice the name Stylus on=20
"UGTABLET 24 inch PenDisplay Stylus stylus". Before it was only=20
"UGTABLET 24 inch PenDisplay stylus".

$ xsetwacom --list
UGTABLET 24 inch PenDisplay Stylus stylus       id: 10  type: STYLUS=20

Not a big deal, but I thought it was worth to mention it.

> Then, I'll need the following sequence (ideally repeated twice or
> three times, given that your last record show a slight difference in
> the first and second attempt):
>=20
> - outside of the proximity of the sensor, press the upper button
> - approach the stylus to the surface keeping the upper button pressed
> - touch the surface with the tip while holding the upper button pressed
> - release the upper button while keeping the tip pressed (like previously=
)
> - press once again the upper button while keeping the tip touching the
> surface (like previously)
> - lift of the pen, keeping the upper button pressed, and still in
> range of the sensor
> - remove the pen from the proximity of the sensor entirely (move away
> 20 cm or so), while still keeping the upper button pressed
>=20
> It's actually longer to describe than to execute :)
>=20

Thank you for the detailed steps. True, it makes sens once=20
practising it. I made the gesture three time on:=20

https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Artist-2=
4-Pro/2023-11-23_XPPEN-Artist-24-Pro_pen_tip-contact-and-press-release-uppe=
r-stylus-button-while-pressed-x3.txt

> But I would also totally understand that you had enough debugging and
> you would rather focus on using the tablets, instead of debugging
> them. In which case, someone else from the community might help me.

No problem for continue testing, I'm around! Thank you again=20
for improving the behavior of the tablets.

Cheers,
David

