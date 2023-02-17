Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB7469B287
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 19:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBQStJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 13:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBQStI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 13:49:08 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B8E2BF17;
        Fri, 17 Feb 2023 10:49:07 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bg20so1650016oib.9;
        Fri, 17 Feb 2023 10:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2R5BouqDUnzY018CGf0maQsVNpuPP/EQMpL3MVfNkpE=;
        b=BT+mVUL9ZxnQ7zUCYoDPXJqiIMKBZdUfV1aSaI07PY96VtS0Lj94wx32PudSTZnGr8
         a6qH2i/ajLhL4lK23BaVxJrfwgL5M+brXN1NN7qxHfj2jFbG+aN4mt/n/Ai82+neuKDi
         IFi7+l7NAwr/1m/tUvDyyGobCXSOA0g/UrmsM+FwULGFGoCDW9kO/Hi2Fdtg81wI3Bre
         SXYuh7nwPbuP1mbJB8DBgMzi1YbgaGDFOX3KsmeDBmDH8WpLkkgyyoLq0AjQXupB0VbT
         bNK9vX0MXVxGtN09EzV5VcF0XAy/hPIiYqCJA8ooMjo5W8gZHSYTGvPfMc9/U1v24iz/
         7TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R5BouqDUnzY018CGf0maQsVNpuPP/EQMpL3MVfNkpE=;
        b=ZvYQTJqVrRka3EsmovV9b0V4DYIoELgZBSuVcPeeD+cLZtnkI+nFrQtX37jGYiflET
         Qg9CiXHTe0uTIlwXMRRPCdmuDoAxEPbuzwu3j1naPuR1ZltRHxG+07ynH6N4cCu/J90z
         VSqWBym/GmJUhbT9si4RrATSHHZ+5NBQFlkqLpukykunzHaDU067Sut3qRWSsXuaa69p
         YGfrippiyd8H/rDTODcsccDNsqy7Ku6xAqS2eV0oMkBWMOePvZAO/7OuuSjHrUAU+soW
         M/T99zmpwSy0QA3mWcbWltLg6vrJfr7z1UConRpQvdREGbqk6LBuVgi2Fo3odeUDq0a6
         g7OQ==
X-Gm-Message-State: AO0yUKWCQCm9r1I6zFjJRotU5YaMnegOrd3dTVXOaLmp9HyrWPA6BTEH
        7bR90/ynrlvpDgYELSeTwWI=
X-Google-Smtp-Source: AK7set/ruCpvBTql1zrsBXT2gnK2VAEnVOkBfYEEDzWlDNNGsEMgjB0C45IWrCOqL+aePx5CgQme4A==
X-Received: by 2002:a05:6808:87:b0:378:3ab3:5a0b with SMTP id s7-20020a056808008700b003783ab35a0bmr892674oic.40.1676659746194;
        Fri, 17 Feb 2023 10:49:06 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id s22-20020acaa916000000b0037fa61eb1dasm1198521oie.47.2023.02.17.10.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:49:05 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v6 0/3] Firmware Support for USB-HID Devices and CP2112
Date:   Fri, 17 Feb 2023 12:49:01 -0600
Message-Id: <20230217184904.1290-1-kaehndan@gmail.com>
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
be described in DT and interoperate with other drivers.

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

