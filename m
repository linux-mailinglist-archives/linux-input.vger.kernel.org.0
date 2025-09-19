Return-Path: <linux-input+bounces-14890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7FB882EC
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C628F468259
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5662EB851;
	Fri, 19 Sep 2025 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="KFw2AhVf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail0.khirnov.net (red.khirnov.net [176.97.15.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A72E040A;
	Fri, 19 Sep 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.97.15.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267184; cv=none; b=tTn829BMxwPvmTUARh7rQ9upIigk1f+LeSlti/dliccJ+G76PITSkPKxLT6IN9ZLL6SFJ5eDoDcOWV31osMRrt0lhf8JiwnHiCoQ4OGIK0WL3toU1xfG2ZzpULFOz7dCkE1Pg8F5A4vHkPzbCLg6+FvBAwiPByPT4AvRfJTo8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267184; c=relaxed/simple;
	bh=KiOt8ViSetF92dGbwwJJbXNBeCN9qgGrUeYjqjUWq84=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:MIME-Version; b=r5kBWtMtfyjLf6qrw9Wo+gqBvJvEVAafvM/cz8+v8vvBANvdYq1C06OFIJr9HXs7GJo7eXJPRL6btkHcSw+08cHRB6u2Z9zrIwkb0S6bDral7kiBOJXXRm31a36Qeul67Z4zJePSWRb0rx3wMjP7gJOQzpTEsgM4iyth9xtXhZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=KFw2AhVf; arc=none smtp.client-ip=176.97.15.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail0.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=KFw2AhVf;
	dkim-atps=neutral
Received: from localhost (localhost [IPv6:::1])
	by mail0.khirnov.net (Postfix) with ESMTP id D4A6F245F5C;
	Fri, 19 Sep 2025 09:23:55 +0200 (CEST)
Received: from mail0.khirnov.net ([IPv6:::1])
 by localhost (mail0.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id H9t21pwlKzaw; Fri, 19 Sep 2025 09:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1758266635; bh=KiOt8ViSetF92dGbwwJJbXNBeCN9qgGrUeYjqjUWq84=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=KFw2AhVfxRfL3h3d4/47fe/skYYyncitBk2ObWWwSAfbJgIPg7UMBCUGSWtKoo6jZ
	 YsDsn03iSY0tT9380LHIoK98yTcGAgtXeC0TL5QxZA5C9Q79hDLHO5qIr5Mbv8GqEN
	 0yZNpP+tN0wT/6R4RoTLpWr8X05Kp9t8IPh+IutIWVmCkKwrWB8dbNl0sndeRvpD8Q
	 oVavc+qOvhCQJjssm0nHF+J4bNoXr3MVHqZkGTRbYB6H3P6HM5IY3BQt3YrMNX1n/0
	 uQfXtL91W3unYfw9iXOdMTdK7fVKr/jmOkWz5y2MabBNlwB3GN98dFxK8ypau8eW77
	 r9nwI7OZGBiXw==
Received: from lain.khirnov.net (lain.khirnov.net [IPv6:2001:67c:1138:4306::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lain.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail0.khirnov.net (Postfix) with ESMTPS id DFA05245F57;
	Fri, 19 Sep 2025 09:23:54 +0200 (CEST)
Received: by lain.khirnov.net (Postfix, from userid 1000)
	id C25F51601BA; Fri, 19 Sep 2025 09:23:54 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject:  Re: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
From:  Anton Khirnov <anton@khirnov.net>
To:  Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:  Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
In-Reply-To:
  <u3qzdpgoe2appwnmv2rkcmyg6htrmltna3geymp7llootdwbts@ycmhljii34bz>
References:  <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-2-anton@khirnov.net>
 <u3qzdpgoe2appwnmv2rkcmyg6htrmltna3geymp7llootdwbts@ycmhljii34bz>
Date: Fri, 19 Sep 2025 09:23:54 +0200
Message-ID: <175826663475.18450.7037268164142228744@lain.khirnov.net>
User-Agent: alot/0.8.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dmitry,
Quoting Dmitry Torokhov (2025-09-19 07:12:38)
> Hi Anton,
>=20
> On Mon, Jul 14, 2025 at 05:07:57PM +0200, Anton Khirnov wrote:
> > The Asus ExpertBook B9 laptop sends a WMI event when Fn+space is
> > pressed. Since I could not find any information on what this combination
> > is intended to do on this or any other Asus laptop, allocate a
> > KEY_FN_SPACE keycode for it.
> >=20
> > Signed-off-by: Anton Khirnov <anton@khirnov.net>
> > ---
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/=
input-event-codes.h
> > index 3b2524e4b667..a49b0782fd8a 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -548,6 +548,7 @@
> >  #define KEY_FN_S		0x1e3
> >  #define KEY_FN_B		0x1e4
> >  #define KEY_FN_RIGHT_SHIFT	0x1e5
> > +#define KEY_FN_SPACE		0x1e6
>=20
> I'd rather we did not add more codes with no defined meaning. I regret
> that we have KEY_FN_* (with the exception of KEY_FN itself). Since
> nobody knows what this key is supposed to do maybe map it to
> KEY_RESERVED and whoever wants to use it can map it to a concrete key
> code via udev?

The problem with that approach is that on this laptop we have TWO keys
with unknown meanings - fn+space and fn+f (KEY_FN_F already exists).
Using KEY_RESERVED for one of them would be inconsistent then.

Could you elaborate on why are you against KEY_FN_* codes? I understand
they can be abused, but in some cases (such as this one) it genuinely
seems the least bad way to characterize a key.

Cheers,
--=20
Anton Khirnov

