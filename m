Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C856B17B8E3
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 10:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgCFJB6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 04:01:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36105 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725951AbgCFJB6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Mar 2020 04:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583485316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CPC5mHfHRAVLVzgdzo/eGk9jTCdznxeTA1V5jsqoaMQ=;
        b=hbeQjH8ubc1o1GfDyRGFbSswlh366qCHUZU8P5PwRlGoos7NKfGssbSNTb4ZBl4z4Rsll2
        00Mm8LpJLCCKOK5p1FRFSpUY66YNrUUSyeD7pjwG5jeKzZcB11QOhW2qsaxf2DWCmFwf0P
        XF3g/Epi/UuGefkXj6Pa6ir000ujjmM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-SLgKsrlpP5uHwztfiYn4Cg-1; Fri, 06 Mar 2020 04:01:55 -0500
X-MC-Unique: SLgKsrlpP5uHwztfiYn4Cg-1
Received: by mail-wm1-f72.google.com with SMTP id w12so379844wmc.3
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 01:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CPC5mHfHRAVLVzgdzo/eGk9jTCdznxeTA1V5jsqoaMQ=;
        b=NMGk3IdTan9smoaDRnJFpXb1I5GeWEXjnn65dgMEUldux2J0RKqRRWh8DFCQzJ1vWx
         tIFT34GxtY+qfTUh9jFNRGQbEG+Y9lCOSsYsUPcA+V6LQB3+n5iLuOGt+fzb5F0aseG+
         8BH7MhV1CsMXhgIiiirBF+E+Bf2Obo/XAsdA6uvnDIPLl4MXMo2PWzQbIaM6HjmiVoIS
         EfUwPi2jV7zChRBAQFytVCmgnyPpx5jnFPLWPyudrDCKQoBDJQm/FgxArr/4eWRTyFi6
         3StjHtrRJsA5BbuRsQ7B7KHIwEhN+01YD6NIKjKrz0+JLKRrC2XzYs8F88X1Linq3l7t
         xoHA==
X-Gm-Message-State: ANhLgQ2qyeEUe5HgNMsQLL480dm8w49NG4PTJKrZ1C1S+2UEd93If3Yu
        EPctuhdITvzB3t89wpCqz3YPXTl0thWA164tBnqO16akCD9eHgcyYGrvYPYXdqG2dTNN+eyprGr
        EVL/z8zvww+LaEq4OUJvVFo4=
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr2172860wrn.62.1583485313920;
        Fri, 06 Mar 2020 01:01:53 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv/V4HMYArkO+LO0T+h7pUdFVqFo9ZBz7nb93iG5qtczdbIiYcInZBdKwnuUuf6mStnM41eSA==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr2172839wrn.62.1583485313620;
        Fri, 06 Mar 2020 01:01:53 -0800 (PST)
Received: from x1.localdomain ([2a0e:5700:4:11:42c0:3c5d:2f33:1a6c])
        by smtp.gmail.com with ESMTPSA id a7sm12006313wmj.12.2020.03.06.01.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 01:01:52 -0800 (PST)
Subject: Re: [PATCH v2 02/11] Input: goodix - Make loading the config from
 disk independent from the GPIO setup
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
References: <20200305220132.228722-1-hdegoede@redhat.com>
 <20200305220132.228722-2-hdegoede@redhat.com>
 <20200306040427.GC217608@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c332be91-4487-fd8c-9a53-abf87ec32ecc@redhat.com>
Date:   Fri, 6 Mar 2020 10:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306040427.GC217608@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thank you for the review.

On 3/6/20 5:04 AM, Dmitry Torokhov wrote:
> On Thu, Mar 05, 2020 at 11:01:23PM +0100, Hans de Goede wrote:
>> At least on X86 ACPI platforms it is not necessary to load the touchscreen
>> controller config from disk, if it needs to be loaded this has already been
>> done by the BIOS / UEFI firmware.
>>
>> Even on other (e.g. devicetree) platforms the config-loading as currently
>> done has the issue that the loaded cfg file is based on the controller
>> model, but the actual cfg is device specific, so the cfg files are not
>> part of linux-firmware and this can only work with a device specific OS
>> image which includes the cfg file.
>>
>> And we do not need access to the GPIOs at all to load the config, if we
>> do not have access we can still load the config.
>>
>> So all in all tying the decision to try to load the config from disk to
>> being able to access the GPIOs is not desirable. This commit adds a new
>> load_cfg_from_disk boolean to control the firmware loading instead.
>>
>> This commits sets the new bool to true when we set irq_pin_access_method
>> to IRQ_PIN_ACCESS_GPIO, so there are no functional changes.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Reviewed-by: Bastien Nocera <hadess@hadess.net>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/input/touchscreen/goodix.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index 9cfbcf3cbca8..28bb4385a54d 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -56,6 +56,7 @@ struct goodix_ts_data {
>>   	u16 id;
>>   	u16 version;
>>   	const char *cfg_name;
>> +	bool load_cfg_from_disk;
>>   	struct completion firmware_loading_complete;
>>   	unsigned long irq_flags;
>>   	enum goodix_irq_pin_access_method irq_pin_access_method;
>> @@ -654,8 +655,10 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>>   
>>   	ts->gpiod_rst = gpiod;
>>   
>> -	if (ts->gpiod_int && ts->gpiod_rst)
>> +	if (ts->gpiod_int && ts->gpiod_rst) {
>> +		ts->load_cfg_from_disk = true;
>>   		ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -952,7 +955,7 @@ static int goodix_ts_probe(struct i2c_client *client,
>>   
>>   	ts->chip = goodix_get_chip_data(ts->id);
>>   
>> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
>> +	if (ts->load_cfg_from_disk) {
>>   		/* update device config */
>>   		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>>   					      "goodix_%d_cfg.bin", ts->id);
>> @@ -983,7 +986,7 @@ static int goodix_ts_remove(struct i2c_client *client)
>>   {
>>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>>   
>> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO)
>> +	if (ts->load_cfg_from_disk)
>>   		wait_for_completion(&ts->firmware_loading_complete);
>>   
>>   	return 0;
>> @@ -1001,7 +1004,8 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>>   		return 0;
>>   	}
>>   
>> -	wait_for_completion(&ts->firmware_loading_complete);
>> +	if (ts->load_cfg_from_disk)
>> +		wait_for_completion(&ts->firmware_loading_complete);
> 
> If you are detaching presence of GPIOs from firmware loading, then you
> need to move this wait higher, so we do not complete early if GPIOs are
> not there, but firmware is being loaded.

That is a good point, I've fixed this for v3. Do you have any other
remarks before I send out v3?

Regards,

Hans

