Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71CB7836FA
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjHVAPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjHVAOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA1B198
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ff09632194so5396387e87.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663234; x=1693268034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbwE6BM/RqXOv2hUW/K9A2gh+jFrRI+7NWOB1e8J6uo=;
        b=n6n9qAfTvpj1dsPl5jt9RHOPLPgMbjTLNrn2+bOQR6tWehKdlKNbpn+ZbDifHKf+mF
         bZw2PS03GDM010cpuiAXRWe9uAG/mAav53EzzdizHAgNVKTqeq7eaIy3dpEJop/aTn+e
         mHeZ01NKu4B2hvJjGD8V1wsi9WYBrqPfXSBKuETmJrm+9I6LMqiNjWzDp5y9azdWNbse
         rcdMqbXPmmaft2mgt2/TUo4jUc24bjvuSk+P4ej1bAjZLk5xYXGP6GwxTpok6QQWc2Zt
         +irl+c0rwl7NyjGNQuA9oFIgjwSXgJjwK1GFRLaJt33jWb5iYS2CR+eVda68cmGXY4TK
         dc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663234; x=1693268034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbwE6BM/RqXOv2hUW/K9A2gh+jFrRI+7NWOB1e8J6uo=;
        b=hac25qnhKm1ZYs/tLdYu9JgpaCIW5FFtK4QCHbIalndoq6UIEnCYOQYV5ibFpCPbsz
         bqk0i9IqWqIQVbnDRJmkpOUyPAU2iyvfbAygZSGGjsbuI5w/Ih6q8tTivy4F5Ydg7qdC
         wCd/FVAkHa/cj58zb8BqHaVvpfIWNS99OmMXfWopK2ue0QB4s3pSjTME00Ziw+BGreqX
         Ndf1EGj0qv0w/NEBRe9Am/c31nHRX8dYFKTsukhdp+i+1IXVEZay3Z7sDhW9rtCr8O6a
         9FP85baHpVnA8m03BmLgb4A65fG58RGGmDrzl0VDNENwkaBcxPO0SLVfjencG9B0nTnP
         Uo+w==
X-Gm-Message-State: AOJu0Ywi9+fl0Ut8O4vPLzp5VHl4yF4aldrJBfNzn0Rar97AriBNOnk6
        sf7HqVeOLYRRppzPQ2eUZR1vgJLJ8L8DQHFDKl8=
X-Google-Smtp-Source: AGHT+IEX8+ph3oMhMRzqKtPStBH4/mFquOjS8DteqzB0VwrUZ3BrWCMOt/JnQx4qqm6cAEXRGFqPWw==
X-Received: by 2002:a05:6512:615:b0:4fb:829b:196e with SMTP id b21-20020a056512061500b004fb829b196emr5390018lfe.2.1692663234161;
        Mon, 21 Aug 2023 17:13:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 03/32] dt-bindings: bus: convert qcom,ssbi schema to YAML format
Date:   Tue, 22 Aug 2023 03:13:20 +0300
Message-Id: <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with bus
bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/msm/ssbi.txt      | 18 ------
 .../devicetree/bindings/bus/qcom,ssbi.yaml    | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssbi.yaml

diff --git a/Documentation/devicetree/bindings/arm/msm/ssbi.txt b/Documentation/devicetree/bindings/arm/msm/ssbi.txt
deleted file mode 100644
index 54fd5ced3401..000000000000
--- a/Documentation/devicetree/bindings/arm/msm/ssbi.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Qualcomm SSBI
-
-Some Qualcomm MSM devices contain a point-to-point serial bus used to
-communicate with a limited range of devices (mostly power management
-chips).
-
-These require the following properties:
-
-- compatible: "qcom,ssbi"
-
-- qcom,controller-type
-  indicates the SSBI bus variant the controller should use to talk
-  with the slave device.  This should be one of "ssbi", "ssbi2", or
-  "pmic-arbiter".  The type chosen is determined by the attached
-  slave.
-
-The slave device should be the single child node of the ssbi device
-with a compatible field.
diff --git a/Documentation/devicetree/bindings/bus/qcom,ssbi.yaml b/Documentation/devicetree/bindings/bus/qcom,ssbi.yaml
new file mode 100644
index 000000000000..693cfa9696b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/qcom,ssbi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Single-wire Serial Bus Interface (SSBI)
+
+description:
+  Some Qualcomm MSM devices contain a point-to-point serial bus used to
+  communicate with a limited range of devices (mostly power management
+  chips).
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,ssbi
+
+  reg:
+    maxItems: 1
+
+  qcom,controller-type:
+    description:
+      Indicates the SSBI bus variant the controller should use to talk
+      with the slave device. The type chosen is determined by the attached
+      slave.
+    enum:
+      - ssbi
+      - ssbi2
+      - pmic-arbiter
+
+  pmic:
+    $ref: /schemas/mfd/qcom-pm8xxx.yaml#
+
+required:
+  - compatible
+  - reg
+  - qcom,controller-type
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    ssbi@c00000 {
+        compatible = "qcom,ssbi";
+        reg = <0x00c00000 0x1000>;
+        qcom,controller-type = "pmic-arbiter";
+
+        pmic {
+            compatible = "qcom,pm8821";
+            interrupt-parent = <&msmgpio>;
+            interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...
-- 
2.39.2

