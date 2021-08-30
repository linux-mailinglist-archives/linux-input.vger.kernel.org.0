Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953503FBF76
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbhH3XeH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:34:07 -0400
Received: from phobos.denx.de ([85.214.62.61]:55022 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231783AbhH3XeG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:34:06 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 73322833CF;
        Tue, 31 Aug 2021 01:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630366391;
        bh=x3595ZziGjt6L4uthYlmaxVVZs7g39Z9ty8UJK8/p6g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=W8BjZAw5E8ZOWiZr7+5NxXciKTxiGgR2iDiPOs0b2G7UUgwkh8ZGVQSfJyGUvbKRK
         P4jRQWywoJ5ywr5RhHR7+/xZNp4N1G9FnIQGOAp+PaLVd4f8gLnYj4EQK4/vlsVjBX
         BaCfS7lBAnjRQYym7cdfd+bQEeoLGy4BwP8G0XdQ79f9oxGG6KzusM0s6U7zyXB+tm
         my5gyJSa1RLtn3T+UGPI8IY+o07KDIowcIzUgOnQVV28UafTvoElyxl08Y8HrPjNS7
         Oys/cQkHHDEyb5BrwVe8j6DksSm5V5Eraj4maySwCrUuTE3WfEpT/mGcmFjAAzn4iJ
         KlQKVkP1aMbZw==
Subject: Re: [PATCH v2 2/3] Input: ili210x - export ili251x version details
 via sysfs
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-2-marex@denx.de> <YS1HPKNZMP1XofM0@google.com>
 <991280e5-fd54-75d5-d2f2-bb2673303881@denx.de> <YS1ntnYD2ic5MGYy@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <f16a2957-de02-3165-f3d6-31620e8fae4a@denx.de>
Date:   Tue, 31 Aug 2021 01:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1ntnYD2ic5MGYy@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/31/21 1:20 AM, Dmitry Torokhov wrote:
> On Tue, Aug 31, 2021 at 01:02:57AM +0200, Marek Vasut wrote:
>> On 8/30/21 11:01 PM, Dmitry Torokhov wrote:
>>
>> [...]
>>
>>>> @@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>>>>    	return 0;
>>>>    }
>>>> +static ssize_t ili251x_firmware_version_show(struct device *dev,
>>>> +					     struct device_attribute *attr,
>>>> +					     char *buf)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct ili210x *priv = i2c_get_clientdata(client);
>>>> +	u8 fw[8];
>>>> +	int ret;
>>>> +
>>>> +	/* Get firmware version */
>>>> +	mutex_lock(&priv->lock);
>>>> +	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
>>>> +				   &fw, sizeof(fw));
>>>> +	mutex_unlock(&priv->lock);
>>>
>>> Could we query firmware version and mode at probe time (and also later
>>> after firmware update attempt) so that we do not need to introduce
>>> locking against interrupt handler?
>>
>> This is a threaded interrupt handler and I don't expect much lock contention
>> here.
>>
>> The sysfs attribute readout would race with the interrupt handler and if it
>> wasn't for the firmware update support, we could very well cache all those
>> values. Except, the firmware update can change them all. Worse, if the
>> interrupt were to fire during an update, it could break that update, and I
>> want to prevent that from happening.
> 
> Usually we simply disable interrupts from the device when updating
> firmware.

I don't think this touch controller has any "disable interrupts" bit.
So the only option here would be some disable_irq() on the IRQ line itself ?
