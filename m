Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BEB2F965B
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbhAQXqH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730845AbhAQXpZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:25 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B515C061573
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:45 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u11so3365453plg.13
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+Oizrlo3OIDbfPymvWyjuO3HZ7nWkZrzoyzd5R0UuY=;
        b=hkhkWoIS4hzraQ0FzJ+r8DpAFixesb+wiKVOyb2F8p7nyCvzHH137FL8uYI+phbEaA
         cDDlBZiyCBBR176e5zJfvcKj2AFhGL71tiHHZmny9PUO4y+cnL0bEpZq3ZanXGGryKZR
         BTbMLVWUd0PG9UuVCmT8lxJ9XAhJpCb2E1kuR2S2d4fc8Whv22kvlE25xhV4rMBCzGT7
         P6eeXOI9YHe/Jj7mw+2vgCbrrGkOqaAsBqojNdCTRLadaGnj+2Nl9is+xgPGJ4JbOHE/
         s+RSXR3+zQ9r/3IH37xxxAYb72lhOTYnuy4/2x4nPAaWRKd5u2WdkFTEEwpf3tlGmkKc
         Zgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+Oizrlo3OIDbfPymvWyjuO3HZ7nWkZrzoyzd5R0UuY=;
        b=QQMkU35RzuUXhd/fa9aQFo9Z8ClUgWcfSgsVWOY/nQuVkOCbOdmG7C3YIp0JCo+wMm
         obaWZbsah0V+RRHaucAkKugCrcCKmsZHpFWqdZZ+HDM6aO049/gyOOLbF2V/4Q1vFMpi
         N1d17F3PNAHGAQJbebENoJojAS2rgMyTMD0TclIoyksqd2/GWxF/ucYs4BE+WMonN2Ze
         V06Q5u1xMtWrIhmWYVpbzz5ScCpbEmiV9sa7MAWBh3UD3556HR+3fAnOiAplWSN4dO49
         siFFXzuvNR+YpD4oZ4jLAH5K0JIidIxVujI1zSF15KgNmO6Hl8JMeqt/thaYkWePGcGe
         mmlg==
X-Gm-Message-State: AOAM531XISLm8dzeD25Q/JF+Ni5DeszsjfHKMADiTN6FDqFib2obg/0K
        MD/uDbcswqA8YlLk9V1/2g1UAw==
X-Google-Smtp-Source: ABdhPJzT7RFWojhX/JJDCvhbbiyoEUYjegQnawjBATq7O23ClovCEYORnlEhrnzRoen645B0g9XouA==
X-Received: by 2002:a17:902:e846:b029:da:d44d:1968 with SMTP id t6-20020a170902e846b02900dad44d1968mr14030858plg.47.1610927085168;
        Sun, 17 Jan 2021 15:44:45 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:44 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Sun, 17 Jan 2021 15:44:22 -0800
Message-Id: <20210117234435.180294-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

This is the same code as v3. Due to a misstake during a last minute
rebase, the touchpad and sensors patch got combined while fixing a conflict.
The new v4 corrects that issue. There are no additional code changes.

This new revision contains a few bug fixes, but mostly features small
code changes and minor improvements relative to v2.

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

Changes since v3:
- Separated touchpad and sensors into separate patches due to rebase misstake.

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
 drivers/hid/hid-playstation.c | 1485 +++++++++++++++++++++++++++++++++
 5 files changed, 1514 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

