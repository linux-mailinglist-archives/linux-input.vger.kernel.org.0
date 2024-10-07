Return-Path: <linux-input+bounces-7108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3A992460
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 08:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51BE0282430
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 06:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4BF13C807;
	Mon,  7 Oct 2024 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za6B2cmi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781842077;
	Mon,  7 Oct 2024 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282452; cv=none; b=T7eGl/bcFecG8PbbVaT+1cwDpYCWgnw7upfXyGbmEYoTe82Z9VajqfG7dun13UeEwWAptGlMe0z5Yorvh2BLfNh4Zq7yh3qYRGsiJOjkJ+yeF18A+sAqfKnsphgGSzvj/jQnYzS18m9DKfbbvjuwOai19eJ7MlLt9yE/SRBRKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282452; c=relaxed/simple;
	bh=dez3qDZTCR7aj0lyd+8859UYCldz7p/KR65EToBPfFs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNq2vbmIsfGj2H0hle0nW6jKU+donTg5TkkDNR5dTpZ4/BPFBuwfldowL0vCXraJ5Tbi6P40h/HbjC73CYIaPpjUKb7mWr5EAWbudTHs7ZjNQ/xirl9lML1ti7I5pBUdnfr9fQEHGxpR6xDsaVJd2YtxTZ7EkpgcEc9ziNiIFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za6B2cmi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso41056455e9.0;
        Sun, 06 Oct 2024 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728282449; x=1728887249; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ljP640KoG3Wu+LMoLRmzVfghnukxnk+FpxQaSkZ3Ns=;
        b=Za6B2cmiJ6aByhjrcX94MwyrUpwJlR+pOrk5dUROemf3WUgWgpwcjFfQ8/7MGSr6co
         Lnf2D6KIOORQni2Z7o0rKK0/RVn5fJLOLzjBRvS0NfGFiwgLjG75P0z5gesqrJAChPZT
         TjFVCMXlumrhKnKvrRH30bg4s5PDii976wZN8GuduWoeVFkpx6qpjCh44XlSuptlDLYd
         PK2XiQp1yHZvJ0V+syrWgXm6DZVQU8PxMeyx4d1jTFpxfZ/nOBvqZtYqAck6IjSJ9xeE
         pEn8H05iueSQfqFVP78pwD+OR++7bsdbF/8DyV5oH/JOmqDnbgR99TWvu3BE4+keHqE3
         9ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728282449; x=1728887249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ljP640KoG3Wu+LMoLRmzVfghnukxnk+FpxQaSkZ3Ns=;
        b=JnrHxLQmVE+4J8NIKYksMEGjrqEe0sJJ9FtkwaNq/Mu9jFpscd4u3ZXT008Gzox9Qt
         6q4SQHELzxuCaeNo1FdInhCt1oDEWB2ta/hS3MobjyakRDphntE9uldAUmWvId0+q1S1
         Qhd3/vfOBNVZEWha0rWocRRFR9U0P7tsxlaZIiPHrCsyihalHVVFRVKpSguYh71yaNuo
         ySuTbTxsnA5Jhhq/O1l/TWbQinMzVwhcuLEHOudCwbJBS2Dt0I3mtmAm/R27+nE7/knr
         EmFDwDm8P7QWDyj3eSZIpKwBIqXy4DGiZTXQqMJaDG/XbiMnj5t8E/al9HgzmZhkDTvk
         tUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUwiPVSfFZPnXRAtBDMswe0k/OQL723WFVUCwSHx3Kv+Da5NOIU7vm9h4TmlUNSf+5tyv1ymTaMupAJKw==@vger.kernel.org, AJvYcCV1EoDr0o/QrljuEbVEnni8i1044ui6dYfazJZo2iI/mFeRtPQz2Fro2wjBP25xTbBOrlOwPpdfzEsnbyxj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SjLmVSRPXytG8us1hbQkbiJII7ujh75XyrK11XmdpnXWGZLQ
	0QyKspJkDKTkJ/3LmlMoj+2+XK5vpLTWJFRy2ob1+v/X9pNJm/eAN2JC53Ey
X-Google-Smtp-Source: AGHT+IEJuaZzmFUqMGyp1nNOAu+2KlDOEmzixod+fsMzI+qUmA9SsCWoKQPzrceyuBdhATO/hsz4Ig==
X-Received: by 2002:a05:600c:3ba9:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-42f85a6d73amr73294305e9.7.1728282448958;
        Sun, 06 Oct 2024 23:27:28 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20393sm82128795e9.12.2024.10.06.23.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 23:27:28 -0700 (PDT)
Message-ID: <6cd859e9f307c9358d81e5d8d7856496d8c69b6b.camel@gmail.com>
Subject: Re: [PATCH] Input: adp5588-keys - do not try to disable interrupt 0
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Hennerich
	 <michael.hennerich@analog.com>, Nuno Sa <nuno.sa@analog.com>
Cc: Utsav Agarwal <utsav.agarwal@analog.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 08:27:28 +0200
In-Reply-To: <Zv_2jEMYSWDw2gKs@google.com>
References: <Zv_2jEMYSWDw2gKs@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-10-04 at 07:07 -0700, Dmitry Torokhov wrote:
> Commit dc748812fca0 ("Input: adp5588-keys - add support for pure gpio")
> made having interrupt line optional for the device, however it neglected
> to update suspend and resume handlers that try to disable interrupts
> for the duration of suspend.
>=20
> Fix this by checking if interrupt number assigned to the i2c device is
> not 0 before trying to disable or reenable it.
>=20
> Fixes: dc748812fca0 ("Input: adp5588-keys - add support for pure gpio")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0drivers/input/keyboard/adp5588-keys.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index d25d63a807f2..dc734974ce06 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -822,7 +822,8 @@ static int adp5588_suspend(struct device *dev)
> =C2=A0{
> =C2=A0	struct i2c_client *client =3D to_i2c_client(dev);
> =C2=A0
> -	disable_irq(client->irq);
> +	if (client->irq)
> +		disable_irq(client->irq);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -831,7 +832,8 @@ static int adp5588_resume(struct device *dev)
> =C2=A0{
> =C2=A0	struct i2c_client *client =3D to_i2c_client(dev);
> =C2=A0
> -	enable_irq(client->irq);
> +	if (client->irq)
> +		enable_irq(client->irq);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> --=20
> 2.47.0.rc0.187.ge670bccf7e-goog
>=20
>=20


