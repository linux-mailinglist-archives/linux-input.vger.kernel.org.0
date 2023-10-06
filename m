Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10BA7BB2D2
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjJFIJx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjJFIJw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:09:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954C9E4;
        Fri,  6 Oct 2023 01:09:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAC5C433C8;
        Fri,  6 Oct 2023 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696579790;
        bh=lM2NdHMgE8OYQ3nJerfcrX+ehSaQICQHOndp33z9Z0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fF/fiXUKbJs5ESByPwmTt2LL2vMJzMU3sG45PTL7wF/KTquWEjLdcnwiRxnLYTTbO
         +4PH0rXPhe+weQh14wt2M0gX6voO2sPqooKZ6HcvlsijMftXknEP1VJ9noAZ248Btw
         WU2RfEWEicWTFMRvwlFQ+1peKzjyjH5EYOh4pWx5U+mmmJBGkatQ8rEVa04nF19W1o
         DeGCpOKtlxre4+oJNthzRdHbiY9EcD7Z999aAvrNJwNDvZoAu6yZz6hzHDHG84KjcX
         rKwi77vpe0xQRLuiPR9tdUbtRP0aULJhNYTTod6GvGzxnOLB7m/LES88dgef9E3Zza
         YliTtk302+yLA==
Date:   Fri, 6 Oct 2023 10:09:45 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Fix kernel crash on receiver USB
 disconnect
Message-ID: <sxtunfgvrgkh7gh3df4pawxpt4z3ziybadkdwyw4vinmqxhfct@fpfy56k4tbss>
References: <20231005182638.3776-1-hdegoede@redhat.com>
 <krfqpnfzrubfiweaokbibvz7cfcnd6wi6ub6xazpgfou3uwdds@z6th2ckoqb52>
 <3ebf4abd-ab66-4dfb-7cbb-1248c1f449fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ebf4abd-ab66-4dfb-7cbb-1248c1f449fd@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Oct 06 2023, Hans de Goede wrote:
> Hi Benjamin,
> 
> On 10/6/23 09:29, Benjamin Tissoires wrote:
> > Hi Hans,
> > 
> > On Oct 05 2023, Hans de Goede wrote:
> >> hidpp_connect_event() has *four* time-of-check vs time-of-use (TOCTOU)
> >> races when it races with itself.
> >>
> >> hidpp_connect_event() primarily runs from a workqueue but it also runs
> >> on probe() and if a "device-connected" packet is received by the hw
> >> when the thread running hidpp_connect_event() from probe() is waiting on
> >> the hw, then a second thread running hidpp_connect_event() will be
> >> started from the workqueue.
> >>
> >> This opens the following races (note the below code is simplified):
> >>
> >> 1. Retrieving + printing the protocol (harmless race):
> >>
> >> 	if (!hidpp->protocol_major) {
> >> 		hidpp_root_get_protocol_version()
> >> 		hidpp->protocol_major = response.rap.params[0];
> >> 	}
> >>
> >> We can actually see this race hit in the dmesg in the abrt output
> >> attached to rhbz#2227968:
> >>
> >> [ 3064.624215] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
> >> [ 3064.658184] logitech-hidpp-device 0003:046D:4071.0049: HID++ 4.5 device connected.
> >>
> >> Testing with extra logging added has shown that after this the 2 threads
> >> take turn grabbing the hw access mutex (send_mutex) so they ping-pong
> >> through all the other TOCTOU cases managing to hit all of them:
> >>
> >> 2. Updating the name to the HIDPP name (harmless race):
> >>
> >> 	if (hidpp->name == hdev->name) {
> >> 		...
> >> 		hidpp->name = new_name;
> >> 	}
> >>
> >> 3. Initializing the power_supply class for the battery (problematic!):
> >>
> >> hidpp_initialize_battery()
> >> {
> >>         if (hidpp->battery.ps)
> >>                 return 0;
> >>
> >> 	probe_battery(); /* Blocks, threads take turns executing this */
> >>
> >> 	hidpp->battery.desc.properties =
> >> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> >>
> >> 	hidpp->battery.ps =
> >> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> >> 					   &hidpp->battery.desc, cfg);
> >> }
> >>
> >> 4. Creating delayed input_device (potentially problematic):
> >>
> >> 	if (hidpp->delayed_input)
> >> 		return;
> >>
> >> 	hidpp->delayed_input = hidpp_allocate_input(hdev);
> >>
> >> The really big problem here is 3. Hitting the race leads to the following
> >> sequence:
> >>
> >> 	hidpp->battery.desc.properties =
> >> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> >>
> >> 	hidpp->battery.ps =
> >> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> >> 					   &hidpp->battery.desc, cfg);
> >>
> >> 	...
> >>
> >> 	hidpp->battery.desc.properties =
> >> 		devm_kmemdup(dev, hidpp_battery_props, cnt, GFP_KERNEL);
> >>
> >> 	hidpp->battery.ps =
> >> 		devm_power_supply_register(&hidpp->hid_dev->dev,
> >> 					   &hidpp->battery.desc, cfg);
> >>
> >> So now we have registered 2 power supplies for the same battery,
> >> which looks a bit weird from userspace's pov but this is not even
> >> the really big problem.
> >>
> >> Notice how:
> >>
> >> 1. This is all devm-maganaged
> >> 2. The hidpp->battery.desc struct is shared between the 2 power supplies
> >> 3. hidpp->battery.desc points to the result from the second devm_kmemdup()
> >>
> >> This causes a use after free scenario on USB disconnect of the receiver:
> >> 1. The last registered power supply class device gets unregistered
> >> 2. The memory from the last devm_kmemdup() call gets freed,
> >>    hidpp->battery.desc.properties now points to freed memory
> >> 3. The first registered power supply class device gets unregistered,
> >>    this involves sending a remove uevent to userspace which invokes
> >>    power_supply_uevent() to fill the uevent data
> >> 4. power_supply_uevent() uses hidpp->battery.desc.properties which
> >>    now points to freed memory leading to backtraces like this one:
> >>
> >> Sep 22 20:01:35 eric kernel: BUG: unable to handle page fault for address: ffffb2140e017f08
> >> ...
> >> Sep 22 20:01:35 eric kernel: Workqueue: usb_hub_wq hub_event
> >> Sep 22 20:01:35 eric kernel: RIP: 0010:power_supply_uevent+0xee/0x1d0
> >> ...
> >> Sep 22 20:01:35 eric kernel:  ? asm_exc_page_fault+0x26/0x30
> >> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0xee/0x1d0
> >> Sep 22 20:01:35 eric kernel:  ? power_supply_uevent+0x10d/0x1d0
> >> Sep 22 20:01:35 eric kernel:  dev_uevent+0x10f/0x2d0
> >> Sep 22 20:01:35 eric kernel:  kobject_uevent_env+0x291/0x680
> >> Sep 22 20:01:35 eric kernel:  power_supply_unregister+0x8e/0xa0
> >> Sep 22 20:01:35 eric kernel:  release_nodes+0x3d/0xb0
> >> Sep 22 20:01:35 eric kernel:  devres_release_group+0xfc/0x130
> >> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x56/0xa0
> >> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> >> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> >> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> >> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
> >> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
> >> Sep 22 20:01:35 eric kernel:  logi_dj_remove+0x9a/0x100 [hid_logitech_dj 5c91534a0ead2b65e04dd799a0437e3b99b21bc4]
> >> Sep 22 20:01:35 eric kernel:  hid_device_remove+0x44/0xa0
> >> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> >> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> >> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> >> Sep 22 20:01:35 eric kernel:  ? __queue_work+0x1df/0x440
> >> Sep 22 20:01:35 eric kernel:  hid_destroy_device+0x4b/0x60
> >> Sep 22 20:01:35 eric kernel:  usbhid_disconnect+0x47/0x60 [usbhid 727dcc1c0b94e6b4418727a468398ac3bca492f3]
> >> Sep 22 20:01:35 eric kernel:  usb_unbind_interface+0x90/0x270
> >> Sep 22 20:01:35 eric kernel:  device_release_driver_internal+0x19f/0x200
> >> Sep 22 20:01:35 eric kernel:  bus_remove_device+0xc6/0x130
> >> Sep 22 20:01:35 eric kernel:  device_del+0x15c/0x3f0
> >> Sep 22 20:01:35 eric kernel:  ? kobject_put+0xa0/0x1d0
> >> Sep 22 20:01:35 eric kernel:  usb_disable_device+0xcd/0x1e0
> >> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xde/0x2c0
> >> Sep 22 20:01:35 eric kernel:  usb_disconnect+0xc3/0x2c0
> >> Sep 22 20:01:35 eric kernel:  hub_event+0xe80/0x1c10
> >>
> >> There have been quite a few bug reports (see Link tags) about this crash.
> >>
> >> Fix all the TOCTOU issues, including the really bad power-supply related
> >> system crash on USB disconnect, by making probe() use the workqueue for
> >> running hidpp_connect_event() too, so that it can never run more then once.
> >>
> >> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227221
> >> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
> >> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2227968
> >> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2242189
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217412#c58
> > 
> > Many thanks for finding out the root cause of this. And sorry that you
> > had to do it :(
> > 
> > Out of curiosity, do you have an idea on when this was introduced?
> > From these logs it seem that the symptoms started to appear in July in
> > distributions, but I can not quickly reproduce it locally and so I'm a
> > little bit puzzled.
> 
> I think this may be triggered more easily after commit 699fb50d99039
> from 2023-07-20, but the root cause of this seems to be have been
> with us all along ...

Yeah, that's what I feared :/

> 
> > Anyway, with or without a Fixes tag, I think I'll apply it today and
> > send this and the other patch from Johan to Linus ASAP.
> 
> Note I realized this morning that there is another small race between
> probe() and hidpp_connect_event() which should not cause a crahs but which
> may cause functional issues..
> 
> So I'm preparing a follow up patch. I actually just finished testing
> the follow up patch. Please also include that patch (assuming you agree
> with the fix from it).

Sure. Jiri told me to wait a couple of days before sending the PR to
Linus so the bots came come in and do their jobs. So I will send those
early next week which should give us the time to prepare your other
patch.

Cheers,
Benjamin

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/hid/hid-logitech-hidpp.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> >> index ff077df0babf..a209d51bd247 100644
> >> --- a/drivers/hid/hid-logitech-hidpp.c
> >> +++ b/drivers/hid/hid-logitech-hidpp.c
> >> @@ -4515,7 +4515,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  			goto hid_hw_init_fail;
> >>  	}
> >>  
> >> -	hidpp_connect_event(hidpp);
> >> +	schedule_work(&hidpp->work);
> >> +	flush_work(&hidpp->work);
> >>  
> >>  	if (will_restart) {
> >>  		/* Reset the HID node state */
> >> -- 
> >> 2.41.0
> >>
> > 
> 
