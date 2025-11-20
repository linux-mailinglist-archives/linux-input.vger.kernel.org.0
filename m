Return-Path: <linux-input+bounces-16258-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F6C7497E
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 277D931AA0
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D952E413;
	Thu, 20 Nov 2025 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0RZZJy4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778A286400
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648976; cv=none; b=l8/QwF+lb0WDAwUptZwd2gHRYHmWQN2Vlq1nNgT3OjsoVYRzBXsraPaM69CmU49fpskKX2uTPfWY9HLDNoV7+SJBhTGnKQllqJ/F7TUeGv55xIyaBhWdYANHoRHVnCmBEK3Nc40SeLOUEqXVVjs2xidCMmVJNVxRyqdZMNm2ULA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648976; c=relaxed/simple;
	bh=4sGPhk6b77JM0haaV7ma1VhS6WwzG6m+e1s3k2buRmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clFQhsV0ktngribIaupBo9qU7Ra4gFR2cvfw6p3jut2/qQSOIiHIn54GvIEXZk5Ha3yJ6dtm3ZXt37UprxiboCiaqYgRwpmyb8l9Dq/1AF+ZVh4qX++eDcDkbpEa8RWJo/uSWmgPb7wZBJhT/uKOLTiw3vkVpACfW4dPcIyyzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0RZZJy4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso4400555e9.0
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648973; x=1764253773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaSB0JDzx/KeBkAD7qB+B6gdM9jZdTTt3lJ/HLrBHFY=;
        b=W0RZZJy421jfGqUZ0vH1qUiI26r2+jccqMkwz3f4v66tlUR8QbxNd0l3Nt4pF5Hl4D
         tTLvAI4KOLCwkLhNsMFlnNTkvkar+ScOUJa9ojqhMSj+VbTPo4ZA1T4lwhA5yE+U8PXE
         MosgrvwqeKfMw2ZC9+QN5WYMAF71h4mPhwEJv/PFzJtM3J9ZFOTxXQeDV8JLIFeUavCo
         LQ6kzb5vgyKZKsbJb7WCnkSC2Ue/voQsW0sm/Ztrljc4bParK7eg4GA+t8boCOFLi4ji
         kez7PFeUDQLmP6/ek5nlQ/s/hj+ty4RIK9ZBli4P758klpaXb45jvoRxZ9USF5x0Y4v5
         v19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648973; x=1764253773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaSB0JDzx/KeBkAD7qB+B6gdM9jZdTTt3lJ/HLrBHFY=;
        b=Dsvr9sTaOIi/paoXHGzWgTOjck2+CLOWucKl0s4rXTWryk5Uj3674Q9Q0kkK43/+bA
         tLgrfZr/ETo/0rPLZo1ALDvhVgrgVQV3XfdnZgtA3syhw9n/ow+bvIH16H+ccB35GuDE
         yMsHa0azeY83+OfhGT3wcgL3DwrurU0PLpxl6vFY3u1cpVN2fygomIZq24MKLaerJ/tH
         3kp32+WhHvQZ9wOYO9LDRrBgsbggDDHWS9rDcgaWcqbBUIYFH6PIjAwkOpD7YEWn3ZfE
         iJ7xr/H8x4YAV0iJuj1aITctLrS6nnePDtuQpOa1WdbOoIWCiFFAFnLf3O6wX4YfYQuu
         VpWw==
X-Forwarded-Encrypted: i=1; AJvYcCVxB4BJEOkQZ9SNQcg519bbCxYrcO+UROjDrnxnNWomsPljtB+NSXRvA/EKqtWdXYsEPfke1a4Oe3QSyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Cys9xrJj6j36cmz0eWAbXp2bqhnl8JNTvvT+WbL/xz7xcmR0
	2TmgiBKQjidwwDhngb5Y4oX+FlFMZGLONq6JQ87ZW6SQWEb4/b0e9Cm7
X-Gm-Gg: ASbGncss+JR4REqZZmn26lBqZl7qv2A2zmFce2lzwloqfj9hYo55f09CjyD0RHqKVc/
	alaXVqZfNgGO8dNkzj4IUCfUAc9jLxghwfNbcBW5wtm0exq8UIukNNmkYD6lIGffYQ5/Z5SJlO2
	jycSer+TW5nisuocn92ZD+tqaa49A0tBEnlVmWtAJU7F+4FpcvT9cM0yJOS1FfXC2O5cm46MqK/
	HEEUBfKoVcOR0EJDcTKcHsegjb8NSQ7P36eBm0yOO3eOdgdGq4GzZi6OE9MGUj4WpL1LruvVOIv
	P115jh5yzG7U0Czb5ZQ5A302IQ9XnzB2YMh0jkj9PlYJgyMIXd0usYgSqIrySsQjaQpIXElStsp
	pa9sQAHUebR4N4crCls7HkBDX61CRzwjhIJ7djkx3YRZ0tmDzppKdAb0qEDFnf8LOsGFu1Dej26
	cTFYw6luGltdbKOBUvzInqTIV7oYKBRVY4VQ==
X-Google-Smtp-Source: AGHT+IFRXp1PdrvCziYVlZhZPS+kvq66GveiKYFYWzSPfuPYcPK4t//nyW6R5AUbCQZ7bSE1VqWV6A==
X-Received: by 2002:a05:600c:444c:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-477b8aa06c0mr36976405e9.31.1763648972549;
        Thu, 20 Nov 2025 06:29:32 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffd37bsm115336785e9.3.2025.11.20.06.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:29:32 -0800 (PST)
Message-ID: <5e577dcf-995e-441b-9351-11d6da097fcc@gmail.com>
Date: Thu, 20 Nov 2025 15:29:31 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
 <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 15:15, Antheas Kapenekakis wrote:
> On Thu, 20 Nov 2025 at 14:29, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/20/25 10:46, Antheas Kapenekakis wrote:
>>> Some ROG devices have a new dynamic backlight interface for control by
>>> Windows. This interface does not create an ->input device, causing the
>>> kernel to print an error message and to eject it. In addition, ROG
>>> devices have proper HID names in their descriptors so renaming them is
>>> not necessary.
>> Is this patchset supposed to work without the renaming, correct?
>>
>> If so consider dropping the drop of renames, taking required time
>> to organize with Derek and resubmit when things are ready:
>> there is no point for the rename to stall the rest and quit renaming
>> is not urgent at all.
> I feel like two months is enough of a timeframe for a simple rename
> fix to go in.
>
> I do not want to have to reorder the checks just so the rename can
> stay in _for now_. Skipping the ->input check is important for both
> Xbox Ally/Z13 as it causes errors and the device to stay partially
> uninitialized.
>
>>> Therefore, if a device is identified as ROG, early return from probe to
>>> skip renaming and ->input checks.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/hid/hid-asus.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 3047bc54bf2e..6193c9483bec 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>           asus_kbd_register_leds(hdev))
>>>               hid_warn(hdev, "Failed to initialize backlight.\n");
>>>
>>> +     /*
>>> +      * For ROG keyboards, skip rename for consistency and ->input check as
>>> +      * some devices do not have inputs.
>>> +      */
>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
>>> +             return 0;
>>> +
>>>       /*
>>>        * Check that input registration succeeded. Checking that
>>>        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
>> Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
>> This model works once in windows users disable  that new feature.
>>
>> Note: that kernel the person submitting the bug is using contains your v8
>> and asus-armoury.
>>
> No. This user has a laptop that has at least a WMI implementation of
> RGB controls (this is why you can see rgb settings). Since you did not
> ask for logs, it is not clear if it also has a HID implementation that
> is skipped due to e.g., a missing product ID. Very likely it is a bug
> on the WMI implementation that is out of scope for this series.
I will ask for logs, but I recall someone with the same model sent dmesg already,
I'll try to find it, but if this is true... Are we lending control of LEDs to a bugged WMI
implementation for this laptop?

