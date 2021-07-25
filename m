Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65FB3D4B25
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhGYCrB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYCrA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:00 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB3BC061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:28 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id hu11so3408355qvb.7
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MbRPdVIiaPWllF3jZFfo5YQk3ynPkPx13BUx1ie6Iuc=;
        b=Fpl0aVe2C6+pmhHU60zDJ07sGEdBAkf72XnDCEWW56n/YAaNiXEAPZtQu/Z/NBq0b7
         8R/ICDnEz8Iz70MHOsqK/FVC0+DMps2Z+hMxbatTUdjNeYV7yHUshzoddTOISZtaRd+A
         S6wkQf8G07TL7btqy82CB2/1q8Z3mukCjlQm6XcaD2lubvPCkamVdK8gRAntAWhjLbx/
         NPTiFrb15iDFR/J6QZVWhmoIdzjpmuuYPw9qIIHvcnvS4Xz7wFk/CG/DvSCSR9ZqaUyQ
         0KYYKj471HOck8T8/t2R6H0j3dcywhKguAfR3K0l8q6Uoysyx7aTB+Ps9sEYmx9bCrv4
         p9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MbRPdVIiaPWllF3jZFfo5YQk3ynPkPx13BUx1ie6Iuc=;
        b=Zqc1yogd4UaCv11tSpjeN/bdEnYXqfoSI5D5wERXVBrn4dkJUMg3NPk6RIgxSBdIP6
         MeFdPkPrHVW4IGhuB/PPbid+bTop6LWS63ANlul65QQiwv4SV4G23E7NzMQ0I9/4LZi5
         Z7wIsydrKNMtxGtTbPKEjIJJThGxb7a8o5546+c8XDEucsCMw7CeVtCZrcT2Il/awPLR
         Y8GwAwNWXaubjJXVrNNgU3HaQjdZ/RYZGuu68o4etNC1z2BI/5fW7DEAfLukyP8zhX6V
         qFWDbKGBBTaUusgnL83RRuuBYn4eCu8CXT5Uam2r7uOYDdDbkfejGLx6gxiINqJy9kNG
         ewPQ==
X-Gm-Message-State: AOAM533MBqraITD1oknPMcrZ3HezjN/roYiJSlkSri8dGR264X4YVI40
        9BRT/Et5+p7wq014mwK1FhCfmweVHM4dwQ==
X-Google-Smtp-Source: ABdhPJxYrfFApyhQJH9Joy5XXiPq5EZCnRA5gsZTEDvLEADhGeVxmm1hKHLt5sOfRG7SNxhWyJKE/w==
X-Received: by 2002:a0c:aa42:: with SMTP id e2mr12270940qvb.23.1627183646985;
        Sat, 24 Jul 2021 20:27:26 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:26 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 00/17] HID: nintendo
Date:   Sat, 24 Jul 2021 23:26:50 -0400
Message-Id: <20210725032707.440071-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've updated the driver to use the "player" string introduced in
Roderick's pending patch. I'll update the series again if that pending
patch is altered or a different approach is decided on.

Some stability improvements are included as well.

Version 14 changes:
  - Use proper LED classdev name scheme
  - Prevent situations where a missed zero amplitude rumble packet would
    leave the controller stuck vibrating until a timeout
  - Introduce a max rate at which subcommands or rumble packets can be
    sent to the controller. This reduces bluetooth disconnects.
  - Send rumble packets immediately after receiving input reports. This
    reduces bluetooth disconnects (similar technique was already used
    for subcommands).

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

Daniel J. Ogorchock (17):
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
  HID: nintendo: add IMU support
  HID: nintendo: improve rumble performance and stability
  HID: nintendo: ratelimit subcommands and rumble
  HID: nintendo: send rumble cmds post input reports
  HID: nintendo: prevent needless queueing of the rumble worker

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    4 +
 drivers/hid/hid-nintendo.c | 2319 ++++++++++++++++++++++++++++++++++++
 drivers/input/joydev.c     |   10 +
 6 files changed, 2364 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.32.0

