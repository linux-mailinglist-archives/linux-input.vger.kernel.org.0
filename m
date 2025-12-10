Return-Path: <linux-input+bounces-16531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4CECB394D
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 18:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D471830146E8
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 17:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA43323416;
	Wed, 10 Dec 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Bbp41aMb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3027257845;
	Wed, 10 Dec 2025 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387158; cv=none; b=bgPVJFMLiqbeFVzmHPl/6yz29zaSBxJqCROC0HVpH5NU/XhucCemU+wV3s06NMZ6Rb490dknMtb2/GUEmxM9VxZZhTcTmlI1afdSFpZU2RTgOYlizvSCE5JVYsGEkLoOL+90Rf1xwd1fQi+atOCneOKKrtZdeVnOhKap1/jgV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387158; c=relaxed/simple;
	bh=vyt+hqWbeLDe4k4JerX6Yiir0G7FIK337dP1en2AtLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQW1ivqJLSItMbymkdsoTol0EGQkrdba+joE4x2I/nQnFMmie1VDqIQkjhv//sWzSyPCpjESBKBjqImRsEgBua6G5OFXF30hCgvAQmGjaFSFORH0pBuDl9Re4D60JArgT2o4qKAlVKW0Cd7W1mLF7VJHPqR9PYj/lG96CMGoOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Bbp41aMb; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1765387151; x=1765646351;
	bh=o/3y1VQZazxkTDy5wsqWW/jK4SYQgC0uRK54u3+Kr+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bbp41aMbBYw5hCdqvCRJSof+CGKV3clCfAD5ITjuMUCg5w8fSs8Rs37ip+76f1s9a
	 /3mmRBuTY2TIvHsqAA0mpYcbNyUb+kZf3vVDqYCD6I0L+gUzywN0Jnk88bdLZebcMI
	 fP8GrXQrHierEvX/N377vgu6y46jyA0DLNyRgccxI7iyXn5U+TLEvOcn4zywHixDvA
	 68YehxRbkHPKVfpOAEBzFl9VpLMYQSQIXrSDWPHcC3XjxVDHABUHNwBBEV/bFQ/VZN
	 Z7XyJTuBhQmonAKMlQRhmSDBZeemvGYXt5xwaNKFNpcy72haCJz+I1UgOq91WZ2cRy
	 VTfNrHFcwPjPw==
Date: Wed, 10 Dec 2025 17:19:05 +0000
To: Antheas Kapenekakis <lkml@antheas.dev>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Kelsios <K3lsios@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight handling
Message-ID: <84c35953-51ec-4c61-853c-cfd324382271@proton.me>
In-Reply-To: <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me> <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com> <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com> <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com> <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
Feedback-ID: 69676043:user:proton
X-Pm-Message-ID: 67d4b8129ddaf9c75ce58bf987329e39b05c17bb
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 12/9/25 11:49 AM, Antheas Kapenekakis wrote:
> On Tue, 9 Dec 2025 at 10:17, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>>
>> On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
>>
>>> On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> wro=
te:
>>>>
>>>> On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> I would like to report a regression affecting keyboard backlight brig=
htness control on my ASUS ROG Zephyrus G16 (model GU605CW).
>>>>>
>>>>> Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v=
10, keyboard *color* control works correctly, but *brightness* control no l=
onger responds at all. The issue is reproducible on every boot. This proble=
m is not present when using patchset v8, where both color and brightness wo=
rk as expected.
>>>>>
>>>>> Important detail: the issue occurs even **without** asusctl installed=
, so it must be within the kernel HID/WMI handling and is unrelated to user=
space tools.
>>>>>
>>>>> Output of dmesg is available here [1], please let me know if any addi=
tional information is required.
>>>>>
>>>>> Thank you for your time and work on supporting these ASUS laptops.
>>>>>
>>>>> Best regards,
>>>>> Kelsios
>>>>>
>>>>> [1] https://pastebin.com/ZFC13Scf
>>>>
>>>> [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshake=
 ack: -32
>>>>
>>>> Oh yeah, asus_kbd_init no longer works with spurious inits so it broke
>>>> devices marked with QUIRK_ROG_NKEY_LEGACY
>>>>
>>>> There are three ways to approach this. One is to ignore the error...
>>>> second is to drop the quirk... third is to check for the usages for ID=
1, ID2...
>>>>
>>>> I would tend towards dropping the ID2 init and ignoring the error for
>>>> ID1... Unless an EPIPE would cause the device to close
>>>
>>> Benjamin correctly caught the deviation
>>
>> BTW, we want to record this knowledge also into the changelog so that th=
e
>> next person who'd want to make the check stricter does not need to guess
>> whether it was based on a real observed problem or mere guessing there
>> could be a problem.
>=20
> If we keep the spurious inits, the stricter check will catch them and
> throw errors. This is problematic.
>=20
> Kelsios, you have a device that allegedly would not work without those
> inits. Perhaps you could try removing the legacy quirk from your
> device and see if everything is ok?
>=20
> If it is, then we have a tested device and a case for removing the
> legacy quirk altogether
>=20
> Antheas
>=20
>> --
>>  i.
>>
>>
>=20
Hello,=20

I was able to narrow it down while testing linux-next with the v10 HID ASUS=
 patchset.

Just like you mentioned in the previous email, on this machine the ID2 init=
ialization returns a negative value. Though, when I comment out the two lin=
es that return early after the FEATURE_KBD_LED_REPORT_ID2 init call, bright=
ness control starts working normally again, even after sending the LED repo=
rts.

Patchset v8 did not show this behavior.

Best regards,
Kelsios


