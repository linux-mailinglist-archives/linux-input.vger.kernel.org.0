Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0252CF9BB
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgLEFex (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgLEFex (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:34:53 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D7CC061A4F;
        Fri,  4 Dec 2020 21:34:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a9so10651822lfh.2;
        Fri, 04 Dec 2020 21:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w+OeAkZgNj+MXQ3DH4VONGYNB4R07iZ8IreFmZG+j/c=;
        b=u422r3rjlGqP3sR2ovIAgjx3vy6jdu69rhOhKvSz660wSjNqMVVfH6UeUcsYsDp6Ir
         v8DKkcedwpW7K/wTD0wRzjsotVNDQpRy+YkeU35IbR55+VbrhhkHM467mNnGQlo+oVSC
         3LOqVEt4N40xs/9u0ELOvo5crFb1H2wNwbBiKbwSKmznxGkvhX9m8kZa2/nZRPkiOHOW
         NMxRtGDo4IzMU1QXiVsWRmtAx78gclw67JzsFBxnSpwMkuloKiJZmyCdHGUwWTwpbi93
         Nrq5WmFp34T39fEW/ZuCK9gqzDxPKBMXbyF2BDlnzf83LucnzBpaRkbfBDsAsihGqFfG
         05eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w+OeAkZgNj+MXQ3DH4VONGYNB4R07iZ8IreFmZG+j/c=;
        b=rpavMhLkNXY/S3Zv48WzrY1CmZLExXYt/I6GfO6x3Bx3HRvAqRp2Z4Kg0L/NOc9Ozn
         SkoEMTXgQOjePihGH2IXWICJ/F+NwYfd26DTbrYxzTYVttDI7nQaY0J5haPh5xNa9gn5
         5DdZtkz9kba6EDXJMLZCmZvp+tbtxKvKDKAGhatp3xJXpgEG9WcNIzvGatgZ/KmMQD/p
         W8b1k/VgZP/5eOU6lv8YnB2snqMdfoKad+MoGBB41Pt6JV5z7gicMHN2Qrjn1kaRploE
         ZxcNIc8MHhYiPwxTuqwrYYr4VLHgNV4DeQ47woc3oU3TQn6kijGlF5QDLUaqGr1WiEVT
         1kCQ==
X-Gm-Message-State: AOAM533YTecyhmnHE5KyGnzx6Bow8ccn2Jki88UhkeCatZ39SuoxLrpj
        ZX3lKXKJD/JSs4iHRd0SE/o=
X-Google-Smtp-Source: ABdhPJyUH0DzOcTH+Ceg+t3jp2tA/C4MOKub6f2dgD/N7C07/xDQypsbnC7PzM7w81+e68dQ8cMX9g==
X-Received: by 2002:ac2:528b:: with SMTP id q11mr4658624lfm.60.1607146450638;
        Fri, 04 Dec 2020 21:34:10 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id d25sm2289861lja.40.2020.12.04.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:34:10 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and wake-GPIO
Date:   Sat,  5 Dec 2020 08:33:26 +0300
Message-Id: <20201205053328.9535-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205053328.9535-1-digetx@gmail.com>
References: <20201205053328.9535-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Atmel touchscreen controllers have a WAKE line that needs to be
asserted low in order to wake up controller from a deep sleep. Document
the wakeup methods and the wake-GPIO properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/input/atmel,maxtouch.yaml        | 26 +++++++++++++++++++
 include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 8c6418f76e94..7924a16dc248 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -39,6 +39,13 @@ properties:
       (active low). The line must be flagged with
       GPIO_ACTIVE_LOW.
 
+  wake-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's wake pin
+      (active low). The line must be flagged with
+      GPIO_ACTIVE_LOW.
+
   linux,gpio-keymap:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -53,6 +60,23 @@ properties:
       or experiment to determine which bit corresponds to which input. Use
       KEY_RESERVED for unused padding values.
 
+  atmel,wakeup-method:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The WAKE line is an active-low input that is used to wake up the touch
+      controller from deep-sleep mode before communication with the controller
+      could be started. This feature used to minimize current consumption
+      when the controller is in deep sleep mode.
+
+      The WAKE pin can be connected in one of the following ways:
+       1) left permanently low
+       2) connected to the I2C-compatible SCL pin
+       3) connected to a GPIO pin on the host
+    enum:
+      - 0 # ATMEL_MXT_WAKEUP_NONE
+      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
+      - 2 # ATMEL_MXT_WAKEUP_GPIO
+
 required:
   - compatible
   - reg
@@ -63,6 +87,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/atmel-maxtouch.h>
     #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
@@ -75,6 +100,7 @@ examples:
         reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
         vdda-supply = <&ab8500_ldo_aux2_reg>;
         vdd-supply = <&ab8500_ldo_aux5_reg>;
+        atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
       };
     };
 
diff --git a/include/dt-bindings/input/atmel-maxtouch.h b/include/dt-bindings/input/atmel-maxtouch.h
new file mode 100644
index 000000000000..7345ab32224d
--- /dev/null
+++ b/include/dt-bindings/input/atmel-maxtouch.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DT_BINDINGS_ATMEL_MAXTOUCH_H
+#define _DT_BINDINGS_ATMEL_MAXTOUCH_H
+
+#define ATMEL_MXT_WAKEUP_NONE		0
+#define ATMEL_MXT_WAKEUP_I2C_SCL	1
+#define ATMEL_MXT_WAKEUP_GPIO		2
+
+#endif /* _DT_BINDINGS_ATMEL_MAXTOUCH_H */
-- 
2.29.2

