Return-Path: <linux-input+bounces-14384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D963B3BBA5
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 14:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA2418835E5
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 12:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316B3261B96;
	Fri, 29 Aug 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="neD+MVra"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-107161.simplelogin.co (mail-107161.simplelogin.co [79.135.107.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A513EEDE
	for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756471841; cv=pass; b=FAQRoZtExdiCyH9fQMepArN0CjU0gQPGVNabmUuh0rfIDUEI1i3m88MsjkYif69cRife23NgGLWjah/Dseu+My21P0AIlQaorZ1G7YbvckdDIDamTAcpoEnM8O1XngT6LC68PaT7T6UEYIn9lRROe+kvjTOU7UY7o8aJytdCMoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756471841; c=relaxed/simple;
	bh=RsjxGaAFoZ0RsFFplhir6YFkz69W3zYQG/jgXDx16jA=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=OdlTii7iUi2xPKmNWf8dRqC2Jwlsgt8xSGpIz3epLFsyNt5rZq9QZOxMUJdn5LRGARqerbOHICQp0y7lJkGltF895AQDuE4qmcWcI+cTtUVsH7CoqZMM2cKLaE4lSmGpCiBauh3WqzYguDR/ShS/n/vDzLZbLD6/E72O4jIm8Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=neD+MVra; arc=pass smtp.client-ip=79.135.107.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1756471837;
	cv=none; b=xfY8sCnvyuI6fdxuxhF+EJ1QzUNtR/znKFjVBpotUKlFF/4sUctsPsc8XieUvyLd7I+5eGTajQwlR8JcouaOBKhXnTeLos1tiK04BfX9zocsoCCLGvo0zGYQr4+/nbIc+q0NXgUzpJ8aFSAleKrbx47MoS7rAi6M3TWkrBkxSLVpQjklrZAwOHfgy4ANhwP84vqgk52Eu4h6+yEhIS/bZWH7NNUb+wfS6jkXEO3Yydv3I3D8L/IlpMizJlD0r1Zjzoxmpbq9I//D5BTO2B4XjnJmn09wXqGOmYheFP72Pyx1J0q/6aux+VNi1SojIW/iK+YmM7W2Vq2KmA+aosmHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1756471837; c=relaxed/simple;
	bh=RsjxGaAFoZ0RsFFplhir6YFkz69W3zYQG/jgXDx16jA=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=X8733OpxZqN45af8NrWIRcYsVo8whudOXrkvnQRcPGlLy4tQBjYEqZnNvYWUeP7O0Q4cD0aOqfRuT1wq1M8XhjBEPDtOgwSkvJyppYoXA2I5JW1PscKQtOKSfzjo8p2fKop/g7BvEwO3mKoJG8gTjBoK2wRwCxtVJrNy0K6TDpXGwMo+00C9C4eUqVp8n0u6kNaNuz4H+ocdaAoFdGTWF8Bcl75E1IvhWdFMYDPc9aexIh6SxMm3QDwL37jw3cSViq9c5CBoJySkNWNgF7QyldUsW+80IqZjMJDjCcQWYNBlxZub6tyW2TnQxdsYUxrPISUPyjCZk3DQ/DQiBd5C7g==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1756471837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsjxGaAFoZ0RsFFplhir6YFkz69W3zYQG/jgXDx16jA=;
	b=neD+MVratKjFKK3e6IRKCRUD1gErU/wE5uVX2Xs4QX7fhveazjZUatP8sdiYPbWFMUO6x/
	AtPDq9WY12v8KXQEJ8bYE8tO82xFfdR9bChGcezBllo17F2I1a8yBejuL+mTxQ0LjXqu2Z
	4jeWxm7YmAW9ffjVjOUvXcXZsURIVc0=
Date: Fri, 29 Aug 2025 12:50:31 +0000
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
In-Reply-To: <27863761-d747-459a-af85-18abe207c0ca@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------7a1a13f2bdd02d19b1a0cd1016c8abb2d8fd43fc744af901de6e2679f5db4857";
 charset=utf-8
Content-Transfer-Encoding: 7bit
From: Alerymin <alerdev.ca4x6@simplelogin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: dmitry.torokhov@gmail.com,linux-input@vger.kernel.org
Message-ID: <175647183710.10.7805660721964829096.877719640@simplelogin.com>
References: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
 <dd24398b-0d10-45d4-b93d-4377c017f2e7@leemhuis.info>
 <175646914218.7.12773379431621187280.877650584@simplelogin.com>
 <27863761-d747-459a-af85-18abe207c0ca@leemhuis.info>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 877719643
X-SimpleLogin-Want-Signing: yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------7a1a13f2bdd02d19b1a0cd1016c8abb2d8fd43fc744af901de6e2679f5db4857
Content-Type: multipart/mixed;boundary=---------------------8ae16afa01c4f027e05a259f3e4e1bd7

-----------------------8ae16afa01c4f027e05a259f3e4e1bd7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8






On Friday, August 29th, 2025 at 12:38, Thorsten Leemhuis <regressions@leem=
huis.info> wrote:

> =


> =


> On 29.08.25 14:05, Alerymin wrote:
> =


> > On Friday, August 29th, 2025 at 11:58, Thorsten Leemhuis
> > regressions@leemhuis.info wrote:
> > =


> > > On 29.08.25 13:36, Alerymin wrote:
> > =


> > Well, I read the reporting page a bit too quickly so I CCed the
> > regressions list while I shouldn't have, sorry. I've never seen it
> > work normally, it's not a regression.
> =


> =


> Happens, no worries. But in that case a hint to anyone that might reply
> to this thread: feel free to drop the regressions list and the stable
> list (it's off-topic there, too)
> =


> > On a github issues on kbd-
> > project legionus had a few ideas about it: https://github.com/
> > legionus/kbd/issues/140
> =


> =


> FWIW, some developers do not follow links in cases like this, as they
> get a lot of reports every day and not much time at hand (and walking
> through other tickets often is cumbersome). You chances will thus be
> higher is you summarize the important bits in a case like this; then
> people might follow the link if they really care.
> =


> Good luck! Ciao, Thorsten

From the github issue. The problem may come from `drivers/tty/vt/keyboard.=
c`

Legionus says maybe it misses `slockstate =3D 0` around line 1492 before t=
he return.

To test it I have a keyboard layout using that: https://codeberg.org/Alery=
min/kbd-qwerty-lafayette
Just make sure you change the CtrlL to SCtrlL in the fr-lafayette.map so i=
t registers a Sticky key (I had to keep a working version).
Load it with `loadkeys fr-lafayette.map`.
-----------------------8ae16afa01c4f027e05a259f3e4e1bd7--

--------7a1a13f2bdd02d19b1a0cd1016c8abb2d8fd43fc744af901de6e2679f5db4857
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmixoggJkOLfGQMiQb0dRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmet5+BatvcFab6UBS8AvJ6wt6EdGCuR0TdkXZ1a
v02u0RYhBA/2MWvcJ0ye/0b56OLfGQMiQb0dAADRoAD+MHNJKqjU9X3o/+0U
iKjy/VIU3QT15iYCEb63NNqvTwEA/RDRjajXkqmmp3WDPlZFiNqwLBuhtArZ
4vOr+SKo9KYM
=H1He
-----END PGP SIGNATURE-----


--------7a1a13f2bdd02d19b1a0cd1016c8abb2d8fd43fc744af901de6e2679f5db4857--



