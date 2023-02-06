Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBA968BEB5
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjBFNus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjBFNud (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:50:33 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A012658F;
        Mon,  6 Feb 2023 05:50:16 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id x10so5754405qtr.2;
        Mon, 06 Feb 2023 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTJAonsBWFkgohMI/qo2XZ0rGLhHVajHhEhE2HgMY0o=;
        b=jKA6Xu0Uim9ptTa69MCzJ+vxRMEEa2YJk433c6qOuvu427QSX3BJARKy/agKD/cywo
         SXg0oUoasFEeFakFULwhzzxdxdLGYLZd0OR5urXFQ4+0IRur0SXSStIx3iMmgRJm1eQk
         VD/eUmMjrP0Ou1NLjOdLnh8o14maLOrrzNbN8Y7LEzxl5HNJd1SOK07VVY+2hyjvMmI3
         FE0XOqrylu2isVY3ySK8sSRMd4QVIgityk2VGNRO4bhg8XXI8qUKwwRQKGPJ7zWHfF8u
         UfgKLVfp3yFaeIp5D2jKu3q7zkr51/D92R4Ihnaf/gRjDd9Q4rVrjYooHuX8G7WvXS0f
         NZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTJAonsBWFkgohMI/qo2XZ0rGLhHVajHhEhE2HgMY0o=;
        b=qPm03noZyUmos80jC1GPIbG3FgszsKkhdA5ipi7ExK1SetAJi0FemZSNhN3crhGzfJ
         Wj5/y4ANGqZ35Qy4K7aWFQ8SEDDInEK+cMpew9H2evsyGDhyLNk0oCIRzLvUl/agfB2b
         tnfvJH7E2ScNWh9ttwM1EDVV/MvgxuTbuMQn6WLbDr7apbFPgkPcldlEftxNmS6h8Jpj
         mSkcN5Pv0eSKGEFIvKW1Zr42SRSJAcigDzgRXEVAEYJHfY0LuUza5pZ3auefc2yR2p6i
         f+mevsicBYhNXpxjJSIVoCu9TcnX8F8I2+KYgdOOkMTkr3KVpv03d/jlBRQh3oeWrq8Y
         WFsg==
X-Gm-Message-State: AO0yUKX1weWaWSnw0NJ+TsW6VDXpkq04UVVeQrRTZBdAMIv5CwXy7ahI
        vHjUQxUJVzE1tT4Pr8m2Qsmx9rV8uTwQ6w==
X-Google-Smtp-Source: AK7set8ZNcZBwGlTcD0petW0eKht2pceqVrRxHs3KJIrU1tasswkct9TeC9v6VMhymgi91OjrLtIbQ==
X-Received: by 2002:ac8:7c54:0:b0:3b8:6b19:7f95 with SMTP id o20-20020ac87c54000000b003b86b197f95mr36931145qtv.19.1675691415645;
        Mon, 06 Feb 2023 05:50:15 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id ed4-20020a05620a490400b007195af894e7sm7349492qkb.76.2023.02.06.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:50:15 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v4 0/4] DeviceTree Support for USB-HID Devices and CP2112
Date:   Mon,  6 Feb 2023 07:50:12 -0600
Message-Id: <20230206135016.6737-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset allows USB-HID devices to have DeviceTree bindings through sharing
the USB of_node with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and interoperate with other drivers, and exposed the threaded
interrupt bug fixed in patch 0003.

Changes in v4:
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/i2c

Changes in v3:
 - Additional fixups to silabs,cp2112.yaml to address comments

Changes in v2:
 - Added more detail to silabs,cp2112.yaml dt-binding
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/input
 - Added support for setting smbus clock-frequency from DT in hid-cp2112.c
 - Added freeing of of_nodes on error paths of _probe in hid-cp2112.c

Danny Kaehn (4):
  dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
  HID: usbhid: Share USB device devicetree node with child HID device
  HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
  HID: cp2112: Devicetree Support

 .../bindings/i2c/silabs,cp2112.yaml           | 112 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  23 +++-
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 135 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

-- 
2.25.1

