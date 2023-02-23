Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5A36A120B
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 22:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjBWVbx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 16:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWVbw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 16:31:52 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4761018162;
        Thu, 23 Feb 2023 13:31:51 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id h16so12399510qta.8;
        Thu, 23 Feb 2023 13:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxIk/b92QK4riANPKvd4rKLMx3a2K85sWfF4D+Sp380=;
        b=bVGEf3btKWqaPzyweK4hcmPHlrLZMgb1pH/rQzR/hP7Rsi0GIn+rGpYGBmuGnn8i5/
         KiF0vdTmyqT9U6G3Qj5YdQe3k6BaSKxHBih5PTwfBjBATzAUk3Sf/T19FRA5AgfIUQBG
         JrjcByKewqr/XuJ7p8mpmKifgzPRKEqG9N+1OsEbvDmmOAsUbeI2fgCAIaW/ynFQNqMF
         BYMNolzAXEMQwQfB8VYdO+89G/Xh8dSW3QAaA/u6upywqYisz2fwpn/4scZz9fiSubtV
         nTfRYaAW3Ig19zhhuLero7t34lbYOtDZib3bpPaijDR2dbQw7ZSFYjQy+ofYhi0ug2+h
         akQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxIk/b92QK4riANPKvd4rKLMx3a2K85sWfF4D+Sp380=;
        b=ylAzbkpiqMzVg3OuP1Ir2h3mY0khiN7sCDmrjd0xE2RkogC3Qo1WeFqs66kApxBtMK
         iW80u2Uz8VgPldtDdbMlUe9fuhj8bBGnjuTRCAH6SYj+p0T4gX4jVyZbjRCXf8PTiyMB
         PkaQ15knOB6EsCkiQams+FHK84Byor7psDwAmQTBUJbyELyCq0ZQTguDv/oVXJfvtZrm
         IQODerN5tL+9gRRHhm2OMY5r/tdttR9E3tN7/Ue6cmvayGqWz1hj+erpEG4WRUyWx1rX
         ikajzlhBIJg7okYcZxT3MbeDRf7voUtclH8fsZuXRSClf31htCWefr1p4Nc0Lrv65JVb
         pibg==
X-Gm-Message-State: AO0yUKWLYQ3GuHTu+YBfDaWnmk0WIrjiO+NeCShlHxbfz/qCiz8bfW7V
        hq9WzDDwKGztuwLFbLZiowEcW/hyOUCFvw==
X-Google-Smtp-Source: AK7set+ztvquxm3EUpWpXwvP3cOuQdkVbN9Lgr3Nb7EX2frI9tldalb/WeBVD3Z7pwN+5QAb8vZ25A==
X-Received: by 2002:a05:622a:1a21:b0:3bf:a760:cb5 with SMTP id f33-20020a05622a1a2100b003bfa7600cb5mr16258286qtb.4.1677187910217;
        Thu, 23 Feb 2023 13:31:50 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id j187-20020a3787c4000000b00739e7e10b71sm3475394qkd.114.2023.02.23.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:31:49 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v7 0/3] Firmware Support for USB-HID Devices and CP2112
Date:   Thu, 23 Feb 2023 15:31:44 -0600
Message-Id: <20230223213147.268-1-kaehndan@gmail.com>
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

