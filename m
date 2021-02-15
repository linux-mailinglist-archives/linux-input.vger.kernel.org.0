Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322BF31C16A
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 19:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhBOST6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 13:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhBOSSl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 13:18:41 -0500
X-Greylist: delayed 13033 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Feb 2021 10:18:01 PST
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA8CC061574;
        Mon, 15 Feb 2021 10:18:01 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id F2FC4140A77;
        Mon, 15 Feb 2021 19:17:58 +0100 (CET)
Date:   Mon, 15 Feb 2021 19:17:57 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        pobm@protonmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 2/4] HID: playstation: add microphone mute support
 for DualSense.
Message-ID: <20210215191757.58992f44@nic.cz>
In-Reply-To: <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-3-roderick@gaikai.com>
        <20210215154045.4ac27ec0@nic.cz>
        <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 15 Feb 2021 10:07:29 -0800
Roderick Colenbrander <roderick@gaikai.com> wrote:

> On Mon, Feb 15, 2021 at 6:40 AM Marek Behun <marek.behun@nic.cz> wrote:
> >
> > On Sun, 14 Feb 2021 16:45:47 -0800
> > Roderick Colenbrander <roderick@gaikai.com> wrote:
> >  
> > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > >
> > > The DualSense controller has a built-in microphone exposed as an
> > > audio device over USB (or HID using Bluetooth). A dedicated
> > > button on the controller handles mute, but software has to configure
> > > the device to mute the audio stream.
> > >
> > > This patch captures the mute button and schedules an output report
> > > to mute/unmute the audio stream as well as toggle the mute LED.
> > >
> > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>  
> >
> > Is the microphone supported via Linux? I.e. is there an audio driver
> > for it?  
> 
> Yes and no. The microphone is supported using USB, not yet using
> Bluetooth (uses a custom protocol). Actually there are various other
> audio features in the DualSense (headphone jack, speaker, volume
> controls,..) and they all work using custom protocols. We were
> planning to defer this work through future patches as the features are
> very complicated and need a deep analysis on how to realize them. For
> example audio controls work through HID, but for USB the audio driver
> is a generic hda audio device I think. Bluetooth is a custom protocol
> and will be yet a different audio driver somewhere.
> 
> > If it is, look at the audio-micmute LED trigger.
> >  
> 
> I'm not sure if the expected behavior for the DualSense is similar to
> the standard audio mute use cases. My understanding of these triggers
> (please correct me if I'm wrong) is for e.g. an audio driver or user
> space to send a signal to anything registering for a particular
> trigger. In this case a global micmute. Is that, right?
> 
> In our case for PlayStation games, there are often multiple
> controllers connected and each user has their own microphone in their
> controller. All can function at the same time (different from a
> standard PC use case). That's why I'm wondering if this makes sense.I
> know we are on Linux, but for Sony we want to properly support such
> use cases.

If there aren't audio drivers yet for this, simply have this driver
also register a private LED trigger (with name "joystick-audiomute"
or something similar), and when registering the LED, set the
trigger_type member. Look at trigger_type in include/linux/leds.h, and
in LED Documentation.

When this trigger is enabled for your LED, have your code switch LED
state like it does now. When there is no trigger enabled, the userspace
will be able to set brightness of this LED via sysfs. Before registering
the LED, assign default_trigger member so that this trigger is enabled
during registration.

This is why we have support for private LED triggers.

Marek

> > If you can't use the audio-micmute trigger because the microphone isn't
> > supported via Linux, I still think the LED should the LED should be
> > read-write. You can then register a LED private trigger. The driver should
> > change the state of the LED according to the microphone mute state only
> > if these trigger is enabled.
> >
> > Marek  
> 
> Roderick

