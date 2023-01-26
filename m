Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2006F67C7B2
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 10:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjAZJqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Jan 2023 04:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjAZJqA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Jan 2023 04:46:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCDBA254
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 01:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674726317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JIhKpCgZi4Qd+PtZ8lYpqohAptnpAYSZBkY1jLrxMPM=;
        b=DZRxhWTSjFuzvbiYneSDSWQjkq8plebXKpCQEDmLLh/ThGNycSMRa2ngIgMn2kv7+txN/S
        mSP/JMafqxUQGVqrBipnFQty2/aSqIHh3vSlJo0QnqE7wrcLPNeBCBydUcOqGCjrF3V02H
        bJq+6Cbgle/rhjdHl+Mo1VpPm9W8J4Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-p3lkK9jXP6CP2Bnz-G3NaQ-1; Thu, 26 Jan 2023 04:45:13 -0500
X-MC-Unique: p3lkK9jXP6CP2Bnz-G3NaQ-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso933282ejb.14
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 01:45:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIhKpCgZi4Qd+PtZ8lYpqohAptnpAYSZBkY1jLrxMPM=;
        b=nJNH5cevMJj0g6003w3m+aLFEiOYRqeX/T0UYy4q46+rBgikcZJ+1aqrvM3/XeIFwc
         Rr1QYu68kDnPJbgKowhC1qHGk8kinMSJZpQLtNm1d0dUM6Ytqdjr7VVnPUkToHl7Nqgv
         FX301YpNXCop5x6/cxkJgb6b/Fg7tT+CXTUNXbgz01fBFqH5t9lfhu5ASpKbIAOvPIi6
         xh0JPMvfhi6uWueKe1f8S/DB4cG5SFx59wb5UnCVH1r00MwE4UlLGT7lVL7hcjXp/k7W
         ZZs9/050s3jpaAMKuafZblG6BJNrjXs1V96KIWqhLqDmdN0VlUEFsR/UHHX8a6OoOlSj
         2ThQ==
X-Gm-Message-State: AFqh2kqxG8MNzx5w/Qq2TUqzZgxdfBR4NqwVFQnOJCJJ7yDtfLktXSW8
        8mHdBzemoyZPzxvJGmhIzTMWuC+R9iXdxzOZvmVplpAZ5mGLhamdZYDOgw53jYN1i4HKcW9Ekrg
        XIc8CS85TODXzwwSGu6bpKwY=
X-Received: by 2002:a17:907:c618:b0:868:b2b6:ee71 with SMTP id ud24-20020a170907c61800b00868b2b6ee71mr37291068ejc.6.1674726311833;
        Thu, 26 Jan 2023 01:45:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXH0GJADrSft7sx79AzUkKjxGpISZXFufCJjBtUzi9/L5dgsqiw88g8j1V9gJrtBAZVIYxpg==
X-Received: by 2002:a17:907:c618:b0:868:b2b6:ee71 with SMTP id ud24-20020a170907c61800b00868b2b6ee71mr37291060ejc.6.1674726311576;
        Thu, 26 Jan 2023 01:45:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ke22-20020a17090798f600b0087842afc5e0sm324172ejc.210.2023.01.26.01.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 01:45:11 -0800 (PST)
Message-ID: <1b118a84-5758-0045-509f-322bac5b0375@redhat.com>
Date:   Thu, 26 Jan 2023 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH resend 2/3] Input: silead - Add a settings
 module-parameter
Content-Language: en-US, nl
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
References: <20230125105416.17406-1-hdegoede@redhat.com>
 <20230125105416.17406-3-hdegoede@redhat.com> <Y9IG6zQtGWWwhyLW@nixie71>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9IG6zQtGWWwhyLW@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/26/23 05:51, Jeff LaBundy wrote:
> Hi Hans,
> 
> On Wed, Jan 25, 2023 at 11:54:15AM +0100, Hans de Goede wrote:
>> Add a settings module-parameter which can be allowed to specify/override
>> various device-properties.
>>
>> Unlike most other touchscreen controllers Silead touchscreens don't tell us
>> the ranges of the reported x and y coordinates and Silead touchscreens also
>> often need to have their axis inverted and/or swapped to match the display
>> coordinates.
>>
>> Being able to specify the necessary properties through a module parameter,
>> allows users of new device-models to help us with bringing up support for
>> new devices without them needing to do a local kernel-build just to modify
>> these settings.
>>
>> Reviewed-by: Bastien Nocera <hadess@hadess.net>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This LGTM, with one comment that I do not feel strongly about.
> 
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
> 
>> ---
>>  drivers/input/touchscreen/silead.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
>> index 8a7351c4414c..22cee8d1bb22 100644
>> --- a/drivers/input/touchscreen/silead.c
>> +++ b/drivers/input/touchscreen/silead.c
>> @@ -58,6 +58,10 @@
>>  
>>  #define SILEAD_MAX_FINGERS	10
>>  
>> +static char *settings;
>> +module_param(settings, charp, 0444);
>> +MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y\"");
>> +
>>  enum silead_ts_power {
>>  	SILEAD_POWER_ON  = 1,
>>  	SILEAD_POWER_OFF = 0
>> @@ -133,14 +137,15 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
>>  
>>  	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
>>  	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
>> -	touchscreen_parse_properties(data->input, true, &data->prop);
>> +	touchscreen_parse_properties_with_settings(data->input, true,
>> +						   &data->prop, settings);
>>  	silead_apply_efi_fw_min_max(data);
>>  
>>  	input_mt_init_slots(data->input, data->max_fingers,
>>  			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
>>  			    INPUT_MT_TRACK);
>>  
>> -	if (device_property_read_bool(dev, "silead,home-button"))
>> +	if (touchscreen_property_read_bool(dev, "silead,home-button", settings))
> 
> While harmless, this seems like a bit of an overuse of the proposed
> functionality. Either the platform has a home button or it does not.
> Would users really need to experiment with this property enabled or
> disabled?

Thank you for the review.

Having this is actually useful, because users do need to check if
they actually have a home-button:

1. Always setting this may lead to false-positive home button presses
   on some models (IIRC, this has been around for a long time)

2. The home button typical is a windows logo printed on the front of
   cheap windows tablets below the screen. Recently I was adding info
   for yet another such cheap tablet and I asked the user to test
   the home-button since the windows logo was clearly there visually.
   But on this specific model touching the windows logo does not do
   anything.

Combined these 2 make it useful for users to be able to explicitly
test the home-button functionality.

Regards,

Hans


> 
>>  		input_set_capability(data->input, EV_KEY, KEY_LEFTMETA);
>>  
>>  	data->input->name = SILEAD_TS_NAME;
>> @@ -173,7 +178,8 @@ static int silead_ts_request_pen_input_dev(struct silead_ts_data *data)
>>  	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
>>  	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
>>  	set_bit(INPUT_PROP_DIRECT, data->pen_input->propbit);
>> -	touchscreen_parse_properties(data->pen_input, false, &data->prop);
>> +	touchscreen_parse_properties_with_settings(data->pen_input, false,
>> +						   &data->prop, settings);
>>  	input_abs_set_res(data->pen_input, ABS_X, data->pen_x_res);
>>  	input_abs_set_res(data->pen_input, ABS_Y, data->pen_y_res);
>>  
>> @@ -523,8 +529,8 @@ static int silead_ts_setup(struct i2c_client *client)
>>  	 * this.
>>  	 */
>>  
>> -	if (device_property_read_bool(&client->dev,
>> -				      "silead,stuck-controller-bug")) {
>> +	if (touchscreen_property_read_bool(&client->dev, "silead,stuck-controller-bug",
>> +					   settings)) {
>>  		pm_runtime_set_active(&client->dev);
>>  		pm_runtime_enable(&client->dev);
>>  		pm_runtime_allow(&client->dev);
>> @@ -591,8 +597,8 @@ static void silead_ts_read_props(struct i2c_client *client)
>>  	const char *str;
>>  	int error;
>>  
>> -	error = device_property_read_u32(dev, "silead,max-fingers",
>> -					 &data->max_fingers);
>> +	error = touchscreen_property_read_u32(dev, "silead,max-fingers", settings,
>> +					      &data->max_fingers);
>>  	if (error) {
>>  		dev_dbg(dev, "Max fingers read error %d\n", error);
>>  		data->max_fingers = 5; /* Most devices handle up-to 5 fingers */
>> @@ -605,9 +611,9 @@ static void silead_ts_read_props(struct i2c_client *client)
>>  	else
>>  		dev_dbg(dev, "Firmware file name read error. Using default.");
>>  
>> -	data->pen_supported = device_property_read_bool(dev, "silead,pen-supported");
>> -	device_property_read_u32(dev, "silead,pen-resolution-x", &data->pen_x_res);
>> -	device_property_read_u32(dev, "silead,pen-resolution-y", &data->pen_y_res);
>> +	data->pen_supported = touchscreen_property_read_bool(dev, "silead,pen-supported", settings);
>> +	touchscreen_property_read_u32(dev, "silead,pen-resolution-x", settings, &data->pen_x_res);
>> +	touchscreen_property_read_u32(dev, "silead,pen-resolution-y", settings, &data->pen_y_res);
>>  }
>>  
>>  #ifdef CONFIG_ACPI
>> -- 
>> 2.39.0
>>
> 
> Kind regards,
> Jeff LaBundy
> 

