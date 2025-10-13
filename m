Return-Path: <linux-input+bounces-15447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB4BD6AA5
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 00:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7913E7F87
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186002E283A;
	Mon, 13 Oct 2025 22:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVg5gHbF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0292571A5
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760395864; cv=none; b=FLV+kQUcZQxlaNAsRceNRIFoLtTq8uuXgH1CVrlOnqfebmlN0bhHcsOlvEPlfQPJA+qwlvrjV/v30n59zWysZ0j5ssrpNlyrWcGxHrFIShXcyZjpjaNp2WRF4nRa9OYH/Xg/wgoBPeR7p3EYN7yXLCuaO9ezkymPzwoB66w/LTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760395864; c=relaxed/simple;
	bh=4hdMkBcIlxdNSHdJG1oVcukAr560whAOqOXRcMuQzJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPEvlSfzQiYp6blIKSz1CQpl1sfO258nmgsRjFrvntwxb97KtlRCtVBNDQ6E9j5kc6gjbl8oX1pJYJNaEak0njoWAWYE9EiboZDpN8bwYt1nCyjoBCCmjdITr3BN6z/R2KrXe7DNJYEIiNj9+rEoObpgTa19tIzAr9HrVHcTDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVg5gHbF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso2888448f8f.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760395860; x=1761000660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2x2QRbJMEe8ACU/qqjxgwqBfSWUAjEirSAkpltOyPQc=;
        b=VVg5gHbFVCWrJ5jYEAIl9knwa9FpxaeUoNDJYs/zlJHR3L7pt7GgSbZECYzx9FftbH
         swtXBY9LmMZMjlu4RG7Azody5MZyxQud0SXOf4eOJP5hqanF3bmncn9h1Z0zYIGJl+0s
         rvhjiFcxvqG6RCtSvBclbn/tagzSWlNmg28nrKBokXTw0YHes+LNyu8lkLcKDeHAVMfc
         EKxdee7kC73kkDgvwxMBaQFR2dfQkYWa17olIni3GwHcY9EY8UWz70TJvq60xMGlNiyh
         Z3soMJagcFbgIKyFEs5Zz/j9wwM95/4uPzudF+zQkskobo6RXdk+AvboDW3a2zP42C2m
         ugow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760395860; x=1761000660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2x2QRbJMEe8ACU/qqjxgwqBfSWUAjEirSAkpltOyPQc=;
        b=H9GNanrKZBoolZy3cQrVvm8/yU6IJwJn4rMcRlu6rMH9gbJ5K0OwpUUqDcHtwAEA+x
         jlX//xx88SkKHdGAgB9+S2Fyss/gYadFetdBcjj+/MmoefeUO/LNpLOZqtuRdPLLiEIt
         JmOJA7IpZJ6uXP4KLiU/qkQnZdyRpgY7KsmiN/imevAh8G4ZsH435q0Wqx9JXaA3Gm+q
         sSDSU0Paef3HlA5WB9feXBRO4H3VNFCf4sICEq/yWS5g9/PGAIMofADakQUNtT2/adFB
         UkrhnORXHB8DA559v0xmAihDheYu9Q4LGISHbYP1OZ39OFGFVLLH0tbeMnWfnYds6IZh
         Q7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJjA9bWy+ZxllH5C72nFlCZ0NlUyHBLndnvyhoimbI+Sy1auukziLNXeSpeIxWNTCabnr/OJX3etlYGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSYOKML3jfHIxeyR2frswH2aUwrPpGLjC11ljd4vEIq7Li1AD
	9D9nEM2cDj4b8q3VBgTgxgjOAS4BifQtH70ydZZqtOaU6HEZAHjgwhJJ
X-Gm-Gg: ASbGncsYTd11Xw7OdXu0PkHOwjuHB08QIESPN2n1LqHV+yBfd3pXy99l+Xv1L7Lv0xk
	o65CBdZ3c6qXI4ytnBsF2zW2ngS3rRFX5BF6DjEmTgZK1f+rTYBShuQdyPmkh4OHFKkgQhTyTcW
	zMNCQmIDADcL8br4kBZ4uv/x3J7DGYtFnxtkJsKg9ZPomrD0G/GWIgmgRyRW7onOvKfmX7IQnLX
	LGA75b8mzDqvc62OKl5H7m/WCW6aBoNXznRtik0B/ZWS7YWl23/4TAZIQ6+QB7OBRPSnSTjzeYX
	QBADL68Xhv6ZKXSrY89ciK82F7v1HplW70lefklzhFuHR0zWz3jMZKqdl8QgxloPgrwEtrxma5L
	geZ6L814CqTIlHctGqawpyJ9abtJX9yBFwLkoICDlB/oyQJG7T0+/ijrL+16RhYB1xA==
X-Google-Smtp-Source: AGHT+IErRlsWPPy1/nZGHMbk1L2NiQXNQO1g/VPjoAtC8k8CVey+6Orod80+zbOAqUKI3rvyy/D/cg==
X-Received: by 2002:a05:6000:1887:b0:3ec:e226:c580 with SMTP id ffacd0b85a97d-4267b339754mr15017773f8f.60.1760395860139;
        Mon, 13 Oct 2025 15:51:00 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf71dsm19756058f8f.29.2025.10.13.15.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:50:59 -0700 (PDT)
Message-ID: <65e6c797-b878-4f0f-90ed-c2437d2becbe@gmail.com>
Date: Tue, 14 Oct 2025 00:50:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-5-lkml@antheas.dev>
 <e1e6ee09-ea29-4328-9eae-f2a4a23b3edc@gmail.com>
 <CAGwozwHP6ukxBRpOFU+XQL5gyNKu5f-HUJio-=F6rAGUmcm2tw@mail.gmail.com>
 <bb149ff1-5fbc-41ff-a4e8-51f6b8631b5e@gmail.com>
 <CAGwozwHogocd8FHn31tZY15-N_Kdaoy8cYqtdxte=H3Qioj_ug@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwHogocd8FHn31tZY15-N_Kdaoy8cYqtdxte=H3Qioj_ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/14/25 00:18, Antheas Kapenekakis wrote:
> On Tue, 14 Oct 2025 at 00:06, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 10/13/25 23:57, Antheas Kapenekakis wrote:
>>> On Mon, 13 Oct 2025 at 23:44, Denis Benato <benato.denis96@gmail.com> wrote:
>>>> On 10/13/25 22:15, Antheas Kapenekakis wrote:
>>>>> Some ROG laptops expose multiple interfaces for controlling the
>>>>> keyboard/RGB brightness. This creates a name conflict under
>>>>> asus::kbd_brightness, where the second device ends up being
>>>>> named asus::kbd_brightness_1 and they are both broken.
>>>> Can you please reference a bug report and/or an analysis of why they ends
>>>> up being broken?
>>> You can reference the V1 description [1]
>>>
>>> [1] https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>> oh okay thanks. I would suggest to keep relevant parts in successive revisions,
>> and most importantly repeat (a shorter description of) relevant parts on the proper
>> commit since commit messages will (hopefully) become part of the kernel,
>> because just reading messages of the current revision doesn't give the full picture
>> of the what and why,
> It's true I cut out the introduction, perhaps I shouldn't have, but it
> will get thrown away anyway. I think the commit body is detailed
> enough though.
I am aware the cover letter won't be part of the kernel, it's why I asked for the
relevant context to be repeated in the appropriate commit message.

I don't think commit messages are detailed enough: a few more explanation
lines would surely help a reader as messages are more centered on the "what" and
not the "why".

Note: this comment of mine is not limited to this particular commit:
look at how long the v1 cover letter is and how long commit messages are
once combined. A lot that has been left out should really be included
(personal opinion of mine, looking at this for the first time: it would have helped).

Thanks,
Denis

> I am looping you in late, but since you are taking over
> Luke's series and you ended up moving the quirks this series removes
> and earlier series did not, you will have some merge conflicts.
>
> By the way, remember to sign off that series yourself as well, since
> you are changing the commits.
>
> Antheas
>
>
>> Regards,
>> Denis
>>>>> Therefore, register a listener to the asus-wmi brightness device
>>>>> instead of creating a new one.
>>>>>
>>>>> Reviewed-by: Luke D. Jones <luke@ljones.dev>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>  drivers/hid/hid-asus.c | 64 +++++++-----------------------------------
>>>>>  1 file changed, 10 insertions(+), 54 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>> index a62559e3e064..0af19c8ef035 100644
>>>>> --- a/drivers/hid/hid-asus.c
>>>>> +++ b/drivers/hid/hid-asus.c
>>>>> @@ -102,7 +102,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>>>>>
>>>>>  struct asus_kbd_leds {
>>>>> -     struct led_classdev cdev;
>>>>> +     struct asus_hid_listener listener;
>>>> It is my understanding from "register a listener .... instead of creating a new one"
>>>> that you are attempting to use the same listener among many devices... so why isn't
>>>> this a pointer? And more importantly: why do we have bool available, bool registered
>>>> instead of either one or the other being replaced by this field being possibly NULL?
>>> A listener is the handle that is passed to asus-wmi so that it can
>>> communicate with hid-asus. Since the flow of communication flows from
>>> asus-wmi -> hid-asus, the pointer is placed on asus-wmi.
>>>
>>> The boolean kbd_led_avail is used to signify whether the BIOS supports
>>> RGB commands. If not, we still want the common handler to be there to
>>> link multiple hid-asus devices together. At the same time, we need to
>>> skip calling the bios commands for brightness, and hold a value for
>>> the previous brightness outside the bios.
>>>
>>> The kbd_led_registered fixes the race condition that happens between
>>> hid-asus and asus-wmi. Specifically, it ensures that the rgb listener
>>> is only setup once, either once asus-wmi loads (if it supports RGB) or
>>> when the first hid device loads.
>>>
>>> Best,
>>> Antheas
>>>
>>>>>       struct hid_device *hdev;
>>>>>       struct work_struct work;
>>>>>       unsigned int brightness;
>>>>> @@ -495,11 +495,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>>>>>       spin_unlock_irqrestore(&led->lock, flags);
>>>>>  }
>>>>>
>>>>> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>>>>> -                                enum led_brightness brightness)
>>>>> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
>>>>> +                                int brightness)
>>>>>  {
>>>>> -     struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
>>>>> -                                              cdev);
>>>>> +     struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
>>>>> +                                              listener);
>>>>>       unsigned long flags;
>>>>>
>>>>>       spin_lock_irqsave(&led->lock, flags);
>>>>> @@ -509,20 +509,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>>>>>       asus_schedule_work(led);
>>>>>  }
>>>>>
>>>>> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
>>>>> -{
>>>>> -     struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
>>>>> -                                              cdev);
>>>>> -     enum led_brightness brightness;
>>>>> -     unsigned long flags;
>>>>> -
>>>>> -     spin_lock_irqsave(&led->lock, flags);
>>>>> -     brightness = led->brightness;
>>>>> -     spin_unlock_irqrestore(&led->lock, flags);
>>>>> -
>>>>> -     return brightness;
>>>>> -}
>>>>> -
>>>>>  static void asus_kbd_backlight_work(struct work_struct *work)
>>>>>  {
>>>>>       struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>>>>> @@ -539,34 +525,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>>>>>               hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>>>>>  }
>>>>>
>>>>> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
>>>>> - * precedence. We only activate HID-based backlight control when the
>>>>> - * WMI control is not available.
>>>>> - */
>>>>> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>>>>> -{
>>>>> -     struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>>>>> -     u32 value;
>>>>> -     int ret;
>>>>> -
>>>>> -     if (!IS_ENABLED(CONFIG_ASUS_WMI))
>>>>> -             return false;
>>>>> -
>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>>>>> -                     dmi_check_system(asus_use_hid_led_dmi_ids)) {
>>>>> -             hid_info(hdev, "using HID for asus::kbd_backlight\n");
>>>>> -             return false;
>>>>> -     }
>>>>> -
>>>>> -     ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>>>>> -                                    ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
>>>>> -     hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
>>>>> -     if (ret)
>>>>> -             return false;
>>>>> -
>>>>> -     return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>>>>> -}
>>>>> -
>>>>>  /*
>>>>>   * We don't care about any other part of the string except the version section.
>>>>>   * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
>>>>> @@ -701,14 +659,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>       drvdata->kbd_backlight->removed = false;
>>>>>       drvdata->kbd_backlight->brightness = 0;
>>>>>       drvdata->kbd_backlight->hdev = hdev;
>>>>> -     drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
>>>>> -     drvdata->kbd_backlight->cdev.max_brightness = 3;
>>>>> -     drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
>>>>> -     drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
>>>>> +     drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>>>>>       INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>>>>>       spin_lock_init(&drvdata->kbd_backlight->lock);
>>>>>
>>>>> -     ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
>>>>> +     ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
>>>>>       if (ret < 0) {
>>>>>               /* No need to have this still around */
>>>>>               devm_kfree(&hdev->dev, drvdata->kbd_backlight);
>>>>> @@ -1105,7 +1060,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
>>>>>
>>>>>       if (drvdata->kbd_backlight) {
>>>>>               const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
>>>>> -                             drvdata->kbd_backlight->cdev.brightness };
>>>>> +                             drvdata->kbd_backlight->brightness };
>>>>>               ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>>>>>               if (ret < 0) {
>>>>>                       hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>>>>> @@ -1241,7 +1196,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>>>       }
>>>>>
>>>>>       if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
>>>>> -         !asus_kbd_wmi_led_control_present(hdev) &&
>>>>>           asus_kbd_register_leds(hdev))
>>>>>               hid_warn(hdev, "Failed to initialize backlight.\n");
>>>>>
>>>>> @@ -1282,6 +1236,8 @@ static void asus_remove(struct hid_device *hdev)
>>>>>       unsigned long flags;
>>>>>
>>>>>       if (drvdata->kbd_backlight) {
>>>>> +             asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
>>>>> +
>>>>>               spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>>>>>               drvdata->kbd_backlight->removed = true;
>>>>>               spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);

