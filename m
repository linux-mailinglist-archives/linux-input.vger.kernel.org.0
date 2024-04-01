Return-Path: <linux-input+bounces-2741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0989380A
	for <lists+linux-input@lfdr.de>; Mon,  1 Apr 2024 07:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AD41F21416
	for <lists+linux-input@lfdr.de>; Mon,  1 Apr 2024 05:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B178F44;
	Mon,  1 Apr 2024 05:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="uUz/DXLi"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic309-21.consmr.mail.sg3.yahoo.com (sonic309-21.consmr.mail.sg3.yahoo.com [106.10.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0308F5D
	for <linux-input@vger.kernel.org>; Mon,  1 Apr 2024 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711947983; cv=none; b=HHt1M1QnUEZMPttxwLryEqThrlo//gzOH0qvr+TDbLKLiVCqhuEM8V2vCUjSYea848sCl9iVYyIZ+K/iiZ/ucd2dB68oXsmkf18K7LCBT3vtROuiahUrit8DyhMpEjv/KG1dfLn+CXrgY6D+qkJrr/W8xvR34law/rBmyDurgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711947983; c=relaxed/simple;
	bh=WQq99XX+lAKeMAGk9luTxBZFxB9CJPAtrttzG+V3S5Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Wjpmq7N1TyNNN5+K6wRXD8NGbqe68yutOGyBcCI8Ct4izBr4To7pJwXcqebQcgweRPFtQuPXl0F5FR/xGnHzdMwJHTu49rJuKKacujx7YlKCUi36w+gsiC1h6e8g0EAYHTrTUirGZFOO89YUzQiFD9hKqK2rZRkZds+zwgI/gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=uUz/DXLi; arc=none smtp.client-ip=106.10.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1711947972; bh=WQq99XX+lAKeMAGk9luTxBZFxB9CJPAtrttzG+V3S5Q=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=uUz/DXLiFreY5Y03ImFHVGJI4OB7ErTjySoWOtmqfqGYMaNbBljzLjEo7q8wgMbw+BRUiI/eWFdOjbXQ25HCwaFcjVAAivM+GFgTCX5qoSfWQGwGQzIArR2jJg8FlzS3ZLde4aMFjyHQnDLaCb+vlF40lam8iYBcXil+Rv97BVNMKDDzTyCOctC9u8CKiLQDcpVpR44LLzeDwYxCRoZH0nMYoXHS73heYNxg4m//dJ8Oytp21LwCpp+Iq9pa2ZIixjXc33U5TijXvGZstijFpSnLWxXD7sO9UeeHIRmQKmcsB7jbyIlQc9o/i+GN13Gkq2BXHfEg1dAPMXdYaDy89g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1711947972; bh=qNbyFvbIQtk1JVTOgsBk1B0mKcxbp4I/CdWieqlZNnj=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Ybod292nUQx/J7laGEBlKCgjgwIviRHydyGIaG6DJe8uKEIZEMHkcqjvzpBFUm58y5Bj/xh4bHvyJ/uJHQ39GmAKCE8WK2H0cywLrnwM1TSqrid1EWxJd6F1eQ8lNF7qNZKidhOHADH6JpHFoPPHYL7/7PB/6F4nenJc8vA40EGb4vMZLFjanwh0M6o48LdG7qqEb8dWpXmk5yPHKobGliqk+dc+xrwgHYcTC17aKig8vX1qXF6iwmbQMrBUqv320AnMA7TuOWPRhcFGaA5/1+jd+G2MN6BO8ovinHDCCWzwxEgYssvTg0stDCOqml2SuRsrsfWXq8QNqPVgK7J53A==
X-YMail-OSG: 4W0GzNYVM1mpZhsMxhsaAicYIYBRgF52ftxJw3nVve_8UMNOxPNZ4vmrJQmt.4c
 DRBw9ZwLYbUKFGW2oE.1Z.rjCYFxlJit5uZ5aNGIEKah3ABOyHIVsjUgf4GmdIwaNdjJk_6rCk0g
 3sLLY3qpu0X9xRFaO7VMRcVOAqnrkc0z1kvhhtfOlyUCI6H5FaBtoGZiUB5AtVocBCTt1Sx4hTkv
 efJ6ubvM4gBkTE2FGtEzwbgWrzI3f0etYKa8wSLijLX4xa6nYyjiRmPO4yhs6_CfXMqPLL7.1Lpj
 fx4YKz6GJyC8_lVjWH_.T9WOg2K8sYsDWqtO4dYju5MRNkA.oP6DisuCxD9JxcamGrikfVXxrXld
 oEa8zRs8EOP0xBUbBHJ2dFnSL7Y0GzuuGs3JoDxWEYen6.GeXSSyZMWKJ5UFmCL5u_LcEUP6mfcL
 1UH8NJM9Hfz3Ng0CBOrFiuvtOds3Ec86lbUZIdSB.3bEqDMXUaHDIWb_djI_hxoKrgytvXUtj8hz
 hrLtApagtmxvl6xrlnjK4FEVzhKPnILkH36.dy7m9LvJflNOoB.rnFYYGNcAs50GFXxINg9kZ01Y
 A_bkooeXjQE6OapsmUnGN0cTf9Dvq9522DQwn5Y3O5CfKmbGI20ZcenKQg.pvNSV1eUSoV76ycfv
 zyRmO9QwlK.g1h1ZrKJGbuoVm7UUN50qPWRL7CWpTOyhOnjxTgUMuuHLMtqvwFw33Din.YE2EdTL
 5PfqDgEuU9wAF88AL6w0L1iwljnaWGRth803MA79fdjAmMP0HfQoy2m8_JKi9t8dK1RyfpE0.T_X
 5K4juFzQrveJzGNsLBntIvKGReaxuCmMJpzpA3bcK9RUVaWZv7m9B2zskrvXC8YLbNR0rsJQRkIp
 hTqw5jM2H3fv90gc8bcr1K3OW9N6ngoXBOqXsmFjDuHUbhBzQ1ivEfnCp7NY25zZsQ4wEkJg2t9U
 7F9LCtkZaqLLbdUbb0_A2PZ8bcJlzUDyZ93_PC57mxxYHdL._hyhrNUKZC_j0.it6fsQQlTpfEp0
 QwfNKoy73boZyz.EeUjBJJVLsQJvPPfYoXsja5rLzSKKaVJ1R9MvYlIyboL.MoDbyrm2RTEAqoZL
 zVFUtV7RHT630yAgu4H2AHBxKQsieP7nOqpDUaNP3euexBcy8RQIFpqoopqT2A1HbR6MjF8MS6yO
 w99Dao_BabHEXuMITARu84GmtgiW8yEAdrTGHaZhJu5ovfm4VU3zWLR7SXRHGdhq1eI7oiuSx20X
 u20IR1vWuH4VyfmKcmCCGJwjymsc8g36u4yepuM5_VEC3I5bBOyst2otlO8XtFlNeI0dryGkkLyC
 JLkUJ_D5FzaQRaXb7inZtZYOL0PEGWwnlX1IzoHWESaeTBuHda4zw378GIQKOzmFMehUWKtrOFwe
 Ruxec_KaqLPOFr9G_ICjCsulttJuaHk1X6ppFlMrKYYvHDXQP01_K.r8l4wiQD4lGw8XOR2Hf1MR
 2zIy8n8fU1hnrmJS0Ul_9ScYRyGDAdO05BLe.Ey4D5.4eLPKiKPvswkfLncE8u7MI.5JsJxayjr5
 s3mHKV3Rf5wnBrtxygD4hQ2xUlwq3g2vw0hl8SuO1GtW3a3M73jTznOdJ7EUIQZ57BcKewlxlHEL
 DW4bzerElUuosOzoON86afJsIX5s6AA.BDdbhr8XFZmatTUqqDB2fFbuu.SN2da4xViaIVYvg8..
 BPQgHqb1qExEHD11.o2eMkzIf5w1133w.SohHI38GIX48Hcjtw.I3nvtpukbukVMlm8iVhdhC.zS
 DWk1wWaPxSBLhRzHSmsXWDwv6Ac64WT6nUe46xpYfWV.0vL8SqetsuvwQF68k_Hd9rQdPpa63vmJ
 IMb_ySs7JFvH17w7bcNh78cXHJat2PeGAYevHzjgw_VFEucPb_fJ1SYGsmvRZOKS3Un617VEv5Vl
 EsP6z94ISiNFzBaOKuKSVkpaQFjMFkLB3y6BYnWPwlKHV5MJZxhFmmglVZ7_5mJKkpbnDLs.j6.N
 M6QSnos6zBlYrvr9NIDmjLVqU4EeRYvbvQX2bIc_dh5si.MkdreLtbRkjz5NgPctyUWDixzvCSau
 q4L80DWB0mWWyiVVcFylx6yRMDb_QfmG8zBFdm78ir8bx3I.bCEx02xEMWXbxJSM.8vaFYoyViP9
 JX90nKOz21DJ80MHL8EkFvrWM1XpTZCgIGhpdNrRrJ0PcBAw4rxvwSl4knsAEASr4UoIvhzbOhfs
 6Dr1Y1K4ge_dnv_Cv6CNnARdsfeb.KZshSr9m3a2RBXNqH.1DMwu0qUnnoTQp8SparnVcjPHZVy7
 2awVNNN4bdbOb
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 2394bfbb-7922-4444-b6d0-09f6ba4b9ce6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.sg3.yahoo.com with HTTP; Mon, 1 Apr 2024 05:06:12 +0000
Date: Mon, 1 Apr 2024 05:05:57 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.in>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-ID: <1149883150.2190802.1711947957243@mail.yahoo.com>
In-Reply-To: <20240323105302.1828426-1-ppandit@redhat.com>
References: <20240323105302.1828426-1-ppandit@redhat.com>
Subject: Re: [PATCH] HID: indent config option help text
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22205 YMailNorrin

>On Saturday, 23 March, 2024 at 04:23:25 pm IST, Prasad Pandit wrote:
>From: Prasad Pandit <pjp@fedoraproject.org>
>
>Fix indentation of config option's help text by adding
>leading spaces. Generally help text is indented by couple
>of spaces more beyond the leading tab <\t> character.
>It helps Kconfig parsers to read file without error.
>
>---
>drivers/hid/Kconfig | 633 ++++++++++++++++++++++----------------------
>1 file changed, 321 insertions(+), 312 deletions(-)
>

Ping...!
---
=C2=A0 -Prasad

