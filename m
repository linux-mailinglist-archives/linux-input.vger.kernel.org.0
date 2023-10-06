Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C277BBCB7
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjJFQ3F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 12:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjJFQ3E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 12:29:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81DFB9;
        Fri,  6 Oct 2023 09:28:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AD3C433C7;
        Fri,  6 Oct 2023 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696609738;
        bh=Qq+aYktCLuasjAA3QUpNr7HpyjYEpS8uNozsnROBpKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dqtTt2g4gmke34mzhyO0O72Lew04tZqa3/mQrBDewYj1kvUjLZaDU/fbt1gpYDnRA
         SCbMZiG9QOTOjgJJL09Dv3IWdyeuCaOkITAgGfiYNzLhtG3sZN+KHpO2AL7u7e4R7e
         W3Ylvee56m2uc4DoaTl98KX9eYsCD///n5YrYe5uVPVZuVP+08lW2bb73mt9ALocWB
         ah3XvDqdEdzSWCeJYqJfrBIheweBcP6woU2Gw2u+z/xivOOOQvdbLpfG1EgStczjfZ
         S/NHLGIa2YXPBGGSq1p1+ufJtj5SHKUvAFpgEGfqixLu+SM02jfCZcWfavpvf/0SWt
         kwZWTEoL+PBew==
Date:   Fri, 6 Oct 2023 18:28:54 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: logitech-hidpp: Avoid hidpp_connect_event()
 running while probe() restarts IO
Message-ID: <zjiang3fdy4o7r3daupwpnx6zesmeeerldpx5fno2adzialpre@cdp7tq4araww>
References: <20231006081858.17677-1-hdegoede@redhat.com>
 <20231006081858.17677-2-hdegoede@redhat.com>
 <iqchunho27bqb6dp24ptfx32gdwbq6f6v654ftfme4kel3hoa6@5t2x4kcms2wk>
 <686e8973-613b-2fb3-efd6-26f3dd21ed9d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686e8973-613b-2fb3-efd6-26f3dd21ed9d@redhat.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        GUARANTEED_100_PERCENT,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Oct 06 2023, Hans de Goede wrote:
> Hi Benjamin,
> 
> On 10/6/23 15:46, Benjamin Tissoires wrote:
> > Hi Hans,
> > 
> > On Oct 06 2023, Hans de Goede wrote:
> >> hidpp_probe() restarts IO after setting things up, if we get a connect
> >> event just before hidpp_probe() stops all IO then hidpp_connect_event()
> >> will see IO errors causing it to fail to setup the connected device.
> > 
> > I think I see why you are doing this, but it scares me to be honest.
> > 
> >>
> >> Add a new io_mutex which hidpp_probe() locks while restarting IO and
> >> which is also taken by hidpp_connect_event() to avoid these 2 things
> >> from racing.
> > 
> > So now we are adding a new mutex to prevent a workqueue to be executed,
> > which is held while there is another semaphore going down/up...
> > It feels error prone to say the least and I'm not sure we are not
> > actually fixing the problem.
> > 
> > My guts tells me that the issue is tackled at the wrong time, and that
> > maybe there is a better solution that doesn't involve a new lock in the
> > middle of 2 other locks being actually held...
> 
> Since the lock is only taken into 2 places and 1 of them is holding
> no locks when taking it (because workqueue) I don't really see how
> this would be a problem.
> 
> Actually introducing a new lock for this, rather then say trying
> to use the send_mutex makes this much easier to reason about,
> more on this below.
> 
> > One minor comment in the code.
> > 
> >>
> >> Hopefully this will help with the occasional connect errors leading to
> >> e.g. missing battery monitoring.
> >>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/hid/hid-logitech-hidpp.c | 35 ++++++++++++++++++++++----------
> >>  1 file changed, 24 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> >> index a209d51bd247..33f9cd98485a 100644
> >> --- a/drivers/hid/hid-logitech-hidpp.c
> >> +++ b/drivers/hid/hid-logitech-hidpp.c
> >> @@ -181,6 +181,7 @@ struct hidpp_scroll_counter {
> >>  struct hidpp_device {
> >>  	struct hid_device *hid_dev;
> >>  	struct input_dev *input;
> >> +	struct mutex io_mutex;
> >>  	struct mutex send_mutex;
> >>  	void *send_receive_buf;
> >>  	char *name;		/* will never be NULL and should not be freed */
> >> @@ -4207,36 +4208,39 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
> >>  		return;
> >>  	}
> >>  
> >> +	/* Avoid probe() restarting IO */
> >> +	mutex_lock(&hidpp->io_mutex);
> > 
> > I'd put a `__must_hold(&hidpp->io_mutex);` here, not changing any return
> > path and forcing any caller to `hidpp_connect_event()` (which will
> > eventually only be the work struct) to take the lock.
> > 
> > This should simplify the patch by a lot and also ensure someone doesn't
> > forget the `goto out_unlock`.
> 
> Ok, I can add the __must_hold() here and make 
> delayed_Work_cb take the lock, but that would make it
> impossible to implement patch 2/2 in a clean manner and
> I do like patch 2/2 since it makes it clear that
> hidpp_connect_event must only run from the workqueue
> but I guess we could just add a comment for that
> instead.

In 2/2, just rename this function to __do_hidpp_connect_event(), and
have hidpp_connect_event() being the worker, which takes the lock, and
calls __do_hidpp_connect_event().

> 
> Either way works for me, with a slight preference
> for the current version even if it introduces
> a bunch of gotos.
> 
> > 
> >> +
> >>  	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
> >>  		ret = wtp_connect(hdev, connected);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560) {
> >>  		ret = m560_send_config_command(hdev, connected);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_K400) {
> >>  		ret = k400_connect(hdev, connected);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	}
> >>  
> >>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
> >>  		ret = hidpp10_wheel_connect(hidpp);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	}
> >>  
> >>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS) {
> >>  		ret = hidpp10_extra_mouse_buttons_connect(hidpp);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	}
> >>  
> >>  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS) {
> >>  		ret = hidpp10_consumer_keys_connect(hidpp);
> >>  		if (ret)
> >> -			return;
> >> +			goto out_unlock;
> >>  	}
> >>  
> >>  	/* the device is already connected, we can ask for its name and
> >> @@ -4245,7 +4249,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
> >>  		ret = hidpp_root_get_protocol_version(hidpp);
> >>  		if (ret) {
> >>  			hid_err(hdev, "Can not get the protocol version.\n");
> >> -			return;
> >> +			goto out_unlock;
> >>  		}
> >>  	}
> >>  
> >> @@ -4256,7 +4260,7 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
> >>  						   "%s", name);
> >>  			kfree(name);
> >>  			if (!devm_name)
> >> -				return;
> >> +				goto out_unlock;
> >>  
> >>  			hidpp->name = devm_name;
> >>  		}
> >> @@ -4291,12 +4295,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
> >>  
> >>  	if (!(hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT) || hidpp->delayed_input)
> >>  		/* if the input nodes are already created, we can stop now */
> >> -		return;
> >> +		goto out_unlock;
> >>  
> >>  	input = hidpp_allocate_input(hdev);
> >>  	if (!input) {
> >>  		hid_err(hdev, "cannot allocate new input device: %d\n", ret);
> >> -		return;
> >> +		goto out_unlock;
> >>  	}
> >>  
> >>  	hidpp_populate_input(hidpp, input);
> >> @@ -4304,10 +4308,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
> >>  	ret = input_register_device(input);
> >>  	if (ret) {
> >>  		input_free_device(input);
> >> -		return;
> >> +		goto out_unlock;
> >>  	}
> >>  
> >>  	hidpp->delayed_input = input;
> >> +out_unlock:
> >> +	mutex_unlock(&hidpp->io_mutex);
> >>  }
> >>  
> >>  static DEVICE_ATTR(builtin_power_supply, 0000, NULL, NULL);
> >> @@ -4450,6 +4456,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  		will_restart = true;
> >>  
> >>  	INIT_WORK(&hidpp->work, delayed_work_cb);
> >> +	mutex_init(&hidpp->io_mutex);
> >>  	mutex_init(&hidpp->send_mutex);
> >>  	init_waitqueue_head(&hidpp->wait);
> >>  
> >> @@ -4519,6 +4526,9 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  	flush_work(&hidpp->work);
> >>  
> >>  	if (will_restart) {
> >> +		/* Avoid hidpp_connect_event() running while restarting */
> >> +		mutex_lock(&hidpp->io_mutex);
> >> +
> >>  		/* Reset the HID node state */
> >>  		hid_device_io_stop(hdev);
> > 
> > That's the part that makes me raise an eyebrow. Because we lock, then
> > release the semaphore to get it back later. Can this induce a dead lock?
> > 
> > Can't we solve that same scenario without a mutex, but forcing either
> > the workqueue to not run or to be finished at this point?
> 
> I'm not sure what you are worried about after the mutex_lock
> the line above we are 100% guaranteed that hidpp_connect_event()
> is not running and since it is not running it will also not
> be holding any other locks, so it can not cause any problems.

Agree, but my point is that you are not entirely solving the issue:
if now, between hid_device_io_stop() and hid_hw_close() we receive a
connect notification from the device, hid_input_report() will return
-EBUSY, and we will lose it (it will not be stacked in the workqueue).

I was thinking at adding a flush_work(&hidpp->work) here, instead of
the mutex solution, but yours ensures that any connect event already
started will be handled properly, which is a plus.

Still if between the mutex lock here we receive a connect event from the
device, we still get -EBUSY at the hid-core layer, and so we will lose
it. Maybe that's OK because we might re-ask for the device later (I
don't remember exactly the code), but my point is that because we add a
mutex doesn't mean we will solve all multi-thread problems. So finding a
non-mutex solution sometimes is better :)

And the fact that we need to think through every preemption case often
means that there is something wrong *elsewhere*.

> 
> The other way around if hidpp_connect_event() is running
> the mutex_lock() above ensures that it will finishes and
> release any locks before we get here.
> 
> There is no way that both code paths can run at the same time
> with the new lock. And there thus also is no way that they
> can cause any new not already held locks to be taken while
> the other side is running.
> 
> I actually introduced the new lock because in my mind
> introducing the new lock allows to easily reason about
> the impact on other locking (which is none).
> 
> I hope this helps explain. As for the making
> hidpp_connect_event()'s caller take the lock thing, let me
> know how you want to resolve that. Either way works for me
> and I guess the less intrusive version of making the caller
> take the lock is easier to backport so we should probably
> go that route.

Again, for that particular point, making the function a private one that
doesn't have to cope with the mutex will be simpler in this patch and in
the future.

Cheers,
Benjamin

> 
> Regards,
> 
> Hans
> 
> 
> 
> >>  		hid_hw_close(hdev);
> >> @@ -4529,6 +4539,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  
> >>  		/* Now export the actual inputs and hidraw nodes to the world */
> >>  		ret = hid_hw_start(hdev, connect_mask);
> >> +		mutex_unlock(&hidpp->io_mutex);
> >>  		if (ret) {
> >>  			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
> >>  			goto hid_hw_start_fail;
> >> @@ -4553,6 +4564,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
> >>  	cancel_work_sync(&hidpp->work);
> >>  	mutex_destroy(&hidpp->send_mutex);
> >> +	mutex_destroy(&hidpp->io_mutex);
> >>  	return ret;
> >>  }
> >>  
> >> @@ -4568,6 +4580,7 @@ static void hidpp_remove(struct hid_device *hdev)
> >>  	hid_hw_stop(hdev);
> >>  	cancel_work_sync(&hidpp->work);
> >>  	mutex_destroy(&hidpp->send_mutex);
> >> +	mutex_destroy(&hidpp->io_mutex);
> >>  }
> >>  
> >>  #define LDJ_DEVICE(product) \
> >> -- 
> >> 2.41.0
> >>
> > 
> > Cheers,
> > Benjamin
> > 
> 
> 
> 
