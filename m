Return-Path: <linux-input+bounces-4196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6D8FFD0B
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 09:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3501C20C50
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 07:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DFE154424;
	Fri,  7 Jun 2024 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cLOvVjG/"
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A54153BF6;
	Fri,  7 Jun 2024 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717745021; cv=none; b=GOhJmxaYJW0zSx5/gwoqYj6gV22kwDnyxrVQuLfo+1XmOdHr6dFo0aeJ+D8KDMWrB5Pkwfiv5BrqCg+WUTPROhRsLnzikU2X8VhdvnzKcKojCWwlWQi4hPT7CUeDOiYf98VECtc8wiMH29oSZpct2Ns1YVHboiJbveTXLY/UESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717745021; c=relaxed/simple;
	bh=6AjstlSgvqy5Myga4SE3f4mOcGOy21gQsyvN4ZBIWe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W9kyaZSAzJMuYHiw1y1L1SAHKznUkCepUroKWLVntCszkB0sxz4pPo+3e5uhairHXkrVBsFI2p/klrQ8bHnXoJyBcrTMbFQtQNde6Z3fuMXR2F22MGiEqL92Z1YanK9NaWIS3FZnkK0B/vYeiYI/g+l3eDAjOHIYBSd9k6fEIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cLOvVjG/; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA9C41BF204;
	Fri,  7 Jun 2024 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717745017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6tMAb+dn3fe7Mnc885F0j2M5rYeGbZyeUY/YOGiMQ4=;
	b=cLOvVjG/AGwEYg9ropFA8ur+BGiRrnLmuSl/vLSQgHkj1UB7y1577VXzoiE2NsjoWTBU1d
	4Pm3o6+BcL18ql7j5+tM2Tjp5kQFN7XFQJJA5h8rBW4weCEkNSYqnBcyNmUjlpyk/QKXAI
	8J4+8k8efAgaoRYKYme5R2ePqfNCeQDX6CYXTtnKfV83kg1TBHuPpbA+9QvzcgJItzCMlJ
	AxqI0Ryuop8xRqDo+yb4i0+w7I38cBnr8yWxmm60GTIJpQLR4mGmcmdPGRHyqR8OVWj5w2
	VGBRHXEX7+2ZR2WyDhv5V+Bhu7lYhBb51pbOokVs93fEbXwQ2RmuWSulFdwOJg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kamel BOUHARA
 <kamel.bouhara@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>,
 catalin.popescu@leica-geosystems.com, mark.satterthwaite@touchnetix.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v13 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
In-Reply-To: <ZmIq9jmkZtEaGw19@google.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
 <Zl5ZmYyntq7OJOvZ@google.com> <20240605124746.GA57733@tpx1.home>
 <7ca4a22f903313128de5c0f65a49b319@bootlin.com>
 <ZmIq9jmkZtEaGw19@google.com>
Date: Fri, 07 Jun 2024 09:23:36 +0200
Message-ID: <87bk4dfc7b.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Dmitry,

> On Wed, Jun 05, 2024 at 03:48:20PM +0200, Kamel BOUHARA wrote:
>> [...]
>>=20
>> > > > +
>> > > > +	error =3D devm_request_threaded_irq(dev, client->irq, NULL,
>> > > > +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
>> > > > +	if (error) {
>> > > > +		dev_info(dev, "Request irq failed, falling back to polling mode=
");
>> > >=20
>> > > I do not think you should fall back to polling mode if you fail to g=
et
>> > > interrupt. If it was not specified (client->irq) then I can see that
>> > > we
>> > > might want to fall back, but if the system configured for using
>> > > interrupt and you can not get it you should bail out.
>> > >=20
>> >=20
>> > Yes, clear, the polling mode can be decorrelated to the irq not provid=
ed
>> > case.
>>=20
>> Just to make sure I understood, is this what you propose ?
>>=20
>> if (client->irq) {
>>         error =3D devm_request_threaded_irq(...)
>>         if (error) {
>> 		dev_warn(dev, "failed to request IRQ\n");
>> 		client->irq =3D 0;
>>          }
>> }
>>=20
>> if(!client->irq)=C2=A0{
>>     // setup polling stuff
>>     ...
>> }
>
> No, if you fail to acquire interrupt that was described in ACPI/DT it
> should be treated as an error, like this:
>
> 	if (client->irq) {
> 		error =3D devm_request_threaded_irq(...)
> 		if (error)
> 			return dev_err_probe(...);
> 	} else {
> 		.. set up polling ..
> 	}
>
> This also makes sure that if interrupt controller is not ready and
> requests probe deferral we will not end up with device in polling
> mode.

In the case of probe deferral, I see the benefit of treating it as an
error. However, in the other case, I find it better to fall back to
polling mode with a big error message than just exiting in error. As a
user, I think we prefer having a degraded feature over not having the
feature at all.

So what about something like:

	if (client->irq) {
		error =3D devm_request_threaded_irq(...)
		if (error =3D=3D -EPROBE_DEFER)
			return dev_err_probe(...);
		dev_warn("Big error message");
                client->irq =3D 0;
	}
	if (!client->irq) {
		.. set up polling ..
	}

Gregory

>
> Thanks.
>
> --=20
> Dmitry

