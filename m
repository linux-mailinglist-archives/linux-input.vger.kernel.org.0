Return-Path: <linux-input+bounces-14889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA8B882C2
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4025265D8
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3902D7DF0;
	Fri, 19 Sep 2025 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="DQ0s/RSc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail0.khirnov.net (red.khirnov.net [176.97.15.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7782D2381;
	Fri, 19 Sep 2025 07:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.97.15.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267163; cv=none; b=qyRTO1LwY1t6uaAPxe1X4PlBNfevcUapzCICBFRkTXfr26oYK3iHWYpBGIGybpa262rBpbh9XQFt5SsqROj3mGE8b7iZ+DXdbtnOx3bcnNMYMv/yX/JY138DAxGh/14MZCj3FLpXlC9IoyQyMrASITtet9/5K0czMCDtGvoqfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267163; c=relaxed/simple;
	bh=7kKBDdra4SQwhLuuuWbqpMtlj/F7FDSZGSMO1U+Gqk0=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:MIME-Version; b=ilBYVIJX/lBpztc56wwLIXfDVGoiL8DUvnPNnhvCwGlQYr2iTrQLkyzdOPi0uQnUmk6Lp9f+fsKROqlIa3lfVO64+aMksSiMhMXG7ovf9z4ht7samxo3c0Dj90hZ0UbG/puVbs5sGvMc02EYw8eB+HmoMA2H0UNEjSEyITpwhCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=DQ0s/RSc; arc=none smtp.client-ip=176.97.15.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail0.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=DQ0s/RSc;
	dkim-atps=neutral
Received: from localhost (localhost [IPv6:::1])
	by mail0.khirnov.net (Postfix) with ESMTP id 6C65C245F51;
	Fri, 19 Sep 2025 09:32:37 +0200 (CEST)
Received: from mail0.khirnov.net ([IPv6:::1])
 by localhost (mail0.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id 1FMtlWRBHSjV; Fri, 19 Sep 2025 09:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1758267156; bh=7kKBDdra4SQwhLuuuWbqpMtlj/F7FDSZGSMO1U+Gqk0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=DQ0s/RScALqPnuyj1OdUG+EN4KkIzi7DXf24X5fyk8wR1jaN//rx030/8hRiD8eFX
	 tn6Rl9qwVGNwKzWV70lZ58NNQzzFDGtM5wpqi7n4Xtvi9DLHz6FfKJcbX9LlJ3rzWT
	 eQqylGQDJ878LDVfVeGjL/pPY8RSTvJ37Fy0Lm6WuvWdrFzcnSzy+Y94QY7E2NlBjO
	 erJFWkBGJ1K7atTnog67j5KbiCoFBXNfvI5H3uxVt5uvKyf1951gzjvvXOidHXekYp
	 8mzuebPkJIsGR2JlAyxY7LtTbnhL7NQpnua6JhiAb84CB8t2LoRMryhf78DjIvjzR3
	 0D0QNn4J7cjMg==
Received: from lain.khirnov.net (lain.khirnov.net [IPv6:2001:67c:1138:4306::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lain.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail0.khirnov.net (Postfix) with ESMTPS id EDFB0245938;
	Fri, 19 Sep 2025 09:32:36 +0200 (CEST)
Received: by lain.khirnov.net (Postfix, from userid 1000)
	id D083F1601BA; Fri, 19 Sep 2025 09:32:36 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject:  Re: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
From:  Anton Khirnov <anton@khirnov.net>
To:  "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc:  Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
In-Reply-To:  <c49cf225-c508-4e23-8786-5110a166d7c4@kernel.org>
References:  <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-2-anton@khirnov.net>
 <u3qzdpgoe2appwnmv2rkcmyg6htrmltna3geymp7llootdwbts@ycmhljii34bz>
 <c49cf225-c508-4e23-8786-5110a166d7c4@kernel.org>
Date: Fri, 19 Sep 2025 09:32:36 +0200
Message-ID: <175826715682.18450.2507719983975659600@lain.khirnov.net>
User-Agent: alot/0.8.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mario,
Quoting Mario Limonciello (AMD) (kernel.org) (2025-09-19 07:36:31)
> On 9/19/2025 12:12 AM, Dmitry Torokhov wrote:
> > Hi Anton,
> >=20
> > On Mon, Jul 14, 2025 at 05:07:57PM +0200, Anton Khirnov wrote:
> >> The Asus ExpertBook B9 laptop sends a WMI event when Fn+space is
> >> pressed. Since I could not find any information on what this combination
> >> is intended to do on this or any other Asus laptop, allocate a
> >> KEY_FN_SPACE keycode for it.
> >>
> >> Signed-off-by: Anton Khirnov <anton@khirnov.net>
> >> ---
> >>   include/uapi/linux/input-event-codes.h | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux=
/input-event-codes.h
> >> index 3b2524e4b667..a49b0782fd8a 100644
> >> --- a/include/uapi/linux/input-event-codes.h
> >> +++ b/include/uapi/linux/input-event-codes.h
> >> @@ -548,6 +548,7 @@
> >>   #define KEY_FN_S		0x1e3
> >>   #define KEY_FN_B		0x1e4
> >>   #define KEY_FN_RIGHT_SHIFT	0x1e5
> >> +#define KEY_FN_SPACE		0x1e6
> >=20
> > I'd rather we did not add more codes with no defined meaning. I regret
> > that we have KEY_FN_* (with the exception of KEY_FN itself). Since
> > nobody knows what this key is supposed to do maybe map it to
> > KEY_RESERVED and whoever wants to use it can map it to a concrete key
> > code via udev?
> >=20
> > Thanks.
> >=20
>=20
> Any chance you can look at Windows and see what the key actually does=20
> when you have the matching OEM software installed?

Unfortunately I removed Windows from this machine right after buying it,
and reinstalling it would be too invasive. I did ask someone to test on
a different Asus laptop running Windows, the key did not seem to do
anything.

> I've seen a bunch of laptops that FN+SPACE turns on/off keyboard=20
> backlight.  Maybe that's what it does.

Fn+F7 toggles keyboard backlight on this laptop, so probably not. I'm
willing to believe it's a leftover from older hardware where it did do
something and they just forgot to disable it.

Cheers,
--=20
Anton Khirnov

