Return-Path: <linux-input+bounces-17123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74CD28B2F
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 22:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC2AE3016F93
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 21:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7CE3218CC;
	Thu, 15 Jan 2026 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GqvJN12f"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CB27815D;
	Thu, 15 Jan 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512103; cv=none; b=g0pZV6d1BKo5FDgv/APa/2IyUFNDyh3vqhfFNmAl+LZKOO82neBHtmx9tq3suzWP3uT08pwsssY/YkhHFqtMoqNypOBf6tMExKjJzMza8mIz0h1c6LS0ck47DIgLjLp4sZ4REs6biW/x4ahxYPmnNdlqbW7rvrXl3Nh9QXVwaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512103; c=relaxed/simple;
	bh=Bbw+q476o4/OnnTU6+QY9IXXCNh1H5mwzldo7BImDYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jK4N+VfdIMaUY4KMKhYm+Pfk9zE+hNEiP+xXtHiA0xUJxkarVKxnTgkDDXCH6Z4eyRwQQ8d7XFZXMkfHLW1RvMKBrajlVJY086S4v73pt+HRtIn+2nWsh/gAmdZ0GUGRd2wh9jlX2FNgk1NQ2cXyChez1wp6J55ehuv8wiXVs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GqvJN12f; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dsbWv40xsz9v7t;
	Thu, 15 Jan 2026 22:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768512091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/MO/rccwFZ1sY9kKioDxoQ75J8jMjTWo/N2+TA1EwQ=;
	b=GqvJN12ff32MX69PJP2SD5lJ4sr8SUb+s335EGd2rvenUH6CiPlucR/5XwsBRump1XFRCi
	skSlec/PHSfdmUNThH0Mr7tStSK9v/TtC8zXCrGBziVRqIhsnY0x9OnCWYKMcarD70acCX
	qgySzYJVM9CqJG1y0wgv707/UIayFoZGovKWpV9NUalIKKt29MqvbmTcgV0XyOiq/bytPE
	UjO0CWtZdGPTvuKLzwF2jz80VrQXsvdwj7eBj9Qpx/yV33g9NkqlR4Pz92kbnHyOLXrLVX
	uO5UrihQqp7p26pUiOt3mL9Uv+QEvCjD237daCH7T6dsrc93jjVNYXFpkuAytQ==
Message-ID: <7e7ea0ed-15e9-41cf-87bf-204b803b49c1@mailbox.org>
Date: Thu, 15 Jan 2026 18:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] Input: ili210x - convert to dev_err_probe()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
 <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ffdf92c70d839d5677b
X-MBO-RS-META: ahqzwt5azrfr9wsm7d1qmzmt6njko3zc

On 1/15/26 5:21 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/input/touchscreen/ili210x.c
>> +++ b/drivers/input/touchscreen/ili210x.c
>> @@ -942,15 +942,11 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>>          chip = device_get_match_data(dev);
>>          if (!chip && id)
>>                  chip = (const struct ili2xxx_chip *)id->driver_data;
>> -       if (!chip) {
>> -               dev_err(&client->dev, "unknown device model\n");
>> -               return -ENODEV;
>> -       }
>> +       if (!chip)
>> +               return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
>>
>> -       if (client->irq <= 0) {
>> -               dev_err(dev, "No IRQ!\n");
>> -               return -EINVAL;
>> -       }
>> +       if (client->irq <= 0)
>> +               dev_err_probe(dev, -EINVAL, "No IRQ!\n");
> 
> Missing return.
Fixed in v4, which I will send once I get some more feedback, thanks.

Note that this return-less code is removed in 3/3 .

