Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809B4248649
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 15:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHRNmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 09:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgHRNmm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 09:42:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B038C061389;
        Tue, 18 Aug 2020 06:42:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so9430248pjb.4;
        Tue, 18 Aug 2020 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ow1P/kTAenyLhoRfseJEbrLtN3GqtrG+/0CKngcazsU=;
        b=G+45X+g7/VtCi5pAAiZ1kpTO/B5OIOgETH4OHKeMw4aqGggFu6LL7tAaYYFaCEVioR
         9ecZxDoz4HUsXUS3tmfupGtH/2cp/KR27Bh6XdIDsQbqJqT/trYEeUzssMHW5+IHnEOr
         XAuzLK6FQudbKvOA6uJMWmTf7FBjDpXdAlXPOOtFqV8hsLVWs8rVFXTfQn7renRT7w3q
         BHJhbWVl6nnkOcn8k6HKEEZELWDUWTSuMOLiXZALBoa5GHs9k7oegF/Pjzor4/+oAbxq
         TWHK6OIPmgAVYUCjZYyYw0R/vazZDf4nPAg4ZVW6qgGObWYfc/+ZE/+Kum+CEnE+JcAU
         zJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ow1P/kTAenyLhoRfseJEbrLtN3GqtrG+/0CKngcazsU=;
        b=DFVrJpZrYfiBHpShn0ryFBJ+ImoDZEfb6jA8XhdhU1GaucHrStZd/hFow2V0h9DnsN
         qey3RkYvcGkm2m+w22W+VTJW6MdrFbrcf1grHTxIJcOXf5nKwMo9tzenYZ1coJokExqs
         PCv2n1+9VmyO3UVn0sOEqqk1B3MgR2FW4RrM6Fi2dUezlVgEqAE/TClyS+nEjfQS18Ot
         mp5P45WmUdUjm7vgYVJ/eU5zEPvjEMXCiMzq25ulr/xUUH6cC/sglWEls2JYP+LrwETh
         84M9OwVEzWbeV7LSo+J5a/oyFgRGPl0M/Iqc5Vo6FpwZ9ej/nbwdwyeP5ZdLfCyMxIh4
         NzHQ==
X-Gm-Message-State: AOAM533w0buUIInOpNz1FHN+og/qQHQSsjE8nQn2HHlmlnWbPRTsw1GS
        TokiUS85i+TfVDI/eRxd8mt+WmOWE/0=
X-Google-Smtp-Source: ABdhPJweD5JuSU92yAWpqdS//keXAJW7T+0LhYnZFYJRMD2HVipKHFOD2SuXhqR88Iutq0JNmYfhPQ==
X-Received: by 2002:a17:90a:de09:: with SMTP id m9mr13448pjv.231.1597758160736;
        Tue, 18 Aug 2020 06:42:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z1sm31361pjn.34.2020.08.18.06.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 06:42:39 -0700 (PDT)
Subject: Re: [PATCH v2] hwmon: corsair-cpro: fix ccp_probe, add delay [HID
 related]
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20200817070040.7952-1-mail@mariuszachmann.de>
 <20200817153533.GA243558@roeck-us.net> <79890342.HV0Al07Iil@marius>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <41856a82-f15f-e1d8-fa65-2b2912cffece@roeck-us.net>
Date:   Tue, 18 Aug 2020 06:42:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <79890342.HV0Al07Iil@marius>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/18/20 6:12 AM, Marius Zachmann wrote:
> On 18.08.20 at 17:35:33 CEST, Guenter Roeck wrote
>> On Mon, Aug 17, 2020 at 09:00:40AM +0200, Marius Zachmann wrote:
>>> Possibly because of the changes in usbhid/hid-core.c the first
>>> raw input report is not received during ccp_probe function and it will
>>> timeout. I am not sure, whether this behaviour is expected after
>>> hid_device_io_start or if I am missing something.
>>> As a solution this adds msleep(50) to ccp_probe so that all initial
>>> input reports can be received.
>>>
>>> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
>>
>> Let's just ask the HID maintainers. Is this expected, and the correct fix ?
>>
>> Thanks,
>> Guenter
>>
> 
> This seems to be a problem with "HID: usbhid: do not sleep when opening
> device". There is a bug report with some Logitech devices at the correct
> thread. These drivers also use hid_device_io_start and fail. Seems to me,
> this is the same problem and I retract this (not so beautiful) fix until
> this is sorted out.
> 

I even was involved in that patch. Sigh.

Guenter

> Thanks,
> Marius
> 
>>> ---
>>> v2:
>>> - fix accidentally deleted comment
>>>
>>> ---
>>>  drivers/hwmon/corsair-cpro.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
>>> index 591929ec217a..c04fac1d820f 100644
>>> --- a/drivers/hwmon/corsair-cpro.c
>>> +++ b/drivers/hwmon/corsair-cpro.c
>>> @@ -10,6 +10,7 @@
>>>
>>>  #include <linux/bitops.h>
>>>  #include <linux/completion.h>
>>> +#include <linux/delay.h>
>>>  #include <linux/hid.h>
>>>  #include <linux/hwmon.h>
>>>  #include <linux/kernel.h>
>>> @@ -513,6 +514,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>  	init_completion(&ccp->wait_input_report);
>>>
>>>  	hid_device_io_start(hdev);
>>> +	msleep(50); /* wait before events can be received */
>>>
>>>  	/* temp and fan connection status only updates when device is powered on */
>>>  	ret = get_temp_cnct(ccp);
>>> --
>>> 2.28.0
>>
> 
> 
> 
> 

