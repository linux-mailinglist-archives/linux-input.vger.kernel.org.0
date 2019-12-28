Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF6F12BED0
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2019 21:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfL1ULZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Dec 2019 15:11:25 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33570 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfL1ULY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Dec 2019 15:11:24 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so22906034lfl.0
        for <linux-input@vger.kernel.org>; Sat, 28 Dec 2019 12:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zh8S/4W0ztEaOCn11DyhGNjQj/bRNp6ULAbdfdJJfMM=;
        b=TBi5LQOED8JDNv5C6um28CrR7N2BYkuKI4C60P7VIYXDNfqMIVHl5A3KX4mQKnuhdq
         PSeFg48eT8NnQFPGTwh/rnYJEENx7UmiPqodxVpXgvWbsuU8BCk9qK/dqY0Wyde4hWXs
         lJgpyIfh8aYkuDWLL1OqMNeMqjbLGCvuh4empOZoagah+sgw97WGY1RnwbM3XM7n+JXQ
         l8/iD5mYAOkV2sz6mHUVhDUrVV5M3cxc5Rh2wuU2Vc8Vd26Ff+vYNE6FXAeiekWOxzPX
         0w9NI/Voia8QmNPVgz8u2a3RroPJaIjR31qyOUw7LVDBgbXMpSmWDq/9CsfiEN1MQTYS
         KJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zh8S/4W0ztEaOCn11DyhGNjQj/bRNp6ULAbdfdJJfMM=;
        b=o3armRbqfj8VgN3AtrAc1ksJZ/mskCcwNIfwlGDPbyKtTaslACEcTP73xoBe9hUrI2
         g9jyTbgp+zZ61FraySv/Z2K7Rc7RgAFKiXdlFRQQ+9uREFrVRxwOqZNgUyJ1eutBg3aR
         Ed2xF4QOUVd0AMZImwNL0wEF8nVZYBiICtwcfVcMq3ZPSdMrkHjKdfRi5Wqhu1/WXHo8
         VO89hOtj1FHF3Zo1NMtNoqcBA2GVIuu+VZx669DfR5cWLE2yUOpjcN1uW8l8RKmCmLLF
         9e7gxMiYdYL0JmTIPQoNeQj295SGm5NeLbqyqoekNSQKSgRM/+zznZBZMCLNsvK9hVLW
         1wIw==
X-Gm-Message-State: APjAAAX16XXaOkWXwwTgziJ9XggKjsEHrsz9n7YI4Sk/ttQoZ0PCcg12
        U3Hgq/V0OcLH6LjcT2TsuhlsCw==
X-Google-Smtp-Source: APXvYqwpNVB4U4z1e7+NgxCEHqp1dDo58dJk92Bon+JiAdSe7JzBsZzsK2jl5tZLYcN6yjcxkaeZRA==
X-Received: by 2002:a19:c7c5:: with SMTP id x188mr32486605lff.22.1577563881848;
        Sat, 28 Dec 2019 12:11:21 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id r15sm2590064ljh.11.2019.12.28.12.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 12:11:20 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Donggeun Kim <dg77.kim@samsung.com>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v1] iio: light: Add DT bindings for GP2AP002
Date:   Sat, 28 Dec 2019 21:11:08 +0100
Message-Id: <20191228201109.13635-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds device tree bindings for the GP2AP002 light
and proximity sensor.

As with other early proximity sensors (~2010) the light
sensor and proximity sensors were combined into a single
component.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Donggeun Kim <dg77.kim@samsung.com>
Cc: Minkyu Kang <mk7.kang@samsung.com>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Oskar Andero <oskar.andero@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/iio/light/sharp,gp2ap002.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
new file mode 100644
index 000000000000..27d129e76a8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp GP2AP002A00F and GP2AP002S00F proximity and ambient light sensors
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  Proximity and ambient light sensor with IR LED for the proximity
+  sensing and an analog output for light intensity. The ambient light
+  sensor output is not available on the GP2AP002S00F variant.
+
+properties:
+  compatible:
+    enum:
+      - sharp,gp2ap002a00f
+      - sharp,gp2ap002s00f
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: an interrupt for proximity, usually a GPIO line
+
+  vdd-supply:
+    maxItems: 1
+    description: VDD power supply a phandle to a regulator
+
+  vio-supply:
+    maxItems: 1
+    description: VIO power supply a phandle to a regulator
+
+  io-channels:
+    maxItems: 1
+    description: ALSOUT ADC channel to read the ambient light
+
+  io-channel-names:
+    const: "alsout"
+
+  sharp,proximity-far-hysteresis:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Hysteresis setting for "far" object detection, this setting is
+      device-unique and adjust the optical setting for proximity detection
+      of a "far away" object in front of the sensor.
+
+  sharp,proximity-close-hysteresis:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Hysteresis setting for "close" object detection, this setting is
+      device-unique and adjust the optical setting for proximity detection
+      of a "close" object in front of the sensor.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - sharp,proximity-far-hysteresis
+  - sharp,proximity-close-hysteresis
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      light-sensor@44 {
+        compatible = "sharp,gp2ap002a00f";
+        reg = <0x44>;
+        interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+        vdd-supply = <&vdd_regulator>;
+        vio-supply = <&vio_regulator>;
+        io-channels = <&adc_channel>;
+        io-channel-names = "alsout";
+        sharp,proximity-far-hysteresis = <0x2f>;
+        sharp,proximity-close-hysteresis = <0x0f>;
+      };
+    };
+
+...
-- 
2.21.0

