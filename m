Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0F32F9617
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbhAQXLZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730600AbhAQXKn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:10:43 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CEFC061573
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:01 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g3so7638437plp.2
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7I/ccG0MPRG8n0nmy+EblopgcY0+UvZuJZfS4FXkioI=;
        b=oqTxR5iZdTKTp3t8gyQRB6u8aUKQ/DptBIpai6AMqG2BrjCA80zK9Dr1R+feUt027Z
         4v9eSwQeosFRYO5nOhqI0cAYqSN5uf7MBlaOvZFzq9HpDMh1XLL8m1DmmUdpIXNKAu9f
         0z53yfAZpOkJBYoXPq7EjOASkq+55y9sbVNTQsIl0n8GjQTHtTYUEAKCL/Ru83jN1FGY
         qKt5Bxb48hEH8im0BqhNyIJNxRyl1DVXHJU1bqJwbL117B5dzD1xam/Q94xXm4sij+fx
         bZ+y65TSvOf0Pn9nshl+Xp4n4VwXVBhyFeUaoJweAbFnT5MSbUnHJbNezbuQ+4sOk3zX
         mtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7I/ccG0MPRG8n0nmy+EblopgcY0+UvZuJZfS4FXkioI=;
        b=EXAEQg9CeqyyTvLwWGBAkmwk7cjgRI9ILegFGH8YGu/AN4eaZGYBMqO6teaZMTD+mi
         O0dPMQ7v4uaBqzhoDENtOLipfu2+Wu6gUPNVE6Z3i/mwJJr+4aSq/LYmOcc6G7p9BvTy
         kXLlpaF7SZw9RcC3MRx9OW0yxiE2yz7McjACXbICnAqZ2FexQ59+6/Cmw3C9727UXz1A
         91icOtJ1JiIpZUcHm+KUXuy7zTvshXbVZMFAeX6xs//iC3h+YGkvD5pU1SzAFmX2tL2H
         o0z++pwVhnHNUYos0qkj+ZwS7rhnaFE1I9I4XrXPo1kW3wL9WhT+sHRvU2Hd4jyN0OWT
         xdaA==
X-Gm-Message-State: AOAM533KCTVWPaM/Kn4MOnuQtSniJJEniCk3VkjCXm9/c08jtbdAqL1y
        0a3xmBzFejskfGlpW/aLtrb6vg==
X-Google-Smtp-Source: ABdhPJzWHmnP1p75/K1Z602f7k3kAIhRZdFdUePR/R0mVAS89Zqv9+kswcVJOLorOLz+igTvJf+oCw==
X-Received: by 2002:a17:902:7b98:b029:db:fab3:e74b with SMTP id w24-20020a1709027b98b02900dbfab3e74bmr23483457pll.27.1610925000809;
        Sun, 17 Jan 2021 15:10:00 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:09:59 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Sun, 17 Jan 2021 15:09:44 -0800
Message-Id: <20210117230956.173031-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

I would like to share an updated version of the hid-playstation driver.
This new revision contains a few bug fixes, but mostly features small
code changes and minor improvements.

In terms of bugs there were bugs in the sensor code. There was an overflow
issue and EV_MSC/MSC_TIMESTAMP were not set on the device. In addition,
the ps_device spinlock was not initialized.

The biggest change in the driver was the addition of a new 'ps_get_report'
helper function. It handles GET_FEATURE report retrieval and any error handling
including CRC checks for PlayStation Bluetooth devices. This greatly simplified
all the functions (dualsense_get_mac_address, dualsense_calibration_info, ..)
dealing, which used their own report handling and error checking.

Aside for these changes, there were mostly little code style changes like defining
magic constants, cleaning up comments, cleaning up log messages, static_assert
checks etcetera.

Thanks to everyone who provided feedback through the mailing list or privately.

Changes since v2:
- Removed !Expert setting for hid-playstation from Kconfig.
- Removed DualSense from hid-quirks table.
- Added report size checks to dualsense_parse_report.
- Moved mac address endianess comment to struct ps_device.
- Added static_asserts for packed structure size checks.
- Improved readability of battery capacity calculation using 'min'.
- Added spin_lock_init to dualsense_create to initialize ps_device lock. 
- Fixed sensors timestamp overflow.
- Fixed missing MSC_TIMESTAMP and EV_MSC capabilities in ps_sensors_create.
- Used DIV_ROUND_CLOSEST for timestamp calculations to minimize rounding errors.
- Switched to devm_kmalloc_array for lightbar allocation.
- Added CRC32 and NEW_LEDS dependency to Kconfig.
- Added defines for crc32 seed constants.
- Added crc32 check for dualsense_get_mac_address and increased report size to 20.
- Added new ps_get_report call to obtain feature reports.
- Switched to ARRAY_SIZE in dualsense_parse_reports for touch points, accel and gyro data.
- Changed touch point parse loop to use "struct dualsense_touch_point".
- Improved consistency of info and error messages.
- Unified comment style.

Thanks,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (13):
  HID: playstation: initial DualSense USB support.
  HID: playstation: use DualSense MAC address as unique identifier.
  HID: playstation: add DualSense battery support.
  HID: playstation: add DualSense touchpad support.
  HID: playstation: add DualSense accelerometer and gyroscope support.
  HID: playstation: track devices in list.
  HID: playstation: add DualSense Bluetooth support.
  HID: playstation: add DualSense classic rumble support.
  HID: playstation: add DualSense lightbar support
  HID: playstation: add microphone mute support for DualSense.
  HID: playstation: add DualSense player LEDs support.
  HID: playstation: DualSense set LEDs to default player id.
  HID: playstation: report DualSense hardware and firmware version.

 MAINTAINERS                   |    6 +
 drivers/hid/Kconfig           |   21 +
 drivers/hid/Makefile          |    1 +
 drivers/hid/hid-ids.h         |    1 +
 drivers/hid/hid-playstation.c | 1492 +++++++++++++++++++++++++++++++++
 5 files changed, 1521 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

