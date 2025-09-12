Return-Path: <linux-input+bounces-14644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177E9B54D12
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC14A037E2
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 12:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699A13164C8;
	Fri, 12 Sep 2025 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OE3gEZ6X"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77B314A8E
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678745; cv=none; b=NVE+fFXCTV8ttYD7RwpX1wt9uJ0fKwITKa24Y4BMaZvNrtwy3W9a5drkcOByopB6GegFPlDIPv+aemZ/mWKg/30gi0RBAqT702dKa+oGeGq6/UXkuRwMqwz3WwWZvzzk8buUFPH97ZfiIW9u8h2E2FYxqz5nU+LMVLvnB1oCKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678745; c=relaxed/simple;
	bh=6kXTvgsEt4hrAQkTdQrB5UQT/65SaHckvtwi0km/o5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=P6fSZf2pVdgdd8ADY4rrqF9H/15gj1B4DqUWfRumZeirPbF+L2JTiXjtiebKmt7zVtba5WdHBcsDKyYderj5GfoOreqx0UNDRcxE9+1uvxMANr63V7T4Qh9LvhR2BFSjRzG+nypjMDRv7i4pWt1gulNxdD5EG4pSt+QNcImrAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OE3gEZ6X; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C3C34E40CA2;
	Fri, 12 Sep 2025 12:05:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28A6160638;
	Fri, 12 Sep 2025 12:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F324102F2999;
	Fri, 12 Sep 2025 14:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757678734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Os+OidjTl+c1dT3HL1cuaSdhlkiI53JVGWAi5cjuG5g=;
	b=OE3gEZ6X44PjnQgyrjxBYK80kz9SpzxFU5P6SwdMm81+KP5hIFW7PNtGVIDrgqmh5Cex8C
	INo3PxGEWtzFW/10tnhbx+Eo0zQKV/+KXZ6zVxN5eHDVaHYkno9fatGG4GcYDlt6kf7OkL
	/GdcTD6y8s6vhEcjeBrVkUI1zVI6gjwotmc4itWYm3MIoPm0TtO34qMmP350zAF59XnhYA
	cJfCNZaMvrMaWqJTpyXsPaj8D1Rx7zLJFGqp5VVaxcjH4YqdLYUtK8LNCFCLUIU2iNdoMW
	eEj7/g6Y47SUTvkRFrQTlFODlOP4c7iItOnrjsMUPlgWokcnxM+locoSf1pMrA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 14:05:24 +0200
Message-Id: <DCQT3UNG2Y41.2V411GFLLDVEP@bootlin.com>
Subject: Re: [PATCH v14 04/10] pwm: max7360: Add MAX7360 PWM support
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Kamel Bouhara" <kamel.bouhara@bootlin.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Michael Walle"
 <mwalle@kernel.org>, "Mark Brown" <broonie@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <andriy.shevchenko@intel.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250824-mdb-max7360-support-v14-0-435cfda2b1ea@bootlin.com>
 <20250824-mdb-max7360-support-v14-4-435cfda2b1ea@bootlin.com>
 <7jytyub4v7tn6vbwh4drusaagnskl2dsfg2xr6eqp4leqpfq3y@a7g3de5echs4>
In-Reply-To: <7jytyub4v7tn6vbwh4drusaagnskl2dsfg2xr6eqp4leqpfq3y@a7g3de5echs4>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 12, 2025 at 10:57 AM CEST, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Aug 24, 2025 at 01:57:23PM +0200, Mathieu Dubois-Briand wrote:
>> +static int max7360_pwm_round_waveform_tohw(struct pwm_chip *chip,
>> +					   struct pwm_device *pwm,
>> +					   const struct pwm_waveform *wf,
>> +					   void *_wfhw)
>> +{
>> +	struct max7360_pwm_waveform *wfhw =3D _wfhw;
>> +	u64 duty_steps;
>> +
>> +	/*
>> +	 * Ignore user provided values for period_length_ns and duty_offset_ns=
:
>> +	 * we only support fixed period of MAX7360_PWM_PERIOD_NS and offset of=
 0.
>> +	 * Values from 0 to 254 as duty_steps will provide duty cycles of 0/25=
6
>> +	 * to 254/256, while value 255 will provide a duty cycle of 100%.
>> +	 */
>> +	if (wf->duty_length_ns >=3D MAX7360_PWM_PERIOD_NS) {
>> +		duty_steps =3D MAX7360_PWM_MAX;
>> +	} else {
>> +		duty_steps =3D (u32)wf->duty_length_ns * MAX7360_PWM_STEPS / MAX7360_=
PWM_PERIOD_NS;
>> +		if (duty_steps =3D=3D MAX7360_PWM_MAX)
>> +			duty_steps =3D MAX7360_PWM_MAX - 1;
>> +	}
>> +
>> +	wfhw->duty_steps =3D min(MAX7360_PWM_MAX, duty_steps);
>
> duty_steps is never bigger than MAX7360_PWM_MAX, isn't it? Then this can
> be simplified to just
>
> 	wfhw->duty_steps =3D duty_steps;
>

Ok, I reviewed this section and I do agree with you. I will prepare a
new patch to fix this line and will send it separately.

> Otherwise looks fine to me.
>
> To get this series forward, it's OK for me to apply the series as is via
> Lee's MFD tree and cope for this minor optimisation later. So:
>
> Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
>
> Best regards
> Uwe

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


