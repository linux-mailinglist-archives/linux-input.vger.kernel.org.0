Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E4E2E8906
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbhABWcP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhABWcO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:14 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF680C061573
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:33 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id y8so12458291plp.8
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XU/qOQ78RB39CfeMZQLPcThijwmIUgO34NtQGNaeNOY=;
        b=mBpJWaAqeRDb86TdsoTkHvM61Uwx2M5G6pWWk4sp9bZWqeCcGIYXnEs55rceNQvR3L
         TQbbwITNsDzOvAs9l0QpU4afTYk5LwIellMTkwOdWbtH2QuboHeLEOrWSMKgaMJ0jdHy
         2hajVATXXhoJnKD38s/5F63O9jSu0vay+lxTptVshCuKG/cxqNyqYBmc8hd0DIMIhjmP
         btAGSL31+voDSbN48Rt60GFyfU2KOpkYxyObEQqqicZCsETrH9/IVQM+mZrNLQ87ynv2
         Tjkr150XX5hOP/PPCizNizkfVU0PNqbLyp+pTwK6vrZo6/D8dT5vVlb6dDGNKatiy10w
         pqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XU/qOQ78RB39CfeMZQLPcThijwmIUgO34NtQGNaeNOY=;
        b=jZ6jk/HXE5vRg8cwBHmEOgcpWCgvbNcMF2ZyFA7JPOxuhAv5Hput8vWzjuFvAevl1x
         wyrkYzIanL3xlMPoYs6jBw0ryIN+Y/RM9QLFvdk10P+Qwzx+fCsO53Ucb2TlkM+hOxVL
         ngaQm5exaKlzCXOPRqnCws5G4WBmIMY4Rd1Ix0C4E2ZrB5vZt1MWBSOd4JmgQcmwsRTI
         dGMDh/8dyFnyMHWVYOV31gS+HuQFUq7Pes0Gjs6r9aoTEX52kYYeq5wz68U5LUqO3DtQ
         wldYCWk0vNdQMLYYlFYNzqAJBlYHx4od0lk/AUPykHDMBRS5QEn7elpsyVBjxYO3iuVH
         mVyg==
X-Gm-Message-State: AOAM5323enNZKDLhuvcQJnkd9jlquAkRgc5TCoTl2IDR7VrnF0UV1vKV
        OS0GTDYNaH99nfYvL/pPHO2xuw==
X-Google-Smtp-Source: ABdhPJweFa2iBJkRGZ+I9mSHvfqUdtZHLCcP8++IqUqGGh2c2t8PH4pDCrh2RwbLpAe24ANkSoOxgA==
X-Received: by 2002:a17:90b:1202:: with SMTP id gl2mr23773916pjb.123.1609626693383;
        Sat, 02 Jan 2021 14:31:33 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:32 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Sat,  2 Jan 2021 14:30:56 -0800
Message-Id: <20210102223109.996781-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

I would like to share an updated version of the hid-playstation driver.
This new revision is very similar to the original release, but with
various small changes and minor improvements. Thanks to everyone who
provided feedback through the mailing list or privately.

Changes since v1:
- Export ps_devices table using MODULE_DEVICE_TABLE.
- Uses 'width - 1' and 'height - 1' for touchpad ABS_MT_POSITION_X/Y.
- Uses 'sysfs_emit' instead of 'snprintf' in sysfs show functions.
- Switched to devm_device_add_group to manage attribute groups.
- Changed player LED lookup to use pointer calculations instead of a loop.
- Added readonly mute set_brightness call to silence ENOTSUP.
- Lightbar is not dynamically allocated and now allocated as part of 'struct dualsense'
- Size checking on hid_hw_raw_request for calibration, firmware and mac addrees info.
- Replaced magic constants with defines e.g. for HID version or output report values.
- Minor code changes e.g. const changes.
- Uses container_of to retrieve 'struct ps_device' from 'struct dualsense'.
- Added an explicit module_init/module_exit to clean up the player IDA.

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
 drivers/hid/Kconfig           |   20 +
 drivers/hid/Makefile          |    1 +
 drivers/hid/hid-ids.h         |    1 +
 drivers/hid/hid-playstation.c | 1448 +++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c      |    4 +
 6 files changed, 1480 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

