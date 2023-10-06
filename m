Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2067BB2C3
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 09:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjJFH7w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 03:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjJFH7w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 03:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69907FA
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696579144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7m5oh9LS3jegAvdbb029tkqS0/r+ylp+IRF1mJDpIyU=;
        b=Kb+cJIjTqmK2OHmMPID0ffZm/2jZeYiRqZ74WFrR6G/wgn3iJlieXJQiOB3+x8y7HGiSbq
        zSjNre09Xlex6YQGRaoArQ3W4uZSB/dpjcawkWmstBF2U43+8ZvSas0rRKpWJKGMeaNcLs
        /4O/IgBYaSiewRsvZdQYeRmmdmNs/KA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-i4EbvoXCPa-LcSrpdDvz_g-1; Fri, 06 Oct 2023 03:59:02 -0400
X-MC-Unique: i4EbvoXCPa-LcSrpdDvz_g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b99b6b8315so158031166b.2
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 00:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696579142; x=1697183942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m5oh9LS3jegAvdbb029tkqS0/r+ylp+IRF1mJDpIyU=;
        b=YuLA4rn+XKRyyXQEUD6AYUpSPVhYBAyZBvF89A8P2SkMD2STUj48kmbK2K+EahNqyA
         5H+NUbwJLV6e/XcC3XGFLvb+2icpeHBCAy65ual6xSULYPH3vgVBJ4UGHqZbNNcAGv62
         lx8TXKNszXi40Se4GxOfjTvp62q6PTDoCK5CstYSACuzAcD6qKkowU+bTDN278z8OAdX
         NPgBuR8DGgIsMd91JMMQ9QrxfnTHok27S+0p9aubQNCUwcLl3+lSiFkZL0dNIaGNjuAQ
         pbn6e5zLgaYxE96fUymcZiOAn2r9pjg4agpsThpJnvhf4i/pm2BDZeBcqSVAUy157mar
         XiGQ==
X-Gm-Message-State: AOJu0YzinH6SNFueULgjyetUPvX19HIDFdpyMUEVV/qY02MHolOVbSC5
        akni/BN34Pr/N1t5TkvjVPZSDXYfntldhKZFNhc6hOBFiCL7voVBn9Fdz82/ERzkhpUKpI42Hnk
        8Ra3iFKIsUtb5cnWgEvsKkD4=
X-Received: by 2002:a17:906:5390:b0:9a1:bd53:b23 with SMTP id g16-20020a170906539000b009a1bd530b23mr6183658ejo.14.1696579141803;
        Fri, 06 Oct 2023 00:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcZzxd+hzUbFSTHKwAx06gyRU/7exXs3d1r4kEnr2IbeUaFnOY9nKRu52ztLkiQLrgCODmdw==
X-Received: by 2002:a17:906:5390:b0:9a1:bd53:b23 with SMTP id g16-20020a170906539000b009a1bd530b23mr6183644ejo.14.1696579141474;
        Fri, 06 Oct 2023 00:59:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y23-20020a1709064b1700b009aa292a2df2sm2406089eju.217.2023.10.06.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:59:00 -0700 (PDT)
Message-ID: <3ebf4abd-ab66-4dfb-7cbb-1248c1f449fd@redhat.com>
Date:   Fri, 6 Oct 2023 09:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] HID: logitech-hidpp: Fix kernel crash on receiver USB
 disconnect
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
References: <20231005182638.3776-1-hdegoede@redhat.com>
 <krfqpnfzrubfiweaokbibvz7cfcnd6wi6ub6xazpgfou3uwdds@z6th2ckoqb52>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <krfqpnfzrubfiweaokbibvz7cfcnd6wi6ub6xazpgfou3uwdds@z6th2ckoqb52>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 10/6/23 09:29, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Oct 05 2023, Hans de Goede wrote:
>> hidpp_connect_event() has *four* time-of-check vs time-of-use (TOCTOU)
>> races when it races with itself.
>>
>> hidpp_connect_event() primarily runs from a workqueue but it also runs
>> on probe() and if a "device-connected" packet is received by the hw
>> when the thread running hidpp_connect_event() from probe() is waiting on
>> the hw, then a second thread running hidpp_connect_event() will be
>> started from the workqueue.
>>
>> This opens the following races (note the below code is simplified):
>>
>> 1. Retrieving + printing the protocol (harmless race):
>>
>> 	if (!hidpp->protocol_major) {
>> 		hidpp_root_get_protocol_version()
>> 		hidpp->protocol_major = response.rap.params[0];
>> 	}
>>
>> We can actually see this race hit in the dmesg in the abrt output
>> attached to rhbz#2227968:
>>
>> [ 3064.624215] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
>> [ 3064.658184] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
>>
>> Testing with extra logging added has shown that after this the 2 threads
>> take turn grabbing the hw access mutex (send_mutex) so they ping-pong
>> through all the other TOCTOU cases managing to hit all of them:
>>
>> 2. Updating the name to the HIDPP name (harmless race):
>>
>> 	if (hidpp->name == hdev->name) {
>> 		...
>> 		hidpp->name = new_name;
>> 	}
>>
>> 3. Initializing the power_supply class for the battery (problematic!):
>>
>> hidpp_initialize_battery()
>> {
>>         if (hidpp->battery.ps)
>>                 return 0;
>>
>> 	probe_battery(); /* Blocks, threads take turns executing this */
>>
>> 	hidpp->battery.desc.properties =
>> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
>>
>> 	hidpp->battery.ps =
>> 		devm_power_supply_register(&hidpp->hid_dev->dev,
>> 					   &hidpp->battery.desc, cfg);
>> }
>>
>> 4. Creating delayed input_device (potentially problematic):
>>
>> 	if (hidpp->delayed_input)
>> 		return;
>>
>> 	hidpp->delayed_input = hidpp_allocate_input(hdev);
>>
>> The really big problem here is 3. Hitting the race leads to the following
>> sequence:
>>
>> 	hidpp->battery.desc.properties =
>> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
>>
>> 	hidpp->battery.ps =
>> 		devm_power_supply_register(&hidpp->hid_dev->dev,
>> 					   &hidpp->battery.desc, cfg);
>>
>> 	...
>>
>> 	hidpp->battery.desc.properties =
>> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
>>
>> 	hidpp->battery.ps =
>> 		devm_power_supply_register(&hidpp->hid_dev->dev,
>> 					   &hidpp->battery.desc, cfg);
>>
>> So now we have registered 2 power supplies for the same battery,
>> which looks a bit weird from userspace's pov but this is not even
>> the really big problem.
>>
>> Notice how:
>>
>> 1. This is all devm-maganaged
>> 2. The hidpp->battery.desc struct is shared between the 2 power supplies
>> 3. hidpp->battery.desc points to the result from the second devm_kmemdup()
>>
>> This causes a use after free scenario on USB disconnect of the receiver:
>> 1. The last registered power supply class device gets unregistered
>> 2. The memory from the last devm_kmemdup() call gets freed,
>>    hidpp->battery.desc.properties now points to freed memory
>> 3. The first registered power supply class device gets unregistered,
>>    this involves sending a remove uevent to userspace which invokes
>>    power_supply_uevent() to fill the uevent data
>> 4. power_supply_uevent() uses hidpp->battery.desc.properties which
>>    now points to freed memory leading to backtraces like this one:
>>
>> Sep 22 20:01:35 eric kernel: BUG: unable to handle page fault for address: ffffb2140e017f08
>> ...
>> Sep 22 20:01:35 eric kernel: Workqueue: usb_hub_wq hub_event
>> Sep 22 20:01:35 eric kernel: RIP: 0010:power_supply_uevent+0xee/0x1d0
>> ...
>> Sep 22 20:01:35 eric kernel:  ? asm_exc_page_fault+0x26/0x30
>> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0xee/0x1d0
>> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0x10d/0x1d0
>> Sep 22 20:01:35 eric kernel:  dev_uevent+0x10f/0x2d0
>> Sep 22 20:01:35 eric kernel:  kobject_uevent_env+0x291/0x680
>> Sep 22 20:01:35 eric kernel:  power_supply_unregister+0x8e/0xa0
>> Sep 22 20:01:35 eric kernel:  release_nodes+0x3d/0xb0
>> Sep 22 20:01:35 eric kernel:  devres_release_group+0xfc/0x130
>> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x56/0xa0
>> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
>> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
>> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
>> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
>> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
>> Sep 22 20:01:35 eric kernel:  logi_dj_remove+0x9a/0x100 [hid_logitech_dj 5c91534a0ead2b65e04dd799a0437e3b99b21bc4]
>> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x44/0xa0
>> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
>> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
>> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
>> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
>> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
>> Sep 22 20:01:35 eric kernel:  usbhid_disconnect+0x47/0x60 [usbhid 727dcc1c0b94e6b4418727a468398ac3bca492f3]
>> Sep 22 20:01:35 eric kernel:  usb_unbind_interface+0x90/0x270
>> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
>> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
>> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
>> Sep 22 20:01:35 eric kernel:  ? kobject_put+0xa0/0x1d0
>> Sep 22 20:01:35 eric kernel:  usb_disable_device+0xcd/0x1e0
>> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xde/0x2c0
>> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xc3/0x2c0
>> Sep 22 20:01:35 eric kernel:  hub_event+0xe80/0x1c10
>>
>> There have been quite a few bug reports (see Link tags) about this crash.
>>
>> Fix all the TOCTOU issues, including the really bad power-supply related
>> system crash on USB disconnect, by making probe() use the workqueue for
>> running hidpp_connect_event() too, so that it can never run more then once.
>>
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227221
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2242189
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217412#c58
> 
> Many thanks for finding out the root cause of this. And sorry that you
> had to do it :(
> 
> Out of curiosity, do you have an idea on when this was introduced?
> From these logs it seem that the symptoms started to appear in July in
> distributions, but I can not quickly reproduce it locally and so I'm a
> little bit puzzled.

I think this may be triggered more easily after commit 699fb50d99039
from 2023-07-20, but the root cause of this seems to be have been
with us all along ...

> Anyway, with or without a Fixes tag, I think I'll apply it today and
> send this and the other patch from Johan to Linus ASAP.

Note I realized this morning that there is another small race between
probe() and hidpp_connect_event() which should not cause a crahs but which
may cause functional issues..

So I'm preparing a follow up patch. I actually just finished testing
the follow up patch. Please also include that patch (assuming you agree
with the fix from it).

Regards,

Hans






>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/hid/hid-logitech-hidpp.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
>> index ff077df0babf..a209d51bd247 100644
>> --- a/drivers/hid/hid-logitech-hidpp.c
>> +++ b/drivers/hid/hid-logitech-hidpp.c
>> @@ -4515,7 +4515,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  			goto hid_hw_init_fail;
>>  	}
>>  
>> -	hidpp_connect_event(hidpp);
>> +	schedule_work(&hidpp->work);
>> +	flush_work(&hidpp->work);
>>  
>>  	if (will_restart) {
>>  		/* Reset the HID node state */
>> -- 
>> 2.41.0
>>
> 

