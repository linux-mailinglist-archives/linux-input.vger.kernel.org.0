Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21F4176377
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 20:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgCBTJE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 14:09:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51421 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbgCBTJE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 14:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583176142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WmckbSg+HYyyI4kOSwe71WkfPgRWX5rCdwArN9MozOU=;
        b=brrDVe+9JmkxzWRfYrESTPV3avWSdnc5Ndbg6x0vx2hPZFCISTt1RS2kx68ks0weVPadL5
        RkW0cEoXPNO+vF9ezOHsSBWTEdKrPeYI9b4iSvvRg8iwiOlVqywLElE8emlKBXA2VwCWu0
        3/5YiX5py4+d24pUEjcr1o6t5o6cyKQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-L_F0QyZFMZixhp-FCKek7A-1; Mon, 02 Mar 2020 14:08:58 -0500
X-MC-Unique: L_F0QyZFMZixhp-FCKek7A-1
Received: by mail-wr1-f69.google.com with SMTP id t14so114737wrs.12
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 11:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WmckbSg+HYyyI4kOSwe71WkfPgRWX5rCdwArN9MozOU=;
        b=OhkMK6wDS0kwJvqGhWrcdyJ9DNy9AmpT12RXNlgoX+jZBOqf7ng5tYL1go2Rwb0F/w
         W28RoVY3W1wOI6EIh7Wc0MPcEdq2kfB+UzUdy7L/+ddW5Mpg3yDGPJroZTIlVJApu/2A
         IqGhxu10/gJTuoD7by6S4pPdaFq6msJqg05TnODb3rNusaz4lXMH4noH5/DdeSEV2e1Q
         vLBku+JcrFnu1CgxeSae9yZPAGIOexzqQpvYDnhX+YAz+YzhM73kACkOIxfQa9h3X8Km
         kzwsSM5VYSXpHav6J1v86yJfWcalJ2RqQE3IGY7WYYirVkvtJSVAWdcTGrKQeCnPSj86
         G7Kg==
X-Gm-Message-State: ANhLgQ3EIC+5L7Q3TRwzgciN9vaJB/4/nseIybgsHgnrSCCmGKfLwf3F
        DG+4fGrXrATklYiZermo7GdK6hk3M9Z5y5nwT3+xO6n6GAlo4FchEePwlilEd6rRqV4ncolNK/B
        bnW378IQT+uOpIXl0kO2d82o=
X-Received: by 2002:a1c:a502:: with SMTP id o2mr7925wme.94.1583176137056;
        Mon, 02 Mar 2020 11:08:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuQR2u0p5zBne+aCfMxUZ1B0kzVqblt7nTT/q5K7nk22apW17d0LFoeLFThjqo9qb4/VCcpWg==
X-Received: by 2002:a1c:a502:: with SMTP id o2mr7913wme.94.1583176136777;
        Mon, 02 Mar 2020 11:08:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id z14sm29746277wru.31.2020.03.02.11.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 11:08:56 -0800 (PST)
Subject: Re: [PATCH resend 10/10] Input: goodix - Restore config on resume if
 necessary
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <20200221164735.508324-10-hdegoede@redhat.com>
 <30842bb43aa29e8f1edeadc335e3f792a7a76092.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f4a2ea92-8733-3b3c-fe18-ec54d617336b@redhat.com>
Date:   Mon, 2 Mar 2020 20:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <30842bb43aa29e8f1edeadc335e3f792a7a76092.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 12:35 PM, Bastien Nocera wrote:
> On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
>> Some devices, e.g the Trekstor Primetab S11B, loose there config over
> 
> "lose".
> 
>> a suspend/resume cycle (likely the controller looses power during
> 
> "loses".
> 
>> suspend).
>>
>> This commit reads back the config version on resume and if matches
>> the
>> expected config version it resets the controller and resends the
>> config
>> we read back and saved at probe time.
>>
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
>>   drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index 0f39c499e3a9..389d3e044f97 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -1232,6 +1232,7 @@ static int __maybe_unused goodix_resume(struct
>> device *dev)
>>   {
>>   	struct i2c_client *client = to_i2c_client(dev);
>>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>> +	u8 config_ver;
>>   	int error;
>>   
>>   	if (ts->irq_pin_access_method == irq_pin_access_none) {
>> @@ -1253,6 +1254,27 @@ static int __maybe_unused goodix_resume(struct
>> device *dev)
>>   	if (error)
>>   		return error;
>>   
>> +	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
>> +				&config_ver, 1);
>> +	if (error)
>> +		dev_warn(dev, "Error reading config version: %d,
>> resetting controller\n",
>> +			 error);
>> +	else if (config_ver != ts->config[0])
>> +		dev_warn(dev, "Config version mismatch %d != %d,
>> resetting controller\n",
>> +			 config_ver, ts->config[0]);
> 
> Should it really be a warning if it happens regularly?

Good point, I've changed this to a dev_info for v2.

Regards,

Hans



> 
>> +
>> +	if (error != 0 || config_ver != ts->config[0]) {
>> +		error = goodix_reset(ts);
>> +		if (error) {
>> +			dev_err(dev, "Controller reset failed.\n");
>> +			return error;
>> +		}
>> +
>> +		error = goodix_send_cfg(ts, ts->config, ts->chip-
>>> config_len);
>> +		if (error)
>> +			return error;
>> +	}
>> +
>>   	error = goodix_request_irq(ts);
>>   	if (error)
>>   		return error;
> 

