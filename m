Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C492DED73
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgLSGYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgLSGYU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:24:20 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D7EC0617B0
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:40 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id v2so2852027pfm.9
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjSK2KgPjfqodhEi0KGu+WK4FN5lyzq+GsbsBT/wonk=;
        b=U766bkZlHYjeUsTPHRxu3GKe0suKtrN6zcbGPMR7w4vgAvzDNHtQbf71cC9+QEwXiM
         rEsPL3EaSxS5Iz+hvhGFJG4x2ojFjxYu5ZW8xhZbf23SCEPsYf4N1zXXZktNYXYUgol4
         xXQfFtgPFg0jX3ii/Tq7fLTCrgFMS1cue9PgJBc1+99UqQ+h3f506rQgS7+eoedI2J/w
         0uaXUbDxLSPIhFGtrZ4e7+HMX7VPDV++9ksfI/Z8r4nTTMzmaqsswaYiRxhjKntycL19
         pm4naojrd5JOIL1l2IfHE6WrMHK6jd8hwYEv26AOhhcyVa7dmJStIUrWsxpJxokKET7R
         cj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjSK2KgPjfqodhEi0KGu+WK4FN5lyzq+GsbsBT/wonk=;
        b=nnfxSy/p90lx0gO6+h8sPv4p+U095VtQ86WU9xPieKFwZIAO8BfjejHj6+MTXFCC/m
         MQBjJmkkt9qAfxPQZjp5TJo7G7HHUFFLCfocRygFcu79EKcCMCiETBJZ7Q/y9seshqYy
         2gSRo534dcdPFEVm4waHVFmWFiUqD6gYkTAvwojznxQhUzzs5ZdW/Fcc3S6D6XjNjJZ8
         7qibc20TR56qZLN8rsOo8HBozeYsGEWKA62Wg4U3BU02NGcKc7E0wdgr1w+Hcv8CHwQM
         Xkydn5WTKlD0PrN/vafIKlMIxHSCPeIHhqxJPq6f86fbUbtcXhUXX/trhWhg/MR7WLrT
         Qa1A==
X-Gm-Message-State: AOAM5323XdeD6T11S2jRR4MPHeByY/eD+zbIbrL53NxPQWfF244pqZLC
        UhTO3NJdOjeEib5xSdOY85V4Lg==
X-Google-Smtp-Source: ABdhPJy+6DhBEtqWzlFtywt3IoLZgvi49BMbs3Ti4H5UxbfFQu+jqoNLaCcB7/rnCgTM4/inLxg75w==
X-Received: by 2002:a65:620c:: with SMTP id d12mr7093356pgv.220.1608359020324;
        Fri, 18 Dec 2020 22:23:40 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:39 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Fri, 18 Dec 2020 22:23:23 -0800
Message-Id: <20201219062336.72568-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

I am pleased to share a new Linux driver for the PlayStation 5 'DualSense'
game controller. The driver supports the DualSense in both Bluetooth
and USB modes. Most controller features are supported including LEDs,
Touchpad, Motion Sensors and Rumble.

DualSense supported is implemented in a new 'hid-playstation' driver, which
will be used for peripherals by 'Sony Interactive Entertainment' (PlayStation).
Hid-sony will be used for devices for the larger Sony Group. We intend to
migrate existing devices over time gradually to hid-playstation. We do not
want to cause any regressions and maintain quality. As such moving forward,
unit tests are important and we started by providing these through 'hid-tools'
including DualSense.

The Linux driver exposes DualSense functionality as a 'compositive device'
similar to DualShock 4 in hid-sony, spanning multiple frameworks. First,
it exposes 3 evdev nodes for respectively the 'gamepad', 'touchpad' and
'motion sensors'. The FF framework is used to provide basic rumble features.
The leds-class is used to implement the Player indicator LEDs below the
DualSense's touchpad, while the new 'leds-class-multicolor' is used for
the lightbars next to the touchpad.

Not yet supported are new unique features introduced by the DualSense
such as Adaptive Triggers and the VCM based Haptics. These features require
a large amount of data and complex data structures. It is not clear how to
expose these. The current Evdev and FF frameworks are too limiting. We hope
to have a dialog on how to expose these over time in a generic way.

Enjoy the new DualSense driver and let us know if you have any questions
or feedback.

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

 drivers/hid/Kconfig           |   20 +
 drivers/hid/Makefile          |    1 +
 drivers/hid/hid-ids.h         |    1 +
 drivers/hid/hid-playstation.c | 1416 +++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c      |    4 +
 5 files changed, 1442 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

