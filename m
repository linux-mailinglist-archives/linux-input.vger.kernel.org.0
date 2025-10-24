Return-Path: <linux-input+bounces-15705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB286C07D29
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 20:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9404C188B339
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 18:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F1734B41E;
	Fri, 24 Oct 2025 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvloN1Ia"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB4337699
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761332028; cv=none; b=mIHaWBDMOh/78UznCahtYz/qs6rGmS6RYeaYwjWtpE+Ozn6xHDylIegt8Sv2zJqNE1uPbLqwNpGplnc2mex6Ct9HQf0O0Da5ydkG5OMIyyfq99ll0C9T+G7kSn5eyDzh4KMKZGLFjqrneShaVvfYKPCAam9Gyx/5Aw5t2yQwj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761332028; c=relaxed/simple;
	bh=dJcE6rcNqwGVWonbMZZ8d5SPMUehDoxU7j+tQaUNSk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNhad9re0y+u7qcYNJ3t8rZ6fu6WmZvzr1cLH0VR8uFxsVYR3PTmexrQl2WmUsM/wBLRu1unDB5EMms0Qg/fsRGw9L3bISqHYkSbRFV/PunaHv+RczFssQ5RV0zhYNIdHR2IcgpNppYhn68FjqlWNvk/gKC7Vt1iAHgsNtSFDeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvloN1Ia; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ece1102998so1637953f8f.2
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761332024; x=1761936824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxF1QW8cAyFKj/tjgXZgmpujjZS1k0LEfT4PktZPYzk=;
        b=gvloN1IaYUerFI5NoXiNgTHGqaNVxhSW7x7b1ISdufaIdoTvjBaV7DfoGtd2fjpxJ2
         l2Y3PZonWcMOtagKss7/BCKeDFWwrIgw8enwVNWzsrIQacYKyY2nfwwwu8r6xbyZQ1VX
         jM9HvMKRk+bNpuDUWy5Kv104AAiLEY/04TQIRUHYi99aLyuabvf5/Mf0s5zy4Rtx12wX
         BjunqX/CD6LPqxUBxulVOGFQA0gBQDtzm6ljgN3niuLrLUrOwFMaC1Ogl+lqOpjYMRRs
         BncKJqLgDW0n2I0CZeWANInTo6gyZfPI43rDLeBpMpZdVJnK0VehV/jX2XLzQwnZDoyD
         KR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761332024; x=1761936824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxF1QW8cAyFKj/tjgXZgmpujjZS1k0LEfT4PktZPYzk=;
        b=UakFpdcrjCt22+jaKxzppL0LBCZELQXmp6uX/6HSjvkKGCrVCmb4dpi6/YNPW37wGs
         OSHjzm+wBU6DZE17tWrqGj8MXy5bYvodjwLP9pwN60YmdNpDznNAGugZeHW6aUBdoW/C
         PLChLV/mGbiNitVI6lMtFc4NQU6Q0Px13IPMShF31V+dJ10okLoGZnIBfzjbP/CpSszE
         MeeU1dKmMINRTdpxbDxmEsRP2EYPHYYsVB0T+7aM5JaEhCsHH3x4cOSh87Dd6Pvt5xH3
         LrCYLmqbldA8w13MzZ3tyh0cvm3Z3DjWUX07sWZsg7JJ5qTX/kz7n1vBV3BkEYVK55qO
         qZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtmRAmNuF8vogEt1z6IYN3AgIKUrCvwVEu4o1m65lHOO4obeeQcXcGXaAwvBl/O4VSbqXsBNeQ+qtUPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr78WsL9QqPB+p3BRg6uUonsuhnChMeaxDgavyceOMmbnaCjdz
	1vUUpJPufFav8j1lM2Vn8uoj/p+zadzUX1rnPc0mRY8Q2DUhUK2D+X/x
X-Gm-Gg: ASbGncsYatZhBXvOYs2XyvEAty/4qe8YeAkOz6vxoGWMR2vkLlTIENsJH52bjfRy3wX
	lAzmdKCm040Ry0uKwwWZwI1xKyQofV4tkLeImLspMRbNlKZiapbQ48dWs2X9z2DpDRtc0cV14X5
	DknUe+rni01gPnXpW6LItQT4Akukq0V3QfdhUQetJkhXqWNj4UZekUvClHSFIw2rcUOFiuQnR98
	Z8ErgZeMgq/sOdlRcF9ecUpwRus7vzJ8UwFIkdRqeYMcmr2cxrLZn/xIWGOFJQAapMYmTfoHTma
	mqzr1i7Cw2J2NfEJqjdY+OIJX+Hw2N6SrqzmyC4ehVpWRbOirOS/V40x9M4dPWd/RwGAmzSovMB
	HUdAhlqbuVBfE/nzWkVCYK6ZxDlZWuZ/KQGnuxnCuhDR8ePbvzkDQox0tNU/Nq4tjaOFTFDy9Lj
	Zz57mRuHBt3ERJMjGR6M/Isg==
X-Google-Smtp-Source: AGHT+IFLcBIoGTjq6nBKEAvczGM6M/mt/a9F1rriOiDcfQKHqScAvYjeSwrNyN0wRYJijROBaRQUyA==
X-Received: by 2002:a5d:5f55:0:b0:427:a3d:7695 with SMTP id ffacd0b85a97d-4298a059e96mr5880410f8f.26.1761332024030;
        Fri, 24 Oct 2025 11:53:44 -0700 (PDT)
Received: from [192.168.1.121] ([151.61.20.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccc60sm10713573f8f.34.2025.10.24.11.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 11:53:43 -0700 (PDT)
Message-ID: <0d18666a-78e1-4e69-8fd2-f15052db0cee@gmail.com>
Date: Fri, 24 Oct 2025 20:53:42 +0200
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
 <3947f772-691b-46a2-af68-15825e7f4939@gmail.com>
 <CAGwozwFbQWyuQB6EwLMLon5muff2WudR+oVL62DqP_MXGW+p-Q@mail.gmail.com>
 <b91de7c7-74b8-4cf5-82a4-f3d4eaf418d4@gmail.com>
 <CAGwozwGj-yXHXBan38_NV7G5T66bnjm7om2bz_Bha35AHhtCJQ@mail.gmail.com>
 <CAGwozwEh32XMcGJPKMRBWd63ybYOxW1Wx4QjU-QErjQgLHwX2g@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEh32XMcGJPKMRBWd63ybYOxW1Wx4QjU-QErjQgLHwX2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/24/25 18:20, Antheas Kapenekakis wrote:
> On Fri, 24 Oct 2025 at 01:25, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>> On Fri, 24 Oct 2025 at 00:53, Denis Benato <benato.denis96@gmail.com> wrote:
>>>
>>> On 10/23/25 23:30, Antheas Kapenekakis wrote:
>>>> On Thu, 23 Oct 2025 at 22:05, Denis Benato <benato.denis96@gmail.com> wrote:
>>>>> On 10/23/25 20:06, Antheas Kapenekakis wrote:
>>>>>> On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
>>>>>>> On 10/18/25 12:17, Antheas Kapenekakis wrote:
>>>>>>>> Currently, RGB initialization forks depending on whether a device is
>>>>>>>> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
>>>>>>>> endpoints, and non-NKEY devices with 0x5a and then a
>>>>>>>> backlight check, which is omitted for NKEY devices.
>>>>>>>>
>>>>>>>> Remove the fork, using a common initialization sequence for both,
>>>>>>>> where they are both only initialized with 0x5a, then checked for
>>>>>>>> backlight support. This patch should not affect existing functionality.
>>>>>>>>
>>>>>>>> 0x5d and 0x5e endpoint initializations are performed by Windows
>>>>>>>> userspace programs associated with different usages that reside under
>>>>>>>> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
>>>>>>>> controls RGB and 0x5e by an animation program for certain Asus laptops.
>>>>>>>> Neither is used currently in the driver.
>>>>>>> What benefits do we get from removing the unused initialization?
>>>>>>>
>>>>>>> If this has never caused any troubles I don't see the reason for removing
>>>>>>> them. Moreover the lighting protocol is known and I might as well add
>>>>>>> support for it in the near future,
>>>>>> I already have a patch that adds RGB and delay inits that endpoint. It
>>>>>> got removed to make this easier to merge. See [1].
>>>>>>
>>>>>> [1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/
>>>>> I have to main concerns about this:
>>>>>
>>>>> 1. taking away initialization commands in one patchset to make it
>>>>> easier to merge another unrelated patch doesn't seem the right thing
>>>>> to do if the other patch it's not in the same series.
>>>>>
>>>>> I can see [1] has been removed from the set for a later moment in time,
>>>>> it's fine if it needs more work, just send something that function in the
>>>>> same way and do not remove initialization commands when unnecessary,
>>>>> especially since there will be for sure future development.
>>>> The initialization was removed as part of general cleanup. Not to make
>>>> it easier to merge the RGB patch. In addition, the RGB patch only runs
>>>> the init in a lazy fashion, so if nobody uses the RGB sysfs the init
>>>> does not run and the behavior is the same.
>>> There are a few problems here:
>>> 1. sope creep: either do a cleanup or solve bugs. The fact that your flow z13
>>> doesn't load hid-asus correctly has nothing to do with the initialization of anime.
>>> The fact that hid-asus is driving leds instead of asus-wmi has nothing to do with
>>> anime matrix initialization either.
>>> 2. not sending the initialization can get hardware misbehave because it
>>> is left in an uninitialized state.
>>> 3. there are absolutely zero reasons to do that. There are even less reasons
>>> as to do it as part of this patchset.
>>>
>>>>> 2. Your patchset resolves around keyboard backlight control and how
>>>>> the keyboard device is exposed to userspace: it's fine but I do not see
>>>>> the point in removing initialization commands that has nothing to do
>>>>> with the issue we are trying to solve here.
>>>>>
>>>>> Please leave 0x5E and 0x5D initialization commands where they are now.
>>>> I mean the second part of the patchset does that. The first part is a
>>>> cleanup. What would be the reason for keeping 0x5E and 0x5D? They are
>>>> only used when initializing those endpoints to write further commands
>>>> to them and for identification. The current driver does not write
>>>> commands to those endpoints and identifies itself over 0x5A.
>>> There are no bugs opened that ties initialization of devices to bugs.
>>> Quite the opposite: I can guarantee you that removing part of the
>>> init will introduce regressions.
>>>
>>> The onus is on you to provide strong evidence that the removal is
>>> a necessary act.
>>>
>>> Regardless it is not in the scope of this patchset: remove it.
>>>> I do get that it is a bit risky as some laptops might be hardcoded to
>>>> wait for 0x5D to turn on RGB. Which is why we had the last patch until
>>>> V4. But we have yet to find a laptop that has this problem, so I find
>>>> it difficult to justify keeping the init.
>>> Yes it's risky to remove initialization sequences for a device that is
>>> in every modern ASUS laptop and is tied to the EC.
>>>> Do note that you might need to add the 0x5D init to your userspace
>>>> program for certain laptops if you haven't already. But that is ok,
>>>> since in doing so you are also validating you are speaking to an Asus
>>>> device, which is important.
>>> This doesn't make much sense: why would anyone remove
>>> a command from the kernel, that can be very well essential to some models
>>> (sleep can break, for example) just to add it back in a userspace program?
>>>
>>> What does it mean I have to validate I am speaking to an asus device?
>>> Software selects devices by known attribute, one of them is the vid:pid....
>>> Beside what does this have to do with the removal of initialization commands
>>> from the kernel?
>>>
>>> Even late initializing devices can lead to problems. Windows doesn't do that:
>>> as soon as asus drivers are loaded all relevant initialization sequences are
>>> sent; Windows is the only officially supported OS: do not introduce commands
>>> flow divergence without strong reasons backing it up.
>> If you think keeping 0x5D init is that important, I can spin patch [1]
>> into this series. But then this quirk will stay in the kernel forever.
>> I can even add 0x5E since that does not affect newer devices, which I
>> care for simplifying the sequence.
Fully initializing the device tied to the EC in the same windows does
is not a "quirk". Please stop calling it that.

It will stay on the kernel until we have strong evidence that it is causing
problems, at that point we simply avoid doing it for problematic laptops.

If adding other commands doesn't introduce regressions or are otherwise
easy to bisect and makes more hardware working please do.
>> Luke said these two pairs are the important ones to keep.
>>
>> I'm not sure what to do.
> I was asked by a 2025 Asus Zenbook Duo user to add his IDs in [1]. In
> doing so, I updated the rgb and legacy init patches for the new series
> and added a quirk for early init of the duo keyboards.
I will take a look when I can, but if you haven't removed anything
that shouldn't pose any risk. None that I can think of at the moment anyway.
> The series is 14 patches long, I don't think my email can take it :(
linux.dev accounts for maintainers are provided free of charge
and I had to ask for an account too. I suggest you do the same.
> Should we merge the first part of this series with the legacy init,
> then do the backlight refactor, and finally the new Duo stuff + rgb?
I think so. My only doubt is about the per_app quirk. Other than
that looks good and solves one problem while also better representing
the hardware, so I can't think of any blockers.
> Antheas
>
Thanks,
Denis
>> Antheas
>>
>> [1] https://lore.kernel.org/all/20250325184601.10990-12-lkml@antheas.dev/
>>
>>>> Antheas
>>>>
>>> Denis
>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>>> ---
>>>>>>>>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
>>>>>>>>  1 file changed, 19 insertions(+), 37 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>>>>> index a444d41e53b6..7ea1037c3979 100644
>>>>>>>> --- a/drivers/hid/hid-asus.c
>>>>>>>> +++ b/drivers/hid/hid-asus.c
>>>>>>>> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>>>>       unsigned char kbd_func;
>>>>>>>>       int ret;
>>>>>>>>
>>>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>>>>> -             /* Initialize keyboard */
>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>>>>> -             if (ret < 0)
>>>>>>>> -                     return ret;
>>>>>>>> -
>>>>>>>> -             /* The LED endpoint is initialised in two HID */
>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>>>>> -             if (ret < 0)
>>>>>>>> -                     return ret;
>>>>>>>> -
>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>>>>> -             if (ret < 0)
>>>>>>>> -                     return ret;
>>>>>>>> -
>>>>>>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>>>>> -                     ret = asus_kbd_disable_oobe(hdev);
>>>>>>>> -                     if (ret < 0)
>>>>>>>> -                             return ret;
>>>>>>>> -             }
>>>>>>>> -
>>>>>>>> -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>>>>>>> -                     intf = to_usb_interface(hdev->dev.parent);
>>>>>>>> -                     udev = interface_to_usbdev(intf);
>>>>>>>> -                     validate_mcu_fw_version(hdev,
>>>>>>>> -                             le16_to_cpu(udev->descriptor.idProduct));
>>>>>>>> -             }
>>>>>>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>>>>> +     if (ret < 0)
>>>>>>>> +             return ret;
>>>>>>>>
>>>>>>>> -     } else {
>>>>>>>> -             /* Initialize keyboard */
>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>>>>> -             if (ret < 0)
>>>>>>>> -                     return ret;
>>>>>>>> +     /* Get keyboard functions */
>>>>>>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>>>>> +     if (ret < 0)
>>>>>>>> +             return ret;
>>>>>>>>
>>>>>>>> -             /* Get keyboard functions */
>>>>>>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>>>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>>>>> +             ret = asus_kbd_disable_oobe(hdev);
>>>>>>>>               if (ret < 0)
>>>>>>>>                       return ret;
>>>>>>>> +     }
>>>>>>>>
>>>>>>>> -             /* Check for backlight support */
>>>>>>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>>>>> -                     return -ENODEV;
>>>>>>>> +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>>>>>>> +             intf = to_usb_interface(hdev->dev.parent);
>>>>>>>> +             udev = interface_to_usbdev(intf);
>>>>>>>> +             validate_mcu_fw_version(
>>>>>>>> +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
>>>>>>>>       }
>>>>>>>>
>>>>>>>> +     /* Check for backlight support */
>>>>>>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>>>>> +             return -ENODEV;
>>>>>>>> +
>>>>>>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>>>>>>                                             sizeof(struct asus_kbd_leds),
>>>>>>>>                                             GFP_KERNEL);

