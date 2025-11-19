Return-Path: <linux-input+bounces-16210-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C1C6C665
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 03:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1AE235FF4D
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E98D286422;
	Wed, 19 Nov 2025 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2qMt2Ka"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D128643D
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 02:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519615; cv=none; b=pxe0nr8fhwmLadSgvOlmTysBOT+W0mBZjyN1Sbrda0yXb8ZhcEQjZAZY9gxtRGILEZi1K8QHZWKxXIjkbhrOZIhyZgaW6Hrfqev7+W13M4LrZEBQHDKLqLZ4KseWassjGwCnBF/4IHfwajO16IP+hDE8fTOK3xm1inCTKaId4YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519615; c=relaxed/simple;
	bh=cj7FS8n0vColyVy+W47qxt0G7QShMPu5Ad8Rthb2Iic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sA+qcE5PPfsOffDbF8qIRpp12lV2DAmR4yV0h8+2f6I8AnlSrX1LhOOqoEi+wUMDPqfF0JqE4UWBh44F7miFtWqdx5k66sJOUmwOy0RaSJSYHdE16Yo2+e/Hf02IzqM1BF4QbfyMeOfATWUlqrA+zT9yepb/XzfUvXrcfBFGCQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2qMt2Ka; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so45818545e9.3
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 18:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763519611; x=1764124411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8jsLdIIjIqBVqgB66W4xg7i//zbDwyz5yoMrl38a0M=;
        b=P2qMt2KarGJag7t9hLcfioJBK40ZGPZQ4PNCDhyb9qT0wEIY4aeSwCZN6JY6ilfIak
         BJ/nZl8TnUha/eBs/TfCFcbbRG+EACMQgaxMSnhw8PVGCygRCId0E8UrOhUEhc/FgBrX
         Tcsxeowgh+pqBLcjDn3NMLYCeyrvHAQjLk/1/9w1qtkgZVaUeu+DTYCzs3bTohxJL+MR
         7Czhv8V8okjM7zwXgTja5FPK5TukQnLT+Cpmf3e0EFM8SZazPhzaCeMVSDtpYHbfv8tf
         axH4yd8lD8OyRgfjqSaI65+fCh43KM8kl+d9PTHVcywVCpa8+uqPTiawTV93KC7okZrf
         X8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763519611; x=1764124411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8jsLdIIjIqBVqgB66W4xg7i//zbDwyz5yoMrl38a0M=;
        b=TpR0QyzisoHXCBoc+fEuSKiVLADTcxgOhagUewtBndgKgkkzqiy5zeo0GXExO1HUKB
         e+YF6ejXnzyV1I0jDSbt8T9hk6vnJ2tibldUqPsLT2n6XsnfLp9jQeN+1vdtPbMZRrwd
         U8TU6eQ8ctM5s32hbNXMV0EpoI1yV8xPTonSstQF8LCiFHZPvjWMdZsz1G1HQDQUjjb/
         M1R67WnNyy27ymuc3FmN6zK85UDTTYuXgPHge2S1zBS1plXzNL90nyBYqimPyWlNpzPO
         p+/ATP8fZje/dNQl1vobJleTRwFoat3CPZq8ENNQDW8Tasz259Hmpw5TCwfy5+rZ5msR
         BsGA==
X-Forwarded-Encrypted: i=1; AJvYcCWC0dqR/TZEhlPRUkqdQTHnxwUqMko7J5Qb5KN4NfVTqj03o52oMZQLBLneiG6n2QzAtgYsuU2NIx2f4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4Eph5VwVikfoQsy+2cl4PnwOL+k5E0Xqe4HlyWFNjOgYqdrR
	W70+pF7IzbfUchYsG0azjVv8+8Ie5nv/cO0GCtnjRzer6yLEiLOs9IOF
X-Gm-Gg: ASbGncuhThwpEM0eB3z2vd8wWtpxiKImtGIPrDQ5OBfsqlSeSduUyCukaRmYD66ZpON
	aV17UXUA+jMsdZKCMyWF/6F44g8uiHeBrEsBj+9IuS60OsJ7x+X4MuFN9mh3LIwAshjw3t8Zfyl
	f6EFd8Uq1wx0YVMsfJRx9vEUeONSe/kj8iIgwRAHpmgdoJej+5j0M8yD9sZo4RTQ1ugq6jrsUot
	6brdL23GOfM66e9tamg0g0L+IksEUL98/9kHL3ikZUKIscDHuw6dEn5lIejSu8HYlzmvwMOxYhY
	eLMWQ46YTK2V8qLZx4ahCL32ENJqS+XGJuGRYQOUB3GNGSwsrQqYh10/j2ZssqZ8/h7ms4bySqn
	qoi/TMV/LiDZPsX57Gwkd3u80SuAicw6Udz0UyX6SpIhf+cL0TasO/JxdbZnFsb0ftSYs8+IlOZ
	EgYx6BWtvhtLDuVFwdXym3PuabFl5Mi+Ftfw==
X-Google-Smtp-Source: AGHT+IEZJ3D/pCi3DZzhgnvyPk7IaXvHpngSBiwAv0Oh08N0QMYfGotDsV2MxMC+qCTTfeW5HP9umw==
X-Received: by 2002:a05:600c:5249:b0:477:af07:dd22 with SMTP id 5b1f17b1804b1-477af07dfbcmr25262555e9.28.1763519611240;
        Tue, 18 Nov 2025 18:33:31 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm35623122f8f.41.2025.11.18.18.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 18:33:30 -0800 (PST)
Message-ID: <a68f0dff-0a29-4dc2-ae41-12d646578749@gmail.com>
Date: Wed, 19 Nov 2025 03:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices on
 ROG
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-5-lkml@antheas.dev>
 <abeecb3b-8d51-4625-8743-1cfff355c0e9@gmail.com>
 <CAGwozwEj94txMhgXPigbJxVxw4c=9vSTHNEjpmCXs_fKeSQcXQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEj94txMhgXPigbJxVxw4c=9vSTHNEjpmCXs_fKeSQcXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/19/25 02:45, Antheas Kapenekakis wrote:
> On Wed, 19 Nov 2025 at 01:38, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/1/25 11:47, Antheas Kapenekakis wrote:
>>> Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
>>> event devices with a pretty ASUSTEK name. When it loads, it concatenates
>>> all applications per HID endpoint, renames them, and prints errors
>>> when some of them do not have an input device.
>>>
>>> Therefore, change probe so that this is no longer the case. Stop
>>> renaming the devices, omit the check for .input which causes errors
>>> on e.g., the Z13 for some hiddev only devices, and move RGB checks
>>> into probe.
>> I have an issue with this "therefore" related to the renaming of device:
>> you are basically doing here:
>>
>> state a matter of fact.
>> Therefore, change that.
>>
>> Why? the check for .input is clear why, the rename not so much.
>>
>> I have a few more comments below about the rename.
>>> Reviewed-by: Luke D. Jones <luke@ljones.dev>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/hid/hid-asus.c | 52 ++++++++++++++++++++++++++++--------------
>>>  1 file changed, 35 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 03f0d86936fc..726f5d8e22d1 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>  #define T100CHI_MOUSE_REPORT_ID 0x06
>>>  #define FEATURE_REPORT_ID 0x0d
>>>  #define INPUT_REPORT_ID 0x5d
>>> +#define HID_USAGE_PAGE_VENDOR 0xff310000
>>>  #define FEATURE_KBD_REPORT_ID 0x5a
>>>  #define FEATURE_KBD_REPORT_SIZE 64
>>>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>> @@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
>>> +#define QUIRK_SKIP_REPORT_FIXUP              BIT(14)
>>>
>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>                                                QUIRK_NO_INIT_REPORTS | \
>>> @@ -125,7 +127,6 @@ struct asus_drvdata {
>>>       struct input_dev *tp_kbd_input;
>>>       struct asus_kbd_leds *kbd_backlight;
>>>       const struct asus_touchpad_info *tp;
>>> -     bool enable_backlight;
>>>       struct power_supply *battery;
>>>       struct power_supply_desc battery_desc;
>>>       int battery_capacity;
>>> @@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>>>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>>>                     struct hid_usage *usage, __s32 value)
>>>  {
>>> -     if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
>>> +     if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
>>>           (usage->hid & HID_USAGE) != 0x00 &&
>>>           (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>>>               hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
>>> @@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>>>
>>>       drvdata->input = input;
>>>
>>> -     if (drvdata->enable_backlight &&
>>> -         !asus_kbd_wmi_led_control_present(hdev) &&
>>> -         asus_kbd_register_leds(hdev))
>>> -             hid_warn(hdev, "Failed to initialize backlight.\n");
>>> -
>>>       return 0;
>>>  }
>>>
>>> @@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
>>>                       return -1;
>>>               }
>>>
>>> -             /*
>>> -              * Check and enable backlight only on devices with UsagePage ==
>>> -              * 0xff31 to avoid initializing the keyboard firmware multiple
>>> -              * times on devices with multiple HID descriptors but same
>>> -              * PID/VID.
>>> -              */
>>> -             if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
>>> -                     drvdata->enable_backlight = true;
>>> -
>>>               set_bit(EV_REP, hi->input->evbit);
>>>               return 1;
>>>       }
>>> @@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
>>>
>>>  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>  {
>>> -     int ret;
>>> +     struct hid_report_enum *rep_enum;
>>>       struct asus_drvdata *drvdata;
>>> +     struct hid_report *rep;
>>> +     int ret, is_vendor = 0;
>>>
>> Why is is_vendor an int? Don't we have bools?
>>>       drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>>>       if (drvdata == NULL) {
>>> @@ -1218,12 +1207,37 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>               return ret;
>>>       }
>>>
>>> +     /* Check for vendor for RGB init and handle generic devices properly. */
>>> +     rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
>>> +     list_for_each_entry(rep, &rep_enum->report_list, list) {
>>> +             if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
>>> +                     is_vendor = true;
>>> +     }
>>> +
>>> +     /*
>>> +      * For ROG keyboards, disable fixups except vendor devices.
>>> +      */
>> multiline comment for no reason. Comma doesn't provide any value here.
>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
>>> +             drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
>>> +
>> Doing this will skip the report fixup entirely while before
>> it was called in every case: are we really sure we want this?
>> Or do we want it only for specific devices?
>>
>> It's my understanding that function is only useful on
>> keyboard devices, so before keyboard devices (all)
>> while now is_vendor keyboard devices, right?
> ROG Keyboard devices have multiple HID endpoints. This driver only
> hooks to the 0xff31 endpoint. So the rest of the endpoints should not
> be modified. Except for minor fixups, see below.
>
>> What about keyboard devices that are not is_vendor
>> for which function isn't called anymore?
>>>       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>>>       if (ret) {
>>>               hid_err(hdev, "Asus hw start failed: %d\n", ret);
>>>               return ret;
>>>       }
>>>
>>> +     if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
>>> +         !asus_kbd_wmi_led_control_present(hdev) &&
>>> +         asus_kbd_register_leds(hdev))
>>> +             hid_warn(hdev, "Failed to initialize backlight.\n");
>>> +
>>> +     /*
>>> +      * For ROG keyboards, skip rename for consistency and ->input check as
>>> +      * some devices do not have inputs.
>>> +      */
>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
>>> +             return 0;
>>> +
>> This is a moot point: I have yet to see the real benefit of doing this,
>> but one thing is sure... having for the same driver multiple name
>> to basically the same interface across different lineups of
>> hardware is not something I would call "consistency".
> The reason the rename exists here is because the devices this driver
> applied to originally did not have proper names (e.g. I2C). The new
> ROG devices do have proper names, so there is no reason to deviate
> from those. It also eliminates a point of failure in which the
> hid-asus driver is not loaded, if your point is consistency. Ie, as we
> add more keyboard IDs, those would then not be renamed when hid-asus
> starts to load them.
I understand you don't see a reason to rename them,
but I am also not seeing any reason not to rename them.

Removing a theoretically possible failure in the load path
that nobody has ever reported once IMHO is not a strong
enough motivation to change the name of a device.

Just for clarity I am telling you that I am not particularly
happy but I won't oppose if the userspace won't suffer
from this change.
> As for affected software (per your other email), yes it is only
> Inputplumber when running on its fallback mode without access to its
> OOT modules that disable this driver. Because it had an architectural
> decision to rely on hardcoded evdev/phys names for most devices
> instead of more canonical vid/pid/capability matches. The phys part is
> especially problematic as it also hardcodes the bus node of a lot of
> devices. There is a PR open to remove the matches for the Ally units
> though.
I asked what's the path forward, and for you two to decide how to not
break the "we don't break userspace" rule causing troubles to
users/distro maintainers/valve/whoever.

Have you two reached an agreement yet?
> If you want to know about other software that relies on names, SDL is
> the main one. And the reason for that is so that it matches the kernel
> driver. E.g., when a playstation 5 controller loads using
> hid_playstation, it has a different mapping and name than when it
> loads through hid core. My software also relies on it for WMI
> keyboards, as those have a vid:pid of 0:0 so it is unavoidable.
>
> SDL does not map keyboards so it is not affected. Moreover, as this
> series makes it so the device has the same name as with the driver not
> loaded, software such as SDL would have a fallback mapping for that
> name already.
>
>> As I said already I want you to either drop this or to present
>> a list of pros of doing this and to hear from Derek the plan
>> going forward to avoid breaking anything.
>>>       /*
>>>        * Check that input registration succeeded. Checking that
>>>        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
>>> @@ -1352,6 +1366,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>>>               rdesc = new_rdesc;
>>>       }
>>>
>>> +     /* Vendor fixups should only apply to NKEY vendor devices. */
>>> +     if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
>>> +             return rdesc;
>>> +
>> Uhm... no? Or at least it's not obvious why.
>>
>> If this is the case why is the check not at the top of the function?
> Because the checks above apply to e.g., touchpad devices. This was
> actually a bug with this series in previous versions. Only the report
> fixups should be skipped. Specifically, with previous versions a HID
> application mute was skipped, which caused certain keyboards to show
> up as range finders if I recall (there is a comment for it in this
> driver).
I see... honestly I would insert a summary of this in a comment
somewhere. Probably before that if.
> The report fixups that are below this check are only applicable to the
> 0xff31 devices that emit 0x5a events. Specifically, this driver
> "abuses" the HID subsystem a bit to make the vendor report, which is
> not a HID input device, appear as an input device, by mutating its
> descriptor. But refactoring that would be too painful. At least with
> this we make the fixup apply more precisely to only those devices.
You can put a TL;DR of this as a comment too in the code.
> I kindly ask you finish your comments until tomorrow evening, so I can
> resend this series.
I will try to do what I can, but until I hear an approval from Derek
I can't give my approval knowing this can break a tool in use
and we know it.
> Thanks,
> Antheas
>
>> Beside please refrain from using "should" in this context unless
>> backed up by evidence or it's otherwise obvious as "should"
>> can have many different interpretations.
>>>       if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>>>                       *rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
>>>                       rdesc[204] == 0x95 && rdesc[205] == 0x05) {

