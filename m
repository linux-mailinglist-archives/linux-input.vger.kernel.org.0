Return-Path: <linux-input+bounces-11814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D71FA90F25
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 01:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2822616A73A
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 23:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BAB23815B;
	Wed, 16 Apr 2025 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ntAWTydm"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8221B9E1;
	Wed, 16 Apr 2025 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844791; cv=none; b=Mxk3cL5P7KVI9lpZvsBP/0leuIPC7tUd2v9MfxU9kOYsNYglSicBNvm9IXTjBNiW6d9kHGsVtQl54RUXS8uBZ7DwijFFUkkdq5H8zCMKofP6MBDbRAjeYu2khM2FRzyM5jWvMmNOiH4ZavJgPnFld63hoqVL9jwa5VCx9cu2jjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844791; c=relaxed/simple;
	bh=yxkomdsLfy5unhX48embS1AoHidUAG1I51bZRO6evCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uu0AUHg5f4NFtviKAocEy5WmVZFVhxkCv84x+SsRCm+sLYu+5Ra8W+lBtW5baxpRc5/XU7uCMBHN6Ihqra9Lqu5Rh+J/2AiWMfhhQtcVjwdF0jaZfxSd7hOLJnOt3M/qLRL7yo8bKrj/X0MeiBD198dolbX5hwKrTK2QbqDciVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ntAWTydm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744844774; x=1745449574; i=w_armin@gmx.de;
	bh=yxkomdsLfy5unhX48embS1AoHidUAG1I51bZRO6evCc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ntAWTydmUOcDuj0Gu8h1ZY1cch0YIqEeXGYFQRssLXg7GgrY7HaztyzafPWb+7o1
	 60ybVHsFb1/c9Dk0/cdNVEz8OfiFWYJgC4bcJAhuygw9L7CumnWOJbpq5KcjTLSKe
	 1GVaEK5/E7dtvWHsN4GruNrz4AmdDixf40l49mrmpr/RUsKIsMA0AaP4y1PSDyc/t
	 xeaA821Yh1nS4pzMjTbm6dwTlP3uDofBmyAUThMmsTSQioOtKi7rXQ0WwfEd2SQxU
	 7/FSFUaQXnqBi+HwC078UB+NWnAETjXgimW4fot616UwtajQnz3sYYQJTvSW73P42
	 QYRVUu41u8Rhc+6I2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1uCKRY1wXy-009VKw; Thu, 17
 Apr 2025 01:06:14 +0200
Message-ID: <951d3144-1141-4cb8-b86a-1ade764c6e79@gmx.de>
Date: Thu, 17 Apr 2025 01:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: Add a helper for reporting a screen lock key
 sequence
To: Mario Limonciello <superm1@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250407152705.1222469-1-superm1@kernel.org>
 <7bb43fb5-83dd-4531-b835-77a8e937f54b@gmx.de>
 <cebf59f2-5d81-41f9-8c4f-d51fcb514f86@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cebf59f2-5d81-41f9-8c4f-d51fcb514f86@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZQC0MlBfymIz4z1ZYVea5zO1/0zWJJTHFBDutn2aEGVRhZ3dUR/
 Jcunl0yGcIaVFw9YuXpdciahr3mMhjqG7+UGqAAd+tYq9bVTJmmhnqa5lxypEJpXPi1nbKt
 3BefPazVXBy+yzBzBuk+WYwrfXDFw/1OzPyM3CD5/r5FXDN4Sme8+S9KnTLeEXVqmn2Wxct
 TSvZMcn+ymZWy4mbnTNyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mhTVUpXpOxk=;TWriY19oXIz027eHrhpcvqYeDCd
 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

Am 16.04.25 um 22:43 schrieb Mario Limonciello:

> On 4/16/2025 3:39 PM, Armin Wolf wrote:
>> Am 07.04.25 um 17:27 schrieb Mario Limonciello:
>>
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>> to be. Modern versions of Windows [1], GNOME and KDE support "META"=20
>>> + "L"
>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>> events for keys with a silkscreen for screen lock.
>>>
>>> Introduced a helper input_report_lock_sequence() for drivers to utiliz=
e
>>> if they want to send this sequence.
>>>
>>> Link:=20
>>> https://support.microsoft.com/en-us/windows/keyboard-shortcuts-=20
>>> in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
>>> Link: https://www.logitech.com/en-us/shop/p/k860-split-=20
>>> ergonomic.920-009166 [2]
>>> Suggested-by: Armin Wolf <W_Armin@gmx.de>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>> =C2=A0 drivers/input/input.c | 20 ++++++++++++++++++++
>>> =C2=A0 include/linux/input.h |=C2=A0 2 ++
>>> =C2=A0 2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>>> index ec4346f20efdd..dfeace85c4710 100644
>>> --- a/drivers/input/input.c
>>> +++ b/drivers/input/input.c
>>> @@ -508,6 +508,26 @@ void input_copy_abs(struct input_dev *dst,=20
>>> unsigned int dst_axis,
>>> =C2=A0 }
>>> =C2=A0 EXPORT_SYMBOL(input_copy_abs);
>>> +/**
>>> + * input_report_lock_sequence - Report key combination to lock the=20
>>> screen
>>> + * @dev: input device
>>> + *
>>> + * Key combination used in the PC industry since Windows 7 for=20
>>> locking display
>>> + * is META + L. This is also used in GNOME and KDE by default.
>>> + * See https://support.microsoft.com/en-us/windows/keyboard-=20
>>> shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
>>> + */
>>
>> Hi,
>>
>> maybe it would make more sense to have the input subsystem=20
>> transparently translate between KEY_SCREENLOCK and this
>> special screen lock sequence. This way there would be no room for=20
>> regressions as people could enable/disable this
>> behavior via Kconfig.
>
> Wouldn't all drivers that emit KEY_SCREENLOCK still need to be=20
> modified to have support to emit KEY_LEFTMETA and KEY_L?
>
> Wouldn't that mean conditional code in every single driver based on=20
> the Kconfig?
>
> Is that worth it?
>
This translation code could live inside the input code itself. This way al=
l drivers would benefit from it.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>> +void input_report_lock_sequence(struct input_dev *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 input_report_key(dev, KEY_LEFTMETA, 1);
>>> +=C2=A0=C2=A0=C2=A0 input_report_key(dev, KEY_L, 1);
>>> +=C2=A0=C2=A0=C2=A0 input_sync(dev);
>>> +=C2=A0=C2=A0=C2=A0 input_report_key(dev, KEY_L, 0);
>>> +=C2=A0=C2=A0=C2=A0 input_sync(dev);
>>> +=C2=A0=C2=A0=C2=A0 input_report_key(dev, KEY_LEFTMETA, 0);
>>> +=C2=A0=C2=A0=C2=A0 input_sync(dev);
>>> +}
>>> +EXPORT_SYMBOL(input_report_lock_sequence);
>>> +
>>> =C2=A0 /**
>>> =C2=A0=C2=A0 * input_grab_device - grabs device for exclusive use
>>> =C2=A0=C2=A0 * @handle: input handle that wants to own the device
>>> diff --git a/include/linux/input.h b/include/linux/input.h
>>> index 7d7cb0593a63e..16f7bef12f1c1 100644
>>> --- a/include/linux/input.h
>>> +++ b/include/linux/input.h
>>> @@ -492,6 +492,8 @@ void input_set_abs_params(struct input_dev *dev,=
=20
>>> unsigned int axis,
>>> =C2=A0 void input_copy_abs(struct input_dev *dst, unsigned int dst_axi=
s,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const struct input_dev *src, unsigned int src_axis);
>>> +void input_report_lock_sequence(struct input_dev *dev);
>>> +
>>> =C2=A0 #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0 static inline int input_abs_get_##_suffix(struct input_dev *dev=
,=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsi=
gned int axis)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>

