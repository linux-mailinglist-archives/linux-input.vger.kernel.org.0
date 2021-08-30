Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1053FBF42
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239059AbhH3XD5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239062AbhH3XDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:03:55 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B79C061760
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:03:00 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 423E1833DA;
        Tue, 31 Aug 2021 01:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630364578;
        bh=EHB8VV9O1SZNAB63BzkUMmaWp5688YeBwaIvO/UJJqQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YAeQlg6mFOFgByCpfuxNMJI+TU/U//Q4/8pz28sEwnaPbhFrptEHkOZ8boaT2SH0d
         yQX/bSFbWAhUgC1VzWFU2DTbzTS6h99LD1gj7YmGbCmlZf11WXhyMVbk81kxNz8Zf3
         V5513k8liW+k1K5UEYMNaeT2g8wCDjYeK4motHAEIUKLMTZC0o1LCEhfUO2RgCbinx
         4vhFpjoVxfgx0KBEnuTMLkP0XLCxziNRDynvqWmGLIQOIlL49VGOtbCcD+d84H/+jD
         07jNA6oRU2zgxIQTB42LA0WbExNIqLM2HyCNoCZPJf8wyV4ja5lLwOxHHKHuanHjYO
         LM2Q4zGHbGi3g==
Subject: Re: [PATCH v2 2/3] Input: ili210x - export ili251x version details
 via sysfs
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-2-marex@denx.de> <YS1HPKNZMP1XofM0@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <991280e5-fd54-75d5-d2f2-bb2673303881@denx.de>
Date:   Tue, 31 Aug 2021 01:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1HPKNZMP1XofM0@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/30/21 11:01 PM, Dmitry Torokhov wrote:

[...]

>> @@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static ssize_t ili251x_firmware_version_show(struct device *dev,
>> +					     struct device_attribute *attr,
>> +					     char *buf)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct ili210x *priv = i2c_get_clientdata(client);
>> +	u8 fw[8];
>> +	int ret;
>> +
>> +	/* Get firmware version */
>> +	mutex_lock(&priv->lock);
>> +	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
>> +				   &fw, sizeof(fw));
>> +	mutex_unlock(&priv->lock);
> 
> Could we query firmware version and mode at probe time (and also later
> after firmware update attempt) so that we do not need to introduce
> locking against interrupt handler?

This is a threaded interrupt handler and I don't expect much lock 
contention here.

The sysfs attribute readout would race with the interrupt handler and if 
it wasn't for the firmware update support, we could very well cache all 
those values. Except, the firmware update can change them all. Worse, if 
the interrupt were to fire during an update, it could break that update, 
and I want to prevent that from happening.

[...]
