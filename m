Return-Path: <linux-input+bounces-16259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F102C74987
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 065BD2D1F0
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB891DE8BB;
	Thu, 20 Nov 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm2TvaVv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6118C008
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649072; cv=none; b=tmbuwLNnR8bz9FDzBRWzyBq49DnFutH8YoDLiAuR7czgi34OwcbJTcs2qykT71E9dH0iuC6NGbR9jsjUtyC53valE2lfdfau4X+zKiUTgLmSKVESEOsjWrc5bUZjgK2HHB2w/SQUBjgOIKhzPdjqCdTU/bmctFh96Wq9JBFN+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649072; c=relaxed/simple;
	bh=VjIpb9UGuVBbynzJsGpQLvFYKrdn58W/poFnKCcRyRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dp9eX9pDlU69IqYE1vXAbs7xFe3cjBjaCy0KjY3c+XdIpxKS7+SQ8ReB5nnixUE9oFgfhQqrWNjnC+AQa4fjW2/2I5maBVAU9ZBedfa7pXR58/J0x3BwHKkV8IHAZYAcg5OtwgJiRb9ogbTx5OaPkV7pKo+FAETiDJVzm8sR8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm2TvaVv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477770019e4so9535865e9.3
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763649068; x=1764253868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T73HM0puozBRi2+pOPwiTjM3PEATffqq8BLe2CmdD0Y=;
        b=Nm2TvaVvz7XwpDY3lR2zHHszmRaUbt3NAiibp2wwOFT+Rh2VrpO0xOhjnfokmRoaYU
         +2upkzrhOgOfLlZxouUnEcHC0p1Xhi0KxfJvTzZ4sAPOe/97R99QHYrT4g85lbKgEEu2
         p1Btwe1ApBZRaPa2XyGSCMkwYCtO/UXG99lUlAanKAnX9UuD+X4pXNRpWE80hPtOC9/4
         9N+cOpK0nq+tDDfYgH8h+Jaya0vKybiqKata6/Jud5wAb0TNuZGKLvoVj0sdggcHd9Vu
         TkntRnFJ+wzOPaRmaNAgf8x2SOpBNoMYYI02cxUMO9sMdjD9yP4Zf/s4Ri+j+IPKOZ/a
         4I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649068; x=1764253868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T73HM0puozBRi2+pOPwiTjM3PEATffqq8BLe2CmdD0Y=;
        b=S78AqiGM+Xe/li2E0yrfi34UOZ7pV4UMWLF0b2rdviWZwAkpYLNgqnwlFFJC7aFcWe
         6fmHGZj0puzQl6Oy6uutjbT6byNZ7M+TI21Ep8Q0aNqSVy8UR2nB2GLksIWHGOso78DU
         arpQdlnb4boIqqVoayxk+JnTndNG/22HRKkbNp2CYStjtR7jE6qOo9q7UAQkcwBqzkte
         +GfwTvqVUpLeEGZPWpr4QmvM88x4GFfCaRvoX9BS+iKpe4wXIb8O1j0u4FBj0jgO2q3/
         P8DnCt95M/xioAVJo1fy0B8gQOTDXzb6TmZBaD86MIy1NlTwx7dk++gf1b6aHfM3X29W
         /vcA==
X-Forwarded-Encrypted: i=1; AJvYcCWneJ7FR3E7lJVJSaNMwHt8hXt6M0PZk8SK6DnZIwk1zMScenLN76XPhor+trNf/Y9GSnp9uXaapa8DpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLYMJb6/4pFlZqMJ2mOXZa5GOLaQSOtxgmMPxa9+prLMowALp
	NrFBf6IbW6HW8yqFTN0prBzFAp5nC26uuggprzCLeuTvShpmTRqAl3bL
X-Gm-Gg: ASbGncs5z9za6vzyj1lHBTaFbnEprXiRUUAgt5jGqzo38w6e7vXEG+EcYFZKxzIiO2/
	6/yBoZaPMXqc6LiSX9n9dZBONKqEhS9upQdflVfdNJUsP0z7NkkifCZY44fxdw1dqVRpagRElvm
	N4GK9ykSeBrh1Pd8zVvQKDYzf16gzyl/fG4bY6R+i7BPG9TRB8CdF4hCvB19FbwXHwAk6fqqYRf
	M1U+/vGtpfshNUGZTsjigESkiLA2WJeyikte8RwwI6PWwafyANZSCzVKA65SIuwHvbtEqVILCuA
	WoIfgbCJUsZ6sFASkBoBvbh6un9sMHJ5Q+jFQu1NLUlCIK2h9qpgIyc3KB5t8fUd59JCL48uTVs
	oLqxaz62VFA8+IM35zw+HjJe3iVJCg/M4RLL23lAwFwjX5g0fTBChUdMfv0aKq9fa5D5puwbflU
	fwP/aoqjCVvVR5NoM3VFEj58o=
X-Google-Smtp-Source: AGHT+IHllMaFM9RYyCxrxpU/uPalPcB+kKn6aFhED520P2mWS73tM93EHdi0KqQ9Y/EiHt6hgx2JuQ==
X-Received: by 2002:a05:600c:1c97:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-477b8a98ec2mr36555785e9.20.1763649067701;
        Thu, 20 Nov 2025 06:31:07 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc6b9sm51345235e9.3.2025.11.20.06.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:31:07 -0800 (PST)
Message-ID: <6a34198c-aceb-46cb-b84e-c49e4f529907@gmail.com>
Date: Thu, 20 Nov 2025 15:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
 <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 15:28, Antheas Kapenekakis wrote:
> On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/20/25 10:46, Antheas Kapenekakis wrote:
>>> Handshaking with an Asus device involves sending it a feature report
>>> with the string "ASUS Tech.Inc." and then reading it back to verify the
>>> handshake was successful, under the feature ID the interaction will
>>> take place.
>>>
>>> Currently, the driver only does the first part. Add the readback to
>>> verify the handshake was successful. As this could cause breakages,
>>> allow the verification to fail with a dmesg error until we verify
>>> all devices work with it (they seem to).
>>>
>>> Since the response is more than 16 bytes, increase the buffer size
>>> to 64 as well to avoid overflow errors.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
>>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 6de402d215d0..5149dc7edfc5 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>  #define FEATURE_REPORT_ID 0x0d
>>>  #define INPUT_REPORT_ID 0x5d
>>>  #define FEATURE_KBD_REPORT_ID 0x5a
>>> -#define FEATURE_KBD_REPORT_SIZE 16
>>> +#define FEATURE_KBD_REPORT_SIZE 64
>>>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>
>>> @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>>>
>>>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>>>  {
>>> +     /*
>>> +      * The handshake is first sent as a set_report, then retrieved
>>> +      * from a get_report. They should be equal.
>>> +      */
>>>       const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>>>                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>> +     u8 *readbuf;
>>>       int ret;
>>>
>>>       ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>>> -     if (ret < 0)
>>> -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
>>> +     if (ret < 0) {
>>> +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
>>> +             return ret;
>>> +     }
>>> +
>>> +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>> I see my suggestion to use __free here didn't materialize in code using
>> it even after Ilpo kindly wrote how to correctly use it.
>>
>> I think you can move the readbuf assignment right below buf and
>> take into account what Ilpo said.
>>
>> I don't expect new variables will be added here ever again,
>> but I agree with Ilpo that it's a good idea here to write code
>> accounting for that possibility.
>>
>> It is my understanding that who proposes patches is expected to
>> resolve discussions when changes are proposed or to take into
>> account requested changes and submit a modified version.
> It was ambiguous. I interpreted Ilpo's email as a dismissal
>
> I will try to incorporate it if I do another revision. Although I do
> not think it improves things in this case as the function does not
> have multiple return statements.
I will leave this decision to Ilpo, if he thinks there is no point in using
__free here I will add my Reviewed-by tag.
>>> +     if (!readbuf)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>> +                              HID_REQ_GET_REPORT);
>>> +     if (ret < 0) {
>>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
>>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
>>> +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
>>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
>>> +             /*
>>> +              * Do not return error if handshake is wrong until this is
>>> +              * verified to work for all devices.
>>> +              */
>>> +     }
>>>
>>> +     kfree(readbuf);
>>>       return ret;
>>>  }
>>>

