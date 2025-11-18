Return-Path: <linux-input+bounces-16196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58DC6BF78
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 033342C3C4
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3922E7186;
	Tue, 18 Nov 2025 23:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSxjzR/c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193B21D3F5
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507881; cv=none; b=MTY53j2/X0kFiYpCWYF0qOI4jiH6nECjnbWfATcZuivcJtK7w7CCsUo0jyemVBUgQB68SnjMh/rntw0sIFY6Rd3jTPrSmlI+Hc5WG23+7YxLwQzK0yX50AEyMYJ7dggPHlWL5GkQUb1sB+wO3ScdqytNgm38Y7HOA0YpX6+wrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507881; c=relaxed/simple;
	bh=gknviFjPEyU1/kMRyf9Qq0BmZRBgRAyrlFc2Oa7+0hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlqFxgsmcFg1a1d3olDIsJoIH5ivpP4Qdn0j6PPpuIJLEVijsmEBQH77RoiHqroIqW0+5dDUjlKAiaILW3GFelkA2TXZGed+xNBULonT/3/tiFegnc0ODAD7IIDcjSNdnNkSgiQ+GBmAxYE59ZGUhGKTVcBCR8cUyOFwd/rIVrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSxjzR/c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43647775e9.0
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763507878; x=1764112678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gDMr/aywrnnx2iF+KSNXiJDGNcZAavLoTtZUbRlB6I=;
        b=BSxjzR/cfzuMZapWglIULqGF39q7JqRQgFmHIp97RMeKy8V6SHDMCWxVV8MsXoxLuH
         kc7Qy69cxAh8CUQNdMY8OIyvRb4utqlAc0o5hlQNqODvqguqPhyRVQ7b7e3cBmRC3bT+
         qNxjcT4uF4l9gW9AF0g5pVN4XfgMzKwLz04t4clEcZU3N+5er5g6YvsfJKHud8vf00IX
         L3d/Vyx0sikt7qhpoEo8gLnTM8AQlbc58HKYyAk4J2YxNRowu0RCmzE0C7Q+3yTUeAiD
         An3tdcMYWD8//+OnM/v0WrhQt6TFZYk9ykQ89qqBxgdvzQB/V0bdjtfVjEuVxrKa2Jjl
         WxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507878; x=1764112678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gDMr/aywrnnx2iF+KSNXiJDGNcZAavLoTtZUbRlB6I=;
        b=qQgdlrPw/9u9NipzfAbBV8uAWnQcN8a22LIdl8NW7Njx5BpeLYGr0Oqx+MjfmlwmrG
         pcRNgbLFgBtd8rIv4ku2kbAXIOZnktnj43nRfHqR7OeIYBfa8gIcBkqvgJoiM29dJTba
         e7kSnKaCzuwEO0Xh6/QPEW8lIRTH2A0xWoHCYSgD1Ola+jvkjyYuI/R9FDwx0isHvKyY
         RXeFvHDsReI239ufABSSRwx/x9EZG4uSEP0zmodVz6t2WHutTiXD6EaEN9bu8/wBQhQj
         P1QCPB/Es9yfAf6c3A1JF3uyAztwYWNnmHCca5pDRjTIcj/BATfPHOt7Qd4yiAnU8mdV
         31Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV78vHtLW9DxP2QqZtu8D/pDunesPE02ypMRNaIaBZIGgTA1RuYG60FaMEXvsblbJBTDlOGbHiIgFyEVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy439jUeyBwTmw2GrTBbHNSPfgUvfJhy9lAu7T0GYzqKCmCdFLe
	nkUg8TrobqSvNKgJNJKEZPAiWwMbm6RQB4IBqj3xvZIxpVeJUlr3QMS19nx85A==
X-Gm-Gg: ASbGnctYRyGXt92apuK1wTwvORIJLQ26zWgwqcdTbL3JMrpgBnXzco7dFQk+R7bpeA0
	xJ9rcAhY39uFBHMEBOeY0XuwtrHuS9EDVaGkyf35ONHDg6nafWGlLsdrXu4NkTzbq6xUkumQR9X
	qZRXeGEKFNh8v55H/dVBnSZJ8/VOV4+MomfP7zQ4a3rIN/0atGHU2W/YlpXl4MjpZY/JqoJAIWh
	m6AIqA+UoUSKvQk+idVJlcWGZ3rFueqTvfOhDRBfuSuKmTh/75iS2I7SFCCMv4N0uxIPX6Gg/5a
	w+wQAGztXsn2ZszqLi+mSM9YPsZwefbnWugvTK3kCfj6AHnO4itIQxBgIPKsnWvKBCFYM8PE6PH
	I5C0eUdZ6f/cJ7n7LTxWj4G1obD7lMMFXfQLrDkMCWBWOJAo8iMwDPfX8cXglKEByNlN9uyTSMF
	OXGVLV/5Dzt9HqeAno4Y5ixhw=
X-Google-Smtp-Source: AGHT+IGwYE3staR+HpljCb6DKDdaYBLtznmS3Of1dWzwIvywYLGHuQ0P487wMJfCNkKAJBa1w8hR/A==
X-Received: by 2002:a05:600c:8b5b:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-4778fe59f99mr157009395e9.7.1763507877562;
        Tue, 18 Nov 2025 15:17:57 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcd891sm26851615e9.7.2025.11.18.15.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:17:57 -0800 (PST)
Message-ID: <f4046f26-7d07-41b1-8332-a59fa8903f8f@gmail.com>
Date: Wed, 19 Nov 2025 00:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] HID: asus: simplify RGB init sequence
To: Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-2-lkml@antheas.dev>
 <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
 <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/25 14:07, Antheas Kapenekakis wrote:
> On Tue, 18 Nov 2025 at 13:23, Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>>
>>> Currently, RGB initialization forks depending on whether a device is
>>> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
>>> endpoints, and non-NKEY devices with 0x5a and then a
>>> backlight check, which is omitted for NKEY devices.
>>>
>>> Remove the fork, using a common initialization sequence for both,
>>> where they are both only initialized with 0x5a, then checked for
>>> backlight support. This patch should not affect existing functionality.
>>>
>>> 0x5d and 0x5e endpoint initializations are performed by Windows
>>> userspace programs associated with different usages that reside under
>>> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
>>> controls RGB and 0x5e by an animation program for certain Asus laptops.
>>> Neither is used currently in the driver.
This patch is, as requested, not touching 0x5d and 0x5e so why mentioning them at all?

This text has become out of context IMHO.
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
>>>  1 file changed, 19 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index a444d41e53b6..7ea1037c3979 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>       unsigned char kbd_func;
>>>       int ret;
>>>
>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>> -             /* Initialize keyboard */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -
>>> -             /* The LED endpoint is initialised in two HID */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>> -             if (ret < 0)
>>> -                     return ret;
>> This removal of FEATURE_KBD_LED_REPORT_ID2 should definitely be in own
>> patch so a focused changelog can be written to it (who said it's
>> acceptable, etc. included) and it can be pinpointed with bisect if it
>> causes any issues (but I'm not entirely sure what Denis' stance is on this
>> removal so it's going to be subject to some further scrunity, but in any
>> case it must be in own patch if to be accepted).
> Yeah this is a fair approach.
You unified the init interface, but I see that there was divergence
that now is gone:  both FEATURE_KBD_LED_REPORT_ID1 and
FEATURE_KBD_LED_REPORT_ID2 are not used in the initialization
now: I can only see two reasons for this:
- you don't think those are needed
- they will cause problems with asus_kbd_init that is changed in patch 3

What's the given reason here?

You can pretty much re-introduce the if (quirk) { those_two_init }
after the asus_kbd_get_functions as I don't see any reasons to remove that.

If we can't verify with hardware using it that quirk I think we can modify
these to not fail if the HID device doesn't answer back with expected data:
I am cross-referencing patch 3 here.

>> I'm wondering though if QUIRK_ROG_NKEY_LEGACY could also cover this? At
>> least it would look a path of less resistance when it comes to Denis'
>> stance and would decouple the remove or not controversy from acceptance of
>> this series.
Since what I see here is a (qurks excluded) mostly unified path for
all devices I will have to review that, but I already said that if we find
some common denominator to newer devices that could help us
in changing the flow specifically to those I am also open to this
possibility.
> So a way forward would be on the simplify patch, to use an if rog
> statement to do ID1 and ID2 and then on the next patch replace the
> quirk in the if check with the legacy quirk. This is ok with me, as
> those are older devices.
After the fourth time of re-reading this I have no idea what you are
proposing here. Sorry.
> Antheas
I am slowly going through patches and sending comments while also
reviewing them with more detail.
>> --
>>  i.
>>
>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>> -                     ret = asus_kbd_disable_oobe(hdev);
>>> -                     if (ret < 0)
>>> -                             return ret;
>>> -             }
>>> -
>>> -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>> -                     intf = to_usb_interface(hdev->dev.parent);
>>> -                     udev = interface_to_usbdev(intf);
>>> -                     validate_mcu_fw_version(hdev,
>>> -                             le16_to_cpu(udev->descriptor.idProduct));
>>> -             }
>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
>>> -     } else {
>>> -             /* Initialize keyboard */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> +     /* Get keyboard functions */
>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
>>> -             /* Get keyboard functions */
>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>> +             ret = asus_kbd_disable_oobe(hdev);
>>>               if (ret < 0)
>>>                       return ret;
>>> +     }
>>>
>>> -             /* Check for backlight support */
>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>> -                     return -ENODEV;
>>> +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>> +             intf = to_usb_interface(hdev->dev.parent);
>>> +             udev = interface_to_usbdev(intf);
>>> +             validate_mcu_fw_version(
>>> +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
>>>       }
>>>
>>> +     /* Check for backlight support */
>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>> +             return -ENODEV;
>>> +
>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>                                             sizeof(struct asus_kbd_leds),
>>>                                             GFP_KERNEL);
>>>

