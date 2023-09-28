Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236F07B18E5
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjI1LDT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjI1LDR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8336919E
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50317080342so21523831e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898994; x=1696503794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=hhvuaPH0t3P3kiBp0VgfoDBShes+t/Qmg9nO3txzmYdnUaYV7DzEL9UFbIhc/b6+l8
         cMPi7qxbGFZL5VIZ3cWT22IgS76E7wHIn//Pr5SHVGMD9cyLD6aOufg01rT/i4vczSwT
         8izhRGw2jUbExUPFPuuYXGX2CcWK4cgbldG5LcnhRSAEhjj+55SgDNABn2T4G7Wb4KDi
         AHf047rMipq5mxDpcbC0+ldGdkpKaU3/NyESwft9SOrnf0g1Q4ocohVrz5YMBMjww2lS
         U7g4MfwKZVJlEty6iVbuaM28BNQU1NCDdoNQaQ50YzoNt/pp8cTpYeUiG3b0BzOBvF63
         xpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898994; x=1696503794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=KtrrBiQTQCk2YAoj82V03NMW8FtZnXNiX3ATxULSLKLrTXMmXzL3zXnhfOY7jmvoiO
         i3/12OnOoMsm9ntcDlUcQNwM9NGu+vb9SaEI5hxLJfSagAFRSP9dPsFp1JkpGfcOxMg3
         j0BcVulkiGmyKg8clzpan5HVZICay9yDgIqIOoW+5RcCbFR2clr/VwDL4BXFvtTWcTmb
         XE5ekPnOJRIh7p1KkjXOuYfCYx/AGFcfr+CA8Xr59EMNXTKZ5or8BX+avbdVii8uQqWI
         nsX7zrOm9OQYSDoCmyb0ubORWvdvNx7wEyHd/rCHE3plDyU++/OHRSTZTzWu4D7t+1A6
         /oyw==
X-Gm-Message-State: AOJu0YynPR9K7BmgqRSZsWH18ryu+9njtKWYnWKjMlaoN03lXnZHMtup
        JWnmlXuzLqD1xJtvOcscJgEI2A==
X-Google-Smtp-Source: AGHT+IGrRoRGtPuCtJBOskAPI9wCavV58Yv/t35IclZOVuVpmFubBREmxbPeoszsSVM9edkvn/pK5g==
X-Received: by 2002:a19:8c46:0:b0:4fe:551:3d3c with SMTP id i6-20020a198c46000000b004fe05513d3cmr842972lfj.36.1695898993540;
        Thu, 28 Sep 2023 04:03:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 04/36] ARM: dts: qcom: msm8660-surf: use keypad label directly
Date:   Thu, 28 Sep 2023 14:02:37 +0300
Message-Id: <20230928110309.1212221-5-dmitry.baryshkov@linaro.org>
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

Directly use pm8058_keypad to declare keypad properties instead of
referencing pm8058 top-level node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts | 50 ++++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index be18f1be29a1..86fbb6dfdc2a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -34,32 +34,30 @@ &gsbi12_serial {
 	status = "okay";
 };
 
-&pm8058 {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_FN_F1)
-			MATRIX_KEY(0, 1, KEY_UP)
-			MATRIX_KEY(0, 2, KEY_LEFT)
-			MATRIX_KEY(0, 3, KEY_VOLUMEUP)
-			MATRIX_KEY(1, 0, KEY_FN_F2)
-			MATRIX_KEY(1, 1, KEY_RIGHT)
-			MATRIX_KEY(1, 2, KEY_DOWN)
-			MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
-			MATRIX_KEY(2, 3, KEY_ENTER)
-			MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(4, 1, KEY_UP)
-			MATRIX_KEY(4, 2, KEY_LEFT)
-			MATRIX_KEY(4, 3, KEY_HOME)
-			MATRIX_KEY(4, 4, KEY_FN_F3)
-			MATRIX_KEY(5, 0, KEY_CAMERA)
-			MATRIX_KEY(5, 1, KEY_RIGHT)
-			MATRIX_KEY(5, 2, KEY_DOWN)
-			MATRIX_KEY(5, 3, KEY_BACK)
-			MATRIX_KEY(5, 4, KEY_MENU)
-			>;
-		keypad,num-rows = <6>;
-		keypad,num-columns = <5>;
-	};
+&pm8058_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_FN_F1)
+		MATRIX_KEY(0, 1, KEY_UP)
+		MATRIX_KEY(0, 2, KEY_LEFT)
+		MATRIX_KEY(0, 3, KEY_VOLUMEUP)
+		MATRIX_KEY(1, 0, KEY_FN_F2)
+		MATRIX_KEY(1, 1, KEY_RIGHT)
+		MATRIX_KEY(1, 2, KEY_DOWN)
+		MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
+		MATRIX_KEY(2, 3, KEY_ENTER)
+		MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(4, 1, KEY_UP)
+		MATRIX_KEY(4, 2, KEY_LEFT)
+		MATRIX_KEY(4, 3, KEY_HOME)
+		MATRIX_KEY(4, 4, KEY_FN_F3)
+		MATRIX_KEY(5, 0, KEY_CAMERA)
+		MATRIX_KEY(5, 1, KEY_RIGHT)
+		MATRIX_KEY(5, 2, KEY_DOWN)
+		MATRIX_KEY(5, 3, KEY_BACK)
+		MATRIX_KEY(5, 4, KEY_MENU)
+		>;
+	keypad,num-rows = <6>;
+	keypad,num-columns = <5>;
 };
 
 /* eMMC */
-- 
2.39.2

