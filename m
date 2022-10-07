Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64D75F7D57
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiJGSaW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiJGSaQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B6AA222A
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:13 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b7so8461796wrq.9
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYZcTsgNowakdVQSSr2Lgy2SGSRVai0NOuM967yUiO8=;
        b=X6D7qwfT93oTrFZwemDzM82ecvgyJUiMzZU00hMrxuyKmi2JuGvKzOsijBRJ7BfaeL
         b6JU3v4Wy6i8Fx1QpbvSFw2mXRcH4MgLrw6+AFKHf0ABBde7lg2vh5s1lEiW6jsGgy9g
         fxZ8wjzTttHCG9oOTNcSLd3TQLlKOr6Wl38l3SmRiaL22dVHK6fhZ0+ZjghhTR/+/+qq
         WTLTDsA8nOyhAPptYHwjwMXfeLD+aYoRcwEYNICreGYVolw+RvOteSsX+2ikdld8/bbe
         BZqEkCyHDgt+T5etDkGYkfZjP/qKmLobAFJNQ5ax8XPkni4zM8zPzZH4K1t53EvLOWMs
         Z0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYZcTsgNowakdVQSSr2Lgy2SGSRVai0NOuM967yUiO8=;
        b=EE3xG2EAuso7xoOnv73KMPGbaxgPmGRzALndNrKN9buV+9jzxTLxoNjJhVMtk8U4h+
         o+tvUnEwVDnyl8xzRAqdq4Kew9jzC6GZ/NgRXdZaNZofHSB5uPjJ5LUHinvmk45KiBej
         Rp5qOReFG3mKJ2GN0GoWNWCyAd+imLoGUS9zDNE3U5j5htlWYf937f7V/+hTV1CIXcsC
         yVDS90P0krO/h//etzSetz9UOR2vb5URE/y7/n6f1GZMrfw5ITPJ5BvFS1ZINLx6BpxI
         C+j8rMnzm5PtGSfEGfnBDeh8+DgOUNKCwui69EnZoUjwEpN6IzCC8DA1a/u0X2ommCLj
         +JZA==
X-Gm-Message-State: ACrzQf2NtRXMdk/SF9VwAhfpapwJdcBrby/ArFDwyWJ1os22kXWl4hlV
        T7bpdmjk9111P2cqEtr6l2e7P6bM0u13y5dM
X-Google-Smtp-Source: AMsMyM4hObbCe3l5PwiBWczs0SS2zBv2FpoaLfw59hl2ueAt03tR0JUIbNVUoWQ3x1wOqIGjNEckqw==
X-Received: by 2002:adf:cf10:0:b0:22e:4e50:9161 with SMTP id o16-20020adfcf10000000b0022e4e509161mr3981658wrj.587.1665167411770;
        Fri, 07 Oct 2022 11:30:11 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:10 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 00/17] *** Implement simple haptic HID support ***
Date:   Fri,  7 Oct 2022 18:29:28 +0000
Message-Id: <20221007182945.1654046-1-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

v2:
- Describe INPUT_PROP_HAPTIC_TOUCHPAD in
  Documentation/input/event-codes.rst
- Do not extract mt_get_feature(), use hid_hw_wait() instead
- Define HID_UNIT_GRAM and HID_UNIT_NEWTON
- Calculate pressure sum in input-mt if INPUT_MT_TOTAL_FORCE flags set
- Use u* instead of __u* in struct hid_haptic_device
- Solve problems with report IDS >= 0xF as Dmitry suggests

v3:
- Get rid of INPUT_PROP_HAPTIC_TOUCHPAD property as haptic device does not
  gave to be a touchpad
- Introduce notion of haptic forcepads; generate haptic feedback in kernel
  mode only for forcepads
- Generate clicks based on maximum pressure across slots instead of the sum
- Fix off-by-one bug in hid_haptic_upload_effect()
- Fix resume/suspend: issue hid_haptic_resume() in mt_resume() and
  hid_haptic_suspend() in mt_suspend()
- Add reset callback for HID i2c devices
- Implement reset callback for HID multitouch haptic devices
- Implement lid handler triggering touchpad recalibration for Redrix

v4:
- Fix mt_reset callback to end earlier if no input devices have been
  configured yet to avoid iterating over uninitialized hid->inputs list

Angela Czubak (17):
  HID: add haptics page defines
  Input: add FF_HID effect type
  HID: haptic: introduce hid_haptic_device
  HID: input: allow mapping of haptic output
  HID: haptic: initialize haptic device
  Input: add shared effects
  HID: haptic: implement release and press effects
  HID: input: calculate resolution for pressure
  HID: haptic: add functions handling events
  Input: MT - add INPUT_MT_MAX_FORCE flags
  HID: haptic: add hid_haptic_switch_mode
  HID: multitouch: add haptic multitouch support
  Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
  HID: haptic: add hid_haptic_change_control
  HID: add HID device reset callback
  HID: haptic: implement HID haptic reset callback
  HID: multitouch: Add lid handler for touchpad on Redrix chromebook

 drivers/hid/Kconfig                |  14 +
 drivers/hid/Makefile               |   1 +
 drivers/hid/hid-haptic.c           | 753 +++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h           | 152 ++++++
 drivers/hid/hid-input.c            |  18 +-
 drivers/hid/hid-multitouch.c       | 313 +++++++++++-
 drivers/hid/i2c-hid/i2c-hid-core.c |  21 +
 drivers/input/evdev.c              |   6 +
 drivers/input/ff-core.c            | 129 ++++-
 drivers/input/input-mt.c           |  16 +-
 include/linux/hid.h                |  31 ++
 include/linux/input.h              |   5 +
 include/linux/input/mt.h           |   1 +
 include/uapi/linux/input.h         |  26 +-
 14 files changed, 1469 insertions(+), 17 deletions(-)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

-- 
2.36.0.550.gb090851708-goog

