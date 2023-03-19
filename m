Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67DD6C04E4
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 21:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjCSUsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 16:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjCSUsI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 16:48:08 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961406EAC;
        Sun, 19 Mar 2023 13:48:04 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id h19so11137125qtn.1;
        Sun, 19 Mar 2023 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679258883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atQJ6HzIbpVdFiySXVvC8dPG3uoFuY3x7RZCVWG6MfQ=;
        b=b5TIfQh5cCLOGFhiTtZkU0Rcj3xrdW4wyDu0ZW/s57+J96pqx7VD22ypNlSd57LeGW
         ZkmCKHOw3Phqghe2EtubzJQ1UQaur6DETABnFtnmKiXFAcBI774tw6YRyGcZ75Xa62eV
         dBapH1HcPxhDPacUhIxY/2ovuVnCUtzqn28tWzVvNTuy3Aq7pxji2ylnNvbA1HUVYdoY
         8MIFyhiCOEMM8rA2LqhtCRv4znrWObcD/EsA2Ynps4504bEpQiCEVjkARbhrxEOmA9Qu
         +Ps0US7aQtcmUnxLUoD4zrccj32k7PQPy2VcIeCIER3a41awVJYJxL34dpaHQm9SfFoi
         dU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atQJ6HzIbpVdFiySXVvC8dPG3uoFuY3x7RZCVWG6MfQ=;
        b=WiGR1+RbP2bdfL842D52a6WeWe8qWg/iXrWuqGk7PyLAcZwl/dna66rxjNO9kUIAM0
         VBTxRkvpQ+D3EXRU7blaBrrJY/8cZhwe2bovY0ojBoiXb/6PjNf/xFw0flMYfYW2/zGg
         IgdiUUSHQ4O/eZIVpO2YL3dnJ7e7Dt5SNmk+dREurxYahWYIEvjV038hUSu+ttu2r1j7
         B7DYpVq34ve40DViLzK+52GRvbUzqGJjM57PUYKs0eC1npRCeG4GRXwp+xgWIIiy2xE6
         0z6r3GMw6nbm1M9uhqwkN3LtX3Lnh9X7aXP7zBHIeVhj/GOj+mn5VFC22DdfLMfY2b+9
         GzAA==
X-Gm-Message-State: AO0yUKVmaH3jd0gj904Y1KM7EWDtUiUkLmO0DzlA6gtIWY7dPLFGVbT8
        c13An4FhZA1dS4D6SB/VXtw=
X-Google-Smtp-Source: AK7set8at/lxWBnbO3fDJDNASobxDV9HXu5oCBrK00m8FB2FyWIHzA9+uE14VPxF/sQg6Or/yM0fRA==
X-Received: by 2002:a05:622a:449:b0:3d6:ff99:7e9e with SMTP id o9-20020a05622a044900b003d6ff997e9emr24898954qtx.33.1679258883502;
        Sun, 19 Mar 2023 13:48:03 -0700 (PDT)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id m24-20020ac866d8000000b003b7e8c04d2esm5186021qtp.64.2023.03.19.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:48:03 -0700 (PDT)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v9 0/3] Firmware Support for USB-HID Devices and CP2112
Date:   Sun, 19 Mar 2023 15:47:59 -0500
Message-Id: <20230319204802.1364-1-kaehndan@gmail.com>
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
be described in DT and ACPI and interoperate with other drivers.

Changes in v9:
- Add _ADR-based ACPI binding of child nodes (I2C is _ADR Zero, GPIO is _ADR One)
- Use a loop-based approach for assigning child nodes within probe().
    As a consequence, hid-cp2112.c no longer maintains references to the
    child fwnodes during the lifetime of the device. (plese correct if this
    is actually needed for this use-case)

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
 drivers/hid/hid-cp2112.c                      |  18 +++
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

-- 
2.25.1

