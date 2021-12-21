Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537F647C752
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhLUTRt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhLUTRt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED063C061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:48 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v7so21605351wrv.12
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WEC/BJKasGICE07SGr/lFwnSLBsLIZqrufOeY9yV/Z4=;
        b=4lbE/EijSVLdKqTOhSHRdmxJDJaGS3cjZGBiwPdgdYe35wSWqFWvQLNUO+VNmWXsnf
         LUWzokUJf1xT6oAQiSetT8TCqloJDJuFYITJsb28zCCbIitKDAj5zIHa11JV+P9MPbUJ
         0OEw6JGI5Fuwttf6QQY6qwItVnoM+LVG4PwTZ5gGKrKbh2Y1lJc/UTsL41ZqqD89XkO0
         uTJd4huMskvfb4y9p1QDZGpI8TnKpSEn9uXXk7GXKtVl/74ifLEBrjzbxvX5Ge3JOjDk
         DqEYRRGBIoK+serGUYi+0KTTGmMi5nqExZe7yh/+/vs9vDHkzp2sxSovkKFJKnE5aULW
         7p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WEC/BJKasGICE07SGr/lFwnSLBsLIZqrufOeY9yV/Z4=;
        b=bE/K7fkC2VjmX/jyLT/8WcYNQm4Sc3rVLbwoRT1+7ZcW9S8ZyI1qrIM3TVNjUdcSKA
         CL0YhSFLbQkawHnZSjT6q1pzGOzUvpVQcQwwCh/Q/0zvv0+6sg03thrFftKz4EaoUgG9
         cI6bsXNs8N+mIfeGcRbTGJ4fethWlCrbgDwBCQlLoeS1wPXXNv2HfOAhpDQAy8rT8eyP
         Z0bPxHhynARTjRDLP+o4dqoHgW7kFEJwepNfUClpiV/hcSmG/h2QUG8ikHOnxeelIIf6
         WWTMLt6R8P6R4/cN1BHuB7eMBow6gJZ1T0eqZADFNeuDtdkg3EWLiRGFCCkhqSnOlyeO
         8zgA==
X-Gm-Message-State: AOAM531QQwSFKHBGn1/M09qQ1Q8SZnAfLtMt/m6ghjLtIeP6cp5PKpoD
        4aujAAUMXRzR6kMQ4QcVcvurkiulqaLILUgJ/Gc=
X-Google-Smtp-Source: ABdhPJw6DxDxzS1C+2+L8ZUyn8MfbPqUMSvkKSzp2Zh25MbKRSsM3GGZHTpdmIMQn1Fd6W7vZpk7Fg==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr3913478wru.36.1640114267579;
        Tue, 21 Dec 2021 11:17:47 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:47 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 00/18] *** Implement simple haptic HID support ***
Date:   Tue, 21 Dec 2021 19:17:25 +0000
Message-Id: <20211221191743.1893185-1-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
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

Function mt_get_feature() gets renamed to hid_get_feature() and is moved
to hid-core.c as it is not specific to hid multitouch driver and may be
reused, for instance by simple haptic specific source.

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

Fix i2c_hid_set_or_send_report so that report IDs larger than 0xF are
handled correctly.

Angela Czubak (18):
  HID: add haptics page defines
  Input: add FF_HID effect type
  Input: add INPUT_PROP_HAPTIC_TOUCHPAD
  HID: haptic: introduce hid_haptic_device
  HID: introduce hid_get_feature
  HID: haptic: add functions for mapping and configuration
  HID: input: allow mapping of haptic output
  HID: haptic: initialize haptic device
  Input: add shared effects
  HID: haptic: implement release and press effects
  HID: input: calculate resolution for pressure
  HID: haptic: add functions handling events
  Input: MT - toggle ABS_PRESSURE pointer emulation
  HID: haptic: add hid_haptic_switch_mode
  HID: multitouch: add haptic multitouch support
  Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
  HID: haptic: add hid_haptic_change_control
  HID: i2c-hid: fix i2c_hid_set_or_send_report

 drivers/hid/Kconfig                    |  15 +
 drivers/hid/Makefile                   |   1 +
 drivers/hid/hid-core.c                 |  39 ++
 drivers/hid/hid-haptic.c               | 745 +++++++++++++++++++++++++
 drivers/hid/hid-haptic.h               | 150 +++++
 drivers/hid/hid-input.c                |  18 +-
 drivers/hid/hid-multitouch.c           | 109 ++--
 drivers/hid/i2c-hid/i2c-hid-core.c     |  12 +-
 drivers/input/evdev.c                  |   6 +
 drivers/input/ff-core.c                | 129 ++++-
 drivers/input/input-mt.c               |  18 +-
 include/linux/hid.h                    |  24 +
 include/linux/input.h                  |   5 +
 include/linux/input/mt.h               |   4 +
 include/uapi/linux/input-event-codes.h |   1 +
 include/uapi/linux/input.h             |  26 +-
 16 files changed, 1247 insertions(+), 55 deletions(-)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

-- 
2.34.1.307.g9b7440fafd-goog

