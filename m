Return-Path: <linux-input+bounces-16645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9174CD12A7
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 18:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81FCA30E3600
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 17:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8214D369201;
	Fri, 19 Dec 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ouhryBZm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307DC36828A;
	Fri, 19 Dec 2025 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159762; cv=none; b=Ya8vkhg8EGN4HLL2AzT/gyBaF3P+Sz5dtdEefq4c4pApyUKQogmZt5gn8BkfoXXoDEBDMHwWHFtGsHzpCOHzaE9CgYVaXGFxmCuzBNY9liBjiwpu9OSa4lk3lN9GSuDhPESIHr/IqCOXVg44dGPSUs+r9nLDyZzMmWN1oTz7d6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159762; c=relaxed/simple;
	bh=R3WTBoshacBlShMPx4XLSL4SFHVuWyEABQPWOmyFPoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBsHQVAUtL8/y+LTdQaKqw80RVGJtW3FLfy3ffajBCq8TyClPfxtrku1ZJ8yoKn7uTkNdrn0fIwAdI8k33us6BeTLVBmlS+XseWb+c40oQyJXX6oRsY6kJ3MbB98iLOXJVRHy5GWJQ2N0/2D/TBoCGeShU8jm5Ncpe61nEAmeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ouhryBZm; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5087823e.dip0.t-ipconnect.de [80.135.130.62])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 935832FC004A;
	Fri, 19 Dec 2025 16:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1766159750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBWDHuF4fq3ZedE8xH7lnNqnkoaeIqnw6qIKAEiuOrM=;
	b=ouhryBZmT/1oGaQMv+aieILO/IIEdUnqzRZMxop0RZaeq/nvSVkG7T6/paNSN7VLvOjfPC
	oKSvYPJbXH7hIsmh/biKXEDyTugcPUEQaFEuLzzcHqEhFrwh5lZpmCDocqZ92NkYqss+FA
	KD5v98e5Za0Dw2+5t1ux2iWmdYQojmY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ee5388c1-c341-4563-b239-919bc4d0a334@tuxedocomputers.com>
Date: Fri, 19 Dec 2025 16:55:50 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251112144837.499782-1-wse@tuxedocomputers.com>
 <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com>
 <rejkk25fhay4ozlnrior3vbpo4wa6s2rpezmt3kydf7e3jr7k4@vv7423v4mssq>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <rejkk25fhay4ozlnrior3vbpo4wa6s2rpezmt3kydf7e3jr7k4@vv7423v4mssq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 19.12.25 um 14:10 schrieb Benjamin Tissoires:
> On Nov 12 2025, Werner Sembach wrote:
>> Am 12.11.25 um 15:47 schrieb Werner Sembach:
>>> Uniwill devices have a built in gesture in the touchpad to de- and
>>> reactivate it by double taping the upper left corner. This gesture stops
>>> working when latency is set to high, so this patch keeps the latency on
>>> normal.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Cc: stable@vger.kernel.org
>>> ---
>>> V1->V2: Use a quirk to narrow down the devices this is applied to.
>>> V2->V3: Fix this patch breaking touchpads on some devices.
>>>           Add another device ID.
>>>
>>> I have three Uniwill devices at hand right now that have at least two
>>> physically different touchpads, but same Vendor + Product ID combination.
>>> Maybe the vendor uses this product ID for all i2c connected touchpads, or
>>> it is used as some kind of subvendor ID to indicate Uniwill?
>>>
>>> To be able to really narrow it down to Uniwill only devices I would need to
>>> check DMI strings, but then I will probably narrow it down to much as I
>>> only know what we at TUXEDO use there.
>>>
>>>    drivers/hid/hid-multitouch.c | 26 +++++++++++++++++++++++++-
>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>>> index 179dc316b4b51..ed9eb4e0d5038 100644
>>> --- a/drivers/hid/hid-multitouch.c
>>> +++ b/drivers/hid/hid-multitouch.c
>>> @@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
>>>    #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
>>>    #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
>>>    #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
>>> +#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(24)
>>>    #define MT_INPUTMODE_TOUCHSCREEN	0x02
>>>    #define MT_INPUTMODE_TOUCHPAD		0x03
>>> @@ -211,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>>>    #define MT_CLS_WIN_8_DISABLE_WAKEUP		0x0016
>>>    #define MT_CLS_WIN_8_NO_STICKY_FINGERS		0x0017
>>>    #define MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU	0x0018
>>> +#define MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE	0x0019
>> A college realized that at some points in the code some, but not all, of the
>> MT_CLS_WIN_8* classes are checked for directly. Should I add my new class
>> there too?
> It depends. If it's truely a WIN_8 touchpad then I guess those checks
> are here for a reason, but if this particular device works without them,
> then it's your call in the end.

Didn't notice a difference, but will it include anyway to be on the safe side.

v4 incoming

>
> Cheers,
> Benjamin

