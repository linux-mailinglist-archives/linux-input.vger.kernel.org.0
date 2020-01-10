Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96F1136AB3
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 11:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgAJKMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 05:12:50 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34409 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgAJKMu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 05:12:50 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so1052595lfc.1
        for <linux-input@vger.kernel.org>; Fri, 10 Jan 2020 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQ3AvsTOvN2lt6VoCrrcei0UKFhdLdIsH4yixnuLa3k=;
        b=kyE5WbVDVncQ83eWxFYnHwuIO4on0+uCzONsHYZk9JU4/wZ8gxgImU1EJc31YG0q5x
         qGjO7znn7L28cBuEjVWUS1yx+CbbkzvPGNov7rMdbn2yz3HWaaIss4luq5yAf7EhCRi4
         6j9oIGLYvnuNj0XirRn9sj10I44IqzTVZ95zwF7tApE4TJrOFlndqBdQ5o+ew0dd8t1L
         NGA3tCluT+8GvIuNaEhxuZh9mdenzo9eCAZCiK3W5vi+mUGnZk6zAoNpeeTnbB21VCL1
         +9Y8k1fhw1yI7zduN3cGQJNkud3vbB/e5qrWJ2kWxNysM5rNKAjtx6GCgX51LJ4PLFBt
         RU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQ3AvsTOvN2lt6VoCrrcei0UKFhdLdIsH4yixnuLa3k=;
        b=uFYhhPuKnaPyQbMsArb1fz6DwdwyMg4UvyjVPeWFLStJRVZKM8fdIE0Hh0DUZjCUjS
         eMQoItT/OAaOCih9B/UaZQmxk2jdTToqqOgKwJQ+0Ziwv6gLlI6jD1IOGL5r3tr0fZf5
         g4GZ9VjjblbIEcUFrhS4ju880CbycYWZl+sOCnWYYj6prgvRXVDoyN4FcoHhh1zCD7m2
         xzfUXpRdWXOBZReBt8BPCk44tCL+ZAyFSVX7w8EvblUrh0byhV3zBnpG0xglbprpcNWf
         gSzgZfgAgUe2+ppybCYEr0/KRVcRLHgDhSXlBQzQFIBx2ABi/1AYzJ0KhpAzH2+SNBj/
         RhXA==
X-Gm-Message-State: APjAAAUqQoZW9UT7o6eD78OU7s0MOFSN2ysQL5fP/dlM3h0GrbP5hTzx
        lcZP1KG4c56jTusInUp4kOIzDQ==
X-Google-Smtp-Source: APXvYqxIqWX62Yhbh9cxP2oXScdnXjTjmA4Dz4GcXs69CvwK9IueOqMCxN2l8kLTrV+9PEW6QyncNA==
X-Received: by 2002:a19:3f51:: with SMTP id m78mr1877716lfa.70.1578651168048;
        Fri, 10 Jan 2020 02:12:48 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id s23sm736278lji.70.2020.01.10.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 02:12:46 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2 v3] iio: light: Add DT bindings for GP2AP002
Date:   Fri, 10 Jan 2020 11:12:42 +0100
Message-Id: <20200110101242.16077-1-linus.walleij@linaro.org>
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
Cc: Minkyu Kang <mk7.kang@samsung.com>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Oskar Andero <oskar.andero@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Drop the maxitems on the supplies, it is already 1
- Drop quotes around "alsout"
- Limit the sharp hysteresis to 8 bits as it should be
- Use /bits/ 8 in the example so it is correct
---
 .../bindings/iio/light/sharp,gp2ap002.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
new file mode 100644
index 000000000000..12aa16f24772
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
@@ -0,0 +1,85 @@
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
+    description: VDD power supply a phandle to a regulator
+
+  vio-supply:
+    description: VIO power supply a phandle to a regulator
+
+  io-channels:
+    maxItems: 1
+    description: ALSOUT ADC channel to read the ambient light
+
+  io-channel-names:
+    const: alsout
+
+  sharp,proximity-far-hysteresis:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Hysteresis setting for "far" object detection, this setting is
+      device-unique and adjust the optical setting for proximity detection
+      of a "far away" object in front of the sensor.
+
+  sharp,proximity-close-hysteresis:
+    $ref: /schemas/types.yaml#/definitions/uint8
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
+        sharp,proximity-far-hysteresis = /bits/ 8 <0x2f>;
+        sharp,proximity-close-hysteresis = /bits/ 8 <0x0f>;
+      };
+    };
+
+...
-- 
2.21.0

