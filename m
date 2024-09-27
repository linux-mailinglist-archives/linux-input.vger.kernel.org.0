Return-Path: <linux-input+bounces-6790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E58987E25
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 08:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98AB1F23022
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 06:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A0E172BB9;
	Fri, 27 Sep 2024 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WT/V27EB"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB615C137;
	Fri, 27 Sep 2024 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727417436; cv=none; b=MbbTZUNydBsYCTcIBnveh17YKM0inOe8FGMbecZdjhIY3BMo6+bahFHcB/fGqgEQJOEnMecCO9D7GG+fWskIphfWXXQN3giOh9lp1TFArrtMdABjy2KUEy6t37T3ltIwKVYjTlUyxcyV/oYxumH5xzubbOAYEIjJpTn+29S+38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727417436; c=relaxed/simple;
	bh=IjqcBz1lFA+GDXgttQfm02z6EyN6mOcAxH8+wysJdkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D11Vf+u2H7seim1jGi5lsGiYL62dKC+IggfMa7X0wLwFEF5JWnuMWZXbdqzflrtOKI3Rr9+0waDQLgXLbuwdWvgvtJAmmupHO5cLPdvMgB4kgrhohS618GUU3w6UqsPYP1dioy5IqLFTHxha1Fq5QAwXwrtNShn3DU9jtzKVIAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WT/V27EB; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727417407; x=1728022207; i=markus.elfring@web.de;
	bh=IjqcBz1lFA+GDXgttQfm02z6EyN6mOcAxH8+wysJdkE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WT/V27EBvGO4G52F2o9MoWjT/djQNOL6dEShWhPEi1te3jN6MbVgbrkxMQY056dU
	 sK4ZRFdaIuwvBHKqeCGqj0zBqQpgWG0T8mQKOXpRTsotHHWpL/54teg7XtBuwRF4C
	 Yd2SW0TziKh1x8hOaljyxzzy1Lezrwh1bGecV5LkeyFOCX/DM2qhrvwdV5ph/Ipuo
	 0X0RvI8AGtEho2HX8T9swd/n/2JdIz1n99KR99899LACgZ7bPEHPFruC7uHcOclUn
	 V36c14g7SwtFcKKM7k3yZHJTnnOL4F4hNnAaUxKwfBMd7VEXJprgAeiXC2aweYWKG
	 gk0mryDnFyXdAuq7TQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxHUC-1s19Ed2sw4-00zDbU; Fri, 27
 Sep 2024 08:10:07 +0200
Message-ID: <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de>
Date: Fri, 27 Sep 2024 08:09:41 +0200
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
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xPCTGw/vuU+Sz513CCQtxrzm50Mg9OQvFEGR0xIBKsIP2+XWu05
 Q8AU59kqYhYSVkitt/3jI2DxoxxDBCpC5pJymMZ/+GnYRdaiZfLC4BIkd0shM3dbiUqwCU1
 QwisBqS34txvATes5KQfU7ncbtdXTTquIvmr0XoKtW4Hu2XG1tu185OGMnX05FFfA+Y5MY/
 jxz+0ekFKelrVrRsx5zhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Argxaapvd8=;SphmisfGAr/mcjEOoupEjGZrRy4
 VvPd6tEljDHbkYeclfU0yYTf6ZZwAar+36V4wghPlAA3YNfTjYvwWE8GRYgXKXOGcx4R+2tKK
 AxTKzuYPKI2K+wGJrRnE69VG9IM0s5vbScolWfCVpqPDq+iMwncUAN1UzT4mie+LQVDJNIybl
 gS8JuDtgrQZ5e2Gu73wmH/yTdSjeEIKh22lNAiMvg3/jJTX9wMIDantGfwsWJIVy6FdoegNYZ
 2yUAC5hiGt1dVAEjqYeaCVqkAFSQIZRiQJh7ZEFOXRB6BFbHPYN7FWbXMonpB8FseXCjBnPv5
 uVIdP0fqxzQrqlYRNTepnVamLtPs+KbUb0oA7iHyzcAhE+dBb5zZTKySuBj2QqrkiD1QfGw/7
 9VMMoYgxc9tk6mhvLtJgoj9Zirin1tJJInbUl7uUZ+jW7MLtpMt5rgsrc32AHrO++ksbCzlcV
 bpQCX+yf1XGBshZ9KPj/mITmCvpB1OIQM3ll/5ZUA2hO52DqqcoGNM/jWumDtSabrNb/F2s+I
 vhvInSon92Zur75JcLFn8Pec+cT1cdBzVvxJUikxZV3qlyegdQnZmRizb6wTzjk+3GTzT2QvG
 VNbZRKHVHKGG5RlyAPhakB8JsW5PWxZTBWkV/9NiwRYwjdMbVrKl6l/R6mtRSpW6VK/dXesQe
 k2EZEdxFn8kIB6iqdg/6KHnBw22VZph6F03U6wec3J+8UHHadJiOptxyxjPWkM736bpE+GtTG
 vPBPubuekA6g8esb2jfkb5gBs7Xl6mtsbscaNkg/MShzRl7B6LheaddEu4C2Ts6+dJF8HOR9Y
 zeRAAwZfh1nmnanDDgy9N4Rg==

>> =E2=80=A6
>>> +++ b/drivers/platform/x86/asus-armoury.h
>>> @@ -0,0 +1,146 @@
>> =E2=80=A6
>>> +#ifndef _ASUS_BIOSCFG_H_
>>> +#define _ASUS_BIOSCFG_H_
>> =E2=80=A6
>>
>> I suggest to omit leading underscores from such identifiers.
>> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+o=
r+define+a+reserved+identifier
=E2=80=A6
> the link is C standard, not kernel C right?

Advice is offered in such a direction.


> Pretty much everything I look at in the kernel seems to use the leading =
underscores.

How much would you like to care for standard compliance concerns
together with your software developments?

Regards,
Markus

