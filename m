Return-Path: <linux-input+bounces-16203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F0C6C32E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 028A53476D3
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1FA21D58B;
	Wed, 19 Nov 2025 00:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvC8mr9p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347BCA6B
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 00:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513686; cv=none; b=LbEBaxDmacz3CF2nblJnE4Pmxjic8kaekVf7/e6ldgPf0uSqHw1GhHOBdWgtl7WTbdYB3jL+LdYRvN7aT9wUoB9jgNScc1gNAT3JL7iIfqL4L/gjIxmkkk/6nh3QI0FimSvCh1ABjTNCWFPXi1gLDSmzfJDpHIzc2C4QgTzzMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513686; c=relaxed/simple;
	bh=S7cBkVtaWV5vTOafbIcXZKiTf8IWOP3AHqjv2LF1juE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ae0TLLZZA/6/3l1uEx3PcZo5/7TY454wfFBAVR0dVoY/SMIfvnXEGbwwjcMYmLPxpAqKjXI4uGxlgRzGOrfHZPz8Vx8JWtlDzImo1NznjrEyAMgccSvikqvhVsTxEvDeZXmgccyLK616JM1Hr9j7vw3qi5os2p47BfmUvR6ExYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvC8mr9p; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47778b23f64so41247985e9.0
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 16:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763513682; x=1764118482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tD7UHGbxqyXuRW2eROKXZRUdScQ/xRcJrNBgG65enFE=;
        b=cvC8mr9pIsd5oP7zQfZKUb21rzJX6LqSb/UVft5dg7UzlNUnETDK9C+8D+JsJtw1VQ
         1Z1FDG07RN6koQhD4tTXqL9OUPZIGveVninQgoyX/xhcT3Z0dS1UvsueZzcuLiyPV/Hc
         IAim103Nq0ZMK6iggF1DS/bQ818ZrOIRPe9lJz31xMbrRagVPehVHPucx4rxkrfnzPoP
         kNAM1PxycznEv47XIzKdIPbaajFCQhfn0Ol1pRYlVqaPNaPgjp20Nf+IRWVeXP+AwjoG
         rw7CIAlRXKvGAZuwMX3oJ49DKJFbXKytitotBiNC6hohBBVAlir4skczLjRxBqXApBWh
         RKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513682; x=1764118482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD7UHGbxqyXuRW2eROKXZRUdScQ/xRcJrNBgG65enFE=;
        b=p3toBDrhELr4RIfc54rTmJkByY4I0ve1AkNzGE78Co10Smq3lK7nkc5EZnocpc6Kow
         ZjYebvxmSxhTEKn8xY7r/uM44hjuhlIW7piE1RoYjI6Igr3uVuVVhUNux8DZDTxEM1bV
         6bshQMpYABsht36Gy8V2ZL6W8Wa9a6tQwVX1JHz7hkEFUuAmw6LIEmgMzHi3kxpreaif
         zYv8EqDgoyz+31T2eawVMgpDg7yn8ssg2Hxw5Cv2HYAmwGscljSOFHs2K+AUfY4Gv117
         HBLzHZgqtD9HMwJIWCGsvpCgpHOQkhNvsGFjIXOkb3b0+X2ECn9tYyr9zveB0w9NN+WW
         Pndw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/KJqtDXiL38LiUJU7XI1Dl/66AAEc5YNIW8opu+kCHtuopf1IBdDfIQnoXI2g4Q5jPewwg4+bM47cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCcuWXgTtFhf6tsvZWiNnQ09vW7e5vYLiyIDtvcMIxR99q3h6
	4KUJqCKo+FB2BfecRVqCXksbnEl4SgmBBI7P+vH/PgbLRXusqptkmN+t
X-Gm-Gg: ASbGncu794Q9ScNT0hMcxsabmdoXyybjKEhyPa7rq2rRrSBIp21WReGAszavT8ktlhw
	QXhqtWTEq21EKEAmj0NmphEYADsg0FfYQYfbTzA6RaKtaHjemftH5aJWnMgdvmo4YPBuyqxqaLR
	IKBAtgR/wOJYchi6MzaPDA7mMzzyO7vBy1iI1B6KWU4sm0QvubbYXBmr6OI1vNlf3XkyfuBfpSj
	5+s1CkZWePDVoOin9lyliKuxvhvQn73SeLbxtPDYbHrs44SGRmV/I+94HoEJIgX//QLctJBRKe2
	ICtvd2F+89unYhYaRSBDy0Z9ZM1EwKL3X6FX8jRB5scaiRz1VoEjJaeycvyenoj5NOhea/U1sJb
	F2LkxI4Hr4zihtSKX65vdweh/fXVkMo9gtrpWEkFurxprC54btw9UKfxEPiNsU3RZiFTQQSvSZC
	9X/Sab10PvQgiPuZ94yUq4ErMuxzfjW9nJ4P9YKHi7USGX
X-Google-Smtp-Source: AGHT+IFmF63lqiJu3N01t8hhMet7gN17SA69AgiylLzyVwUF6QLmjH4zQF2+1EZ0wzGmSPPrQ+Sbxw==
X-Received: by 2002:a05:600c:6289:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-4778fe50f5emr164310575e9.6.1763513682262;
        Tue, 18 Nov 2025 16:54:42 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106b03bsm16988325e9.9.2025.11.18.16.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:54:41 -0800 (PST)
Message-ID: <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
Date: Wed, 19 Nov 2025 01:54:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/25 13:10, Ilpo Järvinen wrote:
> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>
>> These keyboards have always had initialization in the kernel for 0x5d.
>> At this point, it is hard to verify again and we risk regressions by
>> removing this. Therefore, initialize with 0x5d as well.
See patch 1: unless I missed something you can retain the two 
FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
why are we adding a quirk to replace a quirk that was removed
in patch 1?

You are basically doing the pretty-much-but-not-quite
equivalent of what the driver was doing before.
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> ---
>>  drivers/hid/hid-asus.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index 726f5d8e22d1..221c7195e885 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>>  #define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
>> +#define QUIRK_ROG_NKEY_LEGACY		BIT(15)
>>  
>>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>>  						 QUIRK_NO_INIT_REPORTS | \
>> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>> +		/*
>> +		 * These keyboards might need 0x5d for shortcuts to work.
>> +		 * As it has been more than 5 years, it is hard to verify.
>> +		 */
>> +		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>>  	/* Get keyboard functions */
>>  	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>  	if (ret < 0)
>> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
>>  	  QUIRK_USE_KBD_BACKLIGHT },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remove 
> + add back in different patches.
Granted I still have no idea why that was removed in the first place?
Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?

What's the problem with FEATURE_KBD_LED_REPORT_ID1?

> I suppose the cleanest would be to add a new patch as first which moves
> asus_kbd_init() outside of if/else so you can make this refactoring of 
> FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
Again I am missing the point in moving these...
> I note there's still contention with this series overall.
>
There are a few things that have pretty much the potential of making
some laptops act funny due to tinkering with initializations commands.

The rename will break some tools, but other than that, granted I have yet
to check the rest of the patchset, looks reasonable to me.

Perhaps I am not entirely happy with how things are worded in
a few instances, but it's a minor issue.

