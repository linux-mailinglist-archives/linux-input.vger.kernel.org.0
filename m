Return-Path: <linux-input+bounces-3781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474448CC7AB
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 22:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A43C9B214C7
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C917E112;
	Wed, 22 May 2024 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="l6pyeiSJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20C828F0;
	Wed, 22 May 2024 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716409533; cv=none; b=d/1B3H4trBfX7iA5ytkfW7NjDpzxa2Ant1hWj/4N590Wa6ViB4LUE1nI4KoG3eoLoa5axgVMEq5S2Rp3xcuXBH9RzCYLJiWKUtjEXoc5jevw+uuC9Ik7s3Q2HN1xIdE/RY4TxSAb0zDLmboGSTUc6itX8GSBvTcA5GXI5X5xjaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716409533; c=relaxed/simple;
	bh=i5YeBElyyeAgBzFvmLeCign/ZZTOXVpIXph9q9KRSNU=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:From:Cc:
	 In-Reply-To:Content-Type; b=BO8OFbjY7kVCEtuzkeqYwlT4AiDcZdno4ZLwkZTawNPOSwdUsZ3Y8CYG8bhvLIJtVDjXaFgBqNczIug7dXSEHTkA4GU1Au3SkHhc+uRUdKyNrhIgOk3sJp97mR5JlHkwIFUhHMaVx8mJi5twfrDrLVLExlWSDZv3Wo0rgRcE96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=l6pyeiSJ; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716409520; x=1717014320; i=markus.elfring@web.de;
	bh=HkwD7TSpNFck9Pz42Pa/zrMVWZu+W0Oh5FLIwzj9QLg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=l6pyeiSJrV1Szt1VVh7n6lgikHN6RLpaXjpXFxs41UzLOU5cZ3kCivjkKCAD/klM
	 fthgmVJjSSrjneDGE8+ot7Aa1h3EqKmxtm1KukElsk/vaZ51kSkZCv1CWMA/MAUn0
	 RknIhrJ5n9F7//j9xJYBacAQ/Nm8CSznXoetiraxQWeD0mOKAtq4MHXisUvkpUEmi
	 5vXbySkZxwF6WTTDFdljaBoF54GTRkkkEuQYOAKsxVLFPhjZmWpX08YhEmlsrQVpq
	 62fqBdg0SkoaNGbotSvD1mqvUqlQHYQYnB8wkJlXg1HNBOjg7Z+vJaNM5cCfpw/2U
	 O5yXxvYOV2kOrlQs2g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MmQYX-1ssK4s3ojB-00iK6Q; Wed, 22
 May 2024 22:25:19 +0200
Message-ID: <5ed339a9-82cb-403d-92fd-fdcb18653f72@web.de>
Date: Wed, 22 May 2024 22:25:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Keeping <jkeeping@inmusicbrands.com>, linux-input@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522100341.1650842-1-jkeeping@inmusicbrands.com>
Subject: Re: [PATCH] Input: ili210x - fix ili251x_read_touch_data() return
 value
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20240522100341.1650842-1-jkeeping@inmusicbrands.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hCnH6YciGuPD/GgNskigEv6YNstG+WJ2woxlLKGBJXmNkJsC0ja
 rZ2LmOdFKo+44VhhVAW4pfU75My0zLSWzoGt6qAlKcyqILvKDwxiopEple6/pk55Es9fMiL
 eZE2DvGlVPxI+2I976W/O0Dt8VNQWjAuQwpBzckbFn+E6mkCFi6htpw0ot3rSsZZkQjzQIc
 P5ZfbOC9mHrftrDY2/heA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bEXtXTs4R90=;egPiOca3X35QYWaxy65sV6JrrHD
 bF1FNBgp0aY082IBCstnJrg0arJuqdYiV3/f0fc4wlqSYEnLKpIulQbfoiNnptFUWlplsIGTs
 6qi7KMXZ5k9Iq1L4UzrG4NlHa0rifdci9MNKPagknLxagUfCoPajvQkpkNYrJUO56Ct77+p9+
 YeBEzUvD0YBgHuGG7D7BunoXOaTS6iKY4E02r05wniJbaoUY0POTNg2FiDXzHuQYAHZ+ZZbyK
 NRxf5ngk5d9eQH2iwELHhtfVxFmRS8Qj3F378pj7xmJ7Bl1D0yDHHzr69qGc4S/msjWm5En1Q
 lfpkpfp1l9Y8JBuDcJlJSU3lGemZEGOa0bwAA5dfqPfS0+zaB/OAUDtbHE4kSnbrstnkhzZz1
 xuLlGP7bQD+/yWDXzGpB0DuVHXoP1P1VS29v2XR0HsUHxFubdebuoyqJ3QEbR0QNypLHvsIvB
 NgkF3yS/62Q3P3LOjM5Xs7KW3yJhBs2lw4ix8p8ZSCfkwf7ymZnWOuAxvUBoAuG9V57+rz1xw
 wCWQccFYWVPfgq5ZBhWnTMQkXe8T0ISZm5UPoQUpx0NjxkIYOwrccZzKIdR5DXIBOl1AzQIR7
 rNmfeV9Ayb2vM63Kz4as3kpO2Y2XuHFjWGOcjyQS2PUCthvgm7spLrDFvbdRKqFWHW4r3EhDI
 YNorHHp/6b6GzhV/cTrxqXC1XMoGuKxoVRJSSWnqtYmSL2CedadkzhboxGwuWgG+82KFFA36U
 6yT0C9S3kBt+2pdWp+IFaLABYESPFpiWsN1fe9nNzwkFloyfbhTyMhsCGN0Ri0cJ3azMJ4zNl
 AH1Z4YOmLo2WtNqRJmGVdO16cjEuPGWdFBuaVYZUmtEco=

=E2=80=A6
> This fixes touch reporting when there are more than 6 active touches.

Does such information indicate a need for the tag =E2=80=9CFixes=E2=80=9D?


=E2=80=A6
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -255,14 +255,15 @@ static int ili251x_read_reg(struct i2c_client *cli=
ent,
>  static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
>  {
>  	int error;
> +	int ret;
>
>  	error =3D ili251x_read_reg_common(client, REG_TOUCHDATA,
>  					data, ILI251X_DATA_SIZE1, 0);
>  	if (!error && data[0] =3D=3D 2) {
=E2=80=A6

I suggest to define the variable =E2=80=9Cret=E2=80=9D in the shown if bra=
nch.

Regards,
Markus

