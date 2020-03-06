Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795A717B8C4
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 09:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgCFIyg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 03:54:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51749 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725873AbgCFIyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 03:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583484874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KBL/hRkkdlvockqir54IqcUl++mMvmn3H/4duUsIMnQ=;
        b=AcGNc5lW/sKxyKn42VbWHk3Rn5PN5lAARayyn/0V0Bu4TFuBkPPqRzfDK+YQVhqdqAcTtF
        DrAoabh1Sm9zWGr1yj4CUW8niuejV0K5q9tQdiStLp+Wuy2bYA7c2eiyuXySvUqj71njV/
        lUPp9Q/zuqRugKRLTg3NEVkgLx7d0s0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-8LZD6eOdO22_PT1L0T4N1g-1; Fri, 06 Mar 2020 03:54:30 -0500
X-MC-Unique: 8LZD6eOdO22_PT1L0T4N1g-1
Received: by mail-wr1-f69.google.com with SMTP id z16so708467wrm.15
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 00:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KBL/hRkkdlvockqir54IqcUl++mMvmn3H/4duUsIMnQ=;
        b=J8RvoQsW60WHM+DuW9d/cI0EJp+Ua7nzumGIHFBFnxM4l/fwGyO6qjt0qzVpRyuD+o
         KbO+D7bJo21QXuQ6my3hYbJUg0W3SkXthgUBqe0casvlYeTTT1X+Vu/6jhErKM56+htC
         SzMb79UpBbZtR5WHuEXUlyJ1ysi+jFuJyLZ+dr/fF1sXNCL/8mMHm7ZHueLza/9sj3mZ
         1Iwegg1UNEJNhdcIgVGD5xTt6XRvVuMIlHy9mZ70kf9p/Y+dNAKKfGJo/aTeb3hSygF3
         rG1Kqkd2Evsw7tD/3B0brGQdYLfjY7wDr7u15gGmQfumOERQhxF69NuNFGVWZSjtJRuk
         8DnQ==
X-Gm-Message-State: ANhLgQ0T7QVhRBGm7ck7qvWLjTqenCFqfrTQcfPR3CmBDupGGdCHPqD5
        SFUKZUH+s4N9B8onAr0PuxvrGgQxGsKKGTKouAQ70V/zF/o672OSq/wgivER8M42NaQ/yPzWMml
        1hymrK6m30Bw2lVMm4HK81TI=
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr197509wmb.124.1583484868834;
        Fri, 06 Mar 2020 00:54:28 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt9aWl2ALe3rZctuLGpXLDFlXNnnMhtk9T1VAvxGwMWuMWLvQE5kWLtu1LxHN+QA8XaQdjpaQ==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr197484wmb.124.1583484868607;
        Fri, 06 Mar 2020 00:54:28 -0800 (PST)
Received: from x1.localdomain ([2a0e:5700:4:11:42c0:3c5d:2f33:1a6c])
        by smtp.gmail.com with ESMTPSA id u1sm29386971wrt.78.2020.03.06.00.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 00:54:27 -0800 (PST)
Subject: Re: [PATCH v2 01/11] Input: goodix - Refactor IRQ pin GPIO accesses
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
References: <20200305220132.228722-1-hdegoede@redhat.com>
 <20200306040301.GB217608@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <63a3f7ca-d2c8-2e42-4934-a7e7ca521507@redhat.com>
Date:   Fri, 6 Mar 2020 09:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306040301.GB217608@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/6/20 5:03 AM, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Thu, Mar 05, 2020 at 11:01:22PM +0100, Hans de Goede wrote:
>> Suspending Goodix touchscreens requires changing the interrupt pin to
>> output before sending them a power-down command. Followed by wiggling
>> the interrupt pin to wake the device up, after which it is put back
>> in input mode.
>>
>> So far we have only effectively supported this on devices which use
>> devicetree. On X86 ACPI platforms both looking up the pins; and using a
>> pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
>> we cannot directly access the IRQ pin as GPIO and we need to call ACPI
>> methods to control it instead.
>>
>> This commit adds a new irq_pin_access_method field to the goodix_chip_data
>> struct and adds goodix_irq_direction_output and goodix_irq_direction_input
>> helpers which together abstract the GPIO accesses to the IRQ pin.
>>
>> This is a preparation patch for adding support for properly suspending the
>> touchscreen on X86 ACPI platforms.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Make enum member names upper-case
>> ---
>>   drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++------
>>   1 file changed, 51 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index 0403102e807e..9cfbcf3cbca8 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -31,6 +31,11 @@
>>   
>>   struct goodix_ts_data;
>>   
>> +enum goodix_irq_pin_access_method {
>> +	IRQ_PIN_ACCESS_NONE,
>> +	IRQ_PIN_ACCESS_GPIO,
>> +};
>> +
>>   struct goodix_chip_data {
>>   	u16 config_addr;
>>   	int config_len;
>> @@ -53,6 +58,7 @@ struct goodix_ts_data {
>>   	const char *cfg_name;
>>   	struct completion firmware_loading_complete;
>>   	unsigned long irq_flags;
>> +	enum goodix_irq_pin_access_method irq_pin_access_method;
>>   	unsigned int contact_size;
>>   };
>>   
>> @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,
>>   	return 0;
>>   }
>>   
>> +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
>> +				       int value)
>> +{
>> +	switch (ts->irq_pin_access_method) {
>> +	case IRQ_PIN_ACCESS_NONE:
>> +		dev_err(&ts->client->dev,
>> +			"%s called without an irq_pin_access_method set\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	case IRQ_PIN_ACCESS_GPIO:
>> +		return gpiod_direction_output(ts->gpiod_int, value);
>> +	}
>> +
>> +	return -EINVAL; /* Never reached */
> 
> I do not like these "never reached" comments. We can either let compiler
> issue a warning that we did not cover all switch cases, or stick
> "default:" alongside "case IRQ_PIN_ACCESS_NONE:".

I just tried removing this line, this results in:

   CC [M]  drivers/input/touchscreen/goodix.o
drivers/input/touchscreen/goodix.c: In function ‘goodix_irq_direction_output’:
drivers/input/touchscreen/goodix.c:593:1: warning: control reaches end of non-void function [-Wreturn-type]
   593 | }
       | ^

And I do not want to add a default label, the switch-case is on an enum type and
if I do that I loose the useful warnings for one of the enum values not being
handled in the switch-case.

Regards,

Hans

