Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1D0530A1E
	for <lists+linux-input@lfdr.de>; Mon, 23 May 2022 10:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiEWHaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 May 2022 03:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiEWHYk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 May 2022 03:24:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481413B57D
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 00:20:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F184B80EF9
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 06:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3904C385A9;
        Mon, 23 May 2022 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653289043;
        bh=IRKoTEq4Y4VkYc+/M1ILz2nF0LqcMXmJP5ShEroJNrc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=N/qAYHz1JdGrxqHgIHXDKnhm9126zd1F9C3rhhABZoIJ7L/resVQVzw+G0+i7Rnaz
         oyPiayTvjBd1vaUTDBAW16RSpOzLsCwdkcfWAXw8/tod9Yz0jtzMhlrzWIFFJzVy8Y
         K7lDk9Ydwf8E/A2CAbLw9tp97FdZnqBT0E+WKmC64V0xDHbs2rhjBFlTY0RcWROhbb
         JjX3+B6VIJTC29fqw1k1V+MTto4M2d516Nc2lgfuLWIXud/w9WhAALJ/lp0owa+e/U
         7QhtG30aG6W/QKZMmZUJshzX0+OgWo4pF1RHPhiSQCJ5/MPxiHckLiKKhZjXvogkOT
         DVHBL1j5/3dYA==
Date:   Mon, 23 May 2022 08:57:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Angela Czubak <acz@semihalf.com>
cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 00/17] *** Implement simple haptic HID support ***
In-Reply-To: <CAB4aORVxapNDHjFW5pRM1tExPX6661oPmmt3N8JxhqELhDs86Q@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2205230856010.28985@cbobk.fhfr.pm>
References: <20220513093927.1632262-1-acz@semihalf.com> <CAB4aORVxapNDHjFW5pRM1tExPX6661oPmmt3N8JxhqELhDs86Q@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 22 May 2022, Angela Czubak wrote:

> > This patch series introduces changes necessary to support devices
> > using simple haptic HID pages.
> > Implementation attempts to follow the discussion below:
> > https://www.spinics.net/lists/linux-input/msg61091.html
> >
> > Introduce new haptic defines as specified in HID Usage Tables.
> >
> > Add new force feedback effect type in order to facilitate using
> > simple haptic force feedback.
> >
> > Add INPUT_PROP_HAPTIC_TOUCHPAD to mark touchpad exposing simple haptic
> > support.
> >
> > Add new struct hid_haptic_device so as to gather simple haptic related
> > configuration and current state of the device.
> >
> > Add new functions to be triggered during HID input mapping and
> > configuration in order to detect simple haptic devices.
> >
> > Modify HID input so that haptic output reports are parsed.
> >
> > Initialize a haptic device.
> >
> > Modify FF core so that effect IDs can be shared between multiple open file
> > handles.
> >
> > Add shared release and press effects for a simple haptic device.
> >
> > Calculate pressure resolution if units are grams or newtons.
> >
> > Add support for kernel-driven mode of simple haptic device.
> >
> > Toggle ABS_PRESSURE generation by input-mt on request.
> >
> > Implement functions allowing switching between kernel-managed mode
> > and autonomous mode.
> >
> > Add simple haptic support for hid-multitouch driver.
> >
> > Implement EVIOCFF(TAKE|RELEASE)CONTROL ioctls so that userspace can take
> > and release control of shared release and press effects.
> >
> > Fix i2c hid sending and getting report so that report IDs larger than 0xF
> > are handled correctly.
> >
> > v2:
> > - Describe INPUT_PROP_HAPTIC_TOUCHPAD in
> >   Documentation/input/event-codes.rst
> > - Do not extract mt_get_feature(), use hid_hw_wait() instead
> > - Define HID_UNIT_GRAM and HID_UNIT_NEWTON
> > - Calculate pressure sum in input-mt if INPUT_MT_TOTAL_FORCE flags set
> > - Use u* instead of __u* in struct hid_haptic_device
> > - Solve problems with report IDS >= 0xF as Dmitry suggests
> >
> > v3:
> > - Get rid of INPUT_PROP_HAPTIC_TOUCHPAD property as haptic device does not
> >   gave to be a touchpad
> > - Introduce notion of haptic forcepads; generate haptic feedback in kernel
> >   mode only for forcepads
> > - Generate clicks based on maximum pressure across slots instead of the sum
> > - Fix off-by-one bug in hid_haptic_upload_effect()
> > - Fix resume/suspend: issue hid_haptic_resume() in mt_resume() and
> >   hid_haptic_suspend() in mt_suspend()
> > - Add reset callback for HID i2c devices
> > - Implement reset callback for HID multitouch haptic devices
> > - Implement lid handler triggering touchpad recalibration for Redrix
> >
> > Angela Czubak (17):
> >   HID: add haptics page defines
> >   Input: add FF_HID effect type
> >   HID: haptic: introduce hid_haptic_device
> >   HID: input: allow mapping of haptic output
> >   HID: haptic: initialize haptic device
> >   Input: add shared effects
> >   HID: haptic: implement release and press effects
> >   HID: input: calculate resolution for pressure
> >   HID: haptic: add functions handling events
> >   Input: MT - add INPUT_MT_MAX_FORCE flags
> >   HID: haptic: add hid_haptic_switch_mode
> >   HID: multitouch: add haptic multitouch support
> >   Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
> >   HID: haptic: add hid_haptic_change_control
> >   HID: add HID device reset callback
> >   HID: haptic: implement HID haptic reset callback
> >   HID: multitouch: Add lid handler for touchpad on Redrix chromebook
> >
> >  drivers/hid/Kconfig                |  14 +
> >  drivers/hid/Makefile               |   1 +
> >  drivers/hid/hid-haptic.c           | 753 +++++++++++++++++++++++++++++
> >  drivers/hid/hid-haptic.h           | 152 ++++++
> >  drivers/hid/hid-input.c            |  18 +-
> >  drivers/hid/hid-multitouch.c       | 313 +++++++++++-
> >  drivers/hid/i2c-hid/i2c-hid-core.c |  21 +
> >  drivers/input/evdev.c              |   6 +
> >  drivers/input/ff-core.c            | 129 ++++-
> >  drivers/input/input-mt.c           |  16 +-
> >  include/linux/hid.h                |  31 ++
> >  include/linux/input.h              |   5 +
> >  include/linux/input/mt.h           |   1 +
> >  include/uapi/linux/input.h         |  26 +-
> >  14 files changed, 1469 insertions(+), 17 deletions(-)
> >  create mode 100644 drivers/hid/hid-haptic.c
> >  create mode 100644 drivers/hid/hid-haptic.h
> >
> > --
> > 2.36.0.550.gb090851708-goog
> >
> 
> Hi, could I get any feedback? :) Or should I wait for some features to
> land in the upstream kernel?

Hi Angela,

I am in the process of reviewing the patchset, but I am not done with it 
yet. It won't land in 5.19 anyway, so if all goes good (and we also 
eventually get Ack from Dmitry at least for the Input-specific bits), we 
can potentially target 5.20 unless something substantial pops up.

Please give me/us a few more days to process this.

Thanks,

-- 
Jiri Kosina
SUSE Labs

