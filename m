Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBD9431854
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 14:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhJRMCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 08:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhJRMCa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 08:02:30 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DF2C06161C
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 05:00:19 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 56AF5833F4;
        Mon, 18 Oct 2021 14:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634558417;
        bh=jELqK1cMbvggdkZcmA0ltNmY4/YCdaZaKJ8lqMYOJ5k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BkYX5J+Da0h18QmC3R5x4nncXQAKA3mc9bHtlTdCTdJK90Ql5bUI4asEs0JJKFRJ9
         23PsaV4Olmq/CcxevNthzAlrzn+GM3mLTd82eanWIQtlXqpauGBnkcDZJHhABFrad6
         NDagKzXMDgn5jv7HIhkW+XGbsIy5CbRVoYRT6TCQdGOO+m9uuFZmj3iMN4MDJs90MG
         xGweEdShlJ3IQ9byuk0n1nJphoxuu8kRgKmY9pkYi9uH09QLlKy4qZ474L93qgDPZH
         bZDSxxTf67m7Z1RZQH3bn9k/Oa/NvTC/hF1PVYqGUT1PR315D1U6tDbyHSskgws2Jn
         x3mcwGlsq3dNA==
Subject: Re: [PATCH] Input: ili210x - Make ili251x_firmware_to_buffer more
 generic
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20211017172435.47812-1-marex@denx.de>
 <YWz+qVvfeENpX8uF@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <70448caf-d2d2-a5f1-ae51-a8d1916257ff@denx.de>
Date:   Mon, 18 Oct 2021 14:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWz+qVvfeENpX8uF@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[...]

>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c

[...]

>> @@ -599,10 +613,13 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
>>   	/* DF end address is the last address in the firmware blob */
>>   	*df_end = fw_addr + fw_len;
>>   	*buf = fw_buf;
>> +	release_firmware(fw);
>>   	return 0;
>>   
>>   err_big:
>>   	kfree(fw_buf);
>> +err_mem:
>> +	release_firmware(fw);
> 
> So with that we are essentially back to the original version where we
> have to release firmware in both branches. If we keep loading firmware
> in this function, maybe we could do:

It seems to me the usual fail path with undoing what the function did is 
more obvious, but I can send a V2 with this below.

> 	...
> out:
> 	if (retval)
> 		kfree(fw_buf);
> 	release_firmware(fw);
> 	return retval;
> 
> ?
> 
>>   	return error;
>>   }
>>   
>> @@ -759,22 +776,13 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>>   					     const char *buf, size_t count)
>>   {
>>   	struct i2c_client *client = to_i2c_client(dev);
>> -	const char *fwname = ILI251X_FW_FILENAME;
>> -	const struct firmware *fw;
>> +	struct ili210x *priv = i2c_get_clientdata(client);
>>   	u16 ac_end, df_end;
>>   	u8 *fwbuf;
>>   	int error;
>>   	int i;
>>   
>> -	error = request_ihex_firmware(&fw, fwname, dev);
>> -	if (error) {
>> -		dev_err(dev, "Failed to request firmware %s, error=%d\n",
>> -			fwname, error);
>> -		return error;
>> -	}
>> -
>> -	error = ili251x_firmware_to_buffer(fw, &fwbuf, &ac_end, &df_end);
>> -	release_firmware(fw);
> 
> You do not like releasing firmware before checking if we could parse it
> successfully?

This patch doesn't change that behavior, it only wraps the 
request/release of firmware into the ili210x_firmware_to_buffer() 
function, since that ihex firmware is not used anywhere else.

>> +	error = ili210x_firmware_to_buffer(dev, &fwbuf, &ac_end, &df_end);
>>   	if (error)
>>   		return error;
>>   

[...]
