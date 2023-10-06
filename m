Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B948A7BBB6D
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 17:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjJFPMb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 11:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjJFPMa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 11:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC1ED6
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696605104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+P0e8FtR3aj3+YcVQdR7ywV+wOTDDTJaKG/hhsDtdc4=;
        b=gsODD7VIBJ4lV+Bdt86h0dZ49BQx4gDj/NYnvvL6NVaFV6w5YquGs5TXoEdaH6aCvwikr8
        jx26g1PCZfYWSHvYzj8o/M9fdIFC3t/jRSwq2lRCGpJ68EeooRyLHLQbuwGKcLmXi9FBrw
        wzO1SCmRDtbb8WIm1rG1syXmhxq+qic=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-F95YB7P8MH6ItBpPFKrStQ-1; Fri, 06 Oct 2023 11:11:43 -0400
X-MC-Unique: F95YB7P8MH6ItBpPFKrStQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-538128e18e9so1934759a12.2
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 08:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696605102; x=1697209902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P0e8FtR3aj3+YcVQdR7ywV+wOTDDTJaKG/hhsDtdc4=;
        b=fDZjkSEE/05VfjerPxXK7S52rYhepedjELBp3HJQymzbtx22fBWTdA345rgvvK0T07
         H22sWKVHGmbzF0ylxHu8/IermPAxdh2KyKXq+FEwMY+XE2XtvsCKJeX3Nvf+JJG46grU
         Rl5dZQqGUCLacZs4fFi/YF+VbpfbxLpVO79LnS3JZYxPjoWJx7jAs/C97G9PKH4n5IWd
         k2i0C0ArM7YKoYNkKDw2RM/fClda1BqGf+MI99g3S1J9vxAlL2OuLiQ6jDrSyG84f79i
         1blc2aPD01Ga7RXVIS2GECWwHhn75BzuAf1FUk1cpVXQNiT1kqafaGaavFH79MKFUr5u
         wI2w==
X-Gm-Message-State: AOJu0Yz+ofnCjnmTvlbikFZ/sXk93Aci09aZd8dFQTa113HB106qRsEP
        zbIK2r68tPtNLGzvD5MOMsC1zbJae6usm45Pn0nzX4Pw7zRMOOqpsPxu5ivWq7VpfwlRnAjL/Ms
        mp7rwoEqHTcsrFyd52Nw8zzU=
X-Received: by 2002:aa7:d0d0:0:b0:533:6ef4:9f5b with SMTP id u16-20020aa7d0d0000000b005336ef49f5bmr6734465edo.6.1696605102057;
        Fri, 06 Oct 2023 08:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMFZZb25WtjZgJpS0KYBM7s3rGOk8G8Y0rGJDzku3rcBmQxjrg7Ag/3EBSiwzpnoCy9CiOGA==
X-Received: by 2002:aa7:d0d0:0:b0:533:6ef4:9f5b with SMTP id u16-20020aa7d0d0000000b005336ef49f5bmr6734434edo.6.1696605101537;
        Fri, 06 Oct 2023 08:11:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b00536159c6c45sm2664888edw.15.2023.10.06.08.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 08:11:40 -0700 (PDT)
Message-ID: <686e8973-613b-2fb3-efd6-26f3dd21ed9d@redhat.com>
Date:   Fri, 6 Oct 2023 17:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] HID: logitech-hidpp: Avoid hidpp_connect_event()
 running while probe() restarts IO
Content-Language: en-US, nl
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
References: <20231006081858.17677-1-hdegoede@redhat.com>
 <20231006081858.17677-2-hdegoede@redhat.com>
 <iqchunho27bqb6dp24ptfx32gdwbq6f6v654ftfme4kel3hoa6@5t2x4kcms2wk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <iqchunho27bqb6dp24ptfx32gdwbq6f6v654ftfme4kel3hoa6@5t2x4kcms2wk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        GUARANTEED_100_PERCENT,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 10/6/23 15:46, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Oct 06 2023, Hans de Goede wrote:
>> hidpp_probe() restarts IO after setting things up, if we get a connect
>> event just before hidpp_probe() stops all IO then hidpp_connect_event()
>> will see IO errors causing it to fail to setup the connected device.
> 
> I think I see why you are doing this, but it scares me to be honest.
> 
>>
>> Add a new io_mutex which hidpp_probe() locks while restarting IO and
>> which is also taken by hidpp_connect_event() to avoid these 2 things
>> from racing.
> 
> So now we are adding a new mutex to prevent a workqueue to be executed,
> which is held while there is another semaphore going down/up...
> It feels error prone to say the least and I'm not sure we are not
> actually fixing the problem.
> 
> My guts tells me that the issue is tackled at the wrong time, and that
> maybe there is a better solution that doesn't involve a new lock in the
> middle of 2 other locks being actually held...

Since the lock is only taken into 2 places and 1 of them is holding
no locks when taking it (because workqueue) I don't really see how
this would be a problem.

Actually introducing a new lock for this, rather then say trying
to use the send_mutex makes this much easier to reason about,
more on this below.

> One minor comment in the code.
> 
>>
>> Hopefully this will help with the occasional connect errors leading to
>> e.g. missing battery monitoring.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/hid/hid-logitech-hidpp.c | 35 ++++++++++++++++++++++----------
>>  1 file changed, 24 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
>> index a209d51bd247..33f9cd98485a 100644
>> --- a/drivers/hid/hid-logitech-hidpp.c
>> +++ b/drivers/hid/hid-logitech-hidpp.c
>> @@ -181,6 +181,7 @@ struct hidpp_scroll_counter {
>>  struct hidpp_device {
>>  	struct hid_device *hid_dev;
>>  	struct input_dev *input;
>> +	struct mutex io_mutex;
>>  	struct mutex send_mutex;
>>  	void *send_receive_buf;
>>  	char *name;		/* will never be NULL and should not be freed */
>> @@ -4207,36 +4208,39 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>  		return;
>>  	}
>>  
>> +	/* Avoid probe() restarting IO */
>> +	mutex_lock(&hidpp->io_mutex);
> 
> I'd put a `__must_hold(&hidpp->io_mutex);` here, not changing any return
> path and forcing any caller to `hidpp_connect_event()` (which will
> eventually only be the work struct) to take the lock.
> 
> This should simplify the patch by a lot and also ensure someone doesn't
> forget the `goto out_unlock`.

Ok, I can add the __must_hold() here and make 
delayed_Work_cb take the lock, but that would make it
impossible to implement patch 2/2 in a clean manner and
I do like patch 2/2 since it makes it clear that
hidpp_connect_event must only run from the workqueue
but I guess we could just add a comment for that
instead.

Either way works for me, with a slight preference
for the current version even if it introduces
a bunch of gotos.

> 
>> +
>>  	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
>>  		ret = wtp_connect(hdev, connected);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560) {
>>  		ret = m560_send_config_command(hdev, connected);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_K400) {
>>  		ret = k400_connect(hdev, connected);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	}
>>  
>>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
>>  		ret = hidpp10_wheel_connect(hidpp);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	}
>>  
>>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS) {
>>  		ret = hidpp10_extra_mouse_buttons_connect(hidpp);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	}
>>  
>>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS) {
>>  		ret = hidpp10_consumer_keys_connect(hidpp);
>>  		if (ret)
>> -			return;
>> +			goto out_unlock;
>>  	}
>>  
>>  	/* the device is already connected, we can ask for its name and
>> @@ -4245,7 +4249,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>  		ret = hidpp_root_get_protocol_version(hidpp);
>>  		if (ret) {
>>  			hid_err(hdev, "Can not get the protocol version.\n");
>> -			return;
>> +			goto out_unlock;
>>  		}
>>  	}
>>  
>> @@ -4256,7 +4260,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>  						   "%s", name);
>>  			kfree(name);
>>  			if (!devm_name)
>> -				return;
>> +				goto out_unlock;
>>  
>>  			hidpp->name = devm_name;
>>  		}
>> @@ -4291,12 +4295,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>  
>>  	if (!(hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT) || hidpp->delayed_input)
>>  		/* if the input nodes are already created, we can stop now */
>> -		return;
>> +		goto out_unlock;
>>  
>>  	input = hidpp_allocate_input(hdev);
>>  	if (!input) {
>>  		hid_err(hdev, "cannot allocate new input device: %d\n", ret);
>> -		return;
>> +		goto out_unlock;
>>  	}
>>  
>>  	hidpp_populate_input(hidpp, input);
>> @@ -4304,10 +4308,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>  	ret = input_register_device(input);
>>  	if (ret) {
>>  		input_free_device(input);
>> -		return;
>> +		goto out_unlock;
>>  	}
>>  
>>  	hidpp->delayed_input = input;
>> +out_unlock:
>> +	mutex_unlock(&hidpp->io_mutex);
>>  }
>>  
>>  static DEVICE_ATTR(builtin_power_supply, 0000, NULL, NULL);
>> @@ -4450,6 +4456,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  		will_restart = true;
>>  
>>  	INIT_WORK(&hidpp->work, delayed_work_cb);
>> +	mutex_init(&hidpp->io_mutex);
>>  	mutex_init(&hidpp->send_mutex);
>>  	init_waitqueue_head(&hidpp->wait);
>>  
>> @@ -4519,6 +4526,9 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  	flush_work(&hidpp->work);
>>  
>>  	if (will_restart) {
>> +		/* Avoid hidpp_connect_event() running while restarting */
>> +		mutex_lock(&hidpp->io_mutex);
>> +
>>  		/* Reset the HID node state */
>>  		hid_device_io_stop(hdev);
> 
> That's the part that makes me raise an eyebrow. Because we lock, then
> release the semaphore to get it back later. Can this induce a dead lock?
> 
> Can't we solve that same scenario without a mutex, but forcing either
> the workqueue to not run or to be finished at this point?

I'm not sure what you are worried about after the mutex_lock
the line above we are 100% guaranteed that hidpp_connect_event()
is not running and since it is not running it will also not
be holding any other locks, so it can not cause any problems.

The other way around if hidpp_connect_event() is running
the mutex_lock() above ensures that it will finishes and
release any locks before we get here.

There is no way that both code paths can run at the same time
with the new lock. And there thus also is no way that they
can cause any new not already held locks to be taken while
the other side is running.

I actually introduced the new lock because in my mind
introducing the new lock allows to easily reason about
the impact on other locking (which is none).

I hope this helps explain. As for the making
hidpp_connect_event()'s caller take the lock thing, let me
know how you want to resolve that. Either way works for me
and I guess the less intrusive version of making the caller
take the lock is easier to backport so we should probably
go that route.

Regards,

Hans



>>  		hid_hw_close(hdev);
>> @@ -4529,6 +4539,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  
>>  		/* Now export the actual inputs and hidraw nodes to the world */
>>  		ret = hid_hw_start(hdev, connect_mask);
>> +		mutex_unlock(&hidpp->io_mutex);
>>  		if (ret) {
>>  			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
>>  			goto hid_hw_start_fail;
>> @@ -4553,6 +4564,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
>>  	cancel_work_sync(&hidpp->work);
>>  	mutex_destroy(&hidpp->send_mutex);
>> +	mutex_destroy(&hidpp->io_mutex);
>>  	return ret;
>>  }
>>  
>> @@ -4568,6 +4580,7 @@ static void hidpp_remove(struct hid_device *hdev)
>>  	hid_hw_stop(hdev);
>>  	cancel_work_sync(&hidpp->work);
>>  	mutex_destroy(&hidpp->send_mutex);
>> +	mutex_destroy(&hidpp->io_mutex);
>>  }
>>  
>>  #define LDJ_DEVICE(product) \
>> -- 
>> 2.41.0
>>
> 
> Cheers,
> Benjamin
> 



