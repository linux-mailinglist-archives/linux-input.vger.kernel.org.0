Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065267B18E2
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjI1LDS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjI1LDQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBD119C
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50308217223so20320042e87.3
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898992; x=1696503792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ii+ERiIP/+rN5/93TQF2YXZBm9/0F6AmtInKGYg6uG8=;
        b=PLGjVH2QWxag2sLOYzAGk/+jOpB8mgK5Otm+Mn7CeccL8IYQg05iSw7L5GzCa4RXxM
         nvh6e5NjpZYNMyzJRu9le+sXtNrdmLf0ux2yUl+V9gqEH0/Cc67TKFrpcZL9jHrQNs5q
         eLlOQP6uMWcbZ+KFv/VLT5irECgnI5cofEDKaR+zFu1VdlyzDdSiLbNgkzocaMjbgcZK
         N7fZdglDefyawujpQiBLDS6+2HbmZLQWP1z0PgvdwAiAykInwlC6t9CyquJ0RXFCntU6
         DI91RRZGDvL4+cloCiLav15f+xhyoQNMQB7fofAWNEJaYyr9xkSXoT+SO8sBy3+8Q40k
         q/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898992; x=1696503792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii+ERiIP/+rN5/93TQF2YXZBm9/0F6AmtInKGYg6uG8=;
        b=e7vxkofoqZdf2dXYQdgrhM6+6JPWMVqknZcDTO5Z2CUQqtRs/n6yyuecF4wnbMbnpr
         vbxwRggsZShSTLGdplHfGGCJ0qrmPYgHwnReknA1xkpPnJ0S7Ay6CtPV04sD7lpQ+K/O
         E4g/ufikXsqsxZ4urTDSQBB16EVKZARu+/e0TGoqHqan4Oyw+1zR2dOXn87cMfYFfSz+
         82wJz0gS416+eyYlCvw/nZFCrLgtNZB/PjGNv93KFEhSZZYoDnKqyXm2LbCo+FQHCTv0
         eLGA0+gC5M36Hmq6MTGRaNS+v/fnYcvcAMffgwQKfn2fbNkw5rGb145/R2HvICuJt9dM
         R0GQ==
X-Gm-Message-State: AOJu0Yzlhr0yGUDiBj5YeSqEWZPfLUVRWZ7ah6yBocyALZIevE/0L6xo
        kWlVk8A3dCr+WJaAPobVT+3siA==
X-Google-Smtp-Source: AGHT+IHNrn2EtnUKBrXbRiybzq8QCMr4nO/YDKdfTDD9zcnzAwHsVUeR/ROIkM9JHMYx9P4tlQ/GCQ==
X-Received: by 2002:a19:8c47:0:b0:500:9524:f733 with SMTP id i7-20020a198c47000000b005009524f733mr801481lfj.20.1695898992533;
        Thu, 28 Sep 2023 04:03:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 03/36] ARM: dts: qcom: msm8960: introduce label for PMIC keypad
Date:   Thu, 28 Sep 2023 14:02:36 +0300
Message-Id: <20230928110309.1212221-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To simplify MSM8960 CDP board file, add label to PMIC keypad node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 20 +++++++++-----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi    |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 6c1bc3818883..4641b4f2195d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,17 +88,15 @@ clk-pins {
 	};
 };
 
-&pmicintc {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(0, 3, KEY_CAMERA)
-			>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <5>;
-	};
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(0, 3, KEY_CAMERA)
+		>;
+	keypad,num-rows = <1>;
+	keypad,num-columns = <5>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index d13080fcbeea..a34fda93d6a4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -283,7 +283,7 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				keypad@148 {
+				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pmicintc>;
-- 
2.39.2

