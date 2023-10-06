Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6252A7BB386
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjJFIvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjJFIvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E866783
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696582236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Eom16eIvNGOn91Mfh2jIUZ+DHefNQaputYEjf4qDj2I=;
        b=TxjvB7rT075VG2Owr2n/pEoqfRwbO247YSELloFvWt3QczlEhDW4/6Vlkoxc5HscI1uTZR
        MQJKCyrLWosMzGcmroB/qFHGTUGr3epASgayx8KhNImlEFDqtCTpOyKAN7/hkCHw8XQr54
        0LosO2Ki4dLCo1i/d8JdwBEmrj8Svtk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-m0UVrX3rOhSH7FyFQZfN-Q-1; Fri, 06 Oct 2023 04:50:34 -0400
X-MC-Unique: m0UVrX3rOhSH7FyFQZfN-Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a9e3f703dfso149909266b.1
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 01:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696582232; x=1697187032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eom16eIvNGOn91Mfh2jIUZ+DHefNQaputYEjf4qDj2I=;
        b=Xu2Z7+IGTUzjTyUi0HSEdfoasp4aS12uykC/rAv8YBHMKOIl0NswN/Wna2/2oTi8k+
         GxqsLXrQtyrc2gtAl2o+A4UibRUnxRE81/dH8Ke0/YRIe+DovCxYkK4ZpzsTJJ0ePw4M
         z113fkE6UUVDfYV0h6Aa0HdmK7yxI4eYTpyIjq6y2NpyRz+iuAEy/37sFDAUGNxfIK1u
         G6u7XCaBftwsUrHYgD/OY7vr+I2pKgTcu3nXUEJjYy3q8/NwpmyhS1Jju38qlvKMiakl
         xecYXa8KRbLeqL6KukcEzCGjojCk+5A05001CXkf3s+5nHmp9/o070OuaOwn1VENWhcZ
         9wRQ==
X-Gm-Message-State: AOJu0Yz0XTSfcI/WL/DVDnPnmHUs9VAWcN6DYMgR42qE3WMkeazc0rnN
        tz0sbcaW46/YUtON19LY14cMSpeHBWucGlhKW9zZpphspuowHWmPffXCjT2jb2Uibbj9q5GC+Qz
        JugvIPSq9rKepCiRSBbiHfi509U7QPsI=
X-Received: by 2002:a17:906:53:b0:9ae:738b:86d0 with SMTP id 19-20020a170906005300b009ae738b86d0mr6394348ejg.66.1696582232612;
        Fri, 06 Oct 2023 01:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/iVTWGbkR7Tn9AnvXiJQ/QgBFL34aainRwbbtHB6iTcByNrci08QEwGAN4A+CHvzOiQaBMA==
X-Received: by 2002:a17:906:53:b0:9ae:738b:86d0 with SMTP id 19-20020a170906005300b009ae738b86d0mr6394332ejg.66.1696582232291;
        Fri, 06 Oct 2023 01:50:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id sd23-20020a170906ce3700b009b2b9af0784sm2501539ejb.110.2023.10.06.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 01:50:31 -0700 (PDT)
Message-ID: <0509ed50-571e-fa6e-a323-c73abbb938c7@redhat.com>
Date:   Fri, 6 Oct 2023 10:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] HID: logitech-hidpp: Fix kernel crash on receiver USB
 disconnect
Content-Language: en-US, nl
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, stable@vger.kernel.org
References: <20231005182638.3776-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231005182638.3776-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/5/23 20:26, Hans de Goede wrote:
> hidpp_connect_event() has *four* time-of-check vs time-of-use (TOCTOU)
> races when it races with itself.
> 
> hidpp_connect_event() primarily runs from a workqueue but it also runs
> on probe() and if a "device-connected" packet is received by the hw
> when the thread running hidpp_connect_event() from probe() is waiting on
> the hw, then a second thread running hidpp_connect_event() will be
> started from the workqueue.
> 
> This opens the following races (note the below code is simplified):
> 
> 1. Retrieving + printing the protocol (harmless race):
> 
> 	if (!hidpp->protocol_major) {
> 		hidpp_root_get_protocol_version()
> 		hidpp->protocol_major = response.rap.params[0];
> 	}
> 
> We can actually see this race hit in the dmesg in the abrt output
> attached to rhbz#2227968:
> 
> [ 3064.624215] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
> [ 3064.658184] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
> 
> Testing with extra logging added has shown that after this the 2 threads
> take turn grabbing the hw access mutex (send_mutex) so they ping-pong
> through all the other TOCTOU cases managing to hit all of them:
> 
> 2. Updating the name to the HIDPP name (harmless race):
> 
> 	if (hidpp->name == hdev->name) {
> 		...
> 		hidpp->name = new_name;
> 	}
> 
> 3. Initializing the power_supply class for the battery (problematic!):
> 
> hidpp_initialize_battery()
> {
>         if (hidpp->battery.ps)
>                 return 0;
> 
> 	probe_battery(); /* Blocks, threads take turns executing this */
> 
> 	hidpp->battery.desc.properties =
> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> 
> 	hidpp->battery.ps =
> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> 					   &hidpp->battery.desc, cfg);
> }
> 
> 4. Creating delayed input_device (potentially problematic):
> 
> 	if (hidpp->delayed_input)
> 		return;
> 
> 	hidpp->delayed_input = hidpp_allocate_input(hdev);
> 
> The really big problem here is 3. Hitting the race leads to the following
> sequence:
> 
> 	hidpp->battery.desc.properties =
> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> 
> 	hidpp->battery.ps =
> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> 					   &hidpp->battery.desc, cfg);
> 
> 	...
> 
> 	hidpp->battery.desc.properties =
> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> 
> 	hidpp->battery.ps =
> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> 					   &hidpp->battery.desc, cfg);
> 
> So now we have registered 2 power supplies for the same battery,
> which looks a bit weird from userspace's pov but this is not even
> the really big problem.
> 
> Notice how:
> 
> 1. This is all devm-maganaged
> 2. The hidpp->battery.desc struct is shared between the 2 power supplies
> 3. hidpp->battery.desc points to the result from the second devm_kmemdup()

Small error in the commit msg here, please squash in a fix if possible, this
should read:

3. hidpp->battery.desc.properties points to the result from the second devm_kmemdup()


Regards,

Hans






> This causes a use after free scenario on USB disconnect of the receiver:
> 1. The last registered power supply class device gets unregistered
> 2. The memory from the last devm_kmemdup() call gets freed,
>    hidpp->battery.desc.properties now points to freed memory
> 3. The first registered power supply class device gets unregistered,
>    this involves sending a remove uevent to userspace which invokes
>    power_supply_uevent() to fill the uevent data
> 4. power_supply_uevent() uses hidpp->battery.desc.properties which
>    now points to freed memory leading to backtraces like this one:
> 
> Sep 22 20:01:35 eric kernel: BUG: unable to handle page fault for address: ffffb2140e017f08
> ...
> Sep 22 20:01:35 eric kernel: Workqueue: usb_hub_wq hub_event
> Sep 22 20:01:35 eric kernel: RIP: 0010:power_supply_uevent+0xee/0x1d0
> ...
> Sep 22 20:01:35 eric kernel:  ? asm_exc_page_fault+0x26/0x30
> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0xee/0x1d0
> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0x10d/0x1d0
> Sep 22 20:01:35 eric kernel:  dev_uevent+0x10f/0x2d0
> Sep 22 20:01:35 eric kernel:  kobject_uevent_env+0x291/0x680
> Sep 22 20:01:35 eric kernel:  power_supply_unregister+0x8e/0xa0
> Sep 22 20:01:35 eric kernel:  release_nodes+0x3d/0xb0
> Sep 22 20:01:35 eric kernel:  devres_release_group+0xfc/0x130
> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x56/0xa0
> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
> Sep 22 20:01:35 eric kernel:  logi_dj_remove+0x9a/0x100 [hid_logitech_dj 5c91534a0ead2b65e04dd799a0437e3b99b21bc4]
> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x44/0xa0
> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
> Sep 22 20:01:35 eric kernel:  usbhid_disconnect+0x47/0x60 [usbhid 727dcc1c0b94e6b4418727a468398ac3bca492f3]
> Sep 22 20:01:35 eric kernel:  usb_unbind_interface+0x90/0x270
> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> Sep 22 20:01:35 eric kernel:  ? kobject_put+0xa0/0x1d0
> Sep 22 20:01:35 eric kernel:  usb_disable_device+0xcd/0x1e0
> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xde/0x2c0
> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xc3/0x2c0
> Sep 22 20:01:35 eric kernel:  hub_event+0xe80/0x1c10
> 
> There have been quite a few bug reports (see Link tags) about this crash.
> 
> Fix all the TOCTOU issues, including the really bad power-supply related
> system crash on USB disconnect, by making probe() use the workqueue for
> running hidpp_connect_event() too, so that it can never run more then once.
> 
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227221
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2242189
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217412#c58
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index ff077df0babf..a209d51bd247 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4515,7 +4515,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  			goto hid_hw_init_fail;
>  	}
>  
> -	hidpp_connect_event(hidpp);
> +	schedule_work(&hidpp->work);
> +	flush_work(&hidpp->work);
>  
>  	if (will_restart) {
>  		/* Reset the HID node state */

