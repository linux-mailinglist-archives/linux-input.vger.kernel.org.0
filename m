Return-Path: <linux-input+bounces-16208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D71C6C49E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 80FF529932
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DEE15ECCC;
	Wed, 19 Nov 2025 01:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ4mXaKH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8343FF1
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516805; cv=none; b=GdzWANl6pfXkrBYn04Zy8pTM0TDEb8UTUh/Wm2wFsDSK/ScXR3pZVoyr0UEI1d6sNTuuOoUBqZGrh7x4SNeJOx3c0alOIInZte01wG8Tm3hw8O9Z6YEQvRG/DJKINbjCVgwwvnYpilk1RXqKtZkjll8Qz1rQs79V6VH3oO8RQ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516805; c=relaxed/simple;
	bh=lgoZx3ti0DUnyx+F7NPkqeLArWkoZxgdPK3VhzIpsnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaHZ/wxRY53gnvFGyyGjEPHvb+s2iwJanRXBdOqQeTH3CJugT8Wc6SImTUd2bKQ75ewOpi3963rahgxe7kvdV9dsKNJkEvtfqckjqDaQwWbWoQ65Pqd/1rbuukrl6cM+F6flfu9T5iwEuGhYv5kt3BngJIpgjY59GOvUoYMDjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ4mXaKH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32a5494dso3633404f8f.2
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 17:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763516802; x=1764121602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGAFj0e6JRPHkGBaD48dpAlfpg85+7mQmRrnCwI6k/w=;
        b=GJ4mXaKH5Z1G/CS3Ep55dXDRYycSsZX9xqhKeZMhnyaK8gn9u3oiwalDTLDNXWuX9q
         c6EqLYLBo52VoBlFSvrI6EXZaGZpur7X0CQJjzzA9G0uA2wEXf+9O7csj/XvigH7YBGJ
         wrkRDdytrQXJioloExH5koSY3aGeAj9pA3I1jFR2Q4kcUiLs6F+0lDVZaKdpDg3tWOzt
         Ke680Eoem3C8Nurvpb+Oga3Cbe1anR90BBL3IStJ6BHH6PovL4bOUSQEbNjZZJrxJ3iR
         9j21gi+mFEedoiP5jc9wlramc26zPcAM/eUVOn1n1JnP2oyxjamwR36SG/Y0gV6O1Jd8
         vWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763516802; x=1764121602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGAFj0e6JRPHkGBaD48dpAlfpg85+7mQmRrnCwI6k/w=;
        b=L+5zoeBKZqlIJ/zbzs+0hDfAbyF0yjgdJXAfbUU0Oku0Ojt6V6bvicWO80gOkER6br
         2iyuE3mNkkB9EdOPAiaNZaAx+Y/oHqBaU0596UQdPF6MtPXEuR8DRbNQBhQ5CUzrheHd
         5JkF0OffSXT8XK3JPvEFlx3oKr1+wiRAEDOg2oO0ip9WeoXl8Ng7t17eiUY71r8N434u
         qEOw1373UauweLOrx9fj9Dhx7moXXNaolT7FSG5eLkjQkxLqlrsAVsTlQPrq9Sx6p7eG
         ejauQH3iQfREaKsN13GKTcrzAFQnXBwiyad6abfHl9HLBl/2qWRKBSdvdkWcNTi45JvF
         uFPA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Itnd1Y2J3mNPsznlZmi3SMWgZROLKZsvWuiJaUASOsh4WiE92wbtd1qBPa5GfCnbiF4kG46p+Do0gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKd+f1kF4EWDdCz9NIcqIQI8C0KCPSklnKn9eC2Y4VMeXN8zz
	mrATPSdaJGBNlO6jowng1RkT+yTB7MKQdN3c334I0wBstons4Z9aWOzl
X-Gm-Gg: ASbGncu9FVC8KghCPoyrwDjtKGX+Xa1Sp+xlaRhVZ5XHOvrVUCP2lAEhQWkRSpm+3n3
	VLCtv6s8mmCcfinvfz/1kCIzU9hFwZEGwuXW94XJgncnpuguKqIE06iDNrLd4yhTyHi2r5p/iMQ
	oDjCg3XPSCUwG87ipKA/ivcv14bRBvbFJTwJWW+3VaBwJNcfrJ2gN6V/E1JEkazeuK9ESpda8b7
	vsi5nrn/YMboLyw7RUDMvhp5P5SiXZSLf/4nwsNHs0NUctnTpzs3U3fxqyyNgU0Lj15GAfOYu3i
	yYP8wnYcdqmXErCTdXS1LR87rovYmrIRt/NmSzkHPpOiL96pjPWc2XfU1xcIHCh3T+UnBxsUcWw
	8GnHimdij+Umjk8cmDNeyqk+wTcS/pTwdHH/bsej0uJQX6ocR8spfqACBJzPeZKFra5viemDmub
	X/qkjE/8N0hyfOVwOHoc3ZYwc=
X-Google-Smtp-Source: AGHT+IFygx9DTIl6gxrT6liLVk/WIkzcpIV0hQiSEJsRswnV6WJSsTy7H/QQGdE/9j/bMrL3GjxP1g==
X-Received: by 2002:a5d:5f93:0:b0:42b:40b5:e681 with SMTP id ffacd0b85a97d-42cb1f5d5bamr653934f8f.26.1763516801853;
        Tue, 18 Nov 2025 17:46:41 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f19664sm36130083f8f.36.2025.11.18.17.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 17:46:41 -0800 (PST)
Message-ID: <0ff6651f-4d68-40a3-83a7-7a7ffb2607e8@gmail.com>
Date: Wed, 19 Nov 2025 02:46:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
To: luke@ljones.dev
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
 <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
 <0F5019F3-2654-4C03-B7EF-5B7B83AF7B32@ljones.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <0F5019F3-2654-4C03-B7EF-5B7B83AF7B32@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/19/25 00:46, luke@ljones.dev wrote:
>
>> On 19 Nov 2025, at 12:43, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>>
>> On 11/1/25 11:47, Antheas Kapenekakis wrote:
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
>>> drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
>>> 1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 4676b7f20caf..03f0d86936fc 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>> #define FEATURE_REPORT_ID 0x0d
>>> #define INPUT_REPORT_ID 0x5d
>>> #define FEATURE_KBD_REPORT_ID 0x5a
>>> -#define FEATURE_KBD_REPORT_SIZE 16
>>> +#define FEATURE_KBD_REPORT_SIZE 64
>>> #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>> #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>
>>> @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>>>
>>> static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>>> {
>>> +	/*
>>> +	 * The handshake is first sent as a set_report, then retrieved
>>> +	 * from a get_report. They should be equal.
>>> +	 */
>>> 	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>>> 		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>> +	u8 *readbuf;
>> __free(kfree) = NULL here? Would simplify the code.
>>
>>> 	int ret;
>>>
>>> 	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>>> -	if (ret < 0)
>>> -		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
>>> +	if (ret < 0) {
>>> +		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>>> +	if (!readbuf)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>> +				 HID_REQ_GET_REPORT);
>> See comments on patch 1 (also reported below): not sure if others
>> report_id are going to answer, my guess is that we will have to try
>> if you choose to go that route.
>>> +	if (ret < 0) {
>>> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
>>> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
>>> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
>>> +			FEATURE_KBD_REPORT_SIZE, readbuf);
>>> +		/*
>>> +		 * Do not return error if handshake is wrong until this is
>>> +		 * verified to work for all devices.
>>> +		 */
>> In review of patch 1 I requested this function to be called with more report_id
>> than just 0x5a so this will have to be checked against those values too.
>>
>> In alternative you can fork based on the report_id, but having confirmation that
>> this is valid with those ids too would be of great help. Perhaps I can help you
>> with this asking to asus-linux users.
> The handshake works for 0x5D and 0x5E also.
Then this, like patch 2, should have been sent regardless of
this patchset, this whole discussion stalled two good patches
that we all agree are good and are totally independent from
the main issue?
>>> +	}
>>>
>>> +	kfree(readbuf);
>>> 	return ret;
>>> }
>>>

