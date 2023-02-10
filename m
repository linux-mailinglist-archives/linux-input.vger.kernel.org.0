Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE36692A3D
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 23:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbjBJWgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 17:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbjBJWgg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 17:36:36 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3421EC0;
        Fri, 10 Feb 2023 14:36:35 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id cr22so7571576qtb.10;
        Fri, 10 Feb 2023 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGGpQxrQxf9MLv7eaykMgwYmRhcdWksEEnXkiPcX14E=;
        b=bpJBHEZWcHsjnWdJoc6VWQxnkYKpB0FPRzcpYubKBN96lAd/H3MN4IyS+B/cfrtyDS
         kysnC7+SFuJr07scFLG8L8aphJ5PYt2IZbLZgYFSQEa6Ula3sjsH0cDPGsxtfsN/Pow1
         n26VnPHllHYjIl3ikj/CwI7GFAORLkCinXCnmTYjXQIRkf//dqLcjZUsUigky2SzPmuU
         mAp51yyLpemZSd1UM6Zwc2iQ4G9BxW5pi3mbyXSdBKiv/zyL6sHm0aAvClkYAMCYUu/j
         NlvqqejexGAwN4F2wJrgBWerUQehj3p20cNTQ9R10CVwck8GeOLicKAgjaVcIMIfDIlV
         I4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGGpQxrQxf9MLv7eaykMgwYmRhcdWksEEnXkiPcX14E=;
        b=hv5jrqaU1QbqBT/VRF3yrj3lxL1PlcxAaX342SGgp03qalCKrToC7lXo4izDEFCD0c
         2u55ibV5hPCGs6/BPCSZCHQWUyGEJEhKXX21+X93tq8MJIgI2V1ApGo4jdreS6f6B9q1
         Dyjr9Tl9p5EaTd9V/lyWfTnVaiWpYUzlga6+1SKC1xkBclKKs6vSoi3YkZJ1oNJ+qYxs
         AGP79XicCRbBcxaPQfc8e8TW8flxGxqYWKnUL9K8ol4Gv0hzV5C7u/1KF6WinWtnPGE3
         T36A+n42rVa1l9UrS3Eg2pZ85N8gylSbSkyF63SwG8i6Ieul3tfK3fHQndIUQAGWEGmX
         C3AQ==
X-Gm-Message-State: AO0yUKUTl1AwKjDSspbN8ypPE3FZR/A6YTV22ujJBUwybovpOka0i16Z
        cYCmbQh+GfWYdyGl0hwSeF9dzOdY3ny68g==
X-Google-Smtp-Source: AK7set83tuDLz/B4qxq8hNo5+vsrynRm78m9EZYWu6KaydPBfoVYtwP6/Pk4aS6VzydjGPVmsB6fhQ==
X-Received: by 2002:a05:622a:2c7:b0:3ba:2722:e8d7 with SMTP id a7-20020a05622a02c700b003ba2722e8d7mr26310874qtx.7.1676068594256;
        Fri, 10 Feb 2023 14:36:34 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id o5-20020ac80245000000b003b64f1b1f40sm4166063qtg.40.2023.02.10.14.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:36:33 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v5 0/3] Firmware Support for USB-HID Devices and CP2112
Date:   Fri, 10 Feb 2023 16:36:35 -0600
Message-Id: <20230210223638.12796-1-kaehndan@gmail.com>
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
be described in firmware and interoperate with other drivers.

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
 drivers/hid/hid-cp2112.c                      |   6 +
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

-- 
2.25.1

