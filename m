Return-Path: <linux-input+bounces-15913-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E6C3D0DB
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 19:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3573BC25F
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 18:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2372E7179;
	Thu,  6 Nov 2025 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="RDKl32JO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1EF34CFD1;
	Thu,  6 Nov 2025 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453148; cv=none; b=VQAymLWsYWlGe43FP9Jtuqctq+ElJCs6mW32tuqOyms5aLJ4yU40dvs0A/0uxRwtBOfvF+DD0zdlgsC0OUZcW528KGim/hBK7Rfxf44R023NAxIarDLNT9TA5A7vKtd7i3ED7zIhCfbEDxX128Z5xO9MXkrN4kWSiTbtr/+yjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453148; c=relaxed/simple;
	bh=e5GMY4P4d7+tYRzBfln5EZLpicvdfUFtnV9c6NAVwas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXNBFzIHtsBA8DY36VgyOw+JdARpzdLA20qiNjJmX462boXCsibqZo5r9VKDjcsaS7PHPixDSR/5mbcDK1WekSKjOnHEqWhzZbzg1cQGsmLU3Td1PCbDSjYOG8CYjPt+nS2/UVJAfqtHJHT8CdvZrJ63ygZnRL6oC0HZAdikxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=RDKl32JO; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p50878061.dip0.t-ipconnect.de [80.135.128.97])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C6A1B2FC005D;
	Thu,  6 Nov 2025 19:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762453141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbqqRJure9nigCdVeSLFsIDHMCnZhNpHEzSElmqKXtA=;
	b=RDKl32JOtr/8GnmOEFMqiXNxXrSkySWQkM8vupnZEPk5bPoCXrKKVjGQJJbibjE1yrPS4o
	FSCxmaqrKXVyTyKCDX89Iea6w2Xxszsv08gcRKqa4O0QJZP6Wg6wn6T3TKJiuo7pOQ9hP4
	gYAGUTG3e66GY+DOGOfHmCvKOgoXeS0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2f418bd7-b1fe-442b-983b-6308cf32fe57@tuxedocomputers.com>
Date: Thu, 6 Nov 2025 19:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid/hid-multitouch: Keep latency normal on deactivate for
 reactivation gesture
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251106154636.985427-1-wse@tuxedocomputers.com>
 <s2pc7whgvrwaldkgkle4ydkyc26q75senkmtesv57du6x7bxoa@mq3ght3dksdr>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <s2pc7whgvrwaldkgkle4ydkyc26q75senkmtesv57du6x7bxoa@mq3ght3dksdr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.11.25 um 17:50 schrieb Benjamin Tissoires:
> On Nov 06 2025, Werner Sembach wrote:
>> Uniwill devices have a built in gesture in the touchpad to de- and
>> reactivate it by double taping the upper left corner. This gesture stops
>> working when latency is set to high, so this patch keeps the latency on
>> normal.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>> Or should I better implement this as a quirk?
> Yeah, I guess a quirk would be appreciated. The high latency on close
> was introduced on purpose for saving energy purpose. So this patch is
> rather not nice for those systems where it matters.

ack

v2 incoming

>
> Cheers,
> Benjamin
>
>>   drivers/hid/hid-multitouch.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>> index 179dc316b4b51..df64cb6c41699 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -1998,7 +1998,7 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
>>   
>>   static void mt_on_hid_hw_close(struct hid_device *hdev)
>>   {
>> -	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
>> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
>>   }
>>   
>>   /*
>> -- 
>> 2.43.0
>>

