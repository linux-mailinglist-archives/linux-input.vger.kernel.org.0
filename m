Return-Path: <linux-input+bounces-17174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF9D38F47
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 16:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33CB30141C4
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 15:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7E41FE451;
	Sat, 17 Jan 2026 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gzVPS87v"
X-Original-To: linux-input@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBAC1F8755
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768662824; cv=none; b=jkcyFu21ck9T8WBQtZw6jepSaNCI2eGtriuGDFZfZzlEV9NI8ZWn5laTNV3CL5psMmql87W3o+36FOJWh6gSEcVPiTjKrVA84Xg9MDtMesScmnMxCT5cfBtdF3ZhfvPiO/XljVzB6TT21GFiZnqWLNB9zgOlXK3hCJlvzpDPZ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768662824; c=relaxed/simple;
	bh=9RGK9ABErnsXo2N4Y/0kOrTPk15elevNrxjuUdqKJ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcVvkI95JHA9AzVQC8AMUmYpx6dudCgeMD8ortv7Koi7T0vWOpOAniQQx5+l0rP+0mXV0IavSLVoVSIds9CC8jwXhRrQf2elzzIywKsjzaLjDihBvOR3EFSvYqLHyYwe7qTWllJMXqCFs3BmTwT4PNkPVS8nqGkt+KH9Obr5rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gzVPS87v; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <8102eb26-5206-49e6-a994-a9d3ea480255@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768662809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Im41TO5G1qmYv4FxsE3eAhckPHa3zxj5Zit0rL2J7aA=;
	b=gzVPS87vPI6hlw38is5NYbQ0OnTyC5MfDe+cKHg5wUxlJMq33yffH0Z/1am2v2AJYvwvGo
	gLDUkUb+4v2g4V2ZcqT1a66X0VRIVHr+jwooHVJ+lJ0n7maWdtSYmm4dz8Q7u0RtitFAtT
	2z7ECz2RdCQ2ZwFCTEVevKAq5RJ8zcA=
Date: Sat, 17 Jan 2026 16:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
 <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
 <fe66c416-161c-489e-a38f-9dc7729c6ed7@linux.dev>
 <CAGwozwESNrQZ240_qDMf1pdpCRXooxstGcqP10cGp=q-F_SrAQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAGwozwESNrQZ240_qDMf1pdpCRXooxstGcqP10cGp=q-F_SrAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/17/26 16:07, Antheas Kapenekakis wrote:
> On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.dev> wrote:
>>
>> On 1/17/26 00:10, Antheas Kapenekakis wrote:
>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
>>>>
>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
>>>>> However, ID1 initializations are only required for RGB control and are
>>>>> only supported for RGB capable devices. ID2 initializations are only
>>>>> required for initializing the Anime display endpoint which is only
>>>>> supported on devices with an Anime display. Both of these
>>>>> initializations are out of scope for this driver (this is a brightness
>>>>> control and keyboard shortcut driver) and they should not be performed
>>>>> for devices that do not support them in any case.
>>>>>
>>>>> At the same time, there are older NKEY devices that have only been
>>>>> tested with these initializations in the kernel and it is not possible
>>>>> to recheck them. There is a possibility that especially with the ID1
>>>>> initialization, certain laptop models might have their shortcuts stop
>>>>> working (currently unproven).
>>>>>
>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
>>>>> quirk in the block that performs the inits with that.
>>>>>
>>>>> In addition, as these initializations might not be supported by the
>>>>> affected devices, change the function to not bail if they fail.
>>>>>
>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>> index 323e6302bac5..dc7af12cf31a 100644
>>>>> --- a/drivers/hid/hid-asus.c
>>>>> +++ b/drivers/hid/hid-asus.c
>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
>>> Hi Denis,
>>> it is not the responsibility of this driver. ID2 is used by Anime
>>> models. It is a concession to make sure that we do not cause a
>>> regression that will cause warnings for a lot of users.
>> Who decided it is a concession?
> I would rather remove the extra calls unless they are shown to be
> needed, which they might be for these PIDs.
They are needed on older laptop and to not regress userspace.

You just named _LEGACY an usb pid that is not legacy.
> The quirk is named legacy because we can't retest these devices. If we
> can, then we could remove the quirk and the inits if not needed.
We can't retest every device, and that pid is used in pre-2021 models,
and these are the unknown, I am criticizing the name of the quirk here,
not what it does.

I am also questioning if the quirk is even needed since sending
those commands to (at least) recent hardware that doesn't use
those endpoints carries no downsides, while removing them
surely does.
> Antheas
>
>> Anyway I will move relevant code tied to these two to this driver,
>> so it doesn't make sense to remove them anyway.
>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
>>>> No consequences.
>>> In your laptop. In the other user's laptop, the get feature report fails
>> for the response to be a failure (as it is supposed to be in mine and other models)
>> and to cause problems are two different things. Here I am saying that the hardware
>> correctly reports "unsupported" and nothing bad happens (if you ignore the return value).
>>>> Regardless the name is wrong: mine is a 2023 rog strix with
>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
>>>> and surely isn't legacy.
>>> Sure, can you try removing the if block?
>> I have asked to distribute a kernel that init ID1 and ID2 regardless
>> of that quirk. We will soon know if it causes problems or not.
>>> If it works in your laptop, that is one less reason to keep it for 19b6
>> If it works in my laptop one more reason not to exclude code that
>> works and haven't caused any problem ever.
>>> Antheas
>>>
>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>>>                                                QUIRK_NO_INIT_REPORTS | \
>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>>               return -ENODEV;
>>>>>
>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>>       }
>>>>>
>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
>>>>>         QUIRK_USE_KBD_BACKLIGHT },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
>>>>
>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
>>>>> However, ID1 initializations are only required for RGB control and are
>>>>> only supported for RGB capable devices. ID2 initializations are only
>>>>> required for initializing the Anime display endpoint which is only
>>>>> supported on devices with an Anime display. Both of these
>>>>> initializations are out of scope for this driver (this is a brightness
>>>>> control and keyboard shortcut driver) and they should not be performed
>>>>> for devices that do not support them in any case.
>>>>>
>>>>> At the same time, there are older NKEY devices that have only been
>>>>> tested with these initializations in the kernel and it is not possible
>>>>> to recheck them. There is a possibility that especially with the ID1
>>>>> initialization, certain laptop models might have their shortcuts stop
>>>>> working (currently unproven).
>>>>>
>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
>>>>> quirk in the block that performs the inits with that.
>>>>>
>>>>> In addition, as these initializations might not be supported by the
>>>>> affected devices, change the function to not bail if they fail.
>>>>>
>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>> index 323e6302bac5..dc7af12cf31a 100644
>>>>> --- a/drivers/hid/hid-asus.c
>>>>> +++ b/drivers/hid/hid-asus.c
>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
>>>>
>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
>>>> No consequences.
>>>>
>>>> Regardless the name is wrong: mine is a 2023 rog strix with
>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
>>>> and surely isn't legacy.
>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>>>                                                QUIRK_NO_INIT_REPORTS | \
>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>>               return -ENODEV;
>>>>>
>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>>       }
>>>>>
>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
>>>>>         QUIRK_USE_KBD_BACKLIGHT },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },

