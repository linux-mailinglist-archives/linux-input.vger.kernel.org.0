Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E91300F83
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 23:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbhAVV6k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 16:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730918AbhAVUIc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 15:08:32 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D88C0613D6;
        Fri, 22 Jan 2021 12:07:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id p13so7954528ljg.2;
        Fri, 22 Jan 2021 12:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Q9Reap3GWCAihxatXXr3FfVYUJhLMEM+4qTRCJHb9Q=;
        b=EbYQVnYZe4+A4cZVNvsovFd+Uj5FB5Xx8OMwr0ixsUNq6fSZ6bNtgtrkD3lWMls0so
         NW6aDSVA7UUPlHXJTi0FDP108Il2GhkrJvERU02VfGPGY/EU8OikhVdnLW9rjeyw5iZr
         slVuzONZOgaLJEtm0hTBbJIysddZkBZuxk6T3i4auNRUV9CZxDzjajozm+TZ10FPZp9r
         gErWpgszLu4EZTM8EJulC3F2ySreOf/tc8s9PJTOivYhO4tLRArx7Uepr/WhWHaFdBI+
         SDf8pqs4xXzgrRWqcacgcCzoTL/UWe0iCGUaxQUC+dB2L87dhTBR+0UBg+ZaYtsWl6Pb
         hl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Q9Reap3GWCAihxatXXr3FfVYUJhLMEM+4qTRCJHb9Q=;
        b=P0jOrHPVJfkomMtdkWb9MrvvZpKqstoEt3r27WlnrtPvn0uASjaV9qr5jJATDbdX9j
         dfnOtN7DIfgc778ezU0FDEs8EBFBvB7WiDrFsfbr/uSHl4T20OQcDnRZI90cFguxnBKO
         6NyIzs4aDyQETvqakEPInF3/ixeX/4PYESxWwyt9DwBjL4rvx9VfvtUciZNHBj3+V9Yf
         /8ravBD1d5n5JbSVVj+JCpQ11VAPHu0fKITWMzVdQfmsUB97CAoK0wuq+3zCCU+uXVN+
         fexUZnA4yzn3d06rxdrF8Qo6+1NOGJ/reOlNMGOA+M9ST/li/IQCv9HlXEgJDZw0szSj
         XfZw==
X-Gm-Message-State: AOAM531ch/4HV5qFTG/1DBug521/cKJH8NfqKS19jnyUTQ38eLLfQvZY
        Rl6gtyZNt+yU+rt8ETMgJPk=
X-Google-Smtp-Source: ABdhPJwwc8pKbByXTk7VYPWfy3Qn6WAYf7oG0/n7cLmvx4xCmuxZysQOwKgv8fORvnxUx6ZMupmXgw==
X-Received: by 2002:a2e:9214:: with SMTP id k20mr1643215ljg.45.1611346070383;
        Fri, 22 Jan 2021 12:07:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u6sm994589lfk.127.2021.01.22.12.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:07:49 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and WAKE line GPIO
Date:   Fri, 22 Jan 2021 23:06:57 +0300
Message-Id: <20210122200659.7404-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122200659.7404-1-digetx@gmail.com>
References: <20210122200659.7404-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Atmel touchscreen controllers have a WAKE line that needs to be
asserted low in order to wake up controller from a deep sleep. Document
the wakeup methods and the new GPIO properties.

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

