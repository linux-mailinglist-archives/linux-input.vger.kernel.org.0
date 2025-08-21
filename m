Return-Path: <linux-input+bounces-14233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D44B2F8F0
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 14:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D7334E135A
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 12:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913662D3744;
	Thu, 21 Aug 2025 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tFrD9DRD"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232531A064;
	Thu, 21 Aug 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780862; cv=none; b=heDwWwME91Faj1BouG69FBBBg0d0tQ7iDE+DQUc+UmVr1KJFx84XcMEFduBUEHWGqDck7frosoQRbxMuDBaR5EjwFyZ3b3UwV4n1Egj6I2oO2H9y4npCH9gLt62SbnUrFd+VPpo3jfbWagVAOHfBuGwsOkxfmR34piGjhcg4Z88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780862; c=relaxed/simple;
	bh=yPYXsMvMZwuv5LYXBpJH2Br7t6U0f2hpP77PO6BRizY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/5L+rv/1i7afbPe/2vkniwvnanQz95kZgX5YszlESmF7DaT7t86RtyomllFqKovVuKlLhfnyZ8q1fIjYPCuiZV0paqMYMh0Re95tpT8rHMVc9suiKHioBb+MuYCVOoZt7n19WSaZHqEBE/MSLy9sqW/g/jepnWITOh9x7OAcB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tFrD9DRD; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oPmbTFgKwmws/imMERrk5+csIAfdPrepxIOhDHih7fk=; b=tFrD9DRDe1N9rs+3EymWJKnzqp
	38dsX6wz13pmCgC9XmBjyyKuDdR3VrA6ewwFMHKFEuqsAl2pdIxXDXdHmoIs0Z7lJFmlS4Pgr2L/K
	jev80vziBX8ufdlRUep4ierc5hVPi4TPz/r57MhkAURYKVi3yHpiCtEoT4JK48E0IToKC0qMpQG//
	TtY2N14pEYWbSTtVzkV/MQpqhK35ohSYJQ51nCt1yKWm4UkGJqXmBAJC+xmIQoMmMHFNHEyIr8gkm
	YyizSBFPrfa4Y+VHJvpJFfTzWq491KG51hi3kB2xprpAGAm3NW1pMun2s/4Eagio91w/mGwY+hW7W
	jY14wyHA==;
Received: from i53875bd9.versanet.de ([83.135.91.217] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1up4o0-0006JL-2C; Thu, 21 Aug 2025 14:54:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dmitry.torokhov@gmail.com, Xichao Zhao <zhao.xichao@vivo.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xichao Zhao <zhao.xichao@vivo.com>
Subject: Re: [PATCH] Input: Remove dev_err_probe() if error is -ENOMEM
Date: Thu, 21 Aug 2025 14:54:10 +0200
Message-ID: <25449163.kmuVQn2iE0@diego>
In-Reply-To: <20250821094751.573411-1-zhao.xichao@vivo.com>
References: <20250821094751.573411-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 21. August 2025, 11:47:51 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Xichao Zhao:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.
>=20
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

=46unnily enough, it seems I "messed up" in both drivers - just with a
decade in between :-)


Heiko

> ---
>  drivers/input/misc/qnap-mcu-input.c   | 2 +-
>  drivers/input/touchscreen/zforce_ts.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qna=
p-mcu-input.c
> index 76e62f0816c1..3be899bfc114 100644
> --- a/drivers/input/misc/qnap-mcu-input.c
> +++ b/drivers/input/misc/qnap-mcu-input.c
> @@ -103,7 +103,7 @@ static int qnap_mcu_input_probe(struct platform_devic=
e *pdev)
> =20
>  	input =3D devm_input_allocate_device(dev);
>  	if (!input)
> -		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
> +		return -ENOMEM;
> =20
>  	idev->input =3D input;
>  	idev->dev =3D dev;
> diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchs=
creen/zforce_ts.c
> index df42fdf36ae3..a360749fa076 100644
> --- a/drivers/input/touchscreen/zforce_ts.c
> +++ b/drivers/input/touchscreen/zforce_ts.c
> @@ -747,8 +747,7 @@ static int zforce_probe(struct i2c_client *client)
> =20
>  	input_dev =3D devm_input_allocate_device(&client->dev);
>  	if (!input_dev)
> -		return dev_err_probe(&client->dev, -ENOMEM,
> -				     "could not allocate input device\n");
> +		return -ENOMEM;
> =20
>  	ts->client =3D client;
>  	ts->input =3D input_dev;
>=20





