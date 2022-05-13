Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EABF9525EF4
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379088AbiEMJju (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379093AbiEMJjr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:47 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26023291CDC
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:46 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u3so10681071wrg.3
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeNo6IayOFD87yHR5pDIffB7Jhop2RJROiy4nC/0mMc=;
        b=QJ+dMqsOX5wnbJxA4/8qw81QaR6hkzxnCysGMRdEKD4g/Wyz0VeRlxYEhkN/VlG8NT
         ixjHVsYTGN8NJTSoU1pO/tcS1Z3xab4NSnqwafDQ5WLjl6h7M+3Q5vmEZ+UsbcjoVRhB
         /VPv2aKk/ZG//cyeElUHvnUgxaZqI1QYqLzjnbzEjsclYvUU1JA6dp3MYpJPimU7GvFW
         0vLYFL158eUqJS5pnwsOsJxB41XqNbTj91FtO/TMni70QxwweEqsX3jw21FaDNW2I7qI
         kOxU584tpQ1LLZ8jwRpckKHa1KjDdTF/bQjqJ7yqYwtL1Uw0sBGTMC0iZVgM1Ae3GIHy
         ldVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeNo6IayOFD87yHR5pDIffB7Jhop2RJROiy4nC/0mMc=;
        b=y5Pqwqs0HCQayezGavcC+2BNWRYF8B2ks9x4P93IY1j9xjj7XTvFw1MqyazA3u+dKl
         rR4s1s4VKJanIYpUWab0fnN81NUpRr1mJ0OL/xDxPQc3AIOoCql/t1pNYzRTCzD21rLZ
         Zf1dg6bPQsFZSsucW8bwYfVgp1/HoGaXG6H1x/9QAL8u9yFI97lC+CcVSAGuJOY1QVFq
         p67k54CVZktLmidgXzD98pK+qlcbx2a+YEhZlu8G3xQn4hpeOceCetulnokI2sBjgslq
         QHN/zjkQImYXiWd/8ZuZ30sUGEcst8Kp4zxnNpY89wW7ZCdMrEpsoRE+DQoLKHUtqr1d
         AHAg==
X-Gm-Message-State: AOAM530t7PRBZZ2CE+scCC1xmVK4ooFBH0CImXbPMi+W0x7z9iydnEFT
        mlkIdMrM9QRZYWVCUhhAXD1a8aIDvx1ie7P96VA=
X-Google-Smtp-Source: ABdhPJzt5/xOuydbwYhnvPbfuOIdcQKMyisqqboFn8IbL/K3JN0MIkdmpGUSVus98BeblTL2j7ohKw==
X-Received: by 2002:adf:df05:0:b0:20a:c402:6811 with SMTP id y5-20020adfdf05000000b0020ac4026811mr3157499wrl.275.1652434784753;
        Fri, 13 May 2022 02:39:44 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:44 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 00/17] *** Implement simple haptic HID support ***
Date:   Fri, 13 May 2022 09:39:10 +0000
Message-Id: <20220513093927.1632262-1-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

