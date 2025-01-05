Return-Path: <linux-input+bounces-8890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C61A0190D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 11:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C3D83A044B
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 10:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633871465BE;
	Sun,  5 Jan 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="Jk32xTUC"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE461369AE;
	Sun,  5 Jan 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736073682; cv=none; b=GqHS1vyfqnCCAEmSj3Ig7DLvOtLXvEZQCmg6yUDwBbbXlwgris++iF+ArzfmiwuPNHVGoxUyYyLy4bk2WuKN2BnN2ImCKWj5iPzame8Gwm5HY4I8A4UvpIPTzM+Pl5+aBLIigsiBPY1M6VWXG3HPguwjBjwu13MEWr3isMzI2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736073682; c=relaxed/simple;
	bh=gBptTp/ZCggpSpa3dyNQXo+s7KJ/jQ/ZutaAgXYhZZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUMe69JkTKX8Z4rriOpNHO6gP2PDIjnwGzASydQ2RkJYQDvgIRNmzKYaEyaUU7Z6qu6ZxJsPzKvmwAmg8CAI4xgPafcKctuBDP9wLlp9nJIawr8IJ7RVU+HTGwbHKyQCpgNCmpw3/4ANLkfyr7I7yqg1UMyS5BWQWz4E1hgXMCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=Jk32xTUC; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4YQtv118vsz46L1;
	Sun,  5 Jan 2025 11:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736073197; bh=gBptTp/ZCggpSpa3dyNQXo+s7KJ/jQ/ZutaAgXYhZZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jk32xTUCswXZbuaj7ELXdYOl+w1WgS+FNH5W56++lSbH2wnh6Vf/LNWB6xBn/SUQa
	 yn9WrS+8In6hizmv1SAt5SibgNBQRqVa+HVXbJsMiUWkyeXlAYuDinYTXeKOyRYYbW
	 8+0eUjet4ggi2Sl7B2HjeP+qXmoC51XJxKEp2DKmwW9fsmXt/zqSDDtKNNUCkVi5zb
	 91x8QgCKCw46zpgcXW4mfoCWHxm1DpBc5HXAFBHbM3NkG6OUt3w3xCi7FA4ftXxgXf
	 45NBe2i02PRlpOnBB/U6lFAgWuUz3XpzH4tFs4O4bH5XKOqWr2wyJkgfZTZZI4Sw+y
	 oABB5L6YjO7EA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4YQtv10nStz7wJq;
	Sun,  5 Jan 2025 11:33:17 +0100 (CET)
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4YQtv05ySlz8sgW;
	Sun,  5 Jan 2025 11:33:16 +0100 (CET)
Received: from [192.168.1.212] (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 0DB8B1C0130;
	Sun,  5 Jan 2025 11:33:12 +0100 (CET)
Authentication-Results: mxe85d;
        spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=christian@mayer-bgk.de smtp.helo=[192.168.1.212]
Received-SPF: pass (mxe85d: connection is authenticated)
Message-ID: <fad05be3-0d12-4aed-bdd9-d541f8de6704@mayer-bgk.de>
Date: Sun, 5 Jan 2025 11:33:11 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bastien Nocera <hadess@hadess.net>
References: <20250101151209.100072-1-git@mayer-bgk.de>
 <20250101151209.100072-2-git@mayer-bgk.de>
 <63eb7eda-7db5-4e2c-a976-2f2eb088bf44@wanadoo.fr>
Content-Language: en-US
From: Christian Mayer <christian@mayer-bgk.de>
In-Reply-To: <63eb7eda-7db5-4e2c-a976-2f2eb088bf44@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173607319256.23966.3686620944509541815@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 0DB8B1C0130
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: l3bpo+sk1jDNftzIvSZIDQ8ev3hufHHufPNGIXXfFCpIAtkFN08=



Am 04.01.25 um 13:45 schrieb Christophe JAILLET:
> Le 01/01/2025 à 16:11, Christian Mayer a écrit :
>> Add support for the SteelSeries Arctis 9 headset. This driver
>> will export the battery information like it already does for
>> the Arcits 1 headset.
>>
>> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> 
> ...
Thanks for your feedback Christophe.
I will repost my patches with the fixes for your comments together with 
the fixes for Bastiens comment.
> 
>> -static int steelseries_headset_arctis_1_fetch_battery(struct 
>> hid_device *hdev)
>> +static int steelseries_headset_request_battery(struct hid_device *hdev,
>> +    const char *request, size_t len)
>>   {
>>       u8 *write_buf;
>>       int ret;
>>       /* Request battery information */
>> -    write_buf = kmemdup(arctis_1_battery_request, 
>> sizeof(arctis_1_battery_request), GFP_KERNEL);
>> +    write_buf = kmemdup(request, len, GFP_KERNEL);
>>       if (!write_buf)
>>           return -ENOMEM;
>> -    ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
>> -                 write_buf, sizeof(arctis_1_battery_request),
>> +    hid_dbg(hdev, "Sending battery request report");
>> +    ret = hid_hw_raw_request(hdev, request[0],
>> +                 write_buf, len,
> 
> This could be on the same line.
> 
>>                    HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
>> -    if (ret < (int)sizeof(arctis_1_battery_request)) {
>> +    if (ret < (int)len) {
>>           hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
>>           ret = -ENODATA;
>>       }
> 
> ...
> 
>> +static uint8_t steelseries_headset_map_capacity(uint8_t capacity, 
>> uint8_t min_in, uint8_t max_in)
>> +{
>> +    if (capacity > max_in)
> 
>  >= ?
> 
>> +        return 100;
>> +    if (capacity < min_in)
> 
> <= ?
> 
>> +        return 0;
>> +    return (capacity - min_in) * 100 / (max_in - min_in);
>> +}
> 
> ...
> 
> CJ


