Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D9D187828
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgCQD36 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:29:58 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39712 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgCQD35 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:29:57 -0400
Received: by mail-qt1-f195.google.com with SMTP id f17so15003832qtq.6
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9l8UbkKLvUdRPCWu8xZvsrmKQXUESyFUVRoonfCZYY=;
        b=TLyw1PWr7qp513EGbU3rIBNR9U7y5qd0NNP94clsXJFT8oybxr7tIp2UdVKv9b25RF
         4yIK8NAg/sw1+L9I0/uVOseul+9FugO+FvsDnZkV43jg9XtFeaqGJFV+Eltp0/FU//eF
         32/6W7NmW1NwxHXZJ8dE5jRfzykWeaDAHHT5NKSAzYjYk1A3QsfUH6RLra3CsoF1Z0K7
         f8lRZJf0aA/9yn/Z0Yzm33cnnJtMMAeLbhVnqn1k/keme85btnnr3Ycvg9y+9iQxHYEA
         JTZ/IpTdD1Ch5+H8+F+7ZTDzTDrISki3GrTdV6I4CZx60Oa32cgx/n5qZ2z6nNw/vRSi
         BC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9l8UbkKLvUdRPCWu8xZvsrmKQXUESyFUVRoonfCZYY=;
        b=Zk2i4DlopY0WkmSkV8eyQAKQm73Q4Iy1kpdi7ptBA83z+N677FWbcjdzW1aIdH9jV4
         uIQm6L+kibYVxGc31B54HYUQCvbMr2dBbIsWcBhvJiHGSpIUCMMlojCDxSK128MFMfdc
         kCR9m9SAbJLs4uawkGnXMp0Jdz9Jpil+bpGIyd459jdpG7DuFXqkgfWbevjum5gMag92
         5vBBD8Y6pBJpbs9pjkrNjLsIoZpPPC9nIAKUwhaM5anrPKPfkLbUgJZz93k+FtK+VMEX
         1JQ4NKeU48S8iCfi68UZJQyi9QDffSac9UCfA1SRy1yKy+ljFJ3MOhK4Om9iL3YoAvJN
         LDuQ==
X-Gm-Message-State: ANhLgQ20S3AQz+AO+YBv3p64LtXgyad/mfQnR6f/2WYyP0jj6Qg1F9JR
        cdhaL23sFPhs+dkjCCw2Kw6SB289
X-Google-Smtp-Source: ADFU+vsBiCse/mh1qaGQ3OEfJSplrnqUC00O+Bb+SHMf0Fpnv00aRVt5vunZ+9SYMWfnhBg1XfrPdw==
X-Received: by 2002:ac8:4cce:: with SMTP id l14mr3460911qtv.383.1584415795717;
        Mon, 16 Mar 2020 20:29:55 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:29:54 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 00/11] HID: nintendo
Date:   Mon, 16 Mar 2020 22:29:17 -0500
Message-Id: <20200317032928.546172-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I removed the IMU patch for now, since I have some more work on it to do
before it's ready. This version fixes a bug with joy-con S-trigger
configuration and switches the pro controller's Dpad input to a hat.

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

Daniel J. Ogorchock (11):
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

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    4 +
 drivers/hid/hid-nintendo.c | 1665 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1700 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.25.1

