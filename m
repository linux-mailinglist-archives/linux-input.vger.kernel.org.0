Return-Path: <linux-input+bounces-9281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC3A14102
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 18:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21243188C211
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 17:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127F11428E7;
	Thu, 16 Jan 2025 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YiIRjHl0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349F24A7C6;
	Thu, 16 Jan 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049194; cv=none; b=m41wDCYHh10r8liKMC2QCj0seG+RFP4uOiHJ4bpANWnvVCTxwhQwBF2XSOqvh4lo+7wLif7fqXXUSXTrIw8Q7LwDdI/HeMeVfNgC12JpuSfwTt3z8k+O9s5BT3SS8QoJ65IqnosX40K0VLJZBzKBbFZOm8ILaF92MDErTCQuKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049194; c=relaxed/simple;
	bh=Pbe78CDgAcQ8qySvou0NQJuSmHPtBOJ0i4D6a5fVG8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gokNFVTbFNVQBV8K2fBMDegH9Yzaiig/zf598PDo8zf/uYCxgd6drSejF0QSXni/TGrkH+8L9AlR30K42Qingoppmf3l1uLSKvJCL9Hljb+kMtY8Rmqo1HT/lq4rNnnz+I6hQ1FhQdVcwUpdMG0FljYbNL1B0y3XsmIMB4fkS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YiIRjHl0; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id YTpEtC0LXVtbtYTpIt7QrO; Thu, 16 Jan 2025 18:38:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737049120;
	bh=W4KGw1s8qRcNcbaP9/T5y1fVORxaYOWsYQ9ocFSgjBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=YiIRjHl0hQKw65TeNtM78PcaawR6xLYTJDA3eRV5omrY8uuUd3HPDANKgZkdyLPdE
	 TKlS38xwJTv42zEtZGVW96cQ22UqXnxUKuP7dfSVIqhAhlGdt6eibXnwGRzKqJ+eCT
	 Uk48rABsrogs+a6qyVARo60tqMC38bWsqq+U8cyAB5RY6Dkxo6fFKfrPdge7HmmIC6
	 d1q0mRf4Kw6uL6+4WZIdKDTXEV3VnMZl1DWiuQChlsWpW/V6aKLAG9dZy2Z/o6M4p4
	 D+B6ZA9Ybb3K/WZa1zaq1Yas63I8tmSMjp4NehkRzJdCtvx43dyZNDJNMf8Gdin5vv
	 wy8KurnWMupXQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 16 Jan 2025 18:38:40 +0100
X-ME-IP: 90.11.132.44
Message-ID: <dd31a3fb-d044-4ee4-aed7-bd46c2df0670@wanadoo.fr>
Date: Thu, 16 Jan 2025 18:38:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] HID: steelseries: preparation for adding
 SteelSeries Arctis 9 support
To: Christian Mayer <christian@mayer-bgk.de>,
 Bastien Nocera <hadess@hadess.net>, Christian Mayer <git@mayer-bgk.de>,
 linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20250112114438.2196-1-git@mayer-bgk.de>
 <20250112114438.2196-2-git@mayer-bgk.de>
 <d31906c2-a9d4-4907-ae1b-bea0520adbe2@wanadoo.fr>
 <ee985d9040ce54478ad3db448850ea8676fee642.camel@hadess.net>
 <3b791f85-17ab-4987-afb5-9dbdbd6df1ec@mayer-bgk.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <3b791f85-17ab-4987-afb5-9dbdbd6df1ec@mayer-bgk.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/01/2025 à 18:20, Christian Mayer a écrit :
> 
> 
> Am 13.01.25 um 14:42 schrieb Bastien Nocera:
>> On Sun, 2025-01-12 at 13:02 +0100, Christophe JAILLET wrote:
>>> Le 12/01/2025 à 12:44, Christian Mayer a écrit :
>>>> Refactor code and add calls to hid_hw_open/hid_hw_closed in
>>>> preparation
>>>> for adding support for the SteelSeries Arctis 9 headset.
>>>>
>>>> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
>>
>> Feel free to add my:
>> Reviewed-by: Bastien Nocera <hadess@hadess.net>
>> Tested-by: Bastien Nocera <hadess@hadess.net>
>>
>> once you've made the change Christophe mentions.
>>
>>>> ---
>>>>    drivers/hid/hid-steelseries.c | 19 +++++++++++++------
>>>>    1 file changed, 13 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
>>>> steelseries.c
>>>> index f9ff5be94309..dc4ab55d7c22 100644
>>>> --- a/drivers/hid/hid-steelseries.c
>>>> +++ b/drivers/hid/hid-steelseries.c
>>>> @@ -377,20 +377,21 @@ static void steelseries_srws1_remove(struct
>>>> hid_device *hdev)
>>>>    #define ARCTIS_1_BATTERY_RESPONSE_LEN        8
>>>>    static const char arctis_1_battery_request[] = { 0x06, 0x12 };
>>>> -static int steelseries_headset_arctis_1_fetch_battery(struct
>>>> hid_device *hdev)
>>>> +static int steelseries_headset_request_battery(struct hid_device
>>>> *hdev,
>>>> +    const char *request, size_t len)
>>>>    {
>>>>        u8 *write_buf;
>>>>        int ret;
>>>>        /* Request battery information */
>>>> -    write_buf = kmemdup(arctis_1_battery_request,
>>>> sizeof(arctis_1_battery_request), GFP_KERNEL);
>>>> +    write_buf = kmemdup(request, len, GFP_KERNEL);
>>>>        if (!write_buf)
>>>>            return -ENOMEM;
>>>> -    ret = hid_hw_raw_request(hdev,
>>>> arctis_1_battery_request[0],
>>>> -                 write_buf,
>>>> sizeof(arctis_1_battery_request),
>>>> +    hid_dbg(hdev, "Sending battery request report");
>>>> +    ret = hid_hw_raw_request(hdev, request[0], write_buf, len,
>>>>                     HID_OUTPUT_REPORT,
>>>> HID_REQ_SET_REPORT);
>>>> -    if (ret < (int)sizeof(arctis_1_battery_request)) {
>>>> +    if (ret < (int)len) {
>>>>            hid_err(hdev, "hid_hw_raw_request() failed with
>>>> %d\n", ret);
>>>>            ret = -ENODATA;
>>>>        }
>>>> @@ -404,7 +405,8 @@ static void
>>>> steelseries_headset_fetch_battery(struct hid_device *hdev)
>>>>        int ret = 0;
>>>>        if (sd->quirks & STEELSERIES_ARCTIS_1)
>>>> -        ret =
>>>> steelseries_headset_arctis_1_fetch_battery(hdev);
>>>> +        ret = steelseries_headset_request_battery(hdev,
>>>> +            arctis_1_battery_request,
>>>> sizeof(arctis_1_battery_request));
>>>>        if (ret < 0)
>>>>            hid_dbg(hdev,
>>>> @@ -554,6 +556,10 @@ static int steelseries_probe(struct hid_device
>>>> *hdev, const struct hid_device_id
>>>>        if (ret)
>>>>            return ret;
>>>> +    ret = hid_hw_open(hdev);
>>>> +    if (ret)
>>>> +        return ret;
>>>
>>> Should we call hid_hw_stop() if
>>> steelseries_headset_battery_register()
>>> below fails, as done in the remove funcion?
> Did you mean hid_hw_close instead of hid_hw_stop?

Yes, I mean hid_hw_close()

> If the battery_register fails, the driver will still get assigned to the 
> device, because ret is not getting set and is still 0 from hid_hw_open, 
> right?

Correct. I miss-read this part.
If steelseries_headset_battery_register() fails, the probe still succeeds.

> 
> hid_hw_close doesn't get called before hid_hw_stop and the remove 
> function will get called when the device disconnects.
> That doesn't seem right to me, or am i wrong?

I think you are right.

Not sure it is 100% future proof, but it looks correct.

Sorry for the noise.

CJ

> 
>>>
>>>> +
>>>>        if (steelseries_headset_battery_register(sd) < 0)
>>>>            hid_err(sd->hdev,
>>>>                "Failed to register battery for
>>>> headset\n");
>>>> @@ -580,6 +586,7 @@ static void steelseries_remove(struct
>>>> hid_device *hdev)
>>>>        cancel_delayed_work_sync(&sd->battery_work);
>>>> +    hid_hw_close(hdev);
>>>>        hid_hw_stop(hdev);
>>>>    }
>>>
>>
> 
> 
> 


