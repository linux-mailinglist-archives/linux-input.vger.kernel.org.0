Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979F36A43BC
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 15:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjB0OII (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 09:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjB0OIG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 09:08:06 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B2D6192;
        Mon, 27 Feb 2023 06:08:01 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id b16so2563905iof.11;
        Mon, 27 Feb 2023 06:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGmrflLrMKHCp5mBwrPIGybnzhtwdume4dOCaAVsnbs=;
        b=jcnEliIg6h/kqWte6NGlcRHH9hcUwP93+aFcBDn4tAal9oPdnnxKYxH0J4TMXOAAft
         tj5zdIvn+kGwejIrHsA1Lrr03AwZ6IaAeVZwgbLJy1KSLmUFYLjExUj00hna8pXl70p5
         k95ryuGEJ9lrdoWcNAJkqTBVzio0a+CRXq3hshpz5CY0kXNNmqY5QQgsAv/Fq2kohCUQ
         yyZr4XekMpiqTtdeOQWuamP/03dRBJzcnbDVCikxK7c2IgdsC416+2YAXshoo2rqXXfN
         ssoZNl2yIjIMDCRyDlXW4mQ1CWGCJpkZbiFYOSRV8tB9OGNlBRLZoEKYIWzfsvXqva18
         JL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGmrflLrMKHCp5mBwrPIGybnzhtwdume4dOCaAVsnbs=;
        b=QO0a0JKEJzufPQnTD8iejjeM8DnuvMgXKYoHx1BLq8oenmAp/8PNocCs2HS6rtuUXz
         0LKRiic/pmZL9CeJBixIJABfeL85D1Aw79GL8AlI8KTVXrs5Yg8o/pl/mYJWYjKTGljO
         ywItALxLXbOwEUnfg3vZS5ThbZtUOlkE283VP8QkLRV3YG4Ihf6EWcI/9MH8xo7twb8/
         ojJ7MFarBFGgONUfbo6lR3l6iTzFQWcPwWOyXrShJKrywQ6TzzByH5WGRHB4V9s3kT7R
         mbzVnEKlV0lI4Z53WQ+qqykbsISu0bTxolkJ3ZTg7JKz+ywqW1nhq+mN4SqcZuIiyR4V
         7Gww==
X-Gm-Message-State: AO0yUKU8oLjflj7MNqSS9AzWKqsRaNVo+8Yrdq43fTjvZqled8uhxI8R
        BQwUZj4OcYBh/IAuSSr8DI4=
X-Google-Smtp-Source: AK7set/Gt9Xx73ksbAWAbUK1QYnH+5J4wCY3TaWQbFFemDdGlXXE+Ydw2gs4QJ6p0rKToQkVrc5xWg==
X-Received: by 2002:a5e:9416:0:b0:74c:7db1:7894 with SMTP id q22-20020a5e9416000000b0074c7db17894mr16843399ioj.0.1677506880618;
        Mon, 27 Feb 2023 06:08:00 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id 14-20020a056e020cae00b00316dc3afe57sm1921503ilg.86.2023.02.27.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:08:00 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v8 0/3] Firmware Support for USB-HID Devices and CP2112
Date:   Mon, 27 Feb 2023 08:07:55 -0600
Message-Id: <20230227140758.1575-1-kaehndan@gmail.com>
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
the USB fwnode with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and interoperate with other drivers.

Thanks to all for your patience in working with me on these! I'll have
many lessons learned for future submissions.

Changes in v8:
- Apply Review tags retroactively to patches previously reviewed

Changes in v7:
- Use dev_fwnode when calling fwnod_handle_put in i2c_adapter in hid-cp2112.c
- Capitalize I2C and GPIO in commit message for patch 0003

Changes in v6:
- Fix fwnode_handle reference leaks in hid-cp21112.c
- Simplify hog node pattern in silabs,cp2112.yaml

Changes in v5:
 - Use fwnode API instead of of_node api in hid-core.c and hid-cp2112.c
 - Include sda-gpios and scl-gpios in silabs,cp2112.yaml
 - Additional fixups to silabs,cp2112.yaml to address comments
 - Submit threaded interrupt bugfix separately from this patchset, as requested

Changes in v4:
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/i2c

Changes in v3:
 - Additional fixups to silabs,cp2112.yaml to address comments

Changes in v2:
 - Added more detail to silabs,cp2112.yaml dt-binding
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/input
 - Added support for setting smbus clock-frequency from DT in hid-cp2112.c
 - Added freeing of of_nodes on error paths of _probe in hid-cp2112.c

Danny Kaehn (3):
  dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
  HID: usbhid: Share USB device firmware node with child HID device
  HID: cp2112: Fwnode Support

 .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  15 ++-
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

-- 
2.25.1

