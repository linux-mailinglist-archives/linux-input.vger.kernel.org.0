Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6560747B47C
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 21:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhLTUmB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 15:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhLTUl7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 15:41:59 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8D9C061574
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 12:41:59 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id f186so32399997ybg.2
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 12:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKwkamF2ECdE3m9HBzBYqw9G7DFlWrVoXPc0KZUI9Eo=;
        b=LU/pFkRN99wc5TYV/r3uk5enmnyv+KlUfMCjmi64NtzDc4E2tgDHl2UfiHntaAy7Qe
         81wDgfo6zYm2huHpriZ3KA9PLysziRpxka0qURJ/bqN3qjoYFK5iMKztw/8twxJY4A/E
         5Qni/5H8UKm3poS268WQ6nM/wgw++7LgTaW1udfaARp/FqjSlde4ZmfP6LfSFRNFr2Hx
         k01ueZZJwZvHop5I3wHByq9mLE5/z0a2m8q3Ep1wjqKYCfz0F8wLVjheR5PxKFRsIaoz
         nLk9pOqhYPwCMLsC126EXWPop7NbWvlPLDErQ12ZuLamncCIhljit9Gw9cB4nSMmUXVy
         xAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKwkamF2ECdE3m9HBzBYqw9G7DFlWrVoXPc0KZUI9Eo=;
        b=PPdx5JiNQbNpPWbobQDrQmiOudPg3Qdj9KESFv2cNwrkjYxkbitcmi4wQdu2dm/N8P
         qxQomOfYgi4iB7yhSHpTp2d0OscNsWiERCLUu3qNm36RRADiLMylE4M5N4ub+yejo2wb
         sIqhni47eA07V9fyhUQGGvCHKSL/eX3irhF2k5XmvvjxciLcuO4Pd0KsXOxZL+VNjH5A
         lMeQ/HKTiqodl7x+Q8teHp5qM8KZQ9FU9hCy3gFDgIUsIySBLMVw37DjEsv77WVEGppP
         bN0hR0XHl8zO+Sw96lWlaorTpjykSxo1euy9rJ2WGJK80NmpyyzQEWg1EYflSZJr0nB6
         RjjA==
X-Gm-Message-State: AOAM532WwkXhPvFJ7lhPMO2lPnoxc0ys48DDsHyF7ema805ZcU3uSWYJ
        AZxVc86wscqu8dGbS9m2VPc8ygkCIMHYh++eZIA=
X-Google-Smtp-Source: ABdhPJwADX6cknfMdyIedwsiA59DIKdPnmKhXqgNH9FXTjOUxFRxUuHMQ0SYPll7AMtwkxTlXx/A0Gf7h+BafhFI44w=
X-Received: by 2002:a25:f305:: with SMTP id c5mr25349179ybs.194.1640032918599;
 Mon, 20 Dec 2021 12:41:58 -0800 (PST)
MIME-Version: 1.0
References: <CAB4aORVm7hFDVE_zekZZxTEkXgBJD=HzEekMWNAZs3kV05JU7w@mail.gmail.com>
 <YamHiBW8nI8Lxeef@quokka>
In-Reply-To: <YamHiBW8nI8Lxeef@quokka>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 20 Dec 2021 12:41:47 -0800
Message-ID: <CAEc3jaB+VmH1cFkFXOFxg+p-dM2xCPWzNuXi3U5HNx6idKgikw@mail.gmail.com>
Subject: Re: Forcepad interface design proposal
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Angela Czubak <acz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>, seobrien@chromium.org,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 6, 2021 at 7:24 AM Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> Hi Angela,
>
> On Tue, Nov 30, 2021 at 02:51:48PM +0100, Angela Czubak wrote:
> > Hi Benjamin and Peter,
> >
> > I am refreshing this old thread in order to clarify some things
> > discussed here :)
> > I specifically got lost when reading about virtual IDs for effects.
> > Asking more inline.
>
> [...]
>
> > > > > > > > So, the solution we came to this morning, while talking to Peter, was
> > > > > > > > that the HID driver for a simple haptic HID device would allocate a
> > > > > > > > virtual device memory to store the effects and the parameters.
> > > > > > > >
> > > > > > > > This way, we can:
> > > > > > > > - upload effect WAVEFORM_RELEASE with its parameters in id 0 of the
> > > > > > > > drvdata of the device
> > > > > > > > - upload effect WAVEFORM_PRESS with its parameters in id 1 of the
> > > > > > > > drvdata of the device
> > > > > > > > - ...
> > > > > > > > - upload effect WAVEFORM_VENDOR_ZZZ_ZZZ with its parameters in id N of
> > > > > > > > the drvdata of the device -> userspace will use it while scrolling for
> > > > > > > > instance
> > > > > > > > - ...
> > > > > > > >
> > > > > > > > Then the kernel on BTN_LEFT press can automatically trigger the effect
> > > > > > > > with id 1 and the one with id 0 on release in the case of the
> > > > > > > > autonomous mode mentioned below.
> > > > > > > >
> > > > > > > > To solve the question of knowing which effect should be loaded in
> > > > > > > > which slot, I think we should rely on a userspace helper (udev?).
> > > > > > > > We definitively not want the kernel to keep a list of devices to
> > > > > > > > effects matches, but having a udev database (hwdb and intrinsic?)
> > > > > > > > would nicely solve the issue as we do not need to update the kernel
> > > > > > > > for each new device coming in.
> > > > > > > >
> > > > > > > > From the kernel driver, we can populate the WAVEFORM_PRESS and
> > > > > > > > WAVEFORM_RELEASE with some sensible parameters, but userspace should
> > > > > > > > be allowed to override them.
> > > > > > > >
> > > > > > > > The advantage of having this virtual memory of device effects, is that
> > > > > > > > each userspace implementation could use its own matching for effects.
> > > > > > > > For example, libinput might want to say:
> > > > > > > > - id 0 -> BTN_LEFT released
> > > > > > > > - id 1 -> BTN_LEFT pressed
> > > > > > > > - id 0x1000 -> scrolling up
> > > > > > > > - id 0x1001 -> scrolling down
> > > > > > > > - id 0x2042 -> hard press
> > > > > > > >
> > Was there some idea up then to implement virtual effect IDs? Right now
> > it seems that
> > the number of possible FF effects is limited to FF_MAX_EFFECTS and
> > that it is the kernel
> > and not the user space that assigns the ID when an effect is uploaded.
> > Or was it more of a suggestion for the future than a requirement
> > regarding the simple haptic feedback implementation?
>
> I have to admit I barely remember any of this, it happend around a very busy
> time and i have little recollection beyond re-reading this thread. The above
> was an idea on how to handle custom waveforms, we never went past what was
> suggested in this thread.
>
> Cheers,
>    Peter

Just some additional pennies around this discussion. At Sony we do
want to support our Haptic triggers (marketed as Adaptive triggers) as
for example first seen on our PS5 DualSense controllers. We created a
proof-of-concept, but we need an entirely different interface through
evdev. The existing interface is too limiting due to the amount of
data needed.

The way our haptics works is essentially that per trigger (ABS_Z /
ABS_RZ) you can set different types of haptic effects. Depending on
the effect, you can have it start at a certain axis position. From
that axis position you can make the trigger provide more resistance or
it can even start rumbling. Haptic effects include a weapon like
effect, a rumble effect, resistance effect and others. Apple
implemented some in iOS recently for us.
https://developer.apple.com/documentation/gamecontroller/gcdualsenseadaptivetrigger

In any case, where I'm going with this is that there might be some
similarities and we are running into issues with FF. For our PoC we
created a new EV API (EV_HE for haptic effect). I didn't have time to
polish it in anyway and wanted to keep it generic.

However, there is reluctance in my understanding to add new evdev
APIs. Benjamin for example is very keen on leveraging eBPF. So it is
probably a bigger discussion.

Thanks,
Roderick
