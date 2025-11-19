Return-Path: <linux-input+bounces-16205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB5C6C3B7
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 229124E6319
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AFA21257E;
	Wed, 19 Nov 2025 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gitjQ2ZJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A338191
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763515293; cv=none; b=jDJy+0v4DgfG+Dy4aSe8T3zhnIZhdcwjC3wY+l736I+1DVDvZ+8yMDo20XyDIQXUlkK94d2+fcRdO+qRhyiDB9dWPprhGIdVbRi1yYdqiYnjRZwJLHdhztoZl2eUD1doUkSmfGFNEGwRxMiA1y+RNhpXLQ1R5Sgt0Abuq6auWEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763515293; c=relaxed/simple;
	bh=zsj0bYxmNl0sC4RJxINFguzHtKtN4C3I4foNnLM2ocQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAGwRjZOiSJH7RC1vzOFnL10jz4SL1IBaxTzRGYuspF8NHr/VEdddf6CqXu2Fj/tQpLyuZJQFC72pUojX3NISmqFXF7JNbSriRf5BIo8RK7T8MxrCZSOvTqNcIOLiof34hh0kQuE1aBTlygKmSlLRo1OIp9TxTBsvICQcLlL/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gitjQ2ZJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso29434655e9.3
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 17:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763515290; x=1764120090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ddgEu29tPnsA+drUgrEFgvoZrUhovZVnyPzqxZookM=;
        b=gitjQ2ZJASks/6stURFN0DRPZZXRUMziO13v6jD4pbLwn1sLNHSfTwaQa/RaQJ11HZ
         YSe3G7VH4bjmxh7CidthGQerOhYAkBh3BTHRt4KFrzwXdpWl6A31uA07ENo5+viQZtn7
         j3DDEFrSYU0WSVppUspvLVBHWNej9wer4VrliwHps0RUmRoK3kH1UUULPfj5I/st1hBq
         j/0gYbngIzGo+OI8TqLz+ALSEhm21C1jfdeob04BFSfryWlZc0ZaAXB1WUayHfTi5J0q
         yVxgZkNLpyN3161iA2Qm940EgBPhr+SG7BEEtOLnBvxsy5rZOgwdOEjuNSwO2LS/0FoM
         KrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763515290; x=1764120090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ddgEu29tPnsA+drUgrEFgvoZrUhovZVnyPzqxZookM=;
        b=qG5yV0Uu/+OvbwFMlnYoPPkqoxNpif9xIb57MfSNwI/Czj7F4F6+6P0YyLjw81YPFB
         Wav48NYm+203C7KtBLAmgotVnAZog8+6aWnQh3KQRmqpTIB7I6PY9jo71zZcRLMFJEVZ
         y49oQSB0sRtBmLofc/OE46G3GCyS0/CBTarUafUt8fDZJX8QjpRk4oZ4IjsRxINEx/PE
         uPhSRNqAy9cvSzjuopmqCyYm8o++L7fqhAw0YvVQZ7lTn17yGSM3hnLZpUPfnYC3Q++I
         NSzJoTW+jwdwiLfJwlLLCnnX4fc3wjxuJOuHgjJq8I+0jsarFNf/8q04bsCHalhCMGey
         xN1A==
X-Forwarded-Encrypted: i=1; AJvYcCW+E1/tBZY6rA2TMdzHZvWL94ySo89tB6dufityg8bvwozIvf7tZWhH5rIXoHI3WBCsMrBQ9arsFTG0og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnm0A5tjKS2SSl44tSRg+obTkkuNd7UfjuLw4Ua28kF52v5N5Q
	XbQqrjLUAy4ruOFF6e9n6si/LV6dbTgso70e6nE0OHmMDUlyP1ph3OvJ
X-Gm-Gg: ASbGncvn0fAszEMiouPoP5Sx7c0dzg3ufjSYFVTYTeW/J5kN0+GxrA8sm/GQpOEO879
	wcEw/GYbH/lxaGJGisQvIYqCvpfUvnPMUy4+4QyBIfmZtxkoDILXfhXHN5Ikh02xZPoxmOfIq/z
	QI/KCbCq5FzB+5a6f/VAJnEiJiIZUF0PJ8THldg9J39B/KYY5SSMFAheuD6Qbww7WbAmP8Ezdmd
	7616y+TJTBFv4v9qdmgiz+HZN8HQ0hwupZDBry+3m8kffwPxEZt6CHpf4MQ1JNTnMuw5JBNXTqr
	TrvuEFV6Plc+MIBByxyB9ix5ot0fKpEtSXdMZp4ueEhLcDlOajXmh/p6HxAhueJB8EEYwvfUbZS
	0cYsiqc9aTj+7dZxnqCSloYs/7/lEUZTZ+onrjvLKoE5bU/WSG6Ld4KrkkUwkHvR92Yzd1/4VbW
	rxMVl8xcXcopcHapv536CSwo8=
X-Google-Smtp-Source: AGHT+IHXLcJNiQLcfo3kF05UlgcTUhWRjsF9KAEipPvueBYBiJlxZHNWshHmN9OH5bcWeW1Bhsj09A==
X-Received: by 2002:a05:600c:438a:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-4779d545bddmr73685225e9.29.1763515289577;
        Tue, 18 Nov 2025 17:21:29 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm34821758f8f.43.2025.11.18.17.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 17:21:29 -0800 (PST)
Message-ID: <e204d129-0ac8-48fb-a178-12466350079e@gmail.com>
Date: Wed, 19 Nov 2025 02:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
 <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/19/25 02:11, Antheas Kapenekakis wrote:
> On Wed, 19 Nov 2025 at 01:54, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/18/25 13:10, Ilpo Järvinen wrote:
>>> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>>>
>>>> These keyboards have always had initialization in the kernel for 0x5d.
>>>> At this point, it is hard to verify again and we risk regressions by
>>>> removing this. Therefore, initialize with 0x5d as well.
>> See patch 1: unless I missed something you can retain the two
>> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
>> why are we adding a quirk to replace a quirk that was removed
>> in patch 1?
>>
>> You are basically doing the pretty-much-but-not-quite
>> equivalent of what the driver was doing before.
>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>> ---
>>>>  drivers/hid/hid-asus.c | 15 +++++++++++++--
>>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>> index 726f5d8e22d1..221c7195e885 100644
>>>> --- a/drivers/hid/hid-asus.c
>>>> +++ b/drivers/hid/hid-asus.c
>>>> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>>  #define QUIRK_ROG_ALLY_XPAD         BIT(13)
>>>>  #define QUIRK_SKIP_REPORT_FIXUP             BIT(14)
>>>> +#define QUIRK_ROG_NKEY_LEGACY               BIT(15)
>>>>
>>>>  #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>>                                               QUIRK_NO_INIT_REPORTS | \
>>>> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>      if (ret < 0)
>>>>              return ret;
>>>>
>>>> +    if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>>>> +            /*
>>>> +             * These keyboards might need 0x5d for shortcuts to work.
>>>> +             * As it has been more than 5 years, it is hard to verify.
>>>> +             */
>>>> +            ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>> +    }
>>>> +
>>>>      /* Get keyboard functions */
>>>>      ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>      if (ret < 0)
>>>> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
>>>>        QUIRK_USE_KBD_BACKLIGHT },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>>>        QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remove
>>> + add back in different patches.
>> Granted I still have no idea why that was removed in the first place?
>> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?
>>
>> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
>>
>>> I suppose the cleanest would be to add a new patch as first which moves
>>> asus_kbd_init() outside of if/else so you can make this refactoring of
>>> FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
>> Again I am missing the point in moving these...
>>> I note there's still contention with this series overall.
>>>
>> There are a few things that have pretty much the potential of making
>> some laptops act funny due to tinkering with initializations commands.
>>
>> The rename will break some tools, but other than that, granted I have yet
>> to check the rest of the patchset, looks reasonable to me.
>>
>> Perhaps I am not entirely happy with how things are worded in
>> a few instances, but it's a minor issue.
> Hi Denis,
> please refrain from repeating yourself, in the same email and across
> emails, and repeating comments that are already addressed by Ilpo. As
> that makes it hard to track and respond to your comments.
My repetitions are due to confusion with different aspects of what
you are doing, but I'll try to be less repetitive.

Also I don't think I have said the very same exact things as
Ilpo, unless I misunderstood something.
> As noted in this chain, the plan for the next version is to include
> ID2 in this quirk and instead of removing it in the simplify patch,
> use a gate by the ROG quirk that is then replaced by a gate from this
> quirk.
Yeah but I also asked (perhaps too many times?) what's up with _ID1
and the whole reasoning behind this because as it stands now
you are replacing X with Y, only to do Z without making clear to me
the reason of Y, therefore Z also suffers from the same problem.
> This completely addresses your comment. The legacy quirk only applies
> to a subset of devices, so it is not the same with this series
> applied.
And the reason for this difference is exactly what I am asking for.

I have been trying to suggest things to describe and actions
to take/specific code changes to ensure we agree...
> Antheas
>

