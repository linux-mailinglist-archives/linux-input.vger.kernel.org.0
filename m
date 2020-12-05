Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8232CF9E7
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgLEFsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgLEFsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:48:43 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA815C061A4F;
        Fri,  4 Dec 2020 21:48:02 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id s11so327236ljp.4;
        Fri, 04 Dec 2020 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w+OeAkZgNj+MXQ3DH4VONGYNB4R07iZ8IreFmZG+j/c=;
        b=CAVLqeSeyaknJl7SvJHCKwKO4aRA/IrOwejcfFiYNEsLttyowcrk3dPZQpV6MIlusU
         fHdEtp7s5dkmuKTUM7NlbooPx41MR8767PDZ9/h1YTsHXqQyxzEQN1nYKnE5LOh8oZJ4
         ChekICv7p/INym8vwZhl3llo2HBFAqflqKLDgH3FZlZGw2zwkdw6ZRi2l1KRQ/N83eBo
         hTauwi/tArmcqgxGuIcRBuvb1516yVjxVcH5fcIaw1q89RThdLFDIo+P1ho84FdKuVdY
         LzRSMjYwFnjsdVgVMaoY6SVH7VCNKMWqzJfOwyMyn67wuNzf+F+Tjb57cCVaEsv0UZko
         6o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w+OeAkZgNj+MXQ3DH4VONGYNB4R07iZ8IreFmZG+j/c=;
        b=SFgJ1hKd5ZlOvZQC3qGeNIN05x3FHjks4UDYVfHgAPERwdmsdzfW2AyLOhZl5KvFXp
         hBglP+vXHRYIt+gOdf7vC1lh2bLuAi6dbVMRiM/6jd5RUBfnxlONc2w3fk5R/iUN/f5k
         Jg5GWPkksoW07NM98CEpaSvnjjWlmtT1O3eXafNbCRyl31KaxNuiYKIojyaDCQPq0Cuw
         3unVe6FP9ghBEXMQyjOSX0j8XjE6m/Pe+sctrtLHQXXIsJ5hiulcwLuTnxKeKrtWD6lK
         jv9Cm/0EU9ASOCdwLDfcr9hzSlDI0pqD0nUv+iWEwkfZVWwpds7GmMgla7n0HBj542dw
         O+rQ==
X-Gm-Message-State: AOAM532cF2+r8ZzsBrBzIsXnx353PlJgNqfdgA8m63B4amj1r7u/M8ah
        /jrygF/fR5GD6usitt55HCc=
X-Google-Smtp-Source: ABdhPJz7pukxGzjGdfKueOEWEgIStsLm9Ars4HGBTfAoJK7htnSHmYhPCjqM2Eph+FWYKHkkQDWKgA==
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr4483249ljc.377.1607147281154;
        Fri, 04 Dec 2020 21:48:01 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id w28sm2231490ljd.48.2020.12.04.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:48:00 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and wake-GPIO
Date:   Sat,  5 Dec 2020 08:47:47 +0300
Message-Id: <20201205054749.26487-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205054749.26487-1-digetx@gmail.com>
References: <20201205054749.26487-1-digetx@gmail.com>
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

