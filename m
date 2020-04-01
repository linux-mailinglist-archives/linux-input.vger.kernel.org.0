Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E7719B097
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 18:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388069AbgDAQ17 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 12:27:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40936 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388066AbgDAQ17 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 12:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585758478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lg9e2qJTTzET6IEtX8msBPcXjFTCne/hJvG6UO93hqM=;
        b=Duv+h2HEO93g28zeN2JVkpjJsoTJCk2Cl9Q/LDR/Qfmzp4cYo8hXwQcr6V1UqolZqlGr5Q
        4ajP/GoQTW5oQ01sd0CWhygNynNass99gc+nF9t771f0hjnnVjCxd3HrgJoLD9hmxWW26h
        9xXepoYeCafmyRR1plTj0bWpfuTaA9U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-qgPSW8IZMfWvkGbg-9vl4w-1; Wed, 01 Apr 2020 12:27:57 -0400
X-MC-Unique: qgPSW8IZMfWvkGbg-9vl4w-1
Received: by mail-qv1-f71.google.com with SMTP id o13so17138qvn.15
        for <linux-input@vger.kernel.org>; Wed, 01 Apr 2020 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lg9e2qJTTzET6IEtX8msBPcXjFTCne/hJvG6UO93hqM=;
        b=NtRhM36NLETsw9U+8BW2JoIIp6c4MhIQvDAMcsduego+1zV8HWvR1OKwB5yyxM0IAz
         SD5DAHuKZkw55Wd/JIFt72DJJ5NvdC/wQa7s0BR5dAFSy/5yJ7pyeWiN2z9cs1ftqPxe
         da4AnTbN0ismErVZd0AbxYsmEjwXyrvOEn9D2U2m/B5jeThOp5J/hF/OE3H1uWmnSxi2
         4/kjkR0CJuV4PPtb4Vez3hDAPgUc1sEAj9cmqB/gvxRkSxznDrgrwAW7BJNyQQUa66p5
         3fEViYJIciIu8qhBG075CN+wqEGBrWT2vdlFaCcQ6Brw6hb7z4XVfm1024VRmCxYnPeG
         J2lw==
X-Gm-Message-State: ANhLgQ2f2UVtR1ZqZeTTV/rM+ekmYBbqmLyFeqs3SbaJeKDeeRIVpDxp
        /23UgXhc7Tad6JIWINaBgG037GaO1yMe3woNmTZa3BfHRDk2JhFfIQXhiBgTOCKzmvpqM67Li++
        vlqBqbjEaRYicHA4qGN9Gpf4r1XIBoGoecC95wAk=
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr11178488qke.169.1585758476681;
        Wed, 01 Apr 2020 09:27:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuRu24IMaJDqhKJ2k0FRnxMvnMPpA2ypYjNCu9jE+2P18LexUOk44ORHM1Lecl5+SaaCs+P/pAISS56jUU/vMo=
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr11178454qke.169.1585758476340;
 Wed, 01 Apr 2020 09:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com>
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 1 Apr 2020 18:27:44 +0200
Message-ID: <CAO-hwJJ1OEkgOBeKQh7XUsqm91ydZt+AjgyYU9XGL3cfom24KA@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        carmueller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

On Tue, Mar 17, 2020 at 4:30 AM Daniel J. Ogorchock
<djogorchock@gmail.com> wrote:
>
> I removed the IMU patch for now, since I have some more work on it to do
> before it's ready. This version fixes a bug with joy-con S-trigger
> configuration and switches the pro controller's Dpad input to a hat.

Thanks a lot for the continuous effort. I just had a quick look
through the series, and nothing came up problematic. I have requested
a few tests from people I know, and I'll be happy to merge this for
v5.8. Unless Jiri says that 5.7 is OK, but I doubt Linus will be happy
getting a new driver now that hasn't spent a little time in
linux-next.

Cheers,
Benjamin

>
> Version 11 changes:
>   - Removed IMU patch for now, since it has some issues to work out.
>   - Fixed bug introduced in v10 which led to the joy-cons' S-triggers
>     not being configured as an input.
>   - Changed the pro controller's d-pad input from buttons to a hat to be
>     more in line with other controller drivers.
>
> Version 10 changes:
>   - Removed duplicate reporting of one of the triggers that Billy noticed
>   - The joy-cons now only report having the buttons they actually have
>     (they used to register the input devices with the buttons of the
>     other joy-con as well).
>   - The input device is now created after the LEDs/power supply.
>   - The removed state handling bool has been removed, instead opting to
>     add a new controller state (removed).
>   - Eliminated a 1 second delay when probing a USB controller.
>   - Added support for the IMU. This mostly consisted of merging in some
>     work provided by Carl. I'm not incredibly familiar with proper
>     gyro/accelerometer handling in linux, so this might need some
>     tweaking. Preliminary tests in evtest show the gyro/accel values
>     being reported.
>   - Added support for the joy-con USB charging grip.
>
> Version 9 changes:
>   - Fixed compiler errors on gcc versions older than 8.2
>   - Set input device's uniq value to the controller's MAC address
>
> Version 8 changes:
>   - Corrected the handshaking protocol with USB pro controllers. A
>     handshake now occurs both prior and after the baudrate set. This
>     doesn't appear to have a noticeable difference, but it more
>     accurately follows documentation found online.
>   - Fixed potential race condition which could lead to a slightly longer
>     delay sending subcommands in rare circumstances.
>   - Moved the rumble worker to its own workqueue, since it can block.
>     This prevents it from having a negative impact on the default kernel
>     workqueue. It also prevents dropped subcommands due to something
>     else blocking the kernel workqueue. The benefit is most obvious when
>     using multiple controllers at once, since the controller subcommand
>     timings are very picky.
>   - Added a patch to set the most significant bit of the hid hw version.
>     Roderick had mentioned needing to probably do this awhile ago, but I
>     had forgotten about it until now. This is the same thing hid-sony
>     does. It allows SDL2 to have different mappings for the hid-nintendo
>     driver vs the default hid mappings.
>
> Version 7 changes:
>   - Changed name to hid-nintendo to fit modern naming conventions
>   - Removed joycon_ctlr_destroy(), since it wasn't needed an could
>     potentially invalidate a mutex while it could be in use on other
>     threads
>   - Implemented minor code improvements suggested by Silvan
>   - The driver now waits to send subcommands until after receiving an
>     input report. This significantly reduces dropped subcommands.
>   - Reduced the number of error messages when disconnecting a
>     controller.
>
> Version 6 changes:
>   - Improved subcommand sending reliabilty
>   - Decreased rumble period to 50ms
>   - Added rumble queue to avoid missing ff_effects if sent too quickly
>   - Code cleanup and minor refactoring
>   - Added default analog stick calibration
>
> Version 5 changes:
>   - Removed sysfs interface to control motor frequencies.
>   - Improved rumble reliability by using subcommands to set it.
>   - Changed mapping of the SL/SR triggers on the joy-cons to map to
>     whichever triggers they lack (e.g. a left joycon's sl/sr map to
>     TR and TR2). This allows userspace to distinguish between the
>     normal and S triggers.
>   - Minor refactors
>
> Version 4 changes:
>   - Added support for the Home button LED for the pro controller and
>     right joy-con
>   - Changed name from hid-switchcon to hid-joycon
>   - Added rumble support
>   - Removed ctlr->type and use hdev->product instead
>   - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translating
>     to capacity percentages
>   - Misc. minor refactors based on v3 feedback
>
> Version 3 changes:
>   - Added led_classdev support for the 4 player LEDs
>   - Added power_supply support for the controller's battery
>   - Made the controller number mutex static
>   - Minor refactoring/style fixes based on Roderick's feedback from v2
>
> Version 2 changes:
>   - Switched to using a synchronous method for configuring the
>         controller.
>   - Removed any pairing/orientation logic in the driver. Every
>     controller now corresponds to its own input device.
>   - Store controller button data as a single u32.
>   - Style corrections
>
> Daniel J. Ogorchock (11):
>   HID: nintendo: add nintendo switch controller driver
>   HID: nintendo: add player led support
>   HID: nintendo: add power supply support
>   HID: nintendo: add home led support
>   HID: nintendo: add rumble support
>   HID: nintendo: improve subcommand reliability
>   HID: nintendo: send subcommands after receiving input report
>   HID: nintendo: reduce device removal subcommand errors
>   HID: nintendo: patch hw version for userspace HID mappings
>   HID: nintendo: set controller uniq to MAC
>   HID: nintendo: add support for charging grip
>
>  MAINTAINERS                |    6 +
>  drivers/hid/Kconfig        |   24 +
>  drivers/hid/Makefile       |    1 +
>  drivers/hid/hid-ids.h      |    4 +
>  drivers/hid/hid-nintendo.c | 1665 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 1700 insertions(+)
>  create mode 100644 drivers/hid/hid-nintendo.c
>
> --
> 2.25.1
>

