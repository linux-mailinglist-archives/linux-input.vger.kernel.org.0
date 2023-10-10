Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69BD7BF776
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 11:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjJJJge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 05:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjJJJgd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 05:36:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A972093
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 02:36:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1276C433C8;
        Tue, 10 Oct 2023 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696930591;
        bh=TF+OcWR1FvGOGLWhXO7qTlDqGmlsWAqfc5JKC9hPy0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nu/8RNsWVq+I+/0XmlGBOiiNKokfmNAWiDwCfUvUE3c5H8/FdhztWS5GO+H+tiVwA
         c7jg19lXpIECR6AJ2nBOb5++DpKGM+O3YnfzHkuMvDfnvVJMSA65ZD8jum50lhxk+6
         pKwqV6xnRXA2+v1eqJwXj1K2YvPx31Mlrr2n9Xyh4ic/ZzdEcjrVbHHdCuh+aro5FA
         6zD8gBST7ac+leAgZc4oQ97Kb9/cYcG4wNv+vbez0SDZJ5fR4b3n3Bpi0vBbcdfcUX
         Syqvpd2fo/tm6E3CZIeiOPD2f6r0UsI6NPjdIZAW+3K9DiLSgx2DOHCjK+7tB6oNRV
         P6+99fBsxWCyg==
Date:   Tue, 10 Oct 2023 11:36:26 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 00/14] HID: logitech-hidpp: Avoid
 hidpp_connect_event() running while probe() restarts IO
Message-ID: <hjcpffahcxfqxfzyd7as2v75wpqbta2arj7dy3d2xwg7pz7q4g@4lv2dry2gcp7>
References: <20231008095458.8926-1-hdegoede@redhat.com>
 <98bc1918-653e-b298-392c-c525d069ea31@redhat.com>
 <up2e4vgb24rb25cwnkhhrswusous2wyo376has23k2dakfdmgk@eb76ysbnz3yu>
 <f28d42de-e2f3-bb2e-ed69-b7f21bcf06f9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28d42de-e2f3-bb2e-ed69-b7f21bcf06f9@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Oct 09 2023, Hans de Goede wrote:
> Hi Benjamin,
> 
> On 10/9/23 10:13, Benjamin Tissoires wrote:
> > 
> > Hi Hans,
> > 
> > On Oct 08 2023, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 10/8/23 11:54, Hans de Goede wrote:
> >>> Hi Benjamin,
> >>>
> >>> Here is a v2 of my series to fix issues with hidpp_connect_event() running
> >>> while restarting IO, which now also fixes the issues you mentioned with
> >>> potentially missing connect events.
> > 
> > Great, thanks a lot for this hard work.
> 
> You're welcome.
> 
> >>> This series is best explained by a brief sketch of how probe()
> >>> looks at the end of the series (1):
> > 
> > TBH, I couldn't parse the following yesterday evening, but after looking
> > at all patches one by one I can now get it :)
> 
> I'm glad you get it now :)
> 
> > 
> >>>
> >>> Prep work:
> >>>
> >>> 1. All code depending on a device being in connected state is moved to
> >>>    the hidpp_connect_event() workqueue item
> >>>
> >>> 2. hidpp_connect_event() now checks the connected state itself by
> >>>    checking that hidpp_root_get_protocol_version() succeeds, instead
> >>>    of relying on possibly stale (racy) data in struct hidpp_device
> >>>
> >>> With this in place the new probe() sequence looks like this:
> >>>
> >>> 1. enable_connect_event flag starts at 0, this filters out / ignores any
> >>>    connect-events in hidpp_raw_hidpp_event() avoiding
> >>>    hidpp_connect_event() getting queued before the IO restart
> >>>
> >>> 2. IO is started with connect-mask = 0
> >>>    this avoids hid-input and hidraw connecting while probe() is setting
> >>>    hdev->name and hdev->uniq
> >>>
> >>> 3. Name and serialnr are retrieved and stored in hdev
> >>>
> >>> 4. IO is fully restarted (including hw_open + io_start, not just hw_start)
> >>>    with the actual connect-mask.
> >>>
> >>> 5. enable_connect_event atomic_t is set to 1 to enable processing of
> >>>    connect events.
> >>>
> >>> 6. hidpp_connect_event() is queued + flushed to query the connected state
> >>>    and do the connect work if the device is connected.
> >>>
> >>> 7. probe() now ends with:
> >>>
> >>>         /*
> >>>          * This relies on logi_dj_ll_close() being a no-op so that
> >>>          * DJ connection events will still be received.
> >>>          */
> >>>         hid_hw_close(hdev);
> >>>
> >>>    Since on restarting IO it now is fully restarted so the hid_hw_open()
> >>>    there needs to be balanced. 
> >>>
> >>> This series now obviously is no longer 6.6 material, instead I hope we
> >>> can get this rework (and IMHO nice cleanup) into 6.7 .
> > 
> > Yeah, not 6.6 anymore, but should be doable for 6.7.
> > 
> >>>
> >>> Regards,
> >>>
> >>> Hans
> >>
> >> I forgot to add info on the list of devices I tested this on:
> >>
> >> Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
> >> Logitech M720 Triathlon (bluetooth, HID++ 4.5)
> >> Logitech K400 Pro (unifying, HID++ 4.1)
> >> Logitech K270 (eQUAD nano Lite, HID++ 2.0)
> >> Logitech M185 (eQUAD nano Lite, HID++ 4.5)
> >> Logitech Keyboard LX501 (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
> >> Logitech 27Mhz mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)
> > 
> > We should probably add this list to the commit messages.
> > I'll need to test also myself on some problematic devices that have a
> > special case (WTP, USB wired, BLE).
> 
> So you want to add this to all 14 commit messages ?

I'd like to have this list recorded in the git tree. In case we have to
do forensic once again. Whether it's added in all messages is up to you
I think. But honestly, maybe add those only when you actually tested the
patch. No?

> 
> > Anyway, I'll have to test everything, but this looks like it's in a
> > better shape than previously.
> > 
> > However, the thing I am afraid is that commit 498ba2069035 ("HID:
> > logitech-hidpp: Don't restart communication if not necessary") was
> > fixing devices that did not like the hid_hw_stop/start. I can't find the
> > bug numbers however... So with your series, we might breaking those
> > once again.
> > 
> > How about we do the following (in pseudo code):
> > probe():
> >   hidpp_connect_and_start(connect_mask = 0)
> >   // retrieve name and serial
> >   hid_connect(connect_mask) // with connect_mask ensuring we don't
> >                             // create inputs if HIDPP_QUIRK_DELAYED_INIT
> >                             // is set, instead of stop/start
> >   hid_hw_close(hdev); // to balance hidpp_connect_and_start()
> > 
> > I think the above should even remove the need for the
> > enable_connect_event atomic_t given that now we are not restarting the
> > devices at all.
> 
> Interesting yes that looks good, any idea why this was not done
> in commit 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
> right away ?

I tried to do a little bit of digging. Initially I thought that's
because I was always doing that stop/start dance, and so I continued
with that.

But looking slightly more carefully, I think I understand why:
- calling twice hid_connect should fail, because it'll create twice the
  sysfs nodes for the HID device itself
- so we need to call hid_disconnect() first
- this was done through hid_hw_stop() and given that the dj driver has
  empty stubs for start/stop, this was semantically the same.

So using hid_hw_stop/start was a shortcut because DJ had empty stubs.
But when I enabled direct use of hidpp from other transport layers, I
did not realized that there was this glitch.

And then I completely forgot to clean up that because "at the end of a
HID driver we are supposed to call hid_hw_start()".

> 
> Let me rework the series to use that tomorrow. This will probably also
> allow dropping a bunch of the patches.

Yeah, I think we should be able to remove the sync mechanism.
And be careful to call hid_disconnect() before
hid_connect(connect_mask), or you'll probably have errors if not when
plugging the device, but when unplugging it for sure.

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
> > 
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>> 1) For reviewing you may also want to apply the entire series and look
> >>> at the end result to help you understand why various intermediate steps
> >>> are taken.
> >>>
> >>>
> >>> Hans de Goede (14):
> >>>   HID: logitech-hidpp: Revert "Don't restart communication if not
> >>>     necessary"
> >>>   HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect
> >>>     check
> >>>   HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
> >>>   HID: logitech-hidpp: Remove connected check for non-unifying devices
> >>>   HID: logitech-hidpp: Move get_wireless_feature_index() check to
> >>>     hidpp_connect_event()
> >>>   HID: logitech-hidpp: Remove wtp_get_config() call from probe()
> >>>   HID: logitech-hidpp: Remove connected check for g920_get_config() call
> >>>   HID: logitech-hidpp: Add a hidpp_connect_and_start() helper
> >>>   HID: logitech-hidpp: Move the connected check to after restarting IO
> >>>   HID: logitech-hidpp: Move g920_get_config() to just before
> >>>     hidpp_ff_init()
> >>>   HID: logitech-hidpp: Remove unused connected param from *_connect()
> >>>   HID: logitech-hidpp: Fix connect event race
> >>>   HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe()
> >>>     restarts IO
> >>>   HID: logitech-hidpp: Drop delayed_work_cb()
> >>>
> >>>  drivers/hid/hid-logitech-hidpp.c | 211 +++++++++++++------------------
> >>>  1 file changed, 91 insertions(+), 120 deletions(-)
> >>>
> > 
> > I like when the total number of deletions is higher than the additions
> > :)
> > 
> > Cheers,
> > Benjamin
> > 
> >>
> > 
> 
