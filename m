Return-Path: <linux-input+bounces-9249-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF4A129A9
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 18:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749153A7172
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 17:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2081D152E0C;
	Wed, 15 Jan 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="fUlf/Mbc"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDDD70812;
	Wed, 15 Jan 2025 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961635; cv=none; b=D5sWzGXnOwg3qHlfEox2qd84hWesnqKlInFRKxJ/LbxyFb3odU+7+/QxMJGbj3Oa7NUFcUQilaCD8P3g/G5Md5cUd0j5iDC+fiV1ILSAFzM/MJaNS8KlHNfhYfiwLpLK4cASJToI4/8uGyubALfmU2nMg5gE/b+RyWdWY7NRqRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961635; c=relaxed/simple;
	bh=RlAGI2I9ANOmr7txaYGWHP2wRGbs3J5YM99C1tSk2iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmHykBhmdrXxvhRGv+eVEvFZbPH0+cFRokGBXZEsOANh+IcSXUTujkES9uK9iR/3buYleKm98tXSvczCX49x0DOPd3D5GGClwKI2GTa5rq81jHdzZRO0tJeh+D+udQslASjK00LXKIZefVkRGRz8A/GMEfU2Gn7qWaDeIzuq3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=fUlf/Mbc; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YYCS44Nqmz9386;
	Wed, 15 Jan 2025 18:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736961620; bh=RlAGI2I9ANOmr7txaYGWHP2wRGbs3J5YM99C1tSk2iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fUlf/Mbc9lhOfIw9QIQO6RpldM1KI3Be/kncGG37DZSmAD+8UhhLSzf97A2BO3Wx/
	 t0/66wKfA0xJDu0Jhbab//mvoLfTvrTRLLY06JeM/+1b9OHZoY7ik83IVGnYhkaebS
	 QcOMnZuuxt2o84hyaMeDSPNot8impp1UcsGAjrhCNQBcRmFstGkxeJYaBumXuWAAUc
	 arxUlNQrFBqZwHefRt2I96Cy0hPgZzX6wSfMviwjuJ+Gd+tyzMc1f2SBDMCOr68KFF
	 yv4Vepb3pl3nb0AU3zwDeMQFg3W6IIAE92AW8UW352K3gOWbLM5GyB6eUGpqFm0ybw
	 WcU66pz99mwcA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YYCS43jFJz7wbl;
	Wed, 15 Jan 2025 18:20:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YYCS36c0vz8t4D;
	Wed, 15 Jan 2025 18:20:19 +0100 (CET)
Received: from [192.168.1.212] (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 147A11C023E;
	Wed, 15 Jan 2025 18:20:15 +0100 (CET)
Authentication-Results: mxe85d;
        spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=christian@mayer-bgk.de smtp.helo=[192.168.1.212]
Received-SPF: pass (mxe85d: connection is authenticated)
Message-ID: <3b791f85-17ab-4987-afb5-9dbdbd6df1ec@mayer-bgk.de>
Date: Wed, 15 Jan 2025 18:20:14 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] HID: steelseries: preparation for adding
 SteelSeries Arctis 9 support
To: Bastien Nocera <hadess@hadess.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20250112114438.2196-1-git@mayer-bgk.de>
 <20250112114438.2196-2-git@mayer-bgk.de>
 <d31906c2-a9d4-4907-ae1b-bea0520adbe2@wanadoo.fr>
 <ee985d9040ce54478ad3db448850ea8676fee642.camel@hadess.net>
Content-Language: en-US
From: Christian Mayer <christian@mayer-bgk.de>
In-Reply-To: <ee985d9040ce54478ad3db448850ea8676fee642.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173696161544.14841.1072996971669028682@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 147A11C023E
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: az4fjtZihTZdbRAWw8P0JUzPp+24iuFVJcK5/CEftTwWIXJHyNY=



Am 13.01.25 um 14:42 schrieb Bastien Nocera:
> On Sun, 2025-01-12 at 13:02 +0100, Christophe JAILLET wrote:
>> Le 12/01/2025 à 12:44, Christian Mayer a écrit :
>>> Refactor code and add calls to hid_hw_open/hid_hw_closed in
>>> preparation
>>> for adding support for the SteelSeries Arctis 9 headset.
>>>
>>> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> 
> Feel free to add my:
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Tested-by: Bastien Nocera <hadess@hadess.net>
> 
> once you've made the change Christophe mentions.
> 
>>> ---
>>>    drivers/hid/hid-steelseries.c | 19 +++++++++++++------
>>>    1 file changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
>>> steelseries.c
>>> index f9ff5be94309..dc4ab55d7c22 100644
>>> --- a/drivers/hid/hid-steelseries.c
>>> +++ b/drivers/hid/hid-steelseries.c
>>> @@ -377,20 +377,21 @@ static void steelseries_srws1_remove(struct
>>> hid_device *hdev)
>>>    #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
>>>    static const char arctis_1_battery_request[] = { 0x06, 0x12 };
>>>    
>>> -static int steelseries_headset_arctis_1_fetch_battery(struct
>>> hid_device *hdev)
>>> +static int steelseries_headset_request_battery(struct hid_device
>>> *hdev,
>>> +	const char *request, size_t len)
>>>    {
>>>    	u8 *write_buf;
>>>    	int ret;
>>>    
>>>    	/* Request battery information */
>>> -	write_buf = kmemdup(arctis_1_battery_request,
>>> sizeof(arctis_1_battery_request), GFP_KERNEL);
>>> +	write_buf = kmemdup(request, len, GFP_KERNEL);
>>>    	if (!write_buf)
>>>    		return -ENOMEM;
>>>    
>>> -	ret = hid_hw_raw_request(hdev,
>>> arctis_1_battery_request[0],
>>> -				 write_buf,
>>> sizeof(arctis_1_battery_request),
>>> +	hid_dbg(hdev, "Sending battery request report");
>>> +	ret = hid_hw_raw_request(hdev, request[0], write_buf, len,
>>>    				 HID_OUTPUT_REPORT,
>>> HID_REQ_SET_REPORT);
>>> -	if (ret < (int)sizeof(arctis_1_battery_request)) {
>>> +	if (ret < (int)len) {
>>>    		hid_err(hdev, "hid_hw_raw_request() failed with
>>> %d\n", ret);
>>>    		ret = -ENODATA;
>>>    	}
>>> @@ -404,7 +405,8 @@ static void
>>> steelseries_headset_fetch_battery(struct hid_device *hdev)
>>>    	int ret = 0;
>>>    
>>>    	if (sd->quirks & STEELSERIES_ARCTIS_1)
>>> -		ret =
>>> steelseries_headset_arctis_1_fetch_battery(hdev);
>>> +		ret = steelseries_headset_request_battery(hdev,
>>> +			arctis_1_battery_request,
>>> sizeof(arctis_1_battery_request));
>>>    
>>>    	if (ret < 0)
>>>    		hid_dbg(hdev,
>>> @@ -554,6 +556,10 @@ static int steelseries_probe(struct hid_device
>>> *hdev, const struct hid_device_id
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> +	ret = hid_hw_open(hdev);
>>> +	if (ret)
>>> +		return ret;
>>
>> Should we call hid_hw_stop() if
>> steelseries_headset_battery_register()
>> below fails, as done in the remove funcion?
Did you mean hid_hw_close instead of hid_hw_stop?
If the battery_register fails, the driver will still get assigned to the 
device, because ret is not getting set and is still 0 from hid_hw_open, 
right?

hid_hw_close doesn't get called before hid_hw_stop and the remove 
function will get called when the device disconnects.
That doesn't seem right to me, or am i wrong?

>>
>>> +
>>>    	if (steelseries_headset_battery_register(sd) < 0)
>>>    		hid_err(sd->hdev,
>>>    			"Failed to register battery for
>>> headset\n");
>>> @@ -580,6 +586,7 @@ static void steelseries_remove(struct
>>> hid_device *hdev)
>>>    
>>>    	cancel_delayed_work_sync(&sd->battery_work);
>>>    
>>> +	hid_hw_close(hdev);
>>>    	hid_hw_stop(hdev);
>>>    }
>>>    
>>
> 


