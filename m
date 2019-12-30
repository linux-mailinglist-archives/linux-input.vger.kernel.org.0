Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1537F12CB99
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfL3B12 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:28 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:46207 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfL3B12 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:28 -0500
Received: by mail-yb1-f194.google.com with SMTP id k128so2580659ybc.13
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/iYnevD4/iEdrGsBWoDwTLJoCTcmOakgh0lNEjkVqo=;
        b=Gy8wY0BpUAsCeMYZLiPOT+foLAhhynubAWx9pY5vMW7/NG2taMY5lvRZfN9LF8VajM
         +0jA5tps6qXGQxNNhF2tJwAj2Z9pWrVxH3njn9696BXLaKkHC4i1k6FzUftj3z4SvisR
         5+9JopPcbH8MXzvDAgIbxWvUkLTQLnqOKtHssH2gdS/ENuCq2+ukQDF5HLjIlFo7DHh4
         HdZ2EPZV24+9KTI0j6BVL+I9RZrr8Ri8OxmivwHpw0WmSCbNC818s1ZGWRwRA2fvjL5C
         +78fMLB7PX4G9G6JztNF9Q2dkUjl1KFveikXHt1PC9k++IquEwtZxNOCQ99k8t+oOey7
         UO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/iYnevD4/iEdrGsBWoDwTLJoCTcmOakgh0lNEjkVqo=;
        b=mE4wV2/3Dsu23HL+QWCSEgjkl8niGhJiGMKTlTXo4xclI/6ziEfvFYUdIN6yiDnjpg
         ASztIGLMjZj5SbxL04WRW372/zjOQ/Rzzo5S7VSRMNTHGS9FnUsOwPU1ELbmZKQA8keb
         +Mu+peOIejDuOanhb+PjtFBDqf0ZeGZh1TkmonECainZkZjI1fJ2Z4bq4rFWvDg7YP+X
         ieGcMkd2EXLpvMiTqrR+WygHX3aoBgxUjkAFHPoElFBq3BxEWcg558MH1zPW0mB1kpVX
         v+GChY5fxgrvTQyt+Kjk6ItvUAHq0U61CqZCT4X2SIUjTjMzyMCW5PByFUS1CR0fP58a
         Rbqw==
X-Gm-Message-State: APjAAAU1gam5sNyGzTvjPHbMeawopg+gfuslkHnSXz2DSY9u1r0CYlU5
        P0OJYvpQVMFeJTKaJfYb6HHc7+6O
X-Google-Smtp-Source: APXvYqxgTSOlAn5K6rTQYDfXyhmJw8cw2KycQoo2KZ2zfgLYR4bWg3S3NuiyYOcNKfEoNVljVrCuoQ==
X-Received: by 2002:a25:a446:: with SMTP id f64mr6769135ybi.240.1577669246728;
        Sun, 29 Dec 2019 17:27:26 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:26 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 00/12] HID:nintendo
Date:   Sun, 29 Dec 2019 19:27:08 -0600
Message-Id: <20191230012720.2368987-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

Daniel J. Ogorchock (12):
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
  HID: nintendo: add IMU support
  HID: nintendo: add support for charging grip

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    4 +
 drivers/hid/hid-nintendo.c | 1867 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1902 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.24.1

