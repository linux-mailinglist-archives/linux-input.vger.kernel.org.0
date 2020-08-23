Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A3424EB5B
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgHWEmU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725139AbgHWEmT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:19 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7673CC061573
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:19 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id a65so4713725otc.8
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCEJaM8BGRI3ZAoE7T4YkedhWORh54v4DZnBdiXF9YQ=;
        b=MJd4bPanYtEivuijEaeLu06IGeOx1c9LuT/f85xyDmhU6g+HW9oHq84nVaIt5VI4Oh
         H/saRk2B/Xsa0J0Jp5qawFHicYmTx/JP+iFwPFmj9LIj9aY6jp6EjiCmJ8CxZ0WxyS6D
         CJtiJDpHzbAderAHUDpl+kE/gl8VoVcTB5HxHz3aYJIha/EPpDtNcR/YVZsnOQutpyv0
         /yAUicI1xC69ZkgUxahBy2U5QuxWvwX+oyS5B0K5/lTeWvQZRMA7CZk7lDKe4WJYAGt1
         RbrVNz/XklhDSlsGYgnngfWPJghjXTnISzag6a+3UBSXGWBXhQ3dba2NVht/tQtFYAOV
         8RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCEJaM8BGRI3ZAoE7T4YkedhWORh54v4DZnBdiXF9YQ=;
        b=YuVyuUlh5xsSUN1H1YDdeNzEaEs6seoornh/azr31EteCv+cFzg9NkOvYpAC8fWryq
         o51wI2UQNz3VwTjA8J1Rbw/WHJqTsPBqw7E7lNe2w9vywhOfSefmNWP6pm2BTZmzbAGu
         K3loSTjhR0skhVnTB81FACZfFsQoGjzsiftY16dqS7+/7/jxcqJuKuRcB45lO6wibZEU
         xc3yPU1373Xh1QPwgm19ed/0Zj92Q5sKD7vNL50daHVmuZXs6hNkQhyFjztPHHy5o8WJ
         kgf79x95t76mzBxxIQHSzc5KdvwFUODS+WmXNdVyAiby8pM+6T9oqd9Twzi5RBST5TUu
         dd6A==
X-Gm-Message-State: AOAM530lJ8m5GRq9ZbizQCBsrTagkHAuo+CsSlCCIKVt9x2SKiEcKZ38
        JxF1yEABtPORBAq2L/7Re+JpG5eF9IYrYQ==
X-Google-Smtp-Source: ABdhPJz43Bxf1v571krLKnpMbNVKXNgirnqsJfVNZuApwz4F6F0dSCJipIjxr5SJEPpnTnLqiD3x8g==
X-Received: by 2002:a9d:2782:: with SMTP id c2mr256896otb.217.1598157737763;
        Sat, 22 Aug 2020 21:42:17 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:16 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 00/14] HID: nintendo
Date:   Sat, 22 Aug 2020 23:41:43 -0500
Message-Id: <20200823044157.339677-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've included round 2 for the IMU support patch. The documentation is
improved and the precision increased for the gyroscope values reported
to userspace.

There is still the important question of how to deal with userspace
implementing custom drivers using hidraw (i.e. Steam). I am resistant to
having hid-nintendo completely yield when userspace uses hidraw, since
that would prevent other applications from receiving the events from the
controllers (like maybe someone configures a voip client to use one of
the triggers as push-to-talk).

In my personal testing with steam, I don't see much issue since I
introduced the patch to not send rumble subcommands when no effect is
playing. Steam/hid-nintendo seem to fight when hid-nintendo is sending
lots of subcommands (e.g. rumble, setting LEDs). Others have reported
though that hid-nintendo/Steam are still fighting even with that patch.

I guess there's not much that can be done though to guarantee a
userspace and kernel driver coexisting at the same time, since one of
them could completely reconfigure the controller's reporting mode, IMU
resolution, etc.

The two extremes seem to be either having the hid drivers yield to
userspace completely when hidraw is in use (e.g. hid-steam with its
virtual hidraw dev) or mask out exposing the hidraw device when a kernel
hid driver is being used. It feels wrong to have things in the current
state where the HIDRAW device is being exposed, but it's not actually
supported.

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

Daniel J. Ogorchock (14):
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

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    4 +
 drivers/hid/hid-nintendo.c | 2240 ++++++++++++++++++++++++++++++++++++
 drivers/input/joydev.c     |   10 +
 6 files changed, 2285 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.28.0

