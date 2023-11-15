Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097887E529A
	for <lists+linux-input@lfdr.de>; Wed,  8 Nov 2023 10:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjKHJX4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Nov 2023 04:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235562AbjKHJXy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Nov 2023 04:23:54 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E3492;
        Wed,  8 Nov 2023 01:23:52 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a0907896so8407428e87.2;
        Wed, 08 Nov 2023 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699435430; x=1700040230; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3bWNWLb8bUKUmsrWDbcrZobUCtdzk1dZvHegwY9YLpY=;
        b=DTdn6Ca82bpfC3/e/3houKfwx3uR8OfYzady8V/jI3INhiTkQB7hTSDwIbk69tHmE5
         8ovwr/GKR9213s0O011bt2FiqG8GadqgYiXN0Q0oiyuG6ozzJCwjhdWoeY8OS71ZBDXm
         TC3FxtcPMZTeOWQlAY0W0se0qa9zlhahBJNDx4B2GCZw0ZgeEHMtXxTpJwRDj30y+gR8
         v0MrCizl3vfhrjP1Pjk/SvMUhqLZhsrOhkGKvV1J8xFtFkVb3vqWBmPsEIqbzHAwqqW+
         jfsqHUNIZMZ7+l5gawh+QYraaKHEk55UaAzAuguY8UN5bj71UfoophMOWqEYozh1FBVW
         4EkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699435430; x=1700040230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bWNWLb8bUKUmsrWDbcrZobUCtdzk1dZvHegwY9YLpY=;
        b=ObAkebnuKJgq1TIrSW88i/LXAqidynHbvRfYqEv/kDcB6SzFgEEOC6I5OT9/e7pSr6
         Vc4qtMix5b649EZqDIydae263DRmPwAZDDFTxIO86AYp/fSMhX8YqqYRhA5ZvdElPElH
         wR4PNCN3CG09C+FTaZ0Wm1LwPPkYw1jugZ2QRn49GGbHQCa2E69WnvkneFHYzUnnexHq
         IgfEyrps6VceHhWt4hyUFMH/NHXSaEnO3ANaVlGqepbnx6JYMXSFEH4d5rKUnY9RLodh
         TGFTijNSyPVBX0eghqMZ4GWGv0bJ9jNWnPvRblfMRB6WBhniTm+EuscN0qwnTz2PWZPB
         upLg==
X-Gm-Message-State: AOJu0YzBZ6v2ZXlNluZlyPykZVh8xm/aLw+3Ljmnaz7uPji3m0dk6V55
        ucPyp7QSKRRwrCxmvS6qlu0=
X-Google-Smtp-Source: AGHT+IEPS414QCWC91SlFW64YK9sIOebiUQQ6EPL8AEfFZaellya6egBeYvSvJBIaSzxqdsHGcdDZA==
X-Received: by 2002:a05:6512:3122:b0:509:4864:1b3a with SMTP id p2-20020a056512312200b0050948641b3amr800579lfd.64.1699435430022;
        Wed, 08 Nov 2023 01:23:50 -0800 (PST)
Received: from fedora ([94.73.34.185])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d62c9000000b0032f7f4d008dsm4454992wrv.20.2023.11.08.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 01:23:49 -0800 (PST)
Date:   Wed, 8 Nov 2023 10:23:48 +0100
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Eric GOUYER <folays@gmail.com>,
        Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>,
        David Revoy <davidrevoy@protonmail.com>, jkosina@suse.cz,
        jason.gerecke@wacom.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Requesting your attention and expertise regarding a
 Tablet/Kernel issue
Message-ID: <ZUtTpKyP0oxWhnn8@fedora>
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <20231103200524.53930-1-ostapyshyn@sra.uni-hannover.de>
 <bokQB3BK040-4fGy8tNfZrdM2mNmWxZud9O-KMmYqOkfa1JTC1ocUjoAzCEpPsbsAvY5qb5TcSP6XsQLaja2XO0gapOcsZyeVdCvq6T31qA=@protonmail.com>
 <CAO-hwJLpKTb9yxvxaPDLZkF9kDF8u2VRJUf9yiQd+neOyxPeug@mail.gmail.com>
 <eb8e22f3-77dc-4923-a7ba-e237ee226edb@sra.uni-hannover.de>
 <CAO-hwJKVwZK00yZFjuyyR9Xt4Y2-r8eLJNZfnyeopHxoZQ0eGA@mail.gmail.com>
 <20231108062306.33f5dcd0@dryade>
 <CAO-hwJK_xp1A=dEOV-2v3KJAf0bRLDWNcrFQeBpgEuxT-qSBnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJK_xp1A=dEOV-2v3KJAf0bRLDWNcrFQeBpgEuxT-qSBnw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Wed, Nov 08, 2023 at 10:04:30AM +0100, Benjamin Tissoires wrote:
> Thanks Eric and Illia for the logs and the explanations.
> 
> On Wed, Nov 8, 2023 at 6:23 AM Eric GOUYER <folays@gmail.com> wrote:
> >
> > Sorry, below I re-send my email which bounced due to exceeding 100k
> > (hid-recorder traces included), so I re-send it without them, for some
> > book-keeping.
> >
> > I had originally replied-to-all, so mainteners involved should have
> > received those traces just before (I hope).
> >
> > Best Regards,
> >
> > -----8<-----8<-----8<-----8<
> >
> > Hello, I have the same tablet than OP (David) :
> > - XP-Pen Artist Pro 16 Gen 2
> > - on Ubuntu 23.10 linux-image-generic 6.5.0.10.12
> >
> > I am not (yet ?) encountering the problem described above since I guess
> > that my kernel is before the suspected regression.
> >
> > Here below I included much detail, but you can TL;DR + jump at the five
> > hid-recorder traces below.
> >
> > > On Mon, Nov 6, 2023 at 9:06 PM Illia Ostapyshyn
> > > <ostapyshyn@sra.uni-hannover.de> wrote:
> > > >
> > > > On 11/6/23 17:59, Benjamin Tissoires wrote:
> > > >
> > > > > If the pen has 2 buttons, and an eraser side, it would be a
> > > > > serious design flow for XPPEN to report both as eraser.
> > > > >
> > > > > Could you please use sudo hid-recorder from hid-tools[1] on any
> > > > > kernel version and send us the logs here?
> > > > > I'll be able to replay the events locally, and understand why the
> > > > > kernel doesn't work properly.
> > > > >
> > > > > And if there is a design flaw that can be fixed, we might even be
> > > > > able to use hid-bpf to change it :)
> > > >
> > > > My wild guess is that XP-Pen 16 Artist Pro reports :
> > > > - (1) an Eraser usage without Invert for the upper button
> > > > - (2) and Eraser with Invert for the eraser tip.
> >
> > I think you will agree with below traces that :
> > - (1) : correct (it reports invert=0 eraser=1 tipSwitch=1)
> > - (2) : no, for the rubber tip, it reports invert=1 eraser=0 tipSwitch=1
> >
> > > > A device-specific driver could work with that, but
> > > > there seems to be no way to incorporate two different erasers
> > > > (thus, allowing userspace to map them to different actions
> > > > arbitrarily) in the generic driver currently.
> > >
> > > That's exactly why I want to see the exact event flow. We can not do
> > > "wild guesses" unfortunately (not meaning any offenses).
> > > And I am very suspicious about the fact that the stylus reports 2
> > > identical erasers. Because in the past David seemed to be able to have
> > > 2 distincts behaviors for the 2 "buttons" (physical button and eraser
> > > tail).
> >
> > The Pen, hardware-wise, has the following possibilities :
> > - The (main) pressure tip
> > - The "bottom" button (nearest of the main pressure tip)
> > - The "top" button (farthest of the main tip
> > - The "back" pressure tip (it has pressure!) somewhat called rubber
> >
> > All of those works I think -natively- on my kernel version, without
> > external 3rd-party kernel modules.
> >
> > It works especially on Blender, where I can :
> > - click (or paint) with main pressure-tip
> > - middle-click (to pan viewport) with "bottom" button + move main tip
> > - right-click with "top" button
> > - erase with backside pressure-tip
> >
> > I installed a .deb from the official website [1] which does not contain
> > kernel modules, and seems to only contains :
> > - a udev rule to, I think, chmod 0666 to input character devices
> > - a Qt app to configure some behavior, only userland-side.
> >
> > I think I observed that before running the Qt app, there was only 3
> > xinput devices, and after launching it, there were 4 more (7 total).
> >
> > Blender would not receive pen input without lanching the Qt app.
> > Indeed, the "first" 3 /dev/input/event* associated to the pen are
> > chmod'ed too restrictively (0660) for an underprivileged user.
> 
> This is wrong (not your fault, of course). There is no way Blender
> should directly talk to the input nodes. It should use the events from
> the compositor, not randomly getting values from input nodes. sigh...
> 
> >
> > Anyway, after running the Qt App, 4 *ANOTHER* /dev/input/event* pops,
> > correctly chmod'ed (thanks to the udev rules), and Blender works.
> 
> I got a quick look, and those events are coming from uinput. So their
> Qt App is just a horrible user space driver to fix their tablet. Ouch.
> 
> >
> > My best guess would be that the first 3 very-native /dev/input/
> > devices are somewhat "raw", and that the Qt app feeds those inputs to
> > the Qt app's configured pressure curve + remap the button to the input
> > as chosen by the user.
> 
> The "raw" nodes are giving all of the information, but not correctly.
> So they are using a separate userspace driver to "fix" it.
> 
> >
> > Here is the dmesg before launching the Qt App :
> > -----8<-----8<-----8<-----8<
> > usb 3-9: new full-speed USB device number 64 using xhci_hcd
> > usb 3-9: New USB device found, idVendor=28bd, idProduct=095b,
> > bcdDevice= 0.00
> > usb 3-9: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > usb 3-9: Product: Artist Pro 16 (Gen2)
> > usb 3-9: Manufacturer: UGTABLET
> > usb 3-9: SerialNumber: 00000
> > input: UGTABLET Artist Pro 16 (Gen2) Mouse as
> > /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:08.0/0000:07:00.0/
> > 0000:08:0c.0/0000:69:00.0/usb3/3-9/3-9:1.0/0003:28BD:095B.009E/input/input196
> > input: UGTABLET Artist Pro 16 (Gen2) Keyboard as
> > /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:08.0/0000:07:00.0/
> > 0000:08:0c.0/0000:69:00.0/usb3/3-9/3-9:1.0/0003:28BD:095B.009E/input/input197
> > hid-generic 0003:28BD:095B.009E: input,hidraw4: USB HID v1.00 Mouse
> > [UGTABLET Artist Pro 16 (Gen2)] on usb-0000:69:00.0-9/input0
> > input: UGTABLET Artist Pro 16 (Gen2) as
> > /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:08.0/0000:07:00.0/
> > 0000:08:0c.0/0000:69:00.0/usb3/3-9/3-9:1.1/0003:28BD:095B.009F/input/input198
> > hid-generic 0003:28BD:095B.009F: input,hidraw7: USB HID v1.00 Device
> > [UGTABLET Artist Pro 16 (Gen2)] on usb-0000:69:00.0-9/input1
> > hid-generic 0003:28BD:095B.00A0: hiddev0,hidraw12: USB HID v1.00 Device
> > [UGTABLET Artist Pro 16 (Gen2)] on usb-0000:69:00.0-9/input2
> > -----8<-----8<-----8<-----8<
> >
> > This make "sudo xinput" reports 3 new devices :
> > UGTABLET Artist Pro 16 (Gen2) Mouse id=x [slave pointer (n)]
> > UGTABLET Artist Pro 16 (Gen2) Keyboard id=y [slave keyboard (n+1)]
> > UGTABLET Artist Pro 16 (Gen2) id=z [slave keyboard (n+1)]
> > (sorry I've masked the id to prevent confusion, I did not run "xinput"
> > at the same time/power cycle than "dmesg")
> >
> > Running the Qt App makes "sudo xinput" report 4 new devices :
> > XP-Pen Mouse id=xc [slave pointer (n)]
> > XP-Pen Eraser id=xa [slave keyboard (n+1)]
> > XP-Pen Pen id=xb [slave keyboard (n+1)] << only this chmod'ed 0666
> > XP-Pen Mouse id=xd [slave keyboard (n+1)]
> >
> > And... it suffices to make Blender works without configuring anything.
> >
> > Anyway, besides this user experience / userland Qt app, here are some
> > five hid-recorder traces ;
> 
> Many thanks for attaching them and for digging into them.
> 
> > I re-used the terminology appearing in the traces :
> > - "barrel" : the "bottom" button nearest of the main tip
> > - "erase" : the farther "top" button, just above "barrel"
> > - "back" : the "rubber" secondary pressure tip at the back of the pen
> >
> > (1) hidraw7_inRange_contact_move_lift_outOfRange
> > I "contact" the main tip, move it, and lift it out or range.
> >
> > (2) hidraw7_inRange_contact_barrelPress\
> > _move_barrelRelease_lift_outOfRange
> > I "contact" the main tip, press "barrel" (which is the button nearest
> > of the tip), move the pen, release the button, move it out of range.
> >
> > (3) hidraw7_inRange_contact_erasePress\
> > _move_eraseRelease_lift_outOfRange
> > The same than above, except that I instead use the "erase" button,
> > i.e. the button just above ("vertically speaking") of the "main" button.
> >
> > (4) hidraw7_inRange_contact_BOTHbarrelAnderasePress_move_\
> > BOTHbarrelAnderaseRelease_lift_outOfRange
> > That's just plain stupid, and uncomfortable to do, but it's just to
> > show an example of the capability of the hardware ;
> > In this one, I'm doing the same than above, except I stupidly press BOTH
> > buttons.
> > It means that I "contact" the main tip, press both barrel+erase, move
> > the pen, release both button, lift it out of range.
> >
> > (5) hidraw7_inRange_contact_backPress_move_backRelease_lift_outOfRange
> > Back to non-stupid tests, here I am using the "rubber" (which has
> > pressure !), i.e. I use the back of the pen.
> > I contact it, press the rubber to have some pressure, move it, release
> > the pressure, move the pen ouf of contact and out of range.
> >
> > Reading those traces, I think I observed some (to me) very logical
> > behavior ;
> >
> > I agree that the Pen is possibly not acting in respect of the
> > specification, by the fact that... the spec does not differentiate the
> > "eraser" 2nd button, versus the "backside" rubber pressure tip.
> >
> > The traces shows that :
> > - In range [0 - 1] is correctly reported, both for main tip + rubber tip
> > - Tip Pressure [0 - n] is correctly reported, for both pressure tips
> 
> Yep, that part is correct and follows the specification
> 
> >
> > - Tip Switch [0 - 1] is correctly set to ONE for all traces, when the
> >   in-range tip goes to contact. (either main tip or rubber tip)
> 
> This is half wrong (spec-wise):
> - tip switch should only be used when the actual tip is in contact.
> - when using the rubber tip, we should get an eraser event :(
> 
> >
> > - Barrel Switch [0 - 1] is correctly set to ONE only when pressing
> >   button down, and of course only when using the main tip
> 
> This is correct (as in it follows the spec)
> 
> >
> > - Invert [0 - 1] is set to ONE when (and only) using the back rubber
> >   tip, and the ERASE button (2nd button) does NOT set it, so "INVERT"
> 
> In your case, the invert usage is correct.
> In Illia's case, the invert usage is forwarded by the eraser usage, so
> this is just plain wrong there.
> 
> >
> > - Eraser [0 - 1] is set to ONE ONLY when pressing the 2nd top button,
> >   and of :
> >   - ONLY when using the main itp
> >   - and if you were to instead use the "back" of the pen (rubber tip),
> >     then you will have invert=1 + eraser=0
> 
> This is not correct (again, according to the specification). XP-Pen
> should report SecondaryBarrelSwitch (0x5a in the HID usage table[0])
> And again, in Illia's case, this button should be reported as an
> invert, and eraser when the tip touches the tablet.
> 
> >
> > The main extract of those is, I think, that :
> > - eraser "top" button is completely independent of the back "rubber"
> 
> Yes
> 
> > - eraser "top" button NEVER concerns itself to set invert=1
> 
> yes
> 
> > - backside "rubber" pressure tip will set invert=1, but leave eraser=0
> 
> yes, but that's not correct, it should report eraser=1 when you touch
> the rubber on the surface.
> 
> >
> > So, the behavior probably breaks the specs, but sincerely I'm happy to
> > have the "eraser" button independent of the "rubber eraser", which
> > makes the stylus a somewhat 4-buttons stylus (tip, button1, button2,
> > rubber), and I would like to keep this.
> 
> Yes, and I'd like to keep it that way, even if 6.6 and 6.5.8
> apparently broke it.
> 
> So, to me:
> - 276e14e6c3993317257e1787e93b7166fbc30905 is wrong: this is a
> firmware bug (reporting invert through eraser) and should not be
> tackled at the generic level, thus it should be reverted
> - both of these tablets are forwarding the useful information, but not
> correctly, which confuses the kernel
> - I should now be able to write regression tests
> - I should be able to provide HID-BPF fixes for those tablets so that
> we can keep them working with or without
> 276e14e6c3993317257e1787e93b7166fbc30905
> reverted (hopefully)
> - problem is I still don't have the mechanics to integrate the HID-BPF
> fixes directly in the kernel tree, so maybe I'll have to write a
> driver for XP-Pen while these internals are set (it shouldn't
> interfere with the HID-BPF out of the tree).

I already added support for a few XP-Pen devices on the UCLogic driver
and I was planning to start working on this one during the weekend in
my DIGImend fork (to simplify testing).

Let me know if you prefer to add it yourself or if you want me to ping
you in the DIGImend discussion.

José Expósito

> 
> Cheers,
> Benjamin
> 
> >
> > Best Regards,
> >
> > [1] https://www.xp-pen.fr/download-1027.html ; the .deb Qt app
> >
> > --
> > Eric GOUYER
> >
> 
> [0] https://usb.org/document-library/hid-usage-tables-14
> 
