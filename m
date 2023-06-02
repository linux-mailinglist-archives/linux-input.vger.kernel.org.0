Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335AA720402
	for <lists+linux-input@lfdr.de>; Fri,  2 Jun 2023 16:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbjFBOKx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jun 2023 10:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235688AbjFBOKw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jun 2023 10:10:52 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D0A1BC
        for <linux-input@vger.kernel.org>; Fri,  2 Jun 2023 07:10:50 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53f9a376f3eso1856279a12.0
        for <linux-input@vger.kernel.org>; Fri, 02 Jun 2023 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1685715049; x=1688307049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0soG1YhojKKut/cvwo6U1h/OP9R4kqmXMLSIIqytqQ=;
        b=TNXO6ls5E7h7hjiAsQ7kmw+fxCeQAosJNW0XHdKzfsQmvmJOYjgDFlnzJFPaepN8kf
         uyixpf+sCYWWPO+7q2fo04nrvwCXIfYKc8vNLBmjkkxwr/l1SDD7yniYybGo92sW+ZD+
         YPyvteU36FRDSutziZtgYJ8l/zhtlTE0cVZykJlsV7RJnwQ0NbZiVcj6YEw++Pnyhi6D
         tD3OfFsRzBklFekkSWIHnquoQ+VoEI9Z6Ha0/OEXaeepnNjIbrVq/+hl9IFsNM4VoqB8
         iBfXYJVpI/A5GFRMoOi238knjLbxDXPSESIIl+byx25IKwIbhJHyUWaKOzL1a6bxrnl7
         YlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715049; x=1688307049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0soG1YhojKKut/cvwo6U1h/OP9R4kqmXMLSIIqytqQ=;
        b=Emy2412n+OKDq4u7xEjBXC0l9A1jI4w+Y4M3wqPfBQTnxahN3TrY02ONHAd6FMmvtD
         RSiLP0ZNokOxkBsrCXCE/49ZzvGXBb2cJgp0ld2/xz4fDjy666BWKEAGDYie3LwAAE1s
         bJiAJmomRaqhy4esj0VKmk9tS5AhG5FSVTqNCl4qpevlBfACqSaq4LIru2dti/+vqhXj
         k2JKNfqaw8z+nM1Hofv/lvPiXGVVrV6gXHRoAKDrRywDPVGay++6n+r7u9ADzby9kRet
         +n35nsIjf23ZV9vqj4BV1ar+Por4jMS3hDue61SKV0CxOYGebp16NIdYqpmyLIzZFNBo
         tHhw==
X-Gm-Message-State: AC+VfDwIB5QFyDf3/UTAIVSQZ+kvk1U99Wzly8iGlblYqf8c4cGQUs4h
        R9KBxPC+brf3THKxer35rXs0EA==
X-Google-Smtp-Source: ACHHUZ7BaTuk4zgrW6ynZZ1k+iErc4S59mBqXFZ3f+UaLGZkRLdAFVMSLH3Y6ylsaaoJbY4YR0Z8LQ==
X-Received: by 2002:a17:903:2343:b0:1ae:5f7e:c117 with SMTP id c3-20020a170903234300b001ae5f7ec117mr24943plh.60.1685715049702;
        Fri, 02 Jun 2023 07:10:49 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902d48b00b0019e60c645b1sm1370878plg.305.2023.06.02.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:10:49 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: Add ilitek 9882T touchscreen chip
Date:   Fri,  2 Jun 2023 22:09:47 +0800
Message-Id: <20230602140948.2138668-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com>
References: <20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an ilitek touch screen chip ili9882t.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../bindings/input/elan,ekth6915.yaml         | 36 ++++++++++++++-----
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..73e94cb6c4e0 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -15,11 +15,15 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: elan,ekth6915
+    oneOf:
+      - enum:
+        - elan,ekth6915
+        - ilitek,ili9882t
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x41
 
   interrupts:
     maxItems: 1
@@ -29,17 +33,31 @@ properties:
 
   vcc33-supply:
     description: The 3.3V supply to the touchscreen.
+                 If using ili9882t then this supply will not be needed.
 
   vccio-supply:
     description:
       The IO supply to the touchscreen. Need not be specified if this is the
       same as the 3.3V supply.
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - vcc33-supply
+      If using ili9882t, the IO supply is required.
+
+  required:
+    - compatible
+    - reg
+    - interrupts
+    - vcc33-supply
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ilitek,ili9882t
+then:
+  required:
+    - compatible
+    - reg
+    - interrupts
+    - vccio-supply
 
 additionalProperties: false
 
-- 
2.25.1

