Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0594C14462E
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 22:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgAUVEf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 16:04:35 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46001 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729009AbgAUVEe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 16:04:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so3488321lfa.12
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2020 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svRTGhB+4ikpDEnIdoMkm97ceK1/336tM1Akywsjbv8=;
        b=NFtnljdcWKKUDVcx7dc1rtinhRh9r8xzbehTykikSj2PCfxKCOaMUAO+sgjPWlESGT
         R13pDNAa/lDrVc4ExOat2UjDu+PxxOaHY02yGnY+53e/zy050fnvj+u2LKH9PbjIy42c
         LVTpCXDZLVIX0nbFGSjSNEIoOH4TmNMehNY/Nuxx/5lRWKivLN/w7UIPBC0h85lDXD19
         rQoaSK0EUoAwmbnBOT8uBg22ptcDSANyr3TuPMG6VzRqJsxQf7gRrW+FwFhNW5dA3ox3
         HSOyrffrDkaJ6GjA/Z4On/LOphp760yq8WXfvhNBPD9EjT+5HG98ZVgmbH/qcuF9Gs6r
         +Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svRTGhB+4ikpDEnIdoMkm97ceK1/336tM1Akywsjbv8=;
        b=oEJtYWLIzmlHELuhgaU2lQLUE0KRIL8vVlsdfheAe7RzlWh/Q7usa3y+u80E5aYr58
         JUP8Y0aWZA4EPhISfGmIxNso0lcBtmaDbKPc8GAp9iqxYLoGyHcUF1B9NojSoAnmDXT2
         qNHKOQFLsSjtPV3ewCpbqFMIFeIVCyCDXuBky8YFY3qvyMfV4u9JVPTGG2p9lEyq+/Pp
         BZaCZ5WHzV95WQ2HxB+f3PLqtK5iVZaKgd9Seb+SqJmG+xgASLc83B1Xo1YTKU3r8/dP
         H71UmeY7U+nUYiNcx/MhNbPksxLNidBoBqQR7JORKAmexHxcJAbgm628arhQ2sPatIJx
         T78w==
X-Gm-Message-State: APjAAAU93uVl3UkxhOULJAAa4DeNhtnjQNkpBHKr6AupL/FvIW54KqXG
        1ApmymkkE4xKHFbDRqBPPvUOjQ==
X-Google-Smtp-Source: APXvYqx6BS/uXcJxdiRdUAFXUEaKfWds/djjZ4wKN6hlQIRYwgQlUwQxQ5WDDELKW/V8KnvfabBg2g==
X-Received: by 2002:a19:5f05:: with SMTP id t5mr3741348lfb.149.1579640672255;
        Tue, 21 Jan 2020 13:04:32 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id s2sm19094720lji.53.2020.01.21.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 13:04:31 -0800 (PST)
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
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v5] iio: light: Add DT bindings for GP2AP002
Date:   Tue, 21 Jan 2020 22:04:18 +0100
Message-Id: <20200121210419.13372-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v5:
- Collected Rob's Reviewed-by tag.
ChangeLog v3->v4:
- Resend with the changes in the main patch.
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

