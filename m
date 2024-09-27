Return-Path: <linux-input+bounces-6793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA9987F57
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 978EFB2159C
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 07:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9985817E00D;
	Fri, 27 Sep 2024 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NfXo9n6G"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838414A0A9;
	Fri, 27 Sep 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727421902; cv=none; b=BUzyveu429S5Q3IOrUvJqe7a7eM8/s7mAtyGGAov40+gDL17Glgp1szQ9xA1Xtxs9wZS4+IhXkC4QhX4LS5bdFrWkIUGZm5CHBeUBQGnJgyPnb5HzBOFZLToXRF3nDD8POgWMqJbw8GNf4zOU9CeJxji8B6kvRmkkzpt3eIQ0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727421902; c=relaxed/simple;
	bh=9Loc1/mCcS9hWo8P9ZvJhvEvQWdi88NxltjRDm8JDkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMi9fdHj3W5N0YHA3pXnOlldpHoOqYgZD79TORFM4yvnUZlPtBXUSUGuJlDwDre9aB1sVUALzGHbSIZ11tTZY0DFB9Jq7ng5TmMR7GHczAYgBrduGrJcvO++PU7F0IL3h9PSsyl3DypYCH4U4kcBLTq3LUQYLlSpho49lSMXFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NfXo9n6G; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727421885; x=1728026685; i=markus.elfring@web.de;
	bh=9Loc1/mCcS9hWo8P9ZvJhvEvQWdi88NxltjRDm8JDkY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NfXo9n6GP7CCxswdaJDViaKJNpliqs3qIkhFm9nz/qCAYJm929mrLK04pW44cd7v
	 eg4cdRVdagFMY2fCWCfOYDSZC+DAFmJaMoSm1eSh/Yu8OwuucQTwSIVpLaSUcyOHy
	 JhZFTQg89VHWvx2eoi5DUWagDxbkq5zAfFzzrRBe0diOD6ROee0djqn8Hk7GbNxe6
	 Asdd780OACPez8UfID/5z7nvdVdiNlMy6jLxMjjoT6p9/ZRAgNtl14l/NIzpM+NGl
	 6Zd7unKqoLfr943GjyuXWu6ADVmdmTIEt/nvCjgwO6Hwt2N4XFJhVUnjuxr+FMFp5
	 D44pzCV+KpeCu+LwsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyNwm-1s01jt2EVo-00y7fJ; Fri, 27
 Sep 2024 09:24:45 +0200
Message-ID: <2ace33f8-5596-4b4b-9ab9-e7c0fffa990b@web.de>
Date: Fri, 27 Sep 2024 09:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
To: Luke Jones <luke@ljones.dev>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, Mario Limonciello <superm1@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20240926092952.1284435-4-luke@ljones.dev>
 <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
 <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com>
 <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de>
 <03cfc83f-6f19-436f-9896-78fd6b8cd8f7@app.fastmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <03cfc83f-6f19-436f-9896-78fd6b8cd8f7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KIGZo+GzgJA1fDcQaP5G6Imk4XqjBqvooPldpyDzPO4nWHu+pw1
 5OQ/37D9jiuIMEQ5rDxHIJRGFu+xX1JpjHTQsUCa8/nOOJMM0bgM11K+UisAoPWviOV7HbE
 DBUpCrSAH7omOtKY4Fs2buSuXaH45L5W2Ol3ccghz/lij++10kmVtf19YT7j5b1/1pPnIjf
 0OjeWvwTLXtRYoWscxeag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OWDXrJWiF40=;jLjdkTjkkyfyAOyaENVmWOqaGKF
 Zvgr+DxtBwIQjGX0HndHwFsigDLL7jOMOHX8JJLSl7LqcQvVDFNu5SQgRNO7zWJIREfxzcad3
 oo/Y6Fr6LpNYI6+WfsDo4yYami18n/AzG8jFFjB+K5zp4sO5GRN4IqzqqqoYTb5vfqSf46klE
 Ub1vD6AgqJpyr5p1YMYwY2kDN/9ZsofUxIERXWC21pMLl6YoSset6hYpE/hO3H4gBm/xrrKcb
 quLsvaq7SsU8ljXgcvXBb4gIcim3hEsDR5xnn0xMpUDxRm+XiVdSJXmmSuhEZRyCP5ml76Z9V
 Qm5VZGPqUag7sly7w2G3m7tlCHOyqFtIBmQMx6Q0J+hFDMUW/656CoIeTcpVwvsPcGBuh8SPt
 s4dbSzCTq2XdQBk7rsqIoQI8JENDEN74pi6VoHvI1af4NPhhsLgkQ3glmG52lskBYNazGn4pH
 QVfn+ONosnX91QKZBq4UfAl2DwTfR+LprdV8QlIcMfaF8RoDNgpIWvgHdym3yz8fiPv3I2pI7
 MGjEqTmHx0nLQJFE00SZwlzsByhcsW1e4j5tDI3UwjYQWJ5owPt6JsUD+s53PPngIddrohoyT
 +xeFi+Y8VC1PZxbCQa86D5GRZ+FYsYielFh4qUS8cDMkWiiWoatBmskMBVW+zcqC6Ru32MFNI
 PdSJ4tm36YpUbKT+hReSVb7TU+jwPBP2aKsrsE7BYM43JoOlOhKh8U7UZo3MBbwzJ/7AfawNQ
 hUYMe4hyfT3plpo35S3WkExgxkBBfSpP8BydGT8QbjVYxsFsSbm8iUWh4bIUnWi6bSX358TRh
 sPGUYm3irhXCTgwx55ybYFjw==

>> How much would you like to care for standard compliance concerns
>> together with your software developments?
>
> I only ask about because it seems to deviate from everything else I've v=
iewed. For example the older `asus-wmi.h` has:
>
> #ifndef _ASUS_WMI_H_
> #define _ASUS_WMI_H_

Such a naming approach is =E2=80=9Cpopular=E2=80=9D, isn't it?


> and every other header in the drivers/platform/x86 dir is similar. If wh=
at I'm supposed to is omit the leading `_` then sure I'll do it, it's not =
of any consequence to me.

I dare to propose possibilities to take safer identifier selections better=
 into account.
I hope that we can benefit more from corresponding collateral evolution.

Regards,
Markus

