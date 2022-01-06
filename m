Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D49486207
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 10:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbiAFJWz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 04:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49371 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237329AbiAFJWy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Jan 2022 04:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641460974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QevGG0IFU7VORrSIHhPfB/9VpDDVLqegFoPpPqYGnD8=;
        b=J2lgDAuOT2VzCSroj0zzrM9cl4kyYXCl3gzdegUEo7A1wMKBacWy99pxxCEMtYBqf6aGBC
        iXxBRQwJ0a6jOeo8UMEAWR3SohFby4Ri1YXr/Kb85MJCUyszyx2kT5EU0/G936SD/surAk
        BctRGUZwHeLlOe/u6d8ZqbHoOowmgzI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-vNgit4u6Nxmsh0ctoSQieQ-1; Thu, 06 Jan 2022 04:22:52 -0500
X-MC-Unique: vNgit4u6Nxmsh0ctoSQieQ-1
Received: by mail-ed1-f69.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so1504047edd.11
        for <linux-input@vger.kernel.org>; Thu, 06 Jan 2022 01:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QevGG0IFU7VORrSIHhPfB/9VpDDVLqegFoPpPqYGnD8=;
        b=DCjphCVH6AiU897LU8G8a7IGeZYIIMdsUwIW0I8fhaXw7+tMZVSv59X7Rki0OTeRfb
         yRIh5XnSspgz9auvUnfRHca1hr0zgP94oFnLeZoqForMhdVY9IhcSa333aWNMa7Px20I
         b72Ogpq5NNdBb8D5+ffIErCZndez2Zj4RWSnrOtgyiZ/igdh/XiLnDa5oH62g0ymtLFE
         sC7DvTGZFFSW09AXZcxJ3l+9GDR77/A1noObQF7Cp59mMJ6dRnRkNzxRyP+k8RfpXyhA
         LsirhgYc9zbFM6gcL7SDAeicbWD/TrD901vbwISkVLC1gvsT5/68LdeQ0GHDStVxnhzE
         K5Lw==
X-Gm-Message-State: AOAM530+vTQLMJ/QUBgemqkVlGvjoC9mEMrANHrv9PMH4gl6FaUfDkTz
        S1fLQmcYlzyNjnorHN0uo0K/3mz4ltXt/xDIfIhi5NoQFWEmEJ6IKedKZ39OZ4Xy/mhckMT9Xmo
        dgU1ubCpj4hlslmSWLCTQeGs=
X-Received: by 2002:a17:906:8a72:: with SMTP id hy18mr1032947ejc.614.1641460971337;
        Thu, 06 Jan 2022 01:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkG1G7BlAJd1SDCW6sQVzpe2MsY8K7lXVIjB8So2R+feIYlGKDelhuP2bXoEQTm/lsUyMj/Q==
X-Received: by 2002:a17:906:8a72:: with SMTP id hy18mr1032935ejc.614.1641460971175;
        Thu, 06 Jan 2022 01:22:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id dd5sm354465ejc.99.2022.01.06.01.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 01:22:50 -0800 (PST)
Message-ID: <9dcdd3f9-f0a4-f0b1-adf5-6b90de7c8c7d@redhat.com>
Date:   Thu, 6 Jan 2022 10:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance
 after suspend/resume
Content-Language: en-US
To:     "Jingle.Wu" <jingle.wu@emc.com.tw>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20211222220641.439863-1-hdegoede@redhat.com>
 <YdOVBVUVWnVkaLTZ@google.com> <000b01d802c9$c0396aa0$40ac3fe0$@emc.com.tw>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <000b01d802c9$c0396aa0$40ac3fe0$@emc.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/6/22 07:50, Jingle.Wu wrote:
> Hi Hans/Dmitry:
> 
> It is not OK to skip elan_enable_power() for all Elan touchpad controllers.
> 
> I suggest to deal with this touchpad module ID as "quirk" case to support
> this special case.

There is nothing special / quirky about this, regulator enable imbalances
simply must not happen / must be fixed.

I'll prepare a new version of the patch which adds a parameter to
elan_enable_power() to skip the regulator enable if the regulator
was not disabled on suspend.

This will allow still always calling elan_enable_power() on resume,
while also fixing the regulator imbalance.

Note that this will also help save power, the regulator imbalance
also means that the regulator will no longer get disabled _ever_
after the first suspend/resume cycle where device_may_wakeup()
returns true.

Regards,

Hans




> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
> Sent: Tuesday, January 4, 2022 8:30 AM
> To: Hans de Goede <hdegoede@redhat.com>
> Cc: Jingle Wu <jingle.wu@emc.com.tw>; linux-input@vger.kernel.org
> Subject: Re: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance
> after suspend/resume
> 
> Hi Hans,
> 
> On Wed, Dec 22, 2021 at 11:06:41PM +0100, Hans de Goede wrote:
>> Before these changes elan_suspend() would only call 
>> elan_disable_power() when device_may_wakeup() returns false; whereas 
>> elan_resume() would unconditionally call elan_enable_power(), leading 
>> to an enable count imbalance when device_may_wakeup() returns true.
>>
>> This triggers the "WARN_ON(regulator->enable_count)" in 
>> regulator_put() when the elan_i2c driver gets unbound, this happens 
>> e.g. with the hot-plugable dock with Elan I2C touchpad for the Asus TF103C
> 2-in-1.
>>
>> Fix this by making the elan_enable_power() call also be conditional on 
>> device_may_wakeup() returning false.
> 
> elan_enable_power() not only tries to toggle the regulator, but also tries
> to issue command to the controller to power/wake it up. I need confirmation
> from Jingle Wu that skipping this is OK for all Elan touchpad controllers,
> or if we need to add call to either power control or sleep control method to
> make sure the controller it fully resumed.
> 
> Jingle, what can you tell us here?
> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/mouse/elan_i2c_core.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/input/mouse/elan_i2c_core.c 
>> b/drivers/input/mouse/elan_i2c_core.c
>> index 47af62c12267..cdb36d35ffa4 100644
>> --- a/drivers/input/mouse/elan_i2c_core.c
>> +++ b/drivers/input/mouse/elan_i2c_core.c
>> @@ -1412,17 +1412,17 @@ static int __maybe_unused elan_resume(struct
> device *dev)
>>  	struct elan_tp_data *data = i2c_get_clientdata(client);
>>  	int error;
>>  
>> -	if (device_may_wakeup(dev) && data->irq_wake) {
>> +	if (!device_may_wakeup(dev)) {
>> +		error = elan_enable_power(data);
>> +		if (error) {
>> +			dev_err(dev, "power up when resuming failed: %d\n",
> error);
>> +			goto err;
>> +		}
>> +	} else if (data->irq_wake) {
>>  		disable_irq_wake(client->irq);
>>  		data->irq_wake = false;
>>  	}
>>  
>> -	error = elan_enable_power(data);
>> -	if (error) {
>> -		dev_err(dev, "power up when resuming failed: %d\n", error);
>> -		goto err;
>> -	}
>> -
>>  	error = elan_initialize(data, data->quirks &
> ETP_QUIRK_QUICK_WAKEUP);
>>  	if (error)
>>  		dev_err(dev, "initialize when resuming failed: %d\n",
> error);
>> --
>> 2.33.1
>>
> 
> Thanks.
> 

