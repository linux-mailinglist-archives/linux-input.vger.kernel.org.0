Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E30176344
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 19:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCBSxm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 13:53:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35269 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727388AbgCBSxm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 13:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583175220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4+fp1q9dmCx9+dnhNu6leKRRJeuT3UaNdlA9XKLKqOQ=;
        b=MBSaqvN9iPylAQKDfd7Kpy+MU4jiLbmQVMjdqWEwGstjUCOjanq+AM9T/tbNSVAa/o7ArB
        QSmnaJEL2iWSjnR+OCR08+4GgPGTfTSiYDnyg3vkWrRmfbNaiNgXjae1nlKdDgH/Sqcj6v
        qR2gx0QD0Kk1oILS5c/hTEnsVd9igsE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Gzuh84iWMYu5FuNPHe0ohg-1; Mon, 02 Mar 2020 13:53:39 -0500
X-MC-Unique: Gzuh84iWMYu5FuNPHe0ohg-1
Received: by mail-wm1-f69.google.com with SMTP id w12so55568wmc.3
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 10:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4+fp1q9dmCx9+dnhNu6leKRRJeuT3UaNdlA9XKLKqOQ=;
        b=OZu9HtjanphxaZijI9J9cvdv6ETswT0WQlyrtUXDTgh96KZmRsdEmxVIixl5K00lGe
         JaKkbiA5sW6WVic3F6wGII7tC8l7YoAwMF8jMBXviqzow9rW9jNigZI+dC54w2sRNPFU
         NGsgi6NPxE2Axq0NyqDrM3rogrVMJYss9uuA2wCuvc6h6Hv2V0nDHSJigH641z79iOJB
         QWfwH9+WLx3S06USUODKgOAw5ZFblGWcwk7MKGq6g8oZ8lajkQjgRMnLqIdPviZ5NnB2
         xEe5uVxXqxxXv3qsjpzocJHC7NQUpjYZytYwYa6YwDsizMusBfWrNxR17KCYOnU70weD
         P6fg==
X-Gm-Message-State: ANhLgQ1LqcU9RCFdobZrugGc7S64XUhQNQL9KQveA4G+Eny4+w597LDK
        3EmHkC5E0DNwqrqV8znumpl2SSY/ZiC2QmwHL9BILAOIMULDSMCf3lwGJm7P/yD315RebhXUINU
        g30nI/QExd1AFFaxg3n/KNag=
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr42619wmj.161.1583175217209;
        Mon, 02 Mar 2020 10:53:37 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtjmn7UzAjLZ0TZLS/E6IIGhBoWNrFqlY/co1uOuf+963usNGfRbmlNO8Yub+E8NdkoLLWYZw==
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr42605wmj.161.1583175216880;
        Mon, 02 Mar 2020 10:53:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id j12sm30073325wrt.35.2020.03.02.10.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 10:53:36 -0800 (PST)
Subject: Re: [PATCH resend 09/10] Input: goodix - Make goodix_send_cfg() take
 a raw buffer as argument
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <20200221164735.508324-9-hdegoede@redhat.com>
 <55c1159deb1b7b43bb8b404ab9467eaae9ebbb85.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0717ff90-3bc8-e08d-3b94-c700cd749bb0@redhat.com>
Date:   Mon, 2 Mar 2020 19:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <55c1159deb1b7b43bb8b404ab9467eaae9ebbb85.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 12:33 PM, Bastien Nocera wrote:
> On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
>> Make goodix_send_cfg() take a raw buffer as argument instead of a
>> struct firmware *cfg, so that it can also be used to restore the
>> config
>> on resume if necessary.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/input/touchscreen/goodix.c | 46 ++++++++++++++------------
>> ----
>>   1 file changed, 21 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index 21be33384d14..0f39c499e3a9 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -71,7 +71,7 @@ enum goodix_irq_pin_access_method {
>>   struct goodix_chip_data {
>>   	u16 config_addr;
>>   	int config_len;
>> -	int (*check_config)(struct goodix_ts_data *, const struct
>> firmware *);
>> +	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg,
>> int len);
> 
> Any way to make the length a uint instead of an int? That way, we
> wouldn't need to add < 0 guards, and the "len > MAX_LENGTH" check would
> be enough.

Actually the code does things like:

	int raw_cfg_len = len - 3;

         for (i = 0; i < raw_cfg_len; i += 2)
                 check_sum += get_unaligned_be16(&ts->config[i]);
	check_sum = (~check_sum) + 1;
	if (check_sum != get_unaligned_be16(&cfg[raw_cfg_len])) {

Which is bad without a minimum check regardless of us using signed
or unsigned ints here. unsigned ints will short-circuit / skip the for
loop when len < 3, but then we end up with a negative array index when
doing: &cfg[raw_cfg_len]. And when going unsigned then both the loop
and the array index will be out of bounds when len < 3. So the proper
fix here is to add a minimum check.

I will add an extra patch to the patch-set adding a minimum bounds check.

Regards,

Hans

	


> 
> Looks good otherwise:
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> 
>>   	void (*fix_config)(struct goodix_ts_data *ts);
>>   };
>>   
>> @@ -101,9 +101,9 @@ struct goodix_ts_data {
>>   };
>>   
>>   static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>> -			const struct firmware *cfg);
>> +			      const u8 *cfg, int len);
>>   static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>> -			const struct firmware *cfg);
>> +			       const u8 *cfg, int len);
>>   static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
>>   static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
>>   
>> @@ -426,22 +426,21 @@ static int goodix_request_irq(struct
>> goodix_ts_data *ts)
>>   					 ts->irq_flags, ts->client-
>>> name, ts);
>>   }
>>   
>> -static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>> -			const struct firmware *cfg)
>> +static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8
>> *cfg, int len)
>>   {
>> -	int i, raw_cfg_len = cfg->size - 2;
>> +	int i, raw_cfg_len = len - 2;
>>   	u8 check_sum = 0;
>>   
>>   	for (i = 0; i < raw_cfg_len; i++)
>> -		check_sum += cfg->data[i];
>> +		check_sum += cfg[i];
>>   	check_sum = (~check_sum) + 1;
>> -	if (check_sum != cfg->data[raw_cfg_len]) {
>> +	if (check_sum != cfg[raw_cfg_len]) {
>>   		dev_err(&ts->client->dev,
>>   			"The checksum of the config fw is not
>> correct");
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (cfg->data[raw_cfg_len + 1] != 1) {
>> +	if (cfg[raw_cfg_len + 1] != 1) {
>>   		dev_err(&ts->client->dev,
>>   			"Config fw must have Config_Fresh register
>> set");
>>   		return -EINVAL;
>> @@ -463,22 +462,22 @@ static void goodix_fix_cfg_8(struct
>> goodix_ts_data *ts)
>>   	ts->config[raw_cfg_len + 1] = 1;
>>   }
>>   
>> -static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>> -			const struct firmware *cfg)
>> +static int goodix_check_cfg_16(struct goodix_ts_data *ts, const u8
>> *cfg,
>> +			       int len)
>>   {
>> -	int i, raw_cfg_len = cfg->size - 3;
>> +	int i, raw_cfg_len = len - 3;
>>   	u16 check_sum = 0;
>>   
>>   	for (i = 0; i < raw_cfg_len; i += 2)
>> -		check_sum += get_unaligned_be16(&cfg->data[i]);
>> +		check_sum += get_unaligned_be16(&cfg[i]);
>>   	check_sum = (~check_sum) + 1;
>> -	if (check_sum != get_unaligned_be16(&cfg->data[raw_cfg_len])) {
>> +	if (check_sum != get_unaligned_be16(&cfg[raw_cfg_len])) {
>>   		dev_err(&ts->client->dev,
>>   			"The checksum of the config fw is not
>> correct");
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (cfg->data[raw_cfg_len + 2] != 1) {
>> +	if (cfg[raw_cfg_len + 2] != 1) {
>>   		dev_err(&ts->client->dev,
>>   			"Config fw must have Config_Fresh register
>> set");
>>   		return -EINVAL;
>> @@ -506,16 +505,15 @@ static void goodix_fix_cfg_16(struct
>> goodix_ts_data *ts)
>>    * @ts: goodix_ts_data pointer
>>    * @cfg: firmware config data
>>    */
>> -static int goodix_check_cfg(struct goodix_ts_data *ts,
>> -			    const struct firmware *cfg)
>> +static int goodix_check_cfg(struct goodix_ts_data *ts, const u8
>> *cfg, int len)
>>   {
>> -	if (cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
>> +	if (len > GOODIX_CONFIG_MAX_LENGTH) {
>>   		dev_err(&ts->client->dev,
>>   			"The length of the config fw is not correct");
>>   		return -EINVAL;
>>   	}
>>   
>> -	return ts->chip->check_config(ts, cfg);
>> +	return ts->chip->check_config(ts, cfg, len);
>>   }
>>   
>>   /**
>> @@ -524,17 +522,15 @@ static int goodix_check_cfg(struct
>> goodix_ts_data *ts,
>>    * @ts: goodix_ts_data pointer
>>    * @cfg: config firmware to write to device
>>    */
>> -static int goodix_send_cfg(struct goodix_ts_data *ts,
>> -			   const struct firmware *cfg)
>> +static int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg,
>> int len)
>>   {
>>   	int error;
>>   
>> -	error = goodix_check_cfg(ts, cfg);
>> +	error = goodix_check_cfg(ts, cfg, len);
>>   	if (error)
>>   		return error;
>>   
>> -	error = goodix_i2c_write(ts->client, ts->chip->config_addr,
>> cfg->data,
>> -				 cfg->size);
>> +	error = goodix_i2c_write(ts->client, ts->chip->config_addr,
>> cfg, len);
>>   	if (error) {
>>   		dev_err(&ts->client->dev, "Failed to write config data:
>> %d",
>>   			error);
>> @@ -1058,7 +1054,7 @@ static void goodix_config_cb(const struct
>> firmware *cfg, void *ctx)
>>   
>>   	if (cfg) {
>>   		/* send device configuration to the firmware */
>> -		error = goodix_send_cfg(ts, cfg);
>> +		error = goodix_send_cfg(ts, cfg->data, cfg->size);
>>   		if (error)
>>   			goto err_release_cfg;
>>   	}
> 

