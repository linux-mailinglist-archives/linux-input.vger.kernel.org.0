Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570CF31C768
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 09:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhBPIgL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 03:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhBPIeQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 03:34:16 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A868C0613D6
        for <linux-input@vger.kernel.org>; Tue, 16 Feb 2021 00:33:36 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id c1so6623310qtc.1
        for <linux-input@vger.kernel.org>; Tue, 16 Feb 2021 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YavOzcXtgQalNAaJbNfEc2Doyzxyb2hGxJXjz+HYLNU=;
        b=p72WzAgMBA3Dx+rPJ29NXfrQ0EpkU3vLNy1trcAtTff+HnaSJEOPxQ16SyGYicFdXK
         mQJJWyNE7oX/44RvYcPWVDzcqEunBuQ/dgGicBqnse+gLYV1KKjmXH4emhGRT71xuDwQ
         KZPiNtDAy632Oia3LCmRh0OJbffgOVYkkbqFzZFPf4MCE8A8kpIUZnhtEStHVrG00rzK
         qsSdjbHr7f/aq27VjOKWAUIvt212VGnDYEM6kmlFia9wOMmTZXALPlGW8XWHX2Q5k5Ms
         HY6rdTIcB98N7amn5LZpDBGGzdr/uaIbFCOfoW7d6HYwwjIGEQJQ/weXN9zujraDluyr
         Yj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YavOzcXtgQalNAaJbNfEc2Doyzxyb2hGxJXjz+HYLNU=;
        b=GmqvpxgjHI4I39i7PV7K8QLrQInk2E8fZU+x2bNKOWdoO7ymlXN8ktWfepSrts4yq/
         Ay4e/mb7T26kET7ThRl/zRjYwKmqVHfETg9ClKg27n30J7eZi+S9j7pyz+GsBDA6AUld
         K0BXX7xpCFiRYicgmzRytenzgBCbUWLh5ME2Jb2XFlzpF/Kxny0AS8BgqatC+pPIA+Qx
         u+qu/xiUuwHj326RjdV+YwtHmp7K0yR7nsZkSvkelfTTtyOhEKkStPE/Q+idXC2FdtzI
         Mg3J2wl8NZMMhQhV7cE2YmCdwQaF4eN/bqJvwx+302APsEHzgw85sQmNRCiiNRMijycs
         H+AQ==
X-Gm-Message-State: AOAM531XLIcyA2bHojUyR04IHv3Wk0XAmA3oiVOJ6XY1l+ja9mNTY/AX
        PiwIdqJ0/OR8CJVu91lxoEDmDCcQ6r5MjQmHoyQsaA==
X-Google-Smtp-Source: ABdhPJyl5XVyvc6B25a3OS1HTjonYTIgUjBMvk0fkSZYul2iZGCDG9J2wgN1LeAliJqFyLbhbemNGt8pDv6SE2l0wzM=
X-Received: by 2002:ac8:764c:: with SMTP id i12mr17354128qtr.110.1613464415504;
 Tue, 16 Feb 2021 00:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-3-roderick@gaikai.com>
 <20210215154045.4ac27ec0@nic.cz> <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
 <20210215191757.58992f44@nic.cz>
In-Reply-To: <20210215191757.58992f44@nic.cz>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Tue, 16 Feb 2021 00:33:24 -0800
Message-ID: <CANndSKmA4nh6FRv89vBwshUD7t0c7bBMcZcC7TbQOzU88j=+jA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] HID: playstation: add microphone mute support for DualSense.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        pobm@protonmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 15, 2021 at 10:17 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Mon, 15 Feb 2021 10:07:29 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > On Mon, Feb 15, 2021 at 6:40 AM Marek Behun <marek.behun@nic.cz> wrote:
> > >
> > > On Sun, 14 Feb 2021 16:45:47 -0800
> > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > >
> > > > The DualSense controller has a built-in microphone exposed as an
> > > > audio device over USB (or HID using Bluetooth). A dedicated
> > > > button on the controller handles mute, but software has to configure
> > > > the device to mute the audio stream.
> > > >
> > > > This patch captures the mute button and schedules an output report
> > > > to mute/unmute the audio stream as well as toggle the mute LED.
> > > >
> > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > >
> > > Is the microphone supported via Linux? I.e. is there an audio driver
> > > for it?
> >
> > Yes and no. The microphone is supported using USB, not yet using
> > Bluetooth (uses a custom protocol). Actually there are various other
> > audio features in the DualSense (headphone jack, speaker, volume
> > controls,..) and they all work using custom protocols. We were
> > planning to defer this work through future patches as the features are
> > very complicated and need a deep analysis on how to realize them. For
> > example audio controls work through HID, but for USB the audio driver
> > is a generic hda audio device I think. Bluetooth is a custom protocol
> > and will be yet a different audio driver somewhere.
> >
> > > If it is, look at the audio-micmute LED trigger.
> > >
> >
> > I'm not sure if the expected behavior for the DualSense is similar to
> > the standard audio mute use cases. My understanding of these triggers
> > (please correct me if I'm wrong) is for e.g. an audio driver or user
> > space to send a signal to anything registering for a particular
> > trigger. In this case a global micmute. Is that, right?
> >
> > In our case for PlayStation games, there are often multiple
> > controllers connected and each user has their own microphone in their
> > controller. All can function at the same time (different from a
> > standard PC use case). That's why I'm wondering if this makes sense.I
> > know we are on Linux, but for Sony we want to properly support such
> > use cases.
>
> If there aren't audio drivers yet for this, simply have this driver
> also register a private LED trigger (with name "joystick-audiomute"
> or something similar), and when registering the LED, set the
> trigger_type member. Look at trigger_type in include/linux/leds.h, and
> in LED Documentation.

Sorry for some more questions. I have been trying to understand
triggers all night. The concept is just so strange and foreign to me.
I understand it is in the end just a string and one use case is
in-kernel IPC and you can configure them from user space as well, but
I just don't get it. I understand you can use a trigger to in the end
program your LED in a automatic manner. I just don't understand how
the concepts fit together and how to implement it (maybe I will update
the docs later on... they are a bit sparse for if you don't know this
area).

Regarding registering a private trigger. I see include/linux/leds.h
have a comment about trigger_type and how it should be set for private
triggers on led_classdev. I haven't been able to find any example
usages of this within the kernel. It doesn't seem to be used in the
kernel, maybe it is just around for future use? I also seem to need to
implement my own activate/deactive callbacks for the trigger. These I
would use to program the LED brightness I guess. Though I see various
trigger drivers (drivers/leds/triggers), but not all of them have
activate/deactivate callbacks. Mostly simple drivers, but not sure why
they don't need them. What else is the point of a trigger?

> When this trigger is enabled for your LED, have your code switch LED
> state like it does now. When there is no trigger enabled, the userspace
> will be able to set brightness of this LED via sysfs.

Right now I manage the button mute state directly from the input
handler (dualsense_parse_report) when the button is pressed and then
schedule an output report to toggle the LED and program the DualSense
to mute its audio (the PlayStation works very similar). I would need
to use led_trigger_event then here?

If I then understand it right, I need to modify my "brightness_set"
handler and check if there is a trigger (based on
led_classdev->activated??). If there is none, then userspace can
change the LED state. Internally when I change the LED state, I will
also program the hardware to mute as well. (they are tied together)

I am tempted to wait with the trigger code as I really don't understand it.

> Before registering
> the LED, assign default_trigger member so that this trigger is enabled
> during registration.
>
> This is why we have support for private LED triggers.
>
> Marek
>

Roderick
