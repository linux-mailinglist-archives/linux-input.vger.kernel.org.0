Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43AD42A6969
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbgKDQYo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730073AbgKDQYo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:44 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A351C0613D4
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:42 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id x7so22720008wrl.3
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKssTYpT0b0lSv/NWS69Jlep6nj9RUwV5kyyl2fa01A=;
        b=d2LW2TWmWmyU8GHjxyNoh09FrdyECtiqNAozU8HsFfK9TnPy1Rxy9SHMIOyRG6lPbZ
         vlxktz7e/HfKPeRxsdh7SMM+5TGYkIQgtrOchS9FuH0VzyHRAkTNDx1b9GRNO4gDNaL5
         suGXr/Et4PA+XchZf2BX8avstD29VTIWKSk2skxOAZugQh4MqV1JYEboQpLvODTZ7jKI
         Xtiw8Qz/y+Go4yfFD178O0oq1+T3IDo7StCmTE92wOtGnu/J8IeiAM1V2QgSFIn1dc2d
         8xMdTEszU2qIvCyUmMus+lCONtPW0X/csnxW1anspuScIwg1MyRrH16Hk9/PlNg7QSkW
         RpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKssTYpT0b0lSv/NWS69Jlep6nj9RUwV5kyyl2fa01A=;
        b=MnCC/moKr6Fq0iJjrV8Why6bN39WfrxNI4VfhkMOTk53dtN8Bm9Vzgzbq5VnPau4bD
         TKBNxl5nABTku0bxyCwNwfZLKDWYikP3PhI1UDWZdc1nHqcAEOZCrqhnD6E/LegFIn6t
         BIBCOyg8gxHDlSXwa42jdKdpT5zEY8rHTL8JiQsByI1+t8IUcMruXR7yT+rkDyTVNgf6
         Urz+qPKF++yjho79qKjSCHfgTPpXuWaYI3xEgO2npzeJXMxtUwAy8AJqatWYPnxwAzXw
         fvh6cgSNRy7sY/QdNj/yTj456oyXO3JdaQSk0fnX6O/1Tflax0h0A7uWvaUctFVsyd41
         JXCQ==
X-Gm-Message-State: AOAM5332KhDbYon9MdxNtMaEP5u+kJWYaOyirPGA7hFN9hVtN4tI5xeb
        ex+qWVkABu9zFfYfGpgMBRfcOg==
X-Google-Smtp-Source: ABdhPJwNvpjXZvbQU6g7wjNgnoVbgz3Mp2hAPG78kyDAB2zTU2kIZslfSDvTCVCFcKRBifG7V9eRQg==
X-Received: by 2002:adf:f289:: with SMTP id k9mr35382390wro.0.1604507081265;
        Wed, 04 Nov 2020 08:24:41 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:40 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andrew Duggan <aduggan@synaptics.com>,
        Arjan Opmeer <arjan@opmeer.net>,
        "at www.cypress.com" <ttdrivers@cypress.com>,
        Benson Leung <bleung@chromium.org>,
        Bruce Kalk <kall@compass.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Dan Murphy <dmurphy@ti.com>, David Jander <david@protonic.nl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dudley Du <dudl@cypress.com>, dusonlin@emc.com.tw,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ferruh Yigit <fery@cypress.com>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        KT Liao <kt.liao@emc.com.tw>,
        Kumar G <naveen.gaddipati@stericsson.com>,
        linux-input@vger.kernel.org, Peter Osterlund <petero2@telia.com>,
        Phil Blundell <pb@handhelds.org>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        Sundar Iyer <sundar.iyer@stericsson.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Subject: [PATCH 00/20] [Set 1/2] Rid W=1 issues from Input
Date:   Wed,  4 Nov 2020 16:24:07 +0000
Message-Id: <20201104162427.2984742-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the first of 2 sets.

Lee Jones (20):
  input: rmi4: rmi_bus: Fix misnaming of
    '__rmi_register_function_handler's 'owner' param
  input: mouse: cyapa: Fix misnaming of 'cyapa_i2c_write's 'reg' param
  input: mouse: cyapa_gen5: Fix obvious abuse of kernel-doc format
  input: misc: ab8500-ponkey: Fix incorrect name in 'ab8500_ponkey' doc
    header
  input: rmi4: rmi_f01: Struct headers are expected to start with
    'struct <name>'
  include: input: elan-i2c-ids: Mark 'elan_acpi_id' as __maybe_unused
  input: keyboard: cros_ec_keyb: Struct headers should start with
    'struct <name>'
  input: rmi4: rmi_f11: Struct headers are expected to start with
    'struct <name>'
  input: touchscreen: resistive-adc-touch: Struct headers should start
    with 'struct <name>'
  input: mouse: synaptics: Place braces around empty if() body
  input: keyboard: gpio_keys: Fix misnamed function parameter 'dev'
  input: mouse: elantech: Demote obvious abuse of kernel-doc header
  input: rmi4: rmi_f54: Provide some missing 'REPORT_TYPE' enums
  input: rmi4: rmi_i2c: Provide some missing descriptions for struct
    members
  input: touchscreen: cyttsp4_core:  Move 'cyttsp4_tch_abs_string' to
    the only file that references it
  input: misc: drv260x: Fix kernel-doc formatting and remove one abuse
  input: misc: drv2665: Fix formatting expected by kernel-doc
  input: misc: drv2667: Fix formatting and add missing member docs
  input: keyboard: nomadik-ske-keypad: Provide some missing struct
    member docs
  input: keyboard: pmic8xxx-keypad: Fix kernel-doc formatting

 drivers/input/keyboard/cros_ec_keyb.c         |  5 ++--
 drivers/input/keyboard/gpio_keys.c            |  2 +-
 drivers/input/keyboard/nomadik-ske-keypad.c   |  2 ++
 drivers/input/keyboard/pmic8xxx-keypad.c      | 22 ++++++++--------
 drivers/input/misc/ab8500-ponkey.c            |  2 +-
 drivers/input/misc/drv260x.c                  | 26 +++++++++----------
 drivers/input/misc/drv2665.c                  | 10 +++----
 drivers/input/misc/drv2667.c                  | 14 +++++-----
 drivers/input/mouse/cyapa.c                   |  2 +-
 drivers/input/mouse/cyapa_gen5.c              |  4 +--
 drivers/input/mouse/elantech.c                |  2 +-
 drivers/input/mouse/synaptics.c               |  3 ++-
 drivers/input/rmi4/rmi_bus.c                  |  2 +-
 drivers/input/rmi4/rmi_f01.c                  |  1 +
 drivers/input/rmi4/rmi_f11.c                  |  5 ++--
 drivers/input/rmi4/rmi_f54.c                  |  6 +++++
 drivers/input/rmi4/rmi_i2c.c                  |  4 +++
 drivers/input/touchscreen/cyttsp4_core.c      | 14 ++++++++++
 drivers/input/touchscreen/cyttsp4_core.h      | 14 ----------
 .../input/touchscreen/resistive-adc-touch.c   |  2 +-
 include/linux/input/elan-i2c-ids.h            |  2 +-
 21 files changed, 80 insertions(+), 64 deletions(-)

Cc: Andrew Duggan <aduggan@synaptics.com>
Cc: Arjan Opmeer <arjan@opmeer.net>
Cc: "at www.cypress.com" <ttdrivers@cypress.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Bruce Kalk <kall@compass.com>
Cc: Christopher Heiny <cheiny@synaptics.com>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Daniel Kurtz <djkurtz@chromium.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Jander <david@protonic.nl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dudley Du <dudl@cypress.com>
Cc: dusonlin@emc.com.tw
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Ferruh Yigit <fery@cypress.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: KT Liao <kt.liao@emc.com.tw>
Cc: Kumar G <naveen.gaddipati@stericsson.com>
Cc: linux-input@vger.kernel.org
Cc: Peter Osterlund <petero2@telia.com>
Cc: Phil Blundell <pb@handhelds.org>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: this to <linux-input@vger.kernel.org>
Cc: Trilok Soni <tsoni@codeaurora.org>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
-- 
2.25.1

