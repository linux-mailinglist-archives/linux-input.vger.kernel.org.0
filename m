Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BCD48EFE9
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242519AbiANScW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242991AbiANScW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:22 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC275C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:21 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c2so2135502wml.1
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uyLwA9PlMa5K2mNDHe8B4ySiT5dL9oC+BNy64yw+1zA=;
        b=GDNwx4NBl/pocoJbPVsKrpqEwFpn3Nu366jr4Hohtj47e0gQrYmf4XRw93VpATBze9
         KFDUU5ty5xdKDSs6/FZWn1DCEWHf5JYV2nEWCPf2MXn63LbzvCXc1J/ygl3BC9veKTCH
         kfORvlINXRdEKOpfQfxiTcO4+ctLBOhq0u3crkTFKuVUiTTPMd2zAcP4JN6HGuChaxiP
         1OdB0XiWU7vmDiJWynf2Wr82ZWV8K6zpbHowRw2m4p94cYD2Hl+5RgvaOGBR9g6Rfrqz
         uVR8kArqC/El1deXaA9If+HngZ7jiq23TjwFH8s7LjxAX8qS7Ik/9xrTa42plTIQYyCn
         rinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uyLwA9PlMa5K2mNDHe8B4ySiT5dL9oC+BNy64yw+1zA=;
        b=7akjJ2szAswl6ILlB/hcumndvcxI0RBQzsp5kZjEszfgZ2G8LvBxZbS9iQWrrt1U26
         KfdhDL1Pzh+IhhiVGrkgnzPwTAtTbcs4SCwLM5B98VGaEPAWts385psKBpjKDd/JfoxS
         dQOeFbiG8sjBqaaGv7xw8r+CKHDNCH2B3zQolaBo4GCTbffYm6GASx9VljZWCS9Ima3N
         vFgKwxI3UsLvgetWofPZgSumz/pdnNwqNpiheA3qeuvt2vxDJ8S7dl/F6ZT0hf+YX89Q
         c3p/UMzNWj1GMlAZm78g3klHNkwcrCOjPaGJoGr1QNdfTx9YPRW8SeSTYHes1cAxCXRb
         l24A==
X-Gm-Message-State: AOAM532BooVbFpaCX2VIbHJqz1HTmZJ4I+xk+QFKlzmGNSPGGYxlO9Ke
        AwCyP6Eeu/xX1hvkCJwZmP7wSHAa56aXEzG1N9A=
X-Google-Smtp-Source: ABdhPJz2sPNlquo/gxTDQWGKBiZkfR7COMDpowcBCObguvUhD/gRmfdfY+QJ1J/tda6uLTh8z5ODeg==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr9370346wmd.46.1642185140330;
        Fri, 14 Jan 2022 10:32:20 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:20 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 00/16] *** Implement simple haptic HID support ***
Date:   Fri, 14 Jan 2022 18:31:36 +0000
Message-Id: <20220114183152.1691659-1-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series introduces changes necessary to support devices
using simple haptic HID pages.
Implementation attempts to follow the discussion below:
https://www.spinics.net/lists/linux-input/msg61091.html

Introduce new haptic defines as specified in HID Usage Tables.

Add new force feedback effect type in order to facilitate using
simple haptic force feedback.

Add INPUT_PROP_HAPTIC_TOUCHPAD to mark touchpad exposing simple haptic
support.

Add new struct hid_haptic_device so as to gather simple haptic related
configuration and current state of the device.

Add new functions to be triggered during HID input mapping and
configuration in order to detect simple haptic devices.

Modify HID input so that haptic output reports are parsed.

Initialize a haptic device.

Modify FF core so that effect IDs can be shared between multiple open file
handles.

Add shared release and press effects for a simple haptic device.

Calculate pressure resolution if units are grams or newtons.

Add support for kernel-driven mode of simple haptic device.

Toggle ABS_PRESSURE generation by input-mt on request.

Implement functions allowing switching between kernel-managed mode
and autonomous mode.

Add simple haptic support for hid-multitouch driver.

Implement EVIOCFF(TAKE|RELEASE)CONTROL ioctls so that userspace can take
and release control of shared release and press effects.

Fix i2c hid sending and getting report so that report IDs larger than 0xF
are handled correctly.

v2:
- Describe INPUT_PROP_HAPTIC_TOUCHPAD in
  Documentation/input/event-codes.rst
- Do not extract mt_get_feature(), use hid_hw_wait() instead
- Define HID_UNIT_GRAM and HID_UNIT_NEWTON
- Calculate pressure sum in input-mt if INPUT_MT_TOTAL_FORCE flags set
- Use u* instead of __u* in struct hid_haptic_device
- Solve problems with report IDS >= 0xF as Dmitry suggests

Angela Czubak (16):
  HID: add haptics page defines
  Input: add FF_HID effect type
  Input: add INPUT_PROP_HAPTIC_TOUCHPAD
  HID: haptic: introduce hid_haptic_device
  HID: input: allow mapping of haptic output
  HID: haptic: initialize haptic device
  Input: add shared effects
  HID: haptic: implement release and press effects
  HID: input: calculate resolution for pressure
  HID: haptic: add functions handling events
  Input: MT - add INPUT_MT_TOTAL_FORCE flags
  HID: haptic: add hid_haptic_switch_mode
  HID: multitouch: add haptic multitouch support
  Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
  HID: haptic: add hid_haptic_change_control
  HID: i2c-hid: fix handling numbered reports with IDs of 15 and above

 Documentation/input/event-codes.rst    |  14 +
 drivers/hid/Kconfig                    |  14 +
 drivers/hid/Makefile                   |   1 +
 drivers/hid/hid-haptic.c               | 737 +++++++++++++++++++++++++
 drivers/hid/hid-haptic.h               | 148 +++++
 drivers/hid/hid-input.c                |  18 +-
 drivers/hid/hid-multitouch.c           |  74 ++-
 drivers/hid/i2c-hid/i2c-hid-core.c     |  22 +-
 drivers/input/evdev.c                  |   6 +
 drivers/input/ff-core.c                | 129 ++++-
 drivers/input/input-mt.c               |  14 +-
 include/linux/hid.h                    |  29 +
 include/linux/input.h                  |   5 +
 include/linux/input/mt.h               |   1 +
 include/uapi/linux/input-event-codes.h |   1 +
 include/uapi/linux/input.h             |  26 +-
 16 files changed, 1210 insertions(+), 29 deletions(-)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

-- 
2.34.1.703.g22d0c6ccf7-goog

