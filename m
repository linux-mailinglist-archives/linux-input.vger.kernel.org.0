Return-Path: <linux-input+bounces-13723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35541B164CE
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 18:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0021694AB
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 16:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC2B2DCF69;
	Wed, 30 Jul 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BYc1sED4"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42612DC358;
	Wed, 30 Jul 2025 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753893321; cv=none; b=hKXgU5yABvaWkIjuBlPMw5Ws4sd5tzeaspuhCR2UtfQJf8qJAbVmOVZNLcHcARG/ZUf9peZxVjJw5HJCTOboYP+UqwIe2HqsAfv8WS/sUZEznTlZ+92QMNZWucxKBjKLTl6Sj11ZesQN/QYG4oqHtsp/5w9la2VUveZZcYBJ/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753893321; c=relaxed/simple;
	bh=5x/qyYzQA8lc82smXBRy+ABq7AdSgfcCTmNDNbLXvKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afiDmcuPyPPsgd6+zASwCY28VP642/umQ/YBSRlbR4vjkKEmaQGczYGYJkgiQYFpH450WbBoah38SP4+/vvQ/NFdkYhtTjIal4LGaj0l1BUV8JfFI2S7/qR095ngJdujgKlIMIuOA8TMjAeCPHBELrPbyuEses1IZNdpqMukJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BYc1sED4; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753893317; x=1754498117; i=w_armin@gmx.de;
	bh=5x/qyYzQA8lc82smXBRy+ABq7AdSgfcCTmNDNbLXvKc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BYc1sED4+yKRGjKwZUzoAua35zzfAKQCpUo7DZpVIrpP8xon+jBuWL5dM+WnqvKz
	 Dw7b9RtVPxahRLkMhFyYHsdfPet7OYthiaDOD4w3xe+qrDCazMFf5CPyY12MFlcuh
	 2nvScVyC5pHXY1lz4lKfIyOAt8ZJJvgMB8yAMxGTiv+lsIMy3+nTBuz6eVSwvjjrT
	 JY1HwxBZ4lOTn7/1r4GRgih9QLwG5GuBTAVFpGQsOlpy3L6AOIi+YfKBDQuPO/sJk
	 rRapQWIhzGyJChACPthjYI/jnjgAWxanzKsnEy0eBJC8VyYk8fknZNfjpKHxjyK/E
	 l1yHSGbeAyJyERMu9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1uUsBW19Nf-00tZo4; Wed, 30
 Jul 2025 18:35:17 +0200
Message-ID: <5ffd1945-a1d2-4931-8600-d501f9f66bfd@gmx.de>
Date: Wed, 30 Jul 2025 18:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Add WMI driver for Redmibook keyboard.
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Nikita Krasnov <nikita.nikita.krasnov@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
References: <20250727223516.29244-1-foxido@foxido.dev>
 <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
 <b9a06c17-c18d-4ff1-b020-9eea505a6f41@foxido.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b9a06c17-c18d-4ff1-b020-9eea505a6f41@foxido.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s2eOTCLNlfGh83To2epNdAy5GsjZZOOhknY825CQJtEkKB4WKhP
 Su88BoDv86xJiL+yZPL1wwpikutrQwmkIU/2Od7GhMOx0ZsnUW5JQoTEhAvMdE/TjFdIH74
 9hro4P/TZL+A4Lrqi2P2yjeVDOGVCF7F+zosLR6tQ9Bbm5mk800v8fmWD5RXcuY3yppwkmY
 g7gOZVWevJnQ50+RTYoTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VPGiGIdVSck=;TDUZ4gHsj4zWZ+na5Nd/9zqhj/2
 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

Am 29.07.25 um 10:37 schrieb Gladyshev Ilya:

> On 7/29/25 00:47, Armin Wolf wrote:
>> Am 28.07.25 um 00:34 schrieb Gladyshev Ilya:
>>
>>> This driver implements support for various Fn keys (like Cut) and=20
>>> Xiaomi
>>> specific AI button.
>>
>> Interesting, i was just talking with another person about=20
>> implementing a WMI event
>> driver for the exact same WMI event device. I CCed the person=20
>> involved in the discussion
>> so that he can test this driver on his device as well.
>> All in all the driver looks promising, but there are still things=20
>> that need to be improved
>> before we can include this driver in the mainline kernel. For details=
=20
>> see below.
> Thanks for your feedback, will fix in v2. However, I have small=20
> question: do I still need a mutex for linearizability if I implement=20
> driver via sparse-keymap? I've copied mutex from xiaomi-wmi, but as I=20
> looked up not all WMI keyboard drivers use it (fujitsu-laptop, acer-wmi)=
.
>
Yes, the mutex is still necessary unless the event handler itself is alrea=
dy protected by some sort of locking. Many older WMI driver are not using =
a mutex for legacy reasons, but new drivers should.

Thanks,
Armin Wolf

> --=20
> Gladyshev Ilya
>

