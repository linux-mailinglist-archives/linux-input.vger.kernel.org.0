Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D9432A593
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447165AbhCBMvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379997AbhCBKYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:24:43 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4EFC061794;
        Tue,  2 Mar 2021 02:22:06 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id v9so12656327lfa.1;
        Tue, 02 Mar 2021 02:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oFeJHdMdN6sWTiVX2kJ/nUWLcOSOyUM6St3ihjMXLg=;
        b=b1Eq1J1rv0nxVvSv5zcaUWwSxqxDq5cl0p4txcM2vCqcxIdeOJYK8uyUhO7898GDPC
         hUyiBBb2FeHlNfnnsqRlW/T7aV/6GP58AycVBMr1yxWcx/KB09lLjFtaO8D5B7lTnK+r
         FHoMhPCqGaGtv9kHZ7y8V1iPLwpS6nUVZ5fH1Qm7wPgzNjL6E809PLg9xXxqAURP+Vpn
         T8AYovdAQchAUsi2rEexVCNqWWZ+3hm9YrOQA9r3vOjFhlSuvHcFFjdj7z6KMF8ChMq7
         SEyhMx3y07S8w3lfYgmfRq/tlSJvy30JA9o+8bZg2dkKbGldeNblbGa65QJfD1syEHti
         Yq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+oFeJHdMdN6sWTiVX2kJ/nUWLcOSOyUM6St3ihjMXLg=;
        b=Pk92hYg2RAokFxoN9Qk3yx97cKWdEqXXALNbmdWWilFPiCs0Gdr3y1AzXzm0YWfLAM
         rgCQTxBhqCdZRz6e8Bz5rhrUFEkgHLI9QX6adGsXYxYqXHOHlmOXTqW4yMGIEKSVXp4v
         ok91D0teAlr1Y8pftOxEhwZdj6abLkPA05ujDZP8yz0e89GHFKcxaVn9MvZLcok1cesz
         uk0vV6nsk6Pyta5z7oT20RUD6f0shJAOreTiAZKXD43M1KQoIZa6ClqGWYiUUBgmBqm4
         PxQuqJONUuoSMU991Ecw8736geWjISV1VPSsZ3rPn47qMRm2kkqhkjPIMXxwc1Q9QkKd
         3T7A==
X-Gm-Message-State: AOAM532poNxfRHtL2reWUWwuoXya5Kq7ejOgfi1TM4JQe6DIIk3yjEOd
        0WXQurZY6rHQX72ev7gFXpbAbbIzoxY=
X-Google-Smtp-Source: ABdhPJyLlYt0PdmlcnXPCh5Wjs47IDsKN9AZDUhoZpqzBO7ENx6+25ICT1Y4jyQqelpw9yaWYP+TFg==
X-Received: by 2002:a19:c74d:: with SMTP id x74mr11218630lff.223.1614680524833;
        Tue, 02 Mar 2021 02:22:04 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id n2sm2586369lfu.274.2021.03.02.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:22:04 -0800 (PST)
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
Subject: [PATCH v6 1/3] dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and WAKE line GPIO
Date:   Tue,  2 Mar 2021 13:21:56 +0300
Message-Id: <20210302102158.10533-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302102158.10533-1-digetx@gmail.com>
References: <20210302102158.10533-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Atmel touchscreen controllers have a WAKE line that needs to be
asserted low in order to wake up controller from a deep sleep. Document
the wakeup methods and the new GPIO properties.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++++++++++++++
 include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 8c6418f76e94..e6b03a1e7c30 100644
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
@@ -53,6 +60,26 @@ properties:
       or experiment to determine which bit corresponds to which input. Use
       KEY_RESERVED for unused padding values.
 
+  atmel,wakeup-method:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The WAKE line is an active-low input that is used to wake up the touch
+      controller from deep-sleep mode before communication with the controller
+      could be started. This optional feature used to minimize current
+      consumption when the controller is in deep sleep mode. This feature is
+      relevant only to some controller families, like mXT1386 controller for
+      example.
+
+      The WAKE pin can be connected in one of the following ways:
+       1) left permanently low
+       2) connected to the I2C-compatible SCL pin
+       3) connected to a GPIO pin on the host
+    enum:
+      - 0 # ATMEL_MXT_WAKEUP_NONE
+      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
+      - 2 # ATMEL_MXT_WAKEUP_GPIO
+    default: 0
+
 required:
   - compatible
   - reg
@@ -63,6 +90,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/atmel-maxtouch.h>
     #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
@@ -75,6 +103,7 @@ examples:
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

