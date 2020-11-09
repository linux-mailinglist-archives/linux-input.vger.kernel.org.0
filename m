Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C490F2AC758
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 22:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbgKIVhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 16:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgKIVhY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 16:37:24 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFF0C0613CF
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 13:37:24 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c66so3686938pfa.4
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 13:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b1NwiXOXlnIKNGIq2jOgXwU9+Xz/K9vApGe2ajZ4L/M=;
        b=R4dcTpQUd2iqX73ACvGUPmT1VVIUx3/A6Qxo4tCla0hRau8MucwhNWUtToscfnQYhX
         sWxS1M5Ppcfib6j2cLE1xYgwwzBSW6wEjHPoKVGK0hh4+OBvnLSMKzacFIKjJBbVgaIx
         UmMbG7zv/R+3Ny7vDuqY6mgL0gaF77Vf1ckdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b1NwiXOXlnIKNGIq2jOgXwU9+Xz/K9vApGe2ajZ4L/M=;
        b=a0gFmbFUY0lU57Fxbjdo8CyGB4/+zhUcoEZizP/BJ7r2C5aEl5pxF4vf6aPqpN16eJ
         Xz0kVIn4wGmxYRqq9mz0Et1/G+AOhRKr+cmlaD8M2Ur85ZKjullkRsqGOztlYQOM8zmV
         6F6RlXgKHU2ck5drdN2KXbiao1+Ocy6TNv34WwGy0sDsYnfTFVLDcyPYHo49PBn41F4n
         lbHJnAirE7GUF6a1HC0S5tg9apiTSZJFHTNRtTrZj2zD1VSmQp4Pm4Pbz8bDBg0sfnlz
         IYq31O1ygJn13EJhdblHsp/PgOJNgE8B5cSr+YwtgYBNvCL2nXwio+VhgSQfsxrpdQM6
         5xhA==
X-Gm-Message-State: AOAM532xFq1zqrlx0her1t0ORXL4KG47rnn37i1BrzxJNA6sixKOgFOT
        2XioUzKxJLuyXRIFMrdul/5eQA==
X-Google-Smtp-Source: ABdhPJzzLRXx56fIwabSNEYhOPA3YuOpDVtH42rriiwwfcNJKtY0Z3PUX3P7l9sEgtfXBOPAQpgwAw==
X-Received: by 2002:aa7:868f:0:b029:155:dcd2:7320 with SMTP id d15-20020aa7868f0000b0290155dcd27320mr3869685pfo.53.1604957843517;
        Mon, 09 Nov 2020 13:37:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i10sm11895444pfd.60.2020.11.09.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:37:22 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kai.heng.feng@canonical.com, hdegoede@redhat.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>, Pavel Balan <admin@kryma.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
Date:   Mon,  9 Nov 2020 13:36:32 -0800
Message-Id: <20201109213636.1267536-1-dianders@chromium.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


The goal of this series is to support the Goodix GT7375P touchscreen.
This touchscreen is special because it has power sequencing
requirements that necessitate driving a reset GPIO.

To do this, we totally rejigger the way i2c-hid is organized so that
it's easier to jam the Goodix support in there.

This series was:
- Tested on a device that uses normal i2c-hid.
- Tested on a device that has a Goodix i2c-hid device.
- NOT tested on any ACPI devices (just compile tested).

Changes in v5:
- Add shutdown_tail op and use it in ACPI.
- Added mention of i2c-hid in the yaml itself as per Rob.
- Adjusted subject as per Rob.
- i2chid_subclass_data => i2chid_ops.
- power_up_device => power_up (same with power_down).
- subclass => ops.

Changes in v4:
- ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.
- Fully rejigger so ACPI and OF are full subclasses.
- Totally redid based on the new subclass system.

Changes in v3:
- Fixed compatible in example.
- Removed Benjamin as a maintainer.
- Rework to use subclassing.
- Updated description.

Changes in v2:
- ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.
- Get timings based on the compatible string.
- Use a separate compatible string for this new touchscreen.

Douglas Anderson (4):
  HID: i2c-hid: Reorganize so ACPI and OF are separate modules
  arm64: defconfig: Update config names for i2c-hid rejigger
  dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix
    GT7375P
  HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core

 .../bindings/input/goodix,gt7375p.yaml        |  65 +++++
 arch/arm64/configs/defconfig                  |   3 +-
 drivers/hid/Makefile                          |   2 +-
 drivers/hid/i2c-hid/Kconfig                   |  47 +++-
 drivers/hid/i2c-hid/Makefile                  |   6 +-
 drivers/hid/i2c-hid/i2c-hid-acpi.c            | 170 ++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c            | 252 +++---------------
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 120 +++++++++
 drivers/hid/i2c-hid/i2c-hid-of.c              | 147 ++++++++++
 drivers/hid/i2c-hid/i2c-hid.h                 |  25 ++
 include/linux/platform_data/i2c-hid.h         |  41 ---
 11 files changed, 615 insertions(+), 263 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
 delete mode 100644 include/linux/platform_data/i2c-hid.h

-- 
2.29.2.222.g5d2a92d10f8-goog

