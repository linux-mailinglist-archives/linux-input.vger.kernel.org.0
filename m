Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41173C60F
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 10:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391146AbfFKIjL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 04:39:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35594 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391206AbfFKIjL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 04:39:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so14771628edr.2
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 01:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EZPJDu0+5poRi+ob6FAvc4kTQEKHJCev1SL/oyf3pzs=;
        b=oj7nRju0x54cxESSJOnvHz5Ln3LgSU2WrUcxpHOkh9YT8dFZsH2a8boO0g9Enia72X
         5wWB2mfzQJ06JHj3wQSN+2QiuEkRUzFlUQ7hVdSfyqI/842HepLLgfj64j11zzdZjXyR
         ih1nKPuK1q/TlhenFEK3v1DROPzdIHAHV8cc3QAuAissFwRk1CTRuiw/7ugb/xzQVqFQ
         1FCfeJMVmpNbgwstW/lMl01+LA2l8UPOdq2+QmXe1rLvhNbpyVeEQ6uL2HNld2z8cH9T
         NcMu09M+2mXvVRVpJJn+FR3Sqm14tKpSMl5OCYnBG+Abc5B3Ob9OOZ6+uTejZ9l4wfKV
         edGQ==
X-Gm-Message-State: APjAAAWZ2+284e1xDuoDuHmCrQzVx0LzUZRQCb1Yx+hVxD7z568SzYoE
        eSaq1CCzVFVdluvb+s/RMcQZ9hx0wUI=
X-Google-Smtp-Source: APXvYqzMOTMnChDp4MCNUi3VgsI57hmj7rstuSGCuRXwJHHWKOgudtaqqrkWi6cuF6Jc+SPJDa0aoQ==
X-Received: by 2002:a50:9451:: with SMTP id q17mr16035952eda.119.1560242349441;
        Tue, 11 Jun 2019 01:39:09 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b25sm666371eda.38.2019.06.11.01.39.08
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 01:39:08 -0700 (PDT)
Subject: Re: [PATCH -next] HID: logitech-dj: fix return value of
 logi_dj_recv_query_hidpp_devices
To:     Yuehaibing <yuehaibing@huawei.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, jkosina@suse.cz
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20190525140908.2804-1-yuehaibing@huawei.com>
 <50800f5e-867d-ded9-235c-b9c2db1c41ef@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c9510bce-525a-c4d4-531c-7cf55e141754@redhat.com>
Date:   Tue, 11 Jun 2019 10:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <50800f5e-867d-ded9-235c-b9c2db1c41ef@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11-06-19 05:00, Yuehaibing wrote:
> Hi all,
> 
> Friendly ping...
> 
> On 2019/5/25 22:09, YueHaibing wrote:
>> We should return 'retval' as the correct return value
>> instead of always zero.
>>
>> Fixes: 74808f9115ce ("HID: logitech-dj: add support for non unifying receivers")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>> ---
>>   drivers/hid/hid-logitech-dj.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index 41baa4dbbfcc..7f8db602eec0 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -1133,7 +1133,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
>>   				    HID_REQ_SET_REPORT);
>>   
>>   	kfree(hidpp_report);
>> -	return 0;
>> +	return retval;
>>   }
>>   
>>   static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
>>
> 
