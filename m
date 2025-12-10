Return-Path: <linux-input+bounces-16529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50641CB31F7
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 15:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C7D630AA19A
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D6526E719;
	Wed, 10 Dec 2025 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="r90nnJZE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA2821423C;
	Wed, 10 Dec 2025 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375947; cv=none; b=IR60qmCP35twg0kJXOTKbklCk/7B8x+VIlMS5KBy6QVVoeJufjheQI73kSWUrqfwlReSiO1LGscYaw9Fb0njmLSj6+5QCNkt5yD5X5pii4LUxVmmQzFZUNR1XuMqF/SQlJB/JZbwh870Hbli8OYX31TOcBeCazzUVRlj4wFLk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375947; c=relaxed/simple;
	bh=MYfKQFxwGPTcfDdOYmKtSbtrxxDjUEchvkI/9T3YsK0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qsg3Jghzcfl0NkjfL6LnpDi/lugmZO9Suo/kCM8NUVuMBURrYAabek0A/3xqhbxG4ilaTa+jgHuaOjcI8M2DXpR+GbXdmRWIJW+IVivUEEsR1qqiV5bNaI5/scZgjd85dXPFIip++MQ+R4KkvsqY3NAKUGySfzaCcHgSpJTzibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=r90nnJZE; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 35FC02FC005B;
	Wed, 10 Dec 2025 15:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1765375941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OcWZdxjCwmyx04QjuQ+2LC7VMD6ymAm7TvhXt3PR2j0=;
	b=r90nnJZESyhf7fAEKmTant9B5igCUL+W4/Z3jjjqE3S40DoSoYZ47w3lZ2gy1gGYAPVEAb
	mzInWH63hBrTXeZQ4FGm83TRP7yc4++1h87Gmm2Zu1HbewLSOs2iC5Zx1myDBIWD0ojBwd
	n+1Rp+7jfQ6v/QQJHtGKJNmLu87eMr0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <9f690ec1-9e8b-4862-b1f2-2b68f9be9fb2@tuxedocomputers.com>
Date: Wed, 10 Dec 2025 15:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251112144837.499782-1-wse@tuxedocomputers.com>
 <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 12.11.25 um 16:51 schrieb Werner Sembach:
>
> Am 12.11.25 um 15:47 schrieb Werner Sembach:
>> Uniwill devices have a built in gesture in the touchpad to de- and
>> reactivate it by double taping the upper left corner. This gesture stops
>> working when latency is set to high, so this patch keeps the latency on
>> normal.
Just wanna make sure this doesn't get missed for the 6.19 cycle.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: stable@vger.kernel.org
>> ---
>> V1->V2: Use a quirk to narrow down the devices this is applied to.
>> V2->V3: Fix this patch breaking touchpads on some devices.
>>          Add another device ID.
>>
>> I have three Uniwill devices at hand right now that have at least two
>> physically different touchpads, but same Vendor + Product ID combination.
>> Maybe the vendor uses this product ID for all i2c connected touchpads, or
>> it is used as some kind of subvendor ID to indicate Uniwill?
>>
>> To be able to really narrow it down to Uniwill only devices I would need to
>> check DMI strings, but then I will probably narrow it down to much as I
>> only know what we at TUXEDO use there.
>>
>>   drivers/hid/hid-multitouch.c | 26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>> index 179dc316b4b51..ed9eb4e0d5038 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
>>   #define MT_QUIRK_DISABLE_WAKEUP        BIT(21)
>>   #define MT_QUIRK_ORIENTATION_INVERT    BIT(22)
>>   #define MT_QUIRK_APPLE_TOUCHBAR        BIT(23)
>> +#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE    BIT(24)
>>     #define MT_INPUTMODE_TOUCHSCREEN    0x02
>>   #define MT_INPUTMODE_TOUCHPAD        0x03
>> @@ -211,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct 
>> mt_application *app);
>>   #define MT_CLS_WIN_8_DISABLE_WAKEUP        0x0016
>>   #define MT_CLS_WIN_8_NO_STICKY_FINGERS        0x0017
>>   #define MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU    0x0018
>> +#define MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE    0x0019
> A college realized that at some points in the code some, but not all, of the 
> MT_CLS_WIN_8* classes are checked for directly. Should I add my new class 
> there too?
>>     /* vendor specific classes */
>>   #define MT_CLS_3M                0x0101
>> @@ -330,6 +332,15 @@ static const struct mt_class mt_classes[] = {
>>               MT_QUIRK_CONTACT_CNT_ACCURATE |
>>               MT_QUIRK_WIN8_PTP_BUTTONS,
>>           .export_all_inputs = true },
>> +    { .name = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
>> +        .quirks = MT_QUIRK_ALWAYS_VALID |
>> +            MT_QUIRK_IGNORE_DUPLICATES |
>> +            MT_QUIRK_HOVERING |
>> +            MT_QUIRK_CONTACT_CNT_ACCURATE |
>> +            MT_QUIRK_STICKY_FINGERS |
>> +            MT_QUIRK_WIN8_PTP_BUTTONS |
>> +            MT_QUIRK_KEEP_LATENCY_ON_CLOSE,
>> +        .export_all_inputs = true },
>>         /*
>>        * vendor specific classes
>> @@ -1998,7 +2009,12 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
>>     static void mt_on_hid_hw_close(struct hid_device *hdev)
>>   {
>> -    mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
>> +    struct mt_device *td = hid_get_drvdata(hdev);
>> +
>> +    if (td->mtclass.quirks & MT_QUIRK_KEEP_LATENCY_ON_CLOSE)
>> +        mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
>> +    else
>> +        mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
>>   }
>>     /*
>> @@ -2375,6 +2391,14 @@ static const struct hid_device_id mt_devices[] = {
>>           MT_USB_DEVICE(USB_VENDOR_ID_UNITEC,
>>               USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19) },
>>   +    /* Uniwill touchpads */
>> +    { .driver_data = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
>> +        HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>> +            USB_VENDOR_ID_PIXART, 0x0255) },
>> +    { .driver_data = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
>> +        HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>> +            USB_VENDOR_ID_PIXART, 0x0274) },
>> +
>>       /* VTL panels */
>>       { .driver_data = MT_CLS_VTL,
>>           MT_USB_DEVICE(USB_VENDOR_ID_VTL,

