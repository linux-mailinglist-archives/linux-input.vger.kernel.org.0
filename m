Return-Path: <linux-input+bounces-14381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B588B3BACF
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 14:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8274D1889475
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 12:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1063128BA;
	Fri, 29 Aug 2025 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="Kqlg2Qa9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16804229B1F
	for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469146; cv=pass; b=dGvD3I4nsqV8+x4JANd8JrSV1+Z1M1fc6Tu3RLPd5ns7zVmuUAAFM3KwxpwPEscMUf0Ee64OMPxiBNCO/cY6Ec9Md+QCqpAMeBS9TmRvhMP1jz2RBCApo/SRnyduXX3tFNIkZ2vbdb7FE+9XgbuCS72J7to1uJLWaCRWRTDq7Lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469146; c=relaxed/simple;
	bh=1Dw5x515k1oVH9BqNcGTpNwb+4zyyUSVuGGMXTDouzM=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=RbvGA64Kbxin2S18kcIVMQyKJsAMbP5VyJ5fTMxoJOOVaKxNFrRxpTfmxjVSDp6uRRrDGor7ihEAsNui8m9gQcul0kp1wK1MLmTiRlZQlaqz0muGMCU02Eg3yh17haqC3lQWNpJkk86e/F2nhbAGpJIB1u73U2EOHwK8ETRGpeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=Kqlg2Qa9; arc=pass smtp.client-ip=176.119.200.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1756469143;
	cv=none; b=Lxa3HJ1fKD9Vv5R2/zz5jOChBMvtY9FwQg2dWQXPoyF2ndbJid8bxiZKh8OaeL5YJ/xb6CXrsnpMJ/DJUL6raJgUiGAWzkjt9rGTk/xp1T0icR96bfFBfAnVBcfWoz3qd7eKDra7XoKAbxt1SrzmXg7MNjmJBCv2HbfcDXOn3EXZmSelFFbF2RHfmFYxYuc2QXyUNoJMijY2dI3QL9HQmhPGVCxhmFXQ6x5V8QqnbHOg0iQnvP4vQ+962u9baSd16W7Ov9s3kbBo5bvjzFWJOBhQ9oQ+XHT7XDFTq3xmMG/BNaeWaCod1wNUFeZviuROVk44K2ZP1P59N+wMFFEUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1756469143; c=relaxed/simple;
	bh=1Dw5x515k1oVH9BqNcGTpNwb+4zyyUSVuGGMXTDouzM=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=pEVlxbAtS9Vbletdc1fv6oVl6Vd4HQggpW70WA8ZRk9b6iFrdXqnQs47gEi07BsDPmpEHeJXazyA44MP01x1EPATeKP3btJB6ENQ9inZB10S8C01MT5U/y4h4ZRNXtth7A9vO7q+42lrckVBjP36B+KVf0dveQlqzWlHM5zaRhKjMUwc5kJRBMr4ghOX2VmdHx0iPW/nU5J8Ud0FRaR/jGFRUFbTutGOay1e/Nk5aHpaDr4hT54dH/otyfqMYvHAYPiVuucXk5YTDLUIW8VKdK81uSfU/iVZ4XvmPpV35lUySmNH04Txa1EzF5dfcxvZq2aUraY7cXiErF2ftaQfhA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1756469143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Dw5x515k1oVH9BqNcGTpNwb+4zyyUSVuGGMXTDouzM=;
	b=Kqlg2Qa9YtQnT1y1Vjj8XZmP6C3IE4HaBZyIzwybLQ8zKZ0jtxMkGL8Wks5owsXiv/T2Gt
	emXSICZM1KLKsLaE51OgNwH5y7P9jQsah1lKD9oEOsL+Vdgn3oIPPv1V0QnnIw6sonMuMF
	YvWMHTmMru2VrIg4ND+7eGq6oeaptgI=
Date: Fri, 29 Aug 2025 12:05:35 +0000
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
In-Reply-To: <dd24398b-0d10-45d4-b93d-4377c017f2e7@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------326cbb273a8d78d4aaa4055f0a74bf3c3f68f7b0719268fa9401287ae3e1d532";
 charset=utf-8
Content-Transfer-Encoding: 7bit
From: Alerymin <alerdev.ca4x6@simplelogin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: 
 stable@vger.kernel.org,regressions@lists.linux.dev,dmitry.torokhov@gmail.com,linux-input@vger.kernel.org
Message-ID: <175646914218.7.12773379431621187280.877650584@simplelogin.com>
References: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
 <dd24398b-0d10-45d4-b93d-4377c017f2e7@leemhuis.info>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 877650611
X-SimpleLogin-Want-Signing: yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------326cbb273a8d78d4aaa4055f0a74bf3c3f68f7b0719268fa9401287ae3e1d532
Content-Type: multipart/mixed;boundary=---------------------23538ff184b6cf3495a8deda7527d8b3

-----------------------23538ff184b6cf3495a8deda7527d8b3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8






On Friday, August 29th, 2025 at 11:58, Thorsten Leemhuis <regressions@leem=
huis.info> wrote:

> =


> =


> Lo!
> =


> On 29.08.25 13:36, Alerymin wrote:
> =


> > Note:
> > The issue looks like it's from tty directly but I don't see who is the=
 maintainer, so I email the closest I can get
> > =


> > Description:
> > In command line, sticky keys reset only when typing ASCII and ISO-8859=
-1 characters.
> > Tested with the QWERTY Lafayette layout: https://codeberg.org/Alerymin=
/kbd-qwerty-lafayette
> > =


> > Observed Behaviour:
> > When the layout is loaded in ISO-8859-15, most characters typed don't =
reset the sticky key, unless it's basic ASCII characters or Unicode
> > When the layout is loaded in ISO-8859-1, the sticky key works fine.
> > =


> > Expected behaviour:
> > Sticky key working in ISO-8859-1 and ISO-8859-15
> > =


> > System used:
> > Arch Linux, kernel 6.16.3-arch1-1
> =


> =


> Thx for the report. You CCed the regressions list, so please allow me to
> ask: what's the last version where this worked? And FWIW in case nobody
> comes around with an idea what might cause this any time soon: could you
> bisect[1] what's causing the problem? Ciao, Thorsten
> =


> [1]
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.h=
tml

Well, I read the reporting page a bit too quickly so I CCed the regression=
s list while I shouldn't have, sorry. I've never seen it work normally, it=
's not a regression.
On a github issues on kbd-project legionus had a few ideas about it: https=
://github.com/legionus/kbd/issues/140
-----------------------23538ff184b6cf3495a8deda7527d8b3--

--------326cbb273a8d78d4aaa4055f0a74bf3c3f68f7b0719268fa9401287ae3e1d532
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0Fgmixl4AJkOLfGQMiQb0dRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdMddwb+wEhf+7rTS9ZFXPu/DM3V9e9wE5amjsc
adNdmRYhBA/2MWvcJ0ye/0b56OLfGQMiQb0dAAChkQEA2qa9K5hPM+Ll3vlU
dYLOWi9/UolvdBpFvFhYz6+YNEUA+wYoy1xVolKQKDY9RJxE/ZNkoG/UUn4K
0UF1Cqeu5lUC
=MpVa
-----END PGP SIGNATURE-----


--------326cbb273a8d78d4aaa4055f0a74bf3c3f68f7b0719268fa9401287ae3e1d532--



