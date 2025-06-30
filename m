Return-Path: <linux-input+bounces-13238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB70AEE6F3
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 20:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D223BFA29
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 18:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930A7295DAF;
	Mon, 30 Jun 2025 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LW6K0Q+e"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008982620F5;
	Mon, 30 Jun 2025 18:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309082; cv=none; b=gG0w62q3+Bx3MSBW1oyRVwS+u3KYIFmRC0qtrGK6XVbh5DN0xGSzntgWDsbrDCUApP57AtG5oCkTo7ca3ECUXwxf0aCfHXrzxvgn97ouMuczeVsUhTble7vWgy+s3xxbaI4J6iP+UEX6DJS31jGmNt8wMznLGgmRb2FTzBKiEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309082; c=relaxed/simple;
	bh=BNFWjlM83+wcoO+zJSYBmQXLGTNTc67RpeUwcFQhdU4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=K+kt+U6shL+NfpOh5aEKVYPwBqBSl2LIh1Kt1RIL04PYTaUkG1a2KDB5NO7VJBw38JbFFNC6qBuW86/RUCbiAMEXrD1Gx55LIcvrownF0XJjQDIuMbRct7rGcrHzML/xJ+IMvHE1FSvUrE3QKgdanhFEPWkn9z9JRS2Lqy33eG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LW6K0Q+e; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 04F592061D;
	Mon, 30 Jun 2025 20:44:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZkhyB3FWL8e; Mon, 30 Jun 2025 20:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751309074; bh=BNFWjlM83+wcoO+zJSYBmQXLGTNTc67RpeUwcFQhdU4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LW6K0Q+eEJWWZqtuX2/Ong2KAgSekLogAKyAINQBmoE+pEqt+fEi+Hkb5aWe5XYli
	 tqjjenxUsGb81afnJR6Kl1sxS8rFu+tExL0IBosOWz6c1nlVnsGpu8/hi2DRGbcjUH
	 rrVs5IhvgrAAVuhr5tcOjqVlezmcKJQvN8gndQ3UdGhqo/+OVs7Vr4NzwzC8tGybGw
	 +hG1WvOFdkJzPvysSCZ+8cWcuGafHMEVJPPRXFGQoXfi5SN3wQGzTVfKuHK6QOSot+
	 +aFviXNBzZEc+npZQHOu/Dt4VE8fGTBBgnVG2SRD43BTjLC1ycR+gtZpRdJFzyRVt+
	 AqBBvZ9R4OTsg==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 18:44:34 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sangwon Jee <jeesw@melfas.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Henrik
 Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/5] Input: melfas-mip4 - add support for touchkey
 input events
In-Reply-To: <ugwy3adqmxodsyhohpdv337lvbxpdzhgtojpbtrykkuyf2eivl@sl36qsvcju6v>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
 <20250613-mip4-touchkey-v2-3-9bbbe14c016d@disroot.org>
 <ugwy3adqmxodsyhohpdv337lvbxpdzhgtojpbtrykkuyf2eivl@sl36qsvcju6v>
Message-ID: <e480fbc14bae5e2e24f2fec3d7be308c@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-29 05:12, Dmitry Torokhov wrote:
> Hi Kaustabh,
> 
> On Fri, Jun 13, 2025 at 01:11:35AM +0530, Kaustabh Chakraborty wrote:
>> The MIP4 protocol are supposed to support touchscreens, touchkeys, and
>> combo-devices. The driver handles touchscreen events, but touchkey
>> events are unimplemented.
> 
> I am confused, because I clearly see the driver parsing and forwarding
> key events. It appears that this patch adds the ability to set the
> keymap via device tree instead of relying on userspace to load it.

Yeah, you're correct. Though I'm not sure this is the correct way to do
what I'm trying to do. What I want is a driver which will drive both
touchscreen and pure-touchkey devices.

I feel like a separate driver is how it should be done, although the
protocol is same and it can be done here...

I had tried to get some input (hence the RFC) about this but I couldn't.
Either my wording wasn't clear or I haven't been able to communicate it
properly.

Sorry for bringing this out of the blue in a thread.

> 
> Please adjust the patch description.
> 
>> 
>> Implement them. If compiled with devicetree support, the driver 
>> attempts
>> to retrieve keycodes from a property named "linux,keycodes".
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/input/touchscreen/melfas_mip4.c | 32 
>> ++++++++++++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/input/touchscreen/melfas_mip4.c 
>> b/drivers/input/touchscreen/melfas_mip4.c
>> index 
>> a6946e3d8376d7e9b4c26f4194409e0ba78bb075..061ac353bc7a2e28f17581411af81f35c89733a1 
>> 100644
>> --- a/drivers/input/touchscreen/melfas_mip4.c
>> +++ b/drivers/input/touchscreen/melfas_mip4.c
>> @@ -169,7 +169,7 @@ struct mip4_ts {
>>  	unsigned int event_format;
>> 
>>  	unsigned int key_num;
>> -	unsigned short key_code[MIP4_MAX_KEYS];
>> +	unsigned int key_code[MIP4_MAX_KEYS];
>> 
>>  	bool wake_irq_enabled;
>> 
>> @@ -337,8 +337,13 @@ static int mip4_query_device(struct mip4_ts *ts)
>>  			ts->ppm_x, ts->ppm_y);
>> 
>>  		/* Key ts */
>> -		if (ts->node_key > 0)
>> +		if (ts->node_key > MIP4_MAX_KEYS) {
>> +			dev_warn(&ts->client->dev,
>> +				"Too many keys (%u) found\n", ts->node_key);
>> +			ts->key_num = MIP4_MAX_KEYS;
>> +		} else {
>>  			ts->key_num = ts->node_key;
>> +		}
> 
> I believe this is a bugfix. Please extract it into a separate patch.

Agree, will do so.

> 
>>  	}
>> 
>>  	/* Protocol */
>> @@ -1080,6 +1085,7 @@ static int mip4_flash_fw(struct mip4_ts *ts,
>>  			 const u8 *fw_data, u32 fw_size, u32 fw_offset)
>>  {
>>  	struct i2c_client *client = ts->client;
>> +	unsigned int i;
>>  	int offset;
>>  	u16 buf_addr;
>>  	int error, error2;
>> @@ -1149,6 +1155,11 @@ static int mip4_flash_fw(struct mip4_ts *ts,
>>  	input_abs_set_res(ts->input, ABS_X, ts->ppm_x);
>>  	input_abs_set_res(ts->input, ABS_Y, ts->ppm_y);
>> 
>> +	for (i = 0; i < ts->key_num; i++) {
>> +		if (ts->key_code[i])
>> +			input_set_capability(ts->input, EV_KEY, ts->key_code[i]);
>> +	}
>> +
>>  	return error ? error : 0;
>>  }
>> 
>> @@ -1425,6 +1436,7 @@ static int mip4_probe(struct i2c_client *client)
>>  {
>>  	struct mip4_ts *ts;
>>  	struct input_dev *input;
>> +	unsigned int i;
>>  	int error;
>> 
>>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>> @@ -1471,6 +1483,17 @@ static int mip4_probe(struct i2c_client 
>> *client)
>> 
>>  	input_set_drvdata(input, ts);
>> 
>> +#ifdef CONFIG_OF
>> +	error = of_property_read_u32_array(client->dev.of_node, 
>> "linux,keycodes",
>> +					   ts->key_code, ts->key_num);
>> +	if (error && ts->key_num) {
>> +		dev_warn(&client->dev,
>> +			 "Failed to get codes for %u supported keys", ts->key_num);
>> +		/* Disable touchkey support */
>> +		ts->key_num = 0;
>> +	}
> 
> Please use generic device properties (device_property_read_u32_array())
> and drop the dependency on OF.
> 
>> +#endif
>> +
>>  	input->keycode = ts->key_code;
>>  	input->keycodesize = sizeof(*ts->key_code);
>>  	input->keycodemax = ts->key_num;
>> @@ -1491,6 +1514,11 @@ static int mip4_probe(struct i2c_client 
>> *client)
>>  	if (error)
>>  		return error;
>> 
>> +	for (i = 0; i < ts->key_num; i++) {
>> +		if (ts->key_code[i])
>> +			input_set_capability(input, EV_KEY, ts->key_code[i]);
>> +	}
>> +
>>  	i2c_set_clientdata(client, ts);
>> 
>>  	error = devm_request_threaded_irq(&client->dev, client->irq,
>> 
> 
> Thanks.
> 
> --
> Dmitry

