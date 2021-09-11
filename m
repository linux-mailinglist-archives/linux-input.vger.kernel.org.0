Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1819D4079ED
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbhIKRiJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhIKRiF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:05 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DD8C061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:36:52 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so5807567qki.3
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Inu1qY7UoIHAEaKFyHB0zc76cL57siS32+Gi70l7iuU=;
        b=SKXx3m5svvTDybdbhJNDEiK2zdKcmkuCss/7HIlLQ8LtLd07T/zdgCJmNnUO21CNal
         vzzxP+R+RY0vBZHGT3cRBSAGeQvQdALUdkKbI5HS9MR6GDkp2IR4uLaz+0pil5aXkb0d
         3IYrA7PZ0ZXskt1F2IgUaY8yodX4fRW1RQ/rS7qaxKqCbQAnEQLDqLW9UmhnolusPMBb
         YcrG0IXKCNcUSMkGhBgOFOIBfbl8k8PE4oUnnf7h9PpzBp9VDXnwatcNhX+P+YPfQ29e
         B/uv7txg9k4IFhGuN81hl4BMN+gYJoCvbLTgD2TRtCE3wFbt6wUBBvUkcNLIh6CIq5lb
         2W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Inu1qY7UoIHAEaKFyHB0zc76cL57siS32+Gi70l7iuU=;
        b=05sC9aNZjpikL++Rk5VFmax9aGP08kNxn2+7V5iEtA/h4yvDjQ1aIbmfmu5viNMn7f
         4ALWt1C6E5Qc+P9dSuwz1V/hhmplr+p7oPl3U+r6Vk2AbyuD0V2PDpBHYhTv7gZXQXUS
         SnStxtOESNTvfz4J6NNgwakXozjFCCtzWJ4EPKrIjneXU92ZA9QlWx0x99sC0TreeMYE
         gwIh5B3dT9dn+P91DCy62z5dOE9wxObg4Ol1x+XDDK6ZeqmqCOL4mjBbgKj6E9U+6Q2p
         hM6r0gsYQNG++LFPlsmq19q9iALa2D6YYGUMF/yXiDLstrK5lgWJbcmVQA9wkwCUfgt3
         7Vxw==
X-Gm-Message-State: AOAM533va6q3y77zUkcwVLOPBPfHpuaY4pGQbkVk1BmBQs8Ao1UkPBYI
        dMEqjm1wF28sRT5+nCGKBaTEVPxeSC+zXQ==
X-Google-Smtp-Source: ABdhPJyK+Vo5OxnPthzB5ibjp7rG0KzZUaPKGekRWAuqOvssEBy5fG8/jm8wpADC4gFB2StSUOUYgw==
X-Received: by 2002:a37:7801:: with SMTP id t1mr2973564qkc.162.1631381811279;
        Sat, 11 Sep 2021 10:36:51 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:36:50 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 00/16] HID: nintendo
Date:   Sat, 11 Sep 2021 13:36:23 -0400
Message-Id: <20210911173639.5688-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rebased onto Linus' tree (sha 926de8c4326c14fcf35f1de142019043597a4fac)
Depends on Roderick's patch to add the player LED defines:
https://patchwork.kernel.org/project/linux-input/patch/20210908165539.3102929-3-roderick.colenbrander@sony.com/

Version 16 changes:
  - Use latest LED_FUNCTION_PLAYERX defines for player/home leds

Version 15 changes:
  - fixed minor oversight in how rumble rate limiting was being handled

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

Daniel J. Ogorchock (16):
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
2.33.0

