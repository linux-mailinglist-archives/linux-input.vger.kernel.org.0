Return-Path: <linux-input+bounces-14984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F021B9236F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 18:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C21919029E2
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 16:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00B3112D2;
	Mon, 22 Sep 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2uKK9BO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2CB3112BF
	for <linux-input@vger.kernel.org>; Mon, 22 Sep 2025 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558356; cv=none; b=fW/LU4YZ+Z/hvMGRzvb3Zp8ggW8BD8KVKtvzLIW+qRp9oUdDw5/2/imdezG8+j+hHPGm9LB4CYYD3TPA0lhbs9zt7lJcKNmhnCxvV/dN0Bnu0etP+cK5RpK+bXuUwjv213jubzUOJoabIpfjSXoz8zBrRw4SQdLBSmcalEGDhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558356; c=relaxed/simple;
	bh=OL+Xvwz25wsFr/Baw3v/lJYTgw11rKtS73xu9MyjE9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL77ducLO+iUZvT9BcbEJL4bU/xrElQ+CpzfHzlHna4z0IeAx/XNdStrVoykPqkA6U3Oakna+7Hx8NZ+nwJpZkrPnWcMLb1P/69VlOi6mgTd5cjHjCZvIXHVoE1Ef4DmzYCn8Es/o1lFvJX2S6oyJQKmPdlSAK0ghJeZs4iGXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2uKK9BO; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-84dcf6f28e0so64972285a.2
        for <linux-input@vger.kernel.org>; Mon, 22 Sep 2025 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758558353; x=1759163153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlm3T0upOwy7xn1t1XulwYtiwQ2wQG91vzbQ2MSVGzE=;
        b=A2uKK9BOWxuvX2a19oq5OmqlJbC7FWJrBNzvI09EmJpt55sy/m9GJbYehM+PC8137g
         3J5Qe5Ocb2buf04uXzyiqojY/KymMnBWXo7IqrqhBSLidFaQ8UQysxin9vcMvb+bKedo
         4UcX5AN16BnsbdlM0OznOe14T6JAgmMRk28+umJSWR5tR1PVOcGY9yeLsm1zI1VKK+6W
         xWPIq0V5HXWzZ5MwfBQ3S87DZ3/NCXJW6v7DHKnWlZkcB/vO/gpn8hVIZyt1/7OVQo0C
         nbA3UQugHULY4u4RUNUTnyQNjQXcAz5qNDddPrRQNrXKlVQCg7yEZ9deCz3hEwtgTZfY
         FkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758558353; x=1759163153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlm3T0upOwy7xn1t1XulwYtiwQ2wQG91vzbQ2MSVGzE=;
        b=sYl0Fqg/qql0MxKAXAfYTcXIqgcJtQQipcKYhyB1vFqK4vAnN92oaUGafABi92R2bv
         pOjXAyklp5NtyJscUxE3ePUg8nNwGXPr8QtJ3iejGm/8neAkhBHIY1nQzPNYwMSpB6n8
         p2EIeRKoT2LN/pXIVMfU4U/8Bd3vVmvF4NIwRgxWSWpLijX+HjYNHFvp2cR349OpA/CB
         VOmpt3alEShHG7EhBG0eS/eXD5b/QGm0DRBehjHob27NqogyMHEk3Olb9uTowv8n+iIE
         iWl2k8lEZ1fUNGDGMvhaHgwZ4R9VlkOdQTCjlpZCETi4hB/jFMmjZHqIhWHS+e3ZHSff
         PJkw==
X-Forwarded-Encrypted: i=1; AJvYcCWG5K+9CTTLkJiuH5rfbum5aUa8JukP3ebFD+dpPdvXZNT5MVKoA1qmCdJeOdS+w0c9MkT0t2OG3DI+Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt855BNP1Qk34Nw1odjfjD2FEdnq8CQ/EctqdV4rXRPOyvmB2E
	Be7XuOIXgwGIQ8FlCbcJwFAS47OQ1Ay9kql4sunx5Nc6Iw+WBoaTSlS/0MyBRKROjBAkNXhPk8k
	4qdfjsGMf8jOhl4m+ybhlvb459XknPJEGA+xm5dniaA==
X-Gm-Gg: ASbGncuhcXCvmHlfMfv9xJ3jnfFOw8kLFDA+6UfiGERPrKHVdh8HcnfsoUgZaRwQGJ+
	c/J+Nlm18uqhanqjlI9bWEkGH7xbvlLMTv7oh8nCvXWC7ob2eaDPHZK4tuiDhoxJNWaNgwmDy+T
	W+HuerF0WVSxYnNjDMklV+WUCYVy7Bx1MLHvFt3w/xJxzJe6RKpGm/evjTyS7sKRkqwL3+UQ7a9
	tRSFJVvVgriw6elxsivNACI2LDqrf7Dub6Iho953Q==
X-Google-Smtp-Source: AGHT+IFZhv8u5V97EH7c6E8ccTpPNiMPjPkf8k4uxGpuwG/R76WmlxoeA2GBWbJKLNpiQ2cA18m7RsoJzIdumj0YlJU=
X-Received: by 2002:a05:620a:258c:b0:828:5588:7eb6 with SMTP id
 af79cd13be357-83ba2e800a1mr1387800985a.10.1758558352993; Mon, 22 Sep 2025
 09:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy> <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
In-Reply-To: <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
From: Yinon Burgansky <yinonburgansky@gmail.com>
Date: Mon, 22 Sep 2025 19:25:42 +0300
X-Gm-Features: AS18NWA_WQyNBKYZgu76coVUkTHSCyWrHKyXA-QRTG_dDTw5oHCZR-32wA0Dln0
Message-ID: <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
Subject: Re: Touchpad multitouch leaves ghost fingers
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

Thank you for the quick and detailed response. The solution sounds
great! It will take me some time to learn how to code, build, and
compile HID-BPF on my machine and figure it out. If you can provide me
with additional guidance to speed up the process, I would greatly
appreciate it!

If it is a common issue, as you suggested, having public instructions
to refer to would also be very helpful for others running into the
same issue (e.g. the other 2 users from the libinput issue).

Thanks,
Yinon

On Mon, Sep 22, 2025 at 7:11=E2=80=AFPM Yinon Burgansky
<yinonburgansky@gmail.com> wrote:
>
> Hi Benjamin,
>
> Thank you for the quick and detailed response. The solution sounds great!=
 It will take me some time to learn how to code, build, and compile HID-BPF=
 on my machine and figure it out. If you can provide me with additional gui=
dance to speed up the process, I would greatly appreciate it!
>
> If it is a common issue, as you suggested, having instructions to refer t=
o would also be very helpful for others running into the same issue (e.g. t=
he other 2 users from the libinput issue).
>
> Thanks,
> Yinon
>
>
> On Mon, Sep 22, 2025 at 4:32=E2=80=AFPM Benjamin Tissoires <bentiss@kerne=
l.org> wrote:
>>
>> Hi,
>>
>> On Sep 21 2025, Yinon Burgansky wrote:
>> > When using the touchpad with multi-finger gestures, ghost fingers some=
times
>> > remain.
>> > This is reproducible with `hid-replay hid-recorded.txt`: after the
>> > recording, two ghost fingers remain on the touchpad,
>> > so a subsequent single-finger tap is interpreted as a triple tap.
>> > Tapping with three or four fingers resets the device state.
>> >
>> > I compared `hid-recorded.txt` to `evtest.txt` for the same events and =
it
>> > appears the problem occurs when the device sends a single HID report t=
hat
>> > changes the contact count from 3 -> 1,
>> > while the kernel's evdev stream removes only one contact (3 -> 2) inst=
ead
>> > of clearing the two removed contacts.
>> > The following are the exact events where the issue first appeared:
>> >
>> > hid recorder:
>> >
>> > ```
>> > # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id: 0 | # | X:=
 792
>> > | Y: 378
>> > # | Confidence: 1 | Tip Switch: 1 | Contact Id: 1 | # | X: 564 | Y: 40=
3
>> > # | Confidence: 1 | Tip Switch: 1 | Contact Id: 2 | # | X: 383 | Y: 54=
2
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | =
Scan
>> > Time: 43407 | Contact Count: 3 | Button: 0 | #
>> > E: 000085.948315 30 03 03 18 03 7a 01 07 34 02 93 01 0b 7f 01 1e 02 00=
 00
>> > 00 00 00 00 00 00 00 00 8f a9 03 00
>> > # ReportID: 3 / Confidence: 1 | Tip Switch: 0 | Contact Id: 1 | # | X:=
 564
>> > | Y: 406
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
>> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | =
Scan
>> > Time: 43615 | Contact Count: 1 | Button: 0 | #
>> > E: 000085.960958 30 03 05 34 02 96 01 00 00 00 00 00 00 00 00 00 00 00=
 00
>> > 00 00 00 00 00 00 00 00 5f aa 01 00
>> > ```
>>
>> Actually, this doesn't seem to be 3->1 but 3 ->0:
>> - first report has all 3 touches with "Tip Switch: 1" -> 3 touches
>> - second report has only one report of a touch with "Tip Switch: 0", so
>>         the kernel thinks only Contact Id 1 has been released.
>>
>> What we are missing here is a common defect in some touchpad: "not seen
>> means up". And so we need the multitouch class
>> `MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU`.
>>
>> And following the libinput report, it seems you already found this
>> yourself :)
>>
>> Unfortunatelly, because your touchpad is an integrated one using I2C, we
>> can not dynamically assign this quirk at boot so testing will require
>> you to recompile the hid-multitouch module or inserting a HID-BPF
>> module.
>>
>> I would lean toward providing a small HID-BPF program while the kernel
>> is being fixed as this will be a much quicker way of fixing it for you
>> (but the kernel will still need to be fixed).
>>
>> How does that sound?
>>
>> Cheers,
>> Benjamin
>>
>> >
>> > evtest:
>> >
>> > ```
>> > Event: time 1758384424.367216, -------------- SYN_REPORT ------------
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
>> > value 0
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
>> > (ABS_MT_POSITION_Y), value 378
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
>> > value 1
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 53
>> > (ABS_MT_POSITION_X), value 564
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
>> > (ABS_MT_POSITION_Y), value 403
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
>> > value 2
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 53
>> > (ABS_MT_POSITION_X), value 383
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
>> > (ABS_MT_POSITION_Y), value 542
>> > Event: time 1758384424.380922, type 3 (EV_ABS), code 1 (ABS_Y), value =
378
>> > Event: time 1758384424.380922, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP)=
,
>> > value 547800
>> > Event: time 1758384424.380922, -------------- SYN_REPORT ------------
>> > Event: time 1758384424.393487, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
>> > value 1
>> > Event: time 1758384424.393487, type 3 (EV_ABS), code 57
>> > (ABS_MT_TRACKING_ID), value -1
>> > Event: time 1758384424.393487, type 1 (EV_KEY), code 333
>> > (BTN_TOOL_DOUBLETAP), value 1
>> > Event: time 1758384424.393487, type 1 (EV_KEY), code 334
>> > (BTN_TOOL_TRIPLETAP), value 0
>> > Event: time 1758384424.393487, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP)=
,
>> > value 568600
>> > ```
>> >
>> > This is an old issue (at least a year old) that I still encounter
>> > occasionally. I originally reported it downstream:
>> > https://gitlab.freedesktop.org/libinput/libinput/-/issues/1194
>> >
>> > ```
>> > uname -a
>> > Linux fedora 6.16.7-200.fc42.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 11
>> > 17:46:54 UTC 2025 x86_64 GNU/Linux
>> > ```
>> >
>> > Please let me know if you need anything else,
>> > Thank you!

