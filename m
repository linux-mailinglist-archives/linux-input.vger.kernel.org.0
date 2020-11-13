Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9582B22CD
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 18:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgKMRpl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 12:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKMRpl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 12:45:41 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D471C0613D1;
        Fri, 13 Nov 2020 09:45:41 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n89so9667947otn.3;
        Fri, 13 Nov 2020 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3EZByT1zquCKI3tJAU+7LG89e+iMM8LuM0+NXD2/HaA=;
        b=vg3SSRPPeuIIpwkesAa9QdeCB8MjLXR4Da2h5oYD50jBzJzAbTezMWi4GXPEtaWcXe
         aHXCZjk2rWVNEOKDtWr46R1/DFJbA9mQornIrSsO2IWPKSE9XAKrC2cKw11yaf2JUdaO
         Ri6bwRVbLldmJIXtDmuImbPpSeWB3EMdHhJRCMPW6k7o9mo18oyvFUeSjlRD07Jgz6wj
         ASqrDrYui2x7YUQZSC0CfLmA7Q5GcR6AX6w5xP1JC4YyUv6V8+Ne9D8Gh92SZmZjn4Xp
         WE1u1d6jAMoG/+3mbWPykGwPpP9HHNO05LuyEEWZsezucYq8Dujov1qUNQVWUKF+6Ei9
         KE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3EZByT1zquCKI3tJAU+7LG89e+iMM8LuM0+NXD2/HaA=;
        b=r5jd9ANf29yDLQkP+YsYY5LnRcNpEwddCcKD2QPlbx3Zyv2MQT5tkoRzT1A4XQDKDp
         ekMwTIz+JuWf1+XrgA2DebJhicBU1oaxAP/LY52dJ9CFzhAnm4nwlqIHUOrGMhmmP6iM
         NROX2h5HywE+106Q3+nIgMiuPjnccwgvL8KeGlbBsJD6eiNRgxC9d+5ZsRAdWFfAftMd
         7V8HdiEP7DBk7kq6twQ3PaAwhJitTLbGun4JRaf6q+QGKUXUOxYeQ07JsTc99xk5E17z
         DRZoCx9mF5JYsEAGJnI4MStMS5mfdJaKyL3MrWTk+0U6NBc5Khgz4+qfp/e8fMrf8iGM
         YzFA==
X-Gm-Message-State: AOAM531Z1JrZsIO/GuuGznNG+Yz1qzhC9m3oQ+HgYqHFiN1QU7CKASFk
        jyw7DSW+D0BvD7+F7/gU5DAwPCWmDzuge5FZ
X-Google-Smtp-Source: ABdhPJwA/h7lbKSIiaL9qgR6RdsLg66blL90+VbzCMxp4MWdw7U7acnjTXdDzvhUS6hR9bH2cVBRGA==
X-Received: by 2002:a9d:190a:: with SMTP id j10mr2302462ota.264.1605289539163;
        Fri, 13 Nov 2020 09:45:39 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::35? ([2600:1700:4a30:eaf0::35])
        by smtp.gmail.com with ESMTPSA id n1sm2031244oig.20.2020.11.13.09.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:45:38 -0800 (PST)
Subject: Re: [PATCH v2] Input: Add devices for
 HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Michael Wright <michaelwr@android.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Chris Ye <lzye@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20201101193452.678628-1-lzye@google.com>
 <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
 <e39fbd02-e691-010c-702d-de86ecfc8854@gmail.com>
 <CALDEARh3325ZxQqY58T6imT3QBAkKX_i7ZnuX3PFJ9uQjofozA@mail.gmail.com>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <5e7c71d1-82c8-bcc0-f0fe-6d83f086cdbf@gmail.com>
Date:   Fri, 13 Nov 2020 09:45:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALDEARh3325ZxQqY58T6imT3QBAkKX_i7ZnuX3PFJ9uQjofozA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Great, thanks a lot Michael!

On 11/13/20 9:43 AM, Michael Wright wrote:
> Hi Chris,
>
> I believe the patch is applied to the HID tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.10/upstream-fixes&id=f59ee399de4a8ca4d7d19cdcabb4b63e94867f09
>
> If so, the commit SHA is f59ee399de4a8ca4d7d19cdcabb4b63e94867f09.
>
> Hope this helps,
> Michael
>
>
> On Fri, Nov 13, 2020 at 5:27 PM Chris Ye <linzhao.ye@gmail.com> wrote:
>> Hi Jiri,  can I have a commit ID for 5.10? I'll need this to submit the
>> patch internally.
>>
>> Thanks!
>>
>> Chris
>>
>> On 11/9/20 3:55 AM, Jiri Kosina wrote:
>>> On Sun, 1 Nov 2020, Chris Ye wrote:
>>>
>>>> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>>>> index 74be76e848bf..cf55dca494f3 100644
>>>> --- a/drivers/hid/hid-ids.h
>>>> +++ b/drivers/hid/hid-ids.h
>>>> @@ -449,6 +449,10 @@
>>>>    #define USB_VENDOR_ID_FRUCTEL      0x25B6
>>>>    #define USB_DEVICE_ID_GAMETEL_MT_MODE      0x0002
>>>>
>>>> +#define USB_VENDOR_ID_GAMEVICE      0x27F8
>>>> +#define USB_DEVICE_ID_GAMEVICE_GV186        0x0BBE
>>>> +#define USB_DEVICE_ID_GAMEVICE_KISHI        0x0BBF
>>>> +
>>>>    #define USB_VENDOR_ID_GAMERON              0x0810
>>>>    #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR     0x0001
>>>>    #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR     0x0002
>>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>>>> index 0440e2f6e8a3..36d94e3485e3 100644
>>>> --- a/drivers/hid/hid-quirks.c
>>>> +++ b/drivers/hid/hid-quirks.c
>>>> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
>>>> +    { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
>>>> +            HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>>>> +    { HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
>>>> +            HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>>> Applied for 5.10, thanks.
>>>
