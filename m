Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237081762D1
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 19:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgCBSgM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 13:36:12 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49517 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727234AbgCBSgL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 13:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583174170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nRLQ2JHBohImnxCIQxknqMZPTNVyVazCV846WCt75kI=;
        b=AMSiOAKlbpN84/WgDCxFZlW3jwFAA0jcEPGA0VtJo26DdXWu5emd3RqCVx1cnjDryo/HMy
        n1PtRycJ1NujigZ+W2V7G5UgJjS0/NKAKKbqXeAMbL56Huhtd8l99rwRpNawRKeG40dWf4
        V/xZTDD+cs7WLPOEg61CvxQAK3gxcXw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-nMn5fvaVO6OYz8jUXw8Llw-1; Mon, 02 Mar 2020 13:36:05 -0500
X-MC-Unique: nMn5fvaVO6OYz8jUXw8Llw-1
Received: by mail-wr1-f70.google.com with SMTP id c6so72078wrm.18
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 10:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nRLQ2JHBohImnxCIQxknqMZPTNVyVazCV846WCt75kI=;
        b=EJXyTyjAmv2gkuGnG/fNnUITgx0XYJ8SYleUaWyD4XioOQIAUYdMJUDn1Yr70CZ0ag
         Yrdcp/+5V7aSx1nEqXJ2BMcFGHwPAZ6gWgEjCDRa/Jm9ymJgLTCG8cLWPmDS82lBwrNS
         vBhRRyNuf1jHQr+qJLBaa7iYPqI4UZFHw4fZNyZbgdWq2inTtk+Q26pSUjUS5XNLZyRt
         ooRK5nvNyVJvnvBV/bBD3l/GS3ZOgTwaKXbvSs3PVuq0/vYKV2lfMdKvh4oEpZodYW/A
         dqx7UNxWb3JttGHIYpcuxWqbM7P9GPYKd+GDGEpDnLS9EzEOkap3dXJpm5mOa2ZzAAGF
         qVMA==
X-Gm-Message-State: ANhLgQ225wo5syTMtwnj7XqP46BS103pkgho67sp2mgRT2RxYQ85iqPv
        HnXALGj6Kz11X/Ke4MXuN9nsXwZrCuXW9rH6TgDLwhECG3SOZdvTjkPYaEDMG4FTkFECo1MFadt
        SQtN22OatPlNWe0+FTpqNan8=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr338348wmb.73.1583174164374;
        Mon, 02 Mar 2020 10:36:04 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv9eu5yHirljcZOeboPtWlX6jfZC5zS9ge2HS2YEB+oWoTPdaadjC3Zfa7+zmCLsoBVy65uNQ==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr338335wmb.73.1583174164118;
        Mon, 02 Mar 2020 10:36:04 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id o18sm25340927wrv.60.2020.03.02.10.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 10:36:03 -0800 (PST)
Subject: Re: [PATCH resend 08/10] Input: goodix - Save a copy of the config
 from goodix_read_config()
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <20200221164735.508324-8-hdegoede@redhat.com>
 <bc32be9b924170832aedd9661802f367bebdadca.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <515adc49-cb2b-031d-6c00-7f6d02593a32@redhat.com>
Date:   Mon, 2 Mar 2020 19:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bc32be9b924170832aedd9661802f367bebdadca.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 12:30 PM, Bastien Nocera wrote:
> On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
>> Save a copy of the config in goodix_read_config(), this is a
>> preparation
>> patch for restoring the config if it was lost after a supend/resume
>> cycle.
> 
> Is "fix" really the best verb for this "calculate checksum"?

Good point, I've renamed fix_config to calc_config_checksum for v2.

>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Looks fine apart from the nitpicks.
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> 
>> ---
>>   drivers/input/touchscreen/goodix.c | 51 ++++++++++++++++++++++++++
>> ----
>>   1 file changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index 66d6bb74507d..21be33384d14 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -72,6 +72,7 @@ struct goodix_chip_data {
>>   	u16 config_addr;
>>   	int config_len;
>>   	int (*check_config)(struct goodix_ts_data *, const struct
>> firmware *);
>> +	void (*fix_config)(struct goodix_ts_data *ts);
>>   };
>>   
>>   struct goodix_ts_data {
>> @@ -96,35 +97,42 @@ struct goodix_ts_data {
>>   	unsigned long irq_flags;
>>   	enum goodix_irq_pin_access_method irq_pin_access_method;
>>   	unsigned int contact_size;
>> +	u8 config[GOODIX_CONFIG_MAX_LENGTH];
>>   };
>>   
>>   static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>>   			const struct firmware *cfg);
>>   static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>>   			const struct firmware *cfg);
>> +static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
>> +static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
>>   
>>   static const struct goodix_chip_data gt1x_chip_data = {
>>   	.config_addr		= GOODIX_GT1X_REG_CONFIG_DATA,
>>   	.config_len		= GOODIX_CONFIG_MAX_LENGTH,
>>   	.check_config		= goodix_check_cfg_16,
>> +	.fix_config		= goodix_fix_cfg_16,
>>   };
>>   
>>   static const struct goodix_chip_data gt911_chip_data = {
>>   	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>>   	.config_len		= GOODIX_CONFIG_911_LENGTH,
>>   	.check_config		= goodix_check_cfg_8,
>> +	.fix_config		= goodix_fix_cfg_8,
>>   };
>>   
>>   static const struct goodix_chip_data gt967_chip_data = {
>>   	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>>   	.config_len		= GOODIX_CONFIG_967_LENGTH,
>>   	.check_config		= goodix_check_cfg_8,
>> +	.fix_config		= goodix_fix_cfg_8,
>>   };
>>   
>>   static const struct goodix_chip_data gt9x_chip_data = {
>>   	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>>   	.config_len		= GOODIX_CONFIG_MAX_LENGTH,
>>   	.check_config		= goodix_check_cfg_8,
>> +	.fix_config		= goodix_fix_cfg_8,
>>   };
>>   
>>   static const unsigned long goodix_irq_flags[] = {
>> @@ -442,6 +450,19 @@ static int goodix_check_cfg_8(struct
>> goodix_ts_data *ts,
>>   	return 0;
>>   }
>>   
>> +static void goodix_fix_cfg_8(struct goodix_ts_data *ts)
>> +{
>> +	int i, raw_cfg_len = ts->chip->config_len - 2;
>> +	u8 check_sum = 0;
>> +
>> +	for (i = 0; i < raw_cfg_len; i++)
>> +		check_sum += ts->config[i];
>> +	check_sum = (~check_sum) + 1;
>> +
>> +	ts->config[raw_cfg_len] = check_sum;
>> +	ts->config[raw_cfg_len + 1] = 1;
> 
> Would be good to mention that this is the "config_fresh" bit, in this
> function and others.

Will fix for v2.

> 
>> +}
>> +
>>   static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>>   			const struct firmware *cfg)
>>   {
>> @@ -466,6 +487,19 @@ static int goodix_check_cfg_16(struct
>> goodix_ts_data *ts,
>>   	return 0;
>>   }
>>   
>> +static void goodix_fix_cfg_16(struct goodix_ts_data *ts)
>> +{
>> +	int i, raw_cfg_len = ts->chip->config_len - 3;
>> +	u16 check_sum = 0;
>> +
>> +	for (i = 0; i < raw_cfg_len; i += 2)
>> +		check_sum += get_unaligned_be16(&ts->config[i]);
>> +	check_sum = (~check_sum) + 1;
>> +
>> +	put_unaligned_be16(check_sum, &ts->config[raw_cfg_len]);
>> +	ts->config[raw_cfg_len + 2] = 1;
>> +}
>> +
>>   /**
>>    * goodix_check_cfg - Checks if config fw is valid
>>    *
>> @@ -828,12 +862,11 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>    */
>>   static void goodix_read_config(struct goodix_ts_data *ts)
>>   {
>> -	u8 config[GOODIX_CONFIG_MAX_LENGTH];
>>   	int x_max, y_max;
>>   	int error;
>>   
>>   	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
>> -				config, ts->chip->config_len);
>> +				ts->config, ts->chip->config_len);
>>   	if (error) {
>>   		dev_warn(&ts->client->dev, "Error reading config:
>> %d\n",
>>   			 error);
>> @@ -842,15 +875,21 @@ static void goodix_read_config(struct
>> goodix_ts_data *ts)
>>   		return;
>>   	}
>>   
>> -	ts->int_trigger_type = config[TRIGGER_LOC] & 0x03;
>> -	ts->max_touch_num = config[MAX_CONTACTS_LOC] & 0x0f;
>> +	ts->int_trigger_type = ts->config[TRIGGER_LOC] & 0x03;
>> +	ts->max_touch_num = ts->config[MAX_CONTACTS_LOC] & 0x0f;
>>   
>> -	x_max = get_unaligned_le16(&config[RESOLUTION_LOC]);
>> -	y_max = get_unaligned_le16(&config[RESOLUTION_LOC + 2]);
>> +	x_max = get_unaligned_le16(&ts->config[RESOLUTION_LOC]);
>> +	y_max = get_unaligned_le16(&ts->config[RESOLUTION_LOC + 2]);
>>   	if (x_max && y_max) {
>>   		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_X,
>> x_max - 1);
>>   		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_Y,
>> y_max - 1);
>>   	}
>> +
>> +	/*
>> +	 * Ensure valid checksum and config_fresh bit being set for
>> possible
>> +	 * re-upload of config after suspend/resume.
>> +	 */
> 
> I think that the explanation should ultimately be shorter if the vfunc
> was better named.
> 
>> +	ts->chip->fix_config(ts);
>>   }
>>   
>>   /**
> 


Regards,

Hans

