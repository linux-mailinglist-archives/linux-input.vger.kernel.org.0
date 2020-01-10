Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C021C136A69
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 11:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgAJKBh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 05:01:37 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34960 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbgAJKBh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 05:01:37 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so1021343lfr.2
        for <linux-input@vger.kernel.org>; Fri, 10 Jan 2020 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8fk3K/Nw5FtKa609DTMLMya0M9CeyHh4Kw2lRtmzNV0=;
        b=Lqnu7dJKJV2YLmxAgxlgERWTyhT/wzKWMJxJPsD62jHLixRB5+t6R/rVXWrWAZSc+d
         Sm2fzhTNdzymXjTUTj82VnILY6VvccRCBLDy3mQ72AyV5f8FiQDwHAmzUpGRFmP/Rjyc
         mcwWUU+EvEKkL7gtNKOrl3KhTt8Dp5Pq7aps9EHTKQTVofvpKpWlnKr882C7jHR+A3Xu
         Mm+Z35+ilyQcR9UeilXEjHuV+ueDM1OAYvKm8caz+H9/WbXASc0frcJYdmjUf5KUJFAg
         6nQLH+0+gcQOCPLkP9jkw6ipHfSZDgsfMtwYQncdAVQuaM1x2DhwRAiQ08e3M4Kwh8Ux
         ErsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8fk3K/Nw5FtKa609DTMLMya0M9CeyHh4Kw2lRtmzNV0=;
        b=SN8QKY6Zpgb81OiknsRj4fQhGGoaTYPw+SxPYiX1Mu6mOilAMBAP8euPy4vKzj3/rT
         lPGEI7ZLN/0mH8A3Hz3fs5bHt6NDupjfbm15cnc7GUqtzXFTl92vbqhGkKNV4njqnN7A
         da2xNhYNIx6mCIDoc5xYKDiJO6JGbA3Ze3T0D0YmUrNo5pxUcoE40doNo9XvXBvsCBtI
         C0B6E5WbYEWLJt8u4gMLktuESSliMV1BGbWzbtYxArTPmgTUErkb9koAM02wvSZCwJZ9
         YAqWsOFJc2QSdlhAOPf98yoWTPkSSCBsPasfPhYskpHKn9T+TIi3z2z/gq40rWEt41aM
         rLOA==
X-Gm-Message-State: APjAAAWcsqhaQr9nb5ZJkuzKmTHd3qeQqqWHcNKWkRx2LuvhKRpX1lOB
        T702q5MZiG95PsTV3DkmWuvN4Q==
X-Google-Smtp-Source: APXvYqwEiM86h6vT/VXuePuFQtAz8n7aZ5Vm/lTgGd1pob0/m6P+wQcFhx3/dcblyGETMGQnjDj0OA==
X-Received: by 2002:a19:f514:: with SMTP id j20mr1626835lfb.31.1578650494620;
        Fri, 10 Jan 2020 02:01:34 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id s13sm738096lje.35.2020.01.10.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 02:01:33 -0800 (PST)
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
        Rob Herring <robh+dt@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v3] iio: light: Add DT bindings for GP2AP002
Date:   Fri, 10 Jan 2020 11:01:26 +0100
Message-Id: <20200110100127.15519-1-linus.walleij@linaro.org>
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
Cc: Rob Herring <robh+dt@vger.kernel.org>
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

