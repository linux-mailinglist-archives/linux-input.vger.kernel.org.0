Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5715C405FB9
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 00:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236000AbhIIWvq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 18:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhIIWvq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Sep 2021 18:51:46 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A236C061574
        for <linux-input@vger.kernel.org>; Thu,  9 Sep 2021 15:50:36 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id me10so179841ejb.11
        for <linux-input@vger.kernel.org>; Thu, 09 Sep 2021 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+A3i7sosvuTPex7xzvvC4hnyktrBGU2S5CkYO293STA=;
        b=SXgSm9dYwILg6TL2R/9laGysD9xIGx1zYE9CuixSVBnT17tyd+EBl+tqcfV/Xq3Seu
         DCld3hwaPG7DxMRKMyIhFqA1O4gLLy983f8Erl1u64IZLL109FwYEdSTNxM6mJITsXDn
         +M2PkDK8PdHkPnScwNOqr1lW5Wxcior66sTQJ9StDJboJpQ84Ay8k83aPUS9AT0V+9Ox
         Gim8Oz9oPoIL7SBCpwGuFocVmVWHRjRFM9gPvN7WG/5RMlQJ2D7B+IkYOLaCtMaVRJ+o
         XU+skBy/fe6/x8vHa/q+pS/7txKJV3wV3yNAXBR8tcGwIP52XVpGiPOIbqULa2HPJAVY
         GPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+A3i7sosvuTPex7xzvvC4hnyktrBGU2S5CkYO293STA=;
        b=Frmwm6v+CO0gSjrw22dX7L/EoyjDyoJRzxTOR6duV3KYcAesbfNUgR3mYLCTg+IoCc
         SsBvy3PIfNih5Ct3Pk+8VJAS0/y48vFKFr+/nSBx6lYlCdiWOJYjw774qtPjpsbxfH9+
         Ayrd9aavS/3wAluPmW3D6oGhYkHoIGy1CBDjYV9K8kFdcTgTkVDCXcje4tYbyUfT6v3j
         NM/Tr+KTatZ3waLn+9wEyGFhjSvTsEFnz4qMods26CqYivzbRsH+x3fPIF3rCOYCN6I6
         7i/noloqlJiMaiJSmf9AlhThcvE/fOzFhJ1mSNS1+UMtUq3pWZFyEc914+bdbySq9uBs
         znSQ==
X-Gm-Message-State: AOAM5313UQxgymbSayuhS2SnCMh0l0Yhptx+Fv8oQoB4vZexzMxfDSCq
        NT3iiXteufNQ7jXaONrk7joPdOAW+wDpfxTFyrNPxA==
X-Google-Smtp-Source: ABdhPJyrLfxvlpiA8wP8DdtZrHi2WRmfLVcH1DZ94qzbC5D2Oj/Xmx7KBUqKA66DX0hb3FLTVcdXBgVJb060BWsjtKU=
X-Received: by 2002:a17:907:75d0:: with SMTP id jl16mr5907487ejc.166.1631227834266;
 Thu, 09 Sep 2021 15:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210725032707.440071-1-djogorchock@gmail.com> <YToD0wVxxwukjpXC@google.com>
In-Reply-To: <YToD0wVxxwukjpXC@google.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Thu, 9 Sep 2021 15:50:22 -0700
Message-ID: <CAKF84v3zLutuuThOXgbJp7m5EAxoKQ151TC2yFP_P4=64td-sg@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] HID: nintendo
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If some of the patch aspects are controversial (for example, LED's),
would it be possible to merge this series partially?
For example, add basic support for buttons and keys, while leaving
LEDs / rumble / etc in the review queue?

Also, is it possible to combine some of these patches? For example,
maybe patches 6, 7, 8 can be combined with patch 1? This would make it
easier to merge into Android kernels.


On Thu, Sep 9, 2021 at 5:53 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Sat, 24 Jul 2021, Daniel J. Ogorchock wrote:
>
> > I've updated the driver to use the "player" string introduced in
> > Roderick's pending patch. I'll update the series again if that pending
> > patch is altered or a different approach is decided on.
> >
> > Some stability improvements are included as well.
> >
> > Version 14 changes:
> >   - Use proper LED classdev name scheme
> >   - Prevent situations where a missed zero amplitude rumble packet woul=
d
> >     leave the controller stuck vibrating until a timeout
> >   - Introduce a max rate at which subcommands or rumble packets can be
> >     sent to the controller. This reduces bluetooth disconnects.
> >   - Send rumble packets immediately after receiving input reports. This
> >     reduces bluetooth disconnects (similar technique was already used
> >     for subcommands).
> >
> > Version 13 changes:
> >   - Switched to using the dedicated rumble data message type, rather
> >     than constantly resending the rumble enabled subcommand. This more
> >     closely resembles how the console itself handles rumble data.
> >   - Applied revisions based on Silvan Jegen's feedback on v12.
> >
> > Version 12 changes:
> >   - Added support for reading user calibration from the controller's
> >     SPI flash (written when someone calibrates the controller on the
> >     Nintendo switch).
> >   - Added patch to prevent sending rumble subcommands when no effect
> >     is being played. This turned out to drastically improve bluetooth
> >     connection reliability.
> >   - Set the battery description to POWER_SUPPLY_TYPE_BATTERY (was
> >     missing in previous revisions due to oversight). This fixes problem=
s
> >     with desktop environments not handling the controller batteries
> >     properly.
> >   - Reintroduced IMU patch with improvements to documentation, packet
> >     drop handling, and increased precision for gyro readings. Also
> >     now blacklists the IMU input dev from joydev like hid-sony.
> >
> > Version 11 changes:
> >   - Removed IMU patch for now, since it has some issues to work out.
> >   - Fixed bug introduced in v10 which led to the joy-cons' S-triggers
> >     not being configured as an input.
> >   - Changed the pro controller's d-pad input from buttons to a hat to b=
e
> >     more in line with other controller drivers.
> >
> > Version 10 changes:
> >   - Removed duplicate reporting of one of the triggers that Billy notic=
ed
> >   - The joy-cons now only report having the buttons they actually have
> >     (they used to register the input devices with the buttons of the
> >     other joy-con as well).
> >   - The input device is now created after the LEDs/power supply.
> >   - The removed state handling bool has been removed, instead opting to
> >     add a new controller state (removed).
> >   - Eliminated a 1 second delay when probing a USB controller.
> >   - Added support for the IMU. This mostly consisted of merging in some
> >     work provided by Carl. I'm not incredibly familiar with proper
> >     gyro/accelerometer handling in linux, so this might need some
> >     tweaking. Preliminary tests in evtest show the gyro/accel values
> >     being reported.
> >   - Added support for the joy-con USB charging grip.
> >
> > Version 9 changes:
> >   - Fixed compiler errors on gcc versions older than 8.2
> >   - Set input device's uniq value to the controller's MAC address
> >
> > Version 8 changes:
> >   - Corrected the handshaking protocol with USB pro controllers. A
> >     handshake now occurs both prior and after the baudrate set. This
> >     doesn't appear to have a noticeable difference, but it more
> >     accurately follows documentation found online.
> >   - Fixed potential race condition which could lead to a slightly longe=
r
> >     delay sending subcommands in rare circumstances.
> >   - Moved the rumble worker to its own workqueue, since it can block.
> >     This prevents it from having a negative impact on the default kerne=
l
> >     workqueue. It also prevents dropped subcommands due to something
> >     else blocking the kernel workqueue. The benefit is most obvious whe=
n
> >     using multiple controllers at once, since the controller subcommand
> >     timings are very picky.
> >   - Added a patch to set the most significant bit of the hid hw version=
.
> >     Roderick had mentioned needing to probably do this awhile ago, but =
I
> >     had forgotten about it until now. This is the same thing hid-sony
> >     does. It allows SDL2 to have different mappings for the hid-nintend=
o
> >     driver vs the default hid mappings.
> >
> > Version 7 changes:
> >   - Changed name to hid-nintendo to fit modern naming conventions
> >   - Removed joycon_ctlr_destroy(), since it wasn't needed an could
> >     potentially invalidate a mutex while it could be in use on other
> >     threads
> >   - Implemented minor code improvements suggested by Silvan
> >   - The driver now waits to send subcommands until after receiving an
> >     input report. This significantly reduces dropped subcommands.
> >   - Reduced the number of error messages when disconnecting a
> >     controller.
> >
> > Version 6 changes:
> >   - Improved subcommand sending reliabilty
> >   - Decreased rumble period to 50ms
> >   - Added rumble queue to avoid missing ff_effects if sent too quickly
> >   - Code cleanup and minor refactoring
> >   - Added default analog stick calibration
> >
> > Version 5 changes:
> >   - Removed sysfs interface to control motor frequencies.
> >   - Improved rumble reliability by using subcommands to set it.
> >   - Changed mapping of the SL/SR triggers on the joy-cons to map to
> >     whichever triggers they lack (e.g. a left joycon's sl/sr map to
> >     TR and TR2). This allows userspace to distinguish between the
> >     normal and S triggers.
> >   - Minor refactors
> >
> > Version 4 changes:
> >   - Added support for the Home button LED for the pro controller and
> >     right joy-con
> >   - Changed name from hid-switchcon to hid-joycon
> >   - Added rumble support
> >   - Removed ctlr->type and use hdev->product instead
> >   - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translatin=
g
> >     to capacity percentages
> >   - Misc. minor refactors based on v3 feedback
> >
> > Version 3 changes:
> >   - Added led_classdev support for the 4 player LEDs
> >   - Added power_supply support for the controller's battery
> >   - Made the controller number mutex static
> >   - Minor refactoring/style fixes based on Roderick's feedback from v2
> >
> > Version 2 changes:
> >   - Switched to using a synchronous method for configuring the
> >         controller.
> >   - Removed any pairing/orientation logic in the driver. Every
> >     controller now corresponds to its own input device.
> >   - Store controller button data as a single u32.
> >   - Style corrections
> >
> > Daniel J. Ogorchock (17):
> >   HID: nintendo: add nintendo switch controller driver
> >   HID: nintendo: add player led support
> >   HID: nintendo: add power supply support
> >   HID: nintendo: add home led support
> >   HID: nintendo: add rumble support
> >   HID: nintendo: improve subcommand reliability
> >   HID: nintendo: send subcommands after receiving input report
> >   HID: nintendo: reduce device removal subcommand errors
> >   HID: nintendo: patch hw version for userspace HID mappings
> >   HID: nintendo: set controller uniq to MAC
> >   HID: nintendo: add support for charging grip
> >   HID: nintendo: add support for reading user calibration
> >   HID: nintendo: add IMU support
> >   HID: nintendo: improve rumble performance and stability
> >   HID: nintendo: ratelimit subcommands and rumble
> >   HID: nintendo: send rumble cmds post input reports
> >   HID: nintendo: prevent needless queueing of the rumble worker
> >
> >  MAINTAINERS                |    6 +
> >  drivers/hid/Kconfig        |   24 +
> >  drivers/hid/Makefile       |    1 +
> >  drivers/hid/hid-ids.h      |    4 +
> >  drivers/hid/hid-nintendo.c | 2319 ++++++++++++++++++++++++++++++++++++
> >  drivers/input/joydev.c     |   10 +
> >  6 files changed, 2364 insertions(+)
> >  create mode 100644 drivers/hid/hid-nintendo.c
>
> v14 already. :)
>
> Is this the latest version?
>
> Have there been any review comments?
>
> What are the current plans please?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
