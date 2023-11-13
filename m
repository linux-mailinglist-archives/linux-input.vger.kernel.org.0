Return-Path: <linux-input+bounces-44-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5277EA5B6
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 23:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099D31C2088C
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 22:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C07D2D622;
	Mon, 13 Nov 2023 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="s/MJK+6z"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A92D627
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 22:08:36 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F05110C
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 14:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1699913308; x=1700172508;
	bh=Cgx6Jlyi/PqfWlF1PLRvcbzm0SmQSL/fmBdfVpYYr8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=s/MJK+6zQSB9dDZMJJoPt8ViBmm/2VBPiDbsaPRBftmQ9rq63Vu1qAfF5+ay4R1bv
	 dj0tqSg4LYq26TeKQuKrsOhuLj58T3Rrwy6V1/cpMBl0R2J1dD9IRQN9ZdvEGNR1ij
	 buiBABuLad6Pz1vatHEhDYhdxcabwHzOG17bhiWkKPaNH5BW09Rn+l5YcjOimBKZbM
	 OLd6wMSvhKgieD4jT/ix9+zeiObMWJ2biV0kecdLfcZQpFfFWMpHqSIC2W3xb5EIin
	 X5LqHaOETBUfpvCnGXUdNxlDXxW6Vw58yZgq/T3lJqOJFM9dalwuTcKKtF+bW0yFJo
	 a+X8L6mZ+MmRQ==
Date: Mon, 13 Nov 2023 22:08:03 +0000
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
From: David Revoy <davidrevoy@protonmail.com>
Cc: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, jason.gerecke@wacom.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
Message-ID: <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
In-Reply-To: <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com>
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm> <ZUtTpKyP0oxWhnn8@fedora> <CAO-hwJLjtjdr2gtrOWJFPZ-38YzKB8XfhDKWf_2jUPeiaP3EcA@mail.gmail.com> <CAO-hwJKNcwcDGEh33NZq4kSYtoxZzg9M2nzE_hVDYNFgA4g_dg@mail.gmail.com> <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com> <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com> <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com> <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com> <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com>
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

> Here is a little bit of history of why you were encountering this bug [..=
.]

Many thanks for all the details you wrote about the bug, I found=20
your email so interesting that I couldn't resist to copy/paste it=20
on my blog[1]. =20

> And that's exactly what happened in your case David. Which is why I'm
> so happy (also because I fixed the tools from an author I like and
> already had the books at home :-P):

Please send me an email in private with your adress; I'll be happy to
send you an original drawing. That will be my way to thank you :-)=20

> Could you please once again attach the hid-recorder of the Pro 24
> while doing the following sequence:
> - touch with the tip of the stylus the tablet
> - while touching, press the upper button (the problematic one)
> - still while touching, release the button
> - remove the stylus

Sure, you'll find the action (repeated three times) recorded here [2]

> you could also give a test of the artifacts of job 51469284[3].
>=20
> The points to check are:
> - if you right click while touching the surface, do you still get only
> a right click or some weird glitches in addition to it?
> - if you right click while not touching (hovering), no glitches?

I tested. It's a bit hard to tell if it causes glitches or if the
behavior is normal or not. I'm not using the right-click this way.
I always use it in "hover mode". With artifact or without, the=20
behavior is while the tip is pressed, the right-click quickly=20
'disapear' but it is probably normal because I test on contextual
menu and clicking somewhere else makes this type of menu disapear.

I hope this will help,
Cheers,

David

[1] https://www.davidrevoy.com/article1002/how-a-kernel-developer-made-my-s=
tyluses-work-again =20
[2] https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Arti=
st-24-Pro/XPPEN-Artist-24-Pro_pen_tip-contact-and-action-press-release-uppe=
r-stylus-button-x3.txt  

