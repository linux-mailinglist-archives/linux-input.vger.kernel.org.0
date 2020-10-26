Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BFD2993D6
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 18:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1787821AbgJZRa5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 13:30:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42174 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1787816AbgJZRa4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 13:30:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id j7so13577077wrt.9;
        Mon, 26 Oct 2020 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QvBGUd61w/7tEXVgF8EUgTiK9j75XxkEhyKk9v88LB8=;
        b=bBA8MqRLULTGesfibrZZHFRM6E7Le6D7dr/TXOM7gEXeoAH37oEO6xCKsWThG4FGD1
         FTFFue+YNqngvqLb1VHj55t2trJadPGJWRkdreGswmZfwS5+9WNXEijKGcJOGgPfsixs
         mONto8PFovBPSYWsiJVvlyNuJg6fD/O66Ku/+UzriBnkyu7710A7lWgsw5oQqepDiGyo
         JaeV1EwjySVAxPPHz03d9c6Xzil0MyyalsPvuECv+Njq4GG1QjxBmqHeEAzS12fxyFdM
         72lLqQQMnfqH6iQ3d0Gz/N+/UGu4izXMx9w9+lkEou+Ue4h7fca53ueltMVcMlQ4fiJd
         HCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QvBGUd61w/7tEXVgF8EUgTiK9j75XxkEhyKk9v88LB8=;
        b=A0uPeMadrnHhibgre4QUTcbrwGiyUYzZn5detF0bQcAYKRfN6WYdqFfUmI1U5GlnS9
         MbRytrTOg839UWJKUK8mhKiK8miVdCqKks2Uj9Q1hwsduS/gmBPfNjGS0zNx6NoGSWhP
         xkHN/d1y2kk5I1jjY2OdrAqYvM3MRjNTERL0uz1ZJV9hPDViYZftYQNQPTFDhsaH7ITB
         +7naFCDJloSh4D2WANJStzYET4Co2Fxwkj3ckW5gwlTxM55Qg16DodeTFJPd02504S5V
         BB2XRlebA/gvRlpct0Cki6+UUkfvpSEqDH99ulmm088Hklz8dboFzgK1+VOiz97X8wYG
         9GoA==
X-Gm-Message-State: AOAM532H0OP4lkGlBtForjsKH+gNJ9hjymK/RceUEJ9uh2Dcxj1it2Ck
        PV4+dEpeOQuaDkUrjJEQNro=
X-Google-Smtp-Source: ABdhPJwgrNUVD2JO6c5eSV0iQfzSWLUjLmhRUux4XK26TGaoIXvZLpNWCz3/lNi3v0bhX3edi7ddxQ==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr18352247wrr.69.1603733452246;
        Mon, 26 Oct 2020 10:30:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b18sm1996808wmj.41.2020.10.26.10.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:30:51 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v8 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Mon, 26 Oct 2020 18:30:45 +0100
Message-Id: <20201026173045.165236-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026173045.165236-1-kholk11@gmail.com>
References: <20201026173045.165236-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../bindings/input/touchscreen/nt36xxx.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
new file mode 100644
index 000000000000..1486b20d6c49
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/nt36xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36xxx series touchscreen controller Bindings
+
+maintainers:
+  - AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for VDD pin
+
+  vio-supply:
+    description: Power supply regulator on VDD-IO pin
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@62 {
+        compatible = "novatek,nt36525";
+        reg = <0x62>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <45 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
-- 
2.28.0

