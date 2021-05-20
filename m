Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3182F38B99C
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhETWsx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhETWsw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:52 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2CBC061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:29 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id i67so17947820qkc.4
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MX0IXxSS5mrkW+wpTWlrjFOJWf6OIBDWRQ3Itl7WS8=;
        b=tqwC3abDEtNuP50IlD3qLsW/A3U5y2gcqUkzSxzM/rmZ7c24/w41YCXfr4JcIe1g6n
         bqZsoRVzKIje5Q/RW6F6Ls39fNZ6C/W44MMYQUGSp2+mjE8HZdkSQJLDcVVvY1/z96CD
         JNIgcY0w41FTjMDZ841Ic24jOKsBVTmwWNS7tfUw1U053vWj3ncxUgTQqwFiA2XB9cJ0
         grcNStghLQtKhYeLy3GZ525M674jykYIRC5rRQRhDaCauE9wjqGWc4PzaaKIl0z97VVJ
         bPCoKmGmHLTtHD2zGPwa7E8iPnWBkH6C4NengpX+bOaaKMPACb0D/uOTg9u+qrGzhOHm
         AmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MX0IXxSS5mrkW+wpTWlrjFOJWf6OIBDWRQ3Itl7WS8=;
        b=k/W6bY2TCg/4qZ9XwRUBpQbYRmO3is1mJ43WbSHifEKUMRLHusmIn/TK9qsvlsQPm8
         edRlSDQ5ShlS0NeLpgIa82CQqHxCakFW9rEFWKdmE5okBmBPxct7sfiuDR4Yq3jpJ9ly
         HDa1jVgddnLHAiifqQX7v1Ita9HVXUr7wcLcBL50f8Gfx6QDVliWmU4wBXWv7I+vfkvc
         KiFlgHB9zpbqqVQoo1xlVYkK2lVR5pX+Uk/mBKCYoNqfH/LikeIbbGbUh+LMEIUw2Pqd
         8xWm+hzpn2/5Qkux4bLfDB4uvJkPZ/7yROGeCQkgFKbcXmKSt1RkLK1fIFu56AR/gwD4
         W6FQ==
X-Gm-Message-State: AOAM532XDeQq8srU3wVmEhVTTFLlOrLFROewMB7blFOCIvhExYlzvNrw
        P1h+UU3MNc2SFEhWGzmBzGLWFCItD18=
X-Google-Smtp-Source: ABdhPJwm7rZqKNmnhOebDeh2Dlp3vy17W5sGEP2qGYDfZSB9pGXx/ShB/Wb4KAO54JqnKYQMnthx9w==
X-Received: by 2002:ae9:edc9:: with SMTP id c192mr7690464qkg.312.1621550847998;
        Thu, 20 May 2021 15:47:27 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:27 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 00/15] HID: nintendo
Date:   Thu, 20 May 2021 18:47:00 -0400
Message-Id: <20210520224715.680919-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've neglected updating this for awhile. Not much has changed in this
revision. It has a couple bug fixes caught in the prior rev in addition
to altering how rumble is handled

Version 13 changes:
  - Switched to using the dedicated rumble data message type, rather
    than constantly resending the rumble enabled subcommand. This more
    closely resembles how the console itself handles rumble data.
  - Applied revisions based on Silvan Jegen's feedback on v12.

Version 12 changes:
  - Added support for reading user calibration from the controller's
    SPI flash (written when someone calibrates the controller on the
    Nintendo switch).
  - Added patch to prevent sending rumble subcommands when no effect
    is being played. This turned out to drastically improve bluetooth
    connection reliability.
  - Set the battery description to POWER_SUPPLY_TYPE_BATTERY (was
    missing in previous revisions due to oversight). This fixes problems
    with desktop environments not handling the controller batteries
    properly.
  - Reintroduced IMU patch with improvements to documentation, packet
    drop handling, and increased precision for gyro readings. Also
    now blacklists the IMU input dev from joydev like hid-sony.

Version 11 changes:
  - Removed IMU patch for now, since it has some issues to work out.
  - Fixed bug introduced in v10 which led to the joy-cons' S-triggers
    not being configured as an input.
  - Changed the pro controller's d-pad input from buttons to a hat to be
    more in line with other controller drivers.

Version 10 changes:
  - Removed duplicate reporting of one of the triggers that Billy noticed
  - The joy-cons now only report having the buttons they actually have
    (they used to register the input devices with the buttons of the
    other joy-con as well).
  - The input device is now created after the LEDs/power supply.
  - The removed state handling bool has been removed, instead opting to
    add a new controller state (removed).
  - Eliminated a 1 second delay when probing a USB controller.
  - Added support for the IMU. This mostly consisted of merging in some
    work provided by Carl. I'm not incredibly familiar with proper
    gyro/accelerometer handling in linux, so this might need some
    tweaking. Preliminary tests in evtest show the gyro/accel values
    being reported.
  - Added support for the joy-con USB charging grip.

Version 9 changes:
  - Fixed compiler errors on gcc versions older than 8.2
  - Set input device's uniq value to the controller's MAC address

Version 8 changes:
  - Corrected the handshaking protocol with USB pro controllers. A
    handshake now occurs both prior and after the baudrate set. This
    doesn't appear to have a noticeable difference, but it more
    accurately follows documentation found online.
  - Fixed potential race condition which could lead to a slightly longer
    delay sending subcommands in rare circumstances.
  - Moved the rumble worker to its own workqueue, since it can block.
    This prevents it from having a negative impact on the default kernel
    workqueue. It also prevents dropped subcommands due to something
    else blocking the kernel workqueue. The benefit is most obvious when
    using multiple controllers at once, since the controller subcommand
    timings are very picky.
  - Added a patch to set the most significant bit of the hid hw version.
    Roderick had mentioned needing to probably do this awhile ago, but I
    had forgotten about it until now. This is the same thing hid-sony
    does. It allows SDL2 to have different mappings for the hid-nintendo
    driver vs the default hid mappings.

Version 7 changes:
  - Changed name to hid-nintendo to fit modern naming conventions
  - Removed joycon_ctlr_destroy(), since it wasn't needed an could
    potentially invalidate a mutex while it could be in use on other
    threads
  - Implemented minor code improvements suggested by Silvan
  - The driver now waits to send subcommands until after receiving an
    input report. This significantly reduces dropped subcommands.
  - Reduced the number of error messages when disconnecting a
    controller.

Version 6 changes:
  - Improved subcommand sending reliabilty
  - Decreased rumble period to 50ms
  - Added rumble queue to avoid missing ff_effects if sent too quickly
  - Code cleanup and minor refactoring
  - Added default analog stick calibration

Version 5 changes:
  - Removed sysfs interface to control motor frequencies.
  - Improved rumble reliability by using subcommands to set it.
  - Changed mapping of the SL/SR triggers on the joy-cons to map to
    whichever triggers they lack (e.g. a left joycon's sl/sr map to
    TR and TR2). This allows userspace to distinguish between the
    normal and S triggers.
  - Minor refactors

Version 4 changes:
  - Added support for the Home button LED for the pro controller and
    right joy-con
  - Changed name from hid-switchcon to hid-joycon
  - Added rumble support
  - Removed ctlr->type and use hdev->product instead
  - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translating
    to capacity percentages
  - Misc. minor refactors based on v3 feedback

Version 3 changes:
  - Added led_classdev support for the 4 player LEDs
  - Added power_supply support for the controller's battery
  - Made the controller number mutex static
  - Minor refactoring/style fixes based on Roderick's feedback from v2

Version 2 changes:
  - Switched to using a synchronous method for configuring the
        controller.
  - Removed any pairing/orientation logic in the driver. Every
    controller now corresponds to its own input device.
  - Store controller button data as a single u32.
  - Style corrections

Daniel J. Ogorchock (15):
  HID: nintendo: add nintendo switch controller driver
  HID: nintendo: add player led support
  HID: nintendo: add power supply support
  HID: nintendo: add home led support
  HID: nintendo: add rumble support
  HID: nintendo: improve subcommand reliability
  HID: nintendo: send subcommands after receiving input report
  HID: nintendo: reduce device removal subcommand errors
  HID: nintendo: patch hw version for userspace HID mappings
  HID: nintendo: set controller uniq to MAC
  HID: nintendo: add support for charging grip
  HID: nintendo: add support for reading user calibration
  HID: nintendo: prevent needless queueing of the rumble worker
  HID: nintendo: add IMU support
  HID: nintendo: improve rumble performance and stability

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    4 +
 drivers/hid/hid-nintendo.c | 2274 ++++++++++++++++++++++++++++++++++++
 drivers/input/joydev.c     |   10 +
 6 files changed, 2319 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.31.1

