Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263E1447E6D
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 12:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238933AbhKHLHR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 06:07:17 -0500
Received: from phobos.denx.de ([85.214.62.61]:47070 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238910AbhKHLHQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Nov 2021 06:07:16 -0500
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3B6CD83628;
        Mon,  8 Nov 2021 12:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636369471;
        bh=rqREcvH3hsepBh2nGWr0ysQ2SuQuqHok8d913fd1s0s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WX4eokbJmv9FZDZo+k7LQNpNB/Y4+CqRNVHsy6KOr3GxvEBNs4/wN0qkOvq8CIT7C
         7FqwwArGZVhO2YRmYOwioIIyR/MUJw4BYmn+URxItD5yeUu3j1K3XqTeEhwa7c5VSo
         h63gi/Yvl4D3nz/d8IMu37ZcsCLXXrzSOELYTa2qdPhhfJ0tcZcHpj/KBkKzd2qDWw
         vff+qEbdWP5FbmUuHazu25YtNqCLE62GriPK84JeLE0cPo4/11yYtL7+20W3mPP3yj
         /8sV4CywVEld5BGTBOwGdt4hI7nv/V+Q8fCoS4K5YyC/lDQOAB9KPm+HnmovrDNCzY
         fccOl8cg/z7yg==
Subject: Re: [PATCH] Input: ili210x - Improve polled sample spacing
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20211108005216.480525-1-marex@denx.de>
 <YYibdjD35P2RklGh@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b541d4b7-0b3e-6ccd-abbb-8448c1c57c22@denx.de>
Date:   Mon, 8 Nov 2021 12:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYibdjD35P2RklGh@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/8/21 4:37 AM, Dmitry Torokhov wrote:
> Hi Marek,

Hi,

[...]

>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
>> index a3b71a9511eb3..b2d9fe1e1c707 100644
>> --- a/drivers/input/touchscreen/ili210x.c
>> +++ b/drivers/input/touchscreen/ili210x.c
>> @@ -328,10 +328,13 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>>   	const struct ili2xxx_chip *chip = priv->chip;
>>   	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
>>   	bool keep_polling;
>> +	ktime_t time_next;
>> +	s64 time_delta;
>>   	bool touch;
>>   	int error;
>>   
>>   	do {
>> +		time_next = ktime_add_ms(ktime_get(), ILI2XXX_POLL_PERIOD);
>>   		error = chip->get_touch_data(client, touchdata);
>>   		if (error) {
>>   			dev_err(&client->dev,
>> @@ -341,8 +344,11 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>>   
>>   		touch = ili210x_report_events(priv, touchdata);
>>   		keep_polling = chip->continue_polling(touchdata, touch);
>> -		if (keep_polling)
>> -			msleep(ILI2XXX_POLL_PERIOD);
>> +		if (keep_polling) {
>> +			time_delta = ktime_us_delta(time_next, ktime_get());
> 
> Do we really need to use exact time, or ktime_get_coarse() is good
> enough, as it is cheaper?

ktime_get_coarse() introduces multi-millisecond jitter into the samples 
if you have low HZ setting, which isn't really nice. That's also why I 
use ktime and not jiffies here, jiffies has the same problem.
