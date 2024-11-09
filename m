Return-Path: <linux-input+bounces-7992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC899C28D4
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 01:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7771C21401
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 00:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAB6C2FD;
	Sat,  9 Nov 2024 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="wsXNSOCP"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EAF8F5C
	for <linux-input@vger.kernel.org>; Sat,  9 Nov 2024 00:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731112211; cv=none; b=IvO1IiQlLmrbzYpT26CzlltFdZw67EsribfrYarJz0k7x57NdwFCjOlztJPDugzWf+a/Th8yX5449ho34Do1ZdeI4OjPL6Bo9nzQ6ShoFqqo+zaegZ7QUrgsfekAg8U8aZcP+yzmcyJzLp8G9FOKn4p61icgrG7OcGBlFG0guos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731112211; c=relaxed/simple;
	bh=yj0pkUhc4216K8kHmUIXS+ymfRK9BPFd07+fVmkvmcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+BQEDZHEgkSIGge2ZlPqIkP9ieTJ+FgobjatLhOpo5/4nc1kTTtIpQOmMrSwBok54edtaOwhF8uYm1IyI2GsiD4l/YshyGbh/z1scYfIqvVlbe2OFJ5EDx4YV1wDoAt9oPQ8rtiszoH4cWTycNN7fguDcKRsnpMEFqJztJJcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=wsXNSOCP; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AF70D892E8;
	Sat,  9 Nov 2024 01:30:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731112207;
	bh=m5xQ6YT4hnX82MzS4k8l4/FAROAOu8tHR6rxrP2QSAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wsXNSOCP+ZRq7wNa8zQnp9eGd5g9tGjCL381RDZEBK7sAyHsfhTTv+D/cFPh3eDXV
	 Dza5tBlvFa211hlStfZ+tC6pFAV46xO0Z8s40IhHH/CUoHQf2MHRdriMtxlZYYmvIP
	 Yh5GdYPeKKv2DV8HfgqhJf+j8ASSgkfZ6CVY0webd60cT7+QNn+jL2bsmAnXQ8dZSJ
	 Vc7yKMboWnIGks4CwjVKFZauUXGCZfDIahFxb+pvvM4sTp7tmFvSWOU1/CH8526l3g
	 v9M+4BkX6Slvhs7fUtdX8H2SmK73J6Jlh+6LYZWI8FsTWxk7c8kqxNgaFUbKPltqhM
	 h5eXeoAwE6v+w==
Message-ID: <f0c119e1-2992-438e-bb8e-d4ab2ff50638@denx.de>
Date: Sat, 9 Nov 2024 01:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atmel_mxt_ts: Avoid excess read length on limited
 controllers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
 Evan Green <evgreen@chromium.org>, Sasha Levin <sashal@kernel.org>
References: <20200613145632.113573-1-marex@denx.de>
 <Zy2q1Ar9BzecljDo@google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Zy2q1Ar9BzecljDo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/8/24 7:08 AM, Dmitry Torokhov wrote:
> Hi Marek,
> 
> On Sat, Jun 13, 2020 at 04:56:32PM +0200, Marek Vasut wrote:
>> Some I2C controllers have a hard limit on the number of data they can
>> transfer in one transfer (e.g. Xilinx XIIC has 255 bytes). The Atmel
>> MXT touchscreen driver mxt_process_messages_until_invalid() function
>> can trigger a read much longer than that (e.g. 690 bytes in my case).
>> This transfer can however be easily split into multiple shorter ones,
>> esp. since the single T5 message is 10 bytes or so.
>>
>> This patch adds a check for the quirk presence and if it is present,
>> limits the number of messages read out of the controller such that
>> they are below the quirk limit. This makes it possible for the MXT
>> driver to work even on such limited controllers.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Nick Dyer <nick@shmanahar.org>
>> Cc: Evan Green <evgreen@chromium.org>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Sasha Levin <sashal@kernel.org>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 30 ++++++++++++++++++------
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index a2189739e30f5..faa3f3f987d46 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -985,21 +985,37 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
>>   
>>   static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
>>   {
>> +	const struct i2c_adapter_quirks *q = data->client->adapter->quirks;
>>   	struct device *dev = &data->client->dev;
>> -	int ret;
>> -	int i;
>> +	int i, ret, offset = 0;
>> +	u16 rem, chunk = count, total = count;
>>   	u8 num_valid = 0;
>>   
>>   	/* Safety check for msg_buf */
>>   	if (count > data->max_reportid)
>>   		return -EINVAL;
>>   
>> +	/* Handle controller read-length limitations */
>> +	if (q && q->max_read_len) {
>> +		chunk = min((u16)(q->max_read_len / data->T5_msg_size),
>> +			    (u16)count);
> 
> I do not think you need this min() here. The "rem = min(total, chunk);"
> below will take care of cases where chunk is bigger than total count.
'chunk' here has to be limited to at most as many T5 messages as fit 
into q->max_read_len limit of the controller, that is the purpose of 
this 'min' here.

