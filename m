Return-Path: <linux-input+bounces-15683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619BC03514
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 22:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E35E44F6D2C
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12B32C236D;
	Thu, 23 Oct 2025 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7cZT1LO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0B1F03C9
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249902; cv=none; b=pxVeiPIXO4VYkxDSsp/JhZwlTkuwILzl3jB+K0sY8CY4HuVA1BAyDAMFIPIyd9H4+zva0UbLcuR+RE8pUrCloc5NdCNJsJ3XjOM1Bs/A7a7Jz4raG2v1RX3TiMISj8Wc7hPiYaB8NrPmAsuxBJ/8Wq+NvTF11ICtbQ1vljV7Pn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249902; c=relaxed/simple;
	bh=MjTzNEw/IYXYD9kw5r1g0n9RlqwGEqe55Q/x9SL42Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zwwk1U6EARXcAgS+e235g/pDhi5XW2nO9tQVz4eO2uiGuSGh/hD1KAW6T0hnKFWJJV6poNGJG/O01a2+LB0nmp+HpcpCGsOjbgQbEsRrC5DR/peqZQVsIes41FU7C+JCVSWh90FbmuFCX2PnhFFgERN+Lk0XC9zewuo8rJBsLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7cZT1LO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4270491e9easo883443f8f.2
        for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761249899; x=1761854699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSp3ympZ3+O5RJFTp67NWvTt3blfkpzAhzcIg0++r6w=;
        b=e7cZT1LOvZkl7WbTIcLMm9L5YTvQxliY01QA3YC6Ow3w6TH+Sj6WPBpoQKqrmHYVNd
         NC4vJBE/6cPVp3mQMecixJyq5vFrtQIXEPkE4dAGL2ib+uXHHW+SR4vbzjy+BBSSb8QV
         6D8ZTBmcqtfwTBs+egQonfRGe6u8FmqB4hFOI1tyzBL1WjUsD0/z4BfP9jM57VVhSHvV
         2ZGPUjNnkQCe2WkLhzdropKKRHDwASEz6K0xHBYOWrhODPcOZsgYgc/8DSLNj6BnbxXS
         di+9bSjRPJkNu+2lq54skZwNS1KbycAPH4mK8b9u5WbzgAOUzQOUrZLOCRVDsr34raoX
         dM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249899; x=1761854699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSp3ympZ3+O5RJFTp67NWvTt3blfkpzAhzcIg0++r6w=;
        b=r9ITltqXzP8olGfeYc5kxfRVfYjR9pFoQLWzMxWxR562IPx8l5YMupPPeF75MHhxNZ
         jGA6sgMCW4P8NIm0WzTvttc/sgJOGTwJeHwdGd229HqoJK0bQ+hx/yHTevrQCFBAhMCj
         9GRwHZl8uYFUfwVCEtMNrvgV3mX3S253VQBwxGH+nC2vSfY31pxJsGuyAYevFphJZWAC
         NZAVzzE9IqNHNxZH/3z+afSKRWdSgFc4ptxwCbB4n7gCK0ONMuRVlek6fGOmORz6JTkD
         0bF/VG3ZNIl3C/k61xueY5PoqEJZBPtwnL1HJyukLQEpH3YUrXtOKtzioDTRZ5HOi75m
         GhuA==
X-Forwarded-Encrypted: i=1; AJvYcCUxrWdDgvUces95EdUaPYEWVk4Y8wE8wqe2mRoXE5tglLGQBgLRx9cX9PWCu/PIvfxaZS+fH8X+nFSRgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgkhAMloszfru4qJMT1zk0ESju4TeLGDS1RXY3oJw6lj0Wk4d
	zmxKrc3RtueAAVZfBpD/TipHukIm0ffpAtN1tS3/4O8LPnpcZNKiOESU
X-Gm-Gg: ASbGncv61G2S5sGh1k/cuY//3oM4Lz/TMxnqa/5JnVjQYCP5krigQI9/+a5daMFz4HW
	fqOAK8AJ1L91ff96wSais3b5Uy2NrA4P71rG2OItOZnxHMRTlxH6q9Nio0MmCBGXrT9xKWSWlrI
	yH5VYY5DFeo/Jwj46i0YD2RQooNMha5qLvSvMZ9KB2ISeajspGVQRnjtnpnhE1akEr73sa0FoBj
	a6mHfEww/eXGJcyiHAqAXCAtE5+rhYtzoPGOM9x/36xDbVF3hgFJ1umdLlMHPTX6NhqgLnWiFKg
	OMX9k3AE1jUbVxz9PXI9wvsxKhRZKn7gO/QdjND3z9+yZk5uvwWUi5xauxBnW9buhK6bZp0CYb7
	PyNAaTI+Zi8jekiur+rL9yYKtQQn8Y9GOX9R2MZtKxHmLNPhbIQyeX2CuOMe3EE+7UL3AAtuxBj
	MrRgmm0xAzGh2SYwjYSM/J9L5yLh7uyT57
X-Google-Smtp-Source: AGHT+IFnIWHXC3BcAZTme+7RJNULJRLszP7Sn8bvFSiN+JB/Gadbl3G7cChfitx/q87/RS6AnSn23w==
X-Received: by 2002:a5d:5f46:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-42704d966ddmr19117238f8f.29.1761249899082;
        Thu, 23 Oct 2025 13:04:59 -0700 (PDT)
Received: from [192.168.1.121] ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4298b9963ccsm3851616f8f.7.2025.10.23.13.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:04:58 -0700 (PDT)
Message-ID: <3947f772-691b-46a2-af68-15825e7f4939@gmail.com>
Date: Thu, 23 Oct 2025 22:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] HID: asus: simplify RGB init sequence
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-2-lkml@antheas.dev>
 <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
 <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/23/25 20:06, Antheas Kapenekakis wrote:
> On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 10/18/25 12:17, Antheas Kapenekakis wrote:
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
>> What benefits do we get from removing the unused initialization?
>>
>> If this has never caused any troubles I don't see the reason for removing
>> them. Moreover the lighting protocol is known and I might as well add
>> support for it in the near future,
> I already have a patch that adds RGB and delay inits that endpoint. It
> got removed to make this easier to merge. See [1].
>
> [1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/
I have to main concerns about this:

1. taking away initialization commands in one patchset to make it
easier to merge another unrelated patch doesn't seem the right thing
to do if the other patch it's not in the same series.

I can see [1] has been removed from the set for a later moment in time,
it's fine if it needs more work, just send something that function in the
same way and do not remove initialization commands when unnecessary,
especially since there will be for sure future development.

2. Your patchset resolves around keyboard backlight control and how
the keyboard device is exposed to userspace: it's fine but I do not see
the point in removing initialization commands that has nothing to do
with the issue we are trying to solve here.

Please leave 0x5E and 0x5D initialization commands where they are now.

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
>>> -
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

