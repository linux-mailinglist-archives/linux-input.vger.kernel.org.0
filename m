Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820B967FACB
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 21:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbjA1U0M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 15:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA1U0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 15:26:11 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C1411674;
        Sat, 28 Jan 2023 12:26:10 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id jr19so6973642qtb.7;
        Sat, 28 Jan 2023 12:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P38nkYr7bVSnQ/H/Vpc3pcdK//hX8r4owD23WxSwUuo=;
        b=NNf9FVXPbAUHEH9KozmU33JWehbHYV42nVd5M4EZVh+8BQs+/52obsYgTll6f2sdMK
         LtKzoColyFQbDbbA6NcNdn5PgMphnDZT4e7rZKvoxtVWtrvenP+gAdMcwMcOrawpTxNk
         u5HQJdgFiTA/Ub4kPxSBdRorj5D2RGiGcXrNl3CeyTtdQrOYjXC5Zz50ROTVYDk70AEM
         EMULEKqtukI3bAAfzmrUC/fC6QXoXguz/AUxa4ne1vwtPSrVuP1N1FKnGj1i3SOfr30y
         cF8e/WnBAo/0viPbUHBOMAyAaT/zx6+tIi+iRwo1aZrNrsnSh8UwNOreY3pCz2JwwM8G
         6tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P38nkYr7bVSnQ/H/Vpc3pcdK//hX8r4owD23WxSwUuo=;
        b=cPFgOPVEV47CN+W1aanc5kgykzxkicxT/wr8BIp7AUr/y3hm4WJ80m3T2Ym/tM6pyK
         EidhfpNj0l8/gLTvyddtwVtBjvLh9rZ1NRu+xpIp/YvOrwl/Mfq/fzlp54olRj6Jx9T5
         WES4M3GIA7yrEV/dCSf+x+2vN6HmYsehwIKa3fjZ1dBfGYu+GhGgO/8K486+1grpP1K8
         3CxbQkwoesQv98gTJ/W5d0+wbbwQl+AOcoMgDdh2jWgt29/tvwFQAfMRI0LVzCPjD/a6
         vhwUY0uM+RdHxn0h2/FvTu5Kc4b4u/gSnupQI71cWYiIpjuNUfR3/w/ZJoZMcQvBSmr2
         ucyw==
X-Gm-Message-State: AO0yUKUpPmTrQdTd+4EXgSF2IOeeKuJN1h7+19j0i/RLlIMgQB07ABCY
        Z/3/gX6J+GwiYAwrAW3C5mY=
X-Google-Smtp-Source: AK7set8DkI2a5r4UZYytvdX4PK6facivD7jG+1vWeFqaL7eN+vCtn5lkjBxPWh4l64BjIu/Ya6sqbg==
X-Received: by 2002:ac8:7d41:0:b0:3b8:4b00:575e with SMTP id h1-20020ac87d41000000b003b84b00575emr3719625qtb.35.1674937569359;
        Sat, 28 Jan 2023 12:26:09 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm52460qkn.49.2023.01.28.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 12:26:09 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH 1/4] dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
Date:   Sat, 28 Jan 2023 14:26:19 -0600
Message-Id: <20230128202622.12676-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128202622.12676-1-kaehndan@gmail.com>
References: <20230128202622.12676-1-kaehndan@gmail.com>
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

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT
using the subnodes named "gpio" and "i2c", respectively. This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hid/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
new file mode 100644
index 000000000000..49287927c63f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hid/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <kaehndan@gmail.com>
+
+description:
+  This is a USB HID device which includes an I2C controller and 8 GPIO pins.
+  While USB devices typically aren't described in DeviceTree, doing so with the
+  CP2112 allows use of its i2c and gpio controllers with other DT nodes when
+  the chip is expected to be found on a USB port.
+
+properties:
+  compatible:
+    const: usb10c4,ea90
+  reg:
+    maxItems: 1
+    description: The USB port number on the host controller
+  i2c:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+  gpio:
+    $ref: /schemas/gpio/gpio.yaml#
+
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      usb@1 {
+        compatible = "usb424,2514";
+        reg = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        device@1 {	/* CP2112 I2C Bridge */
+          compatible = "usb10c4,ea90";
+          reg = <1>;
+
+          cp2112_i2c0: i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* Child I2C Devices can be described as normal here */
+            temp@48 {
+              compatible = "national,lm75";
+              reg = <0x48>;
+            };
+          };
+
+          cp2112_gpio0: gpio {
+            gpio-controller;
+            interrupt-controller;
+            #gpio-cells = <2>;
+            gpio-line-names =
+              "TEST0",
+              "TEST1",
+              "TEST2",
+              "TEST3",
+              "TEST4",
+              "TEST5",
+              "TEST6",
+              "TEST7";
+          };
+        };
+      };
+    };
-- 
2.25.1

