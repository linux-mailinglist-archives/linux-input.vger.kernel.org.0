Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945A8789E94
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjH0N0e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjH0NZz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484C619A
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007c8308c3so3693108e87.0
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142748; x=1693747548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=O6SBeyNyl2Y2KY7TtNVcGggkWGoQFcQiQLCCIb/nYc/zY5e5i5GFzWc2creJJp66J5
         RGeiTtCkVpqVehN6l24POWnFCDZstQ/I4vW5Bi6Mau0C3DJIpzwdDG1EkFgensWWG4ck
         yc4Rd/tGmVmYPqeIPdvqeckUTg1fy7Eq7GNSVQ6RsMi6Ozw/vlQNi01gu5M4iKtpzjJ1
         Bcc1F8TR4bQVBXr6XQi9zsOOx5TvrObUY9oNsj0+o0V4kD16G9U/yPhTsZ+AcQjFSdj7
         mnooa0aMSTt6vsg86brqXmU3rRjgp/kGhxjcgyQE4OxjeV7qOSml1eVIf9n04VwmSO0/
         OKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142748; x=1693747548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=J8KjGEjvx6YICj07xq+hPCqd22ZVY+iVX04O8QbzaoVQ8ZBlNXFnW5DLpH414nCRv9
         UJOJ5z0J66X2FeKNogqydhltxlDHvOjTQi3mwElG2nWHCgn4d3ePlhPd1jY/qmW7+/qS
         hCRoGEZS1vpD6ZvVt3/hFAxrobYGqIY4zsRunaBRtjdR2WucwGZCK+hZhNfMP1vOcdbM
         Ga2HBo8k2dRCJJsoP90wN8WoCzjnmJQ88NSYErS9O1VuC5Bx/PDzMgSXAmHX1CFu6Icw
         QgGXT9Qr2AIk2LCoP9CkgzGsIIuyX3zrkZhZME9XVfEdjg0UL10MRT6YHn1sRtjdaM/w
         0NwA==
X-Gm-Message-State: AOJu0Yz4rrgjQn7/J9V29pdinbKbEiZLNQMgL6wu+s0cyDqDMBL9Sbn9
        LrN2x3unp2Izjbc5qL099oF8pg==
X-Google-Smtp-Source: AGHT+IHjfwt1dEUkbeEli+5qs9ZJG+9CIU9y+ic++AuCIyt5zzcd8QRW/Kl9vpzy/kxEkPXtzWVCIw==
X-Received: by 2002:ac2:562f:0:b0:4f8:4512:c844 with SMTP id b15-20020ac2562f000000b004f84512c844mr15483497lff.48.1693142748561;
        Sun, 27 Aug 2023 06:25:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 26/37] ARM: dts: qcom: pm8921: switch to interrupts-extended
Date:   Sun, 27 Aug 2023 16:25:14 +0300
Message-Id: <20230827132525.951475-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index fa00b57e28b9..360a179670c5 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -11,9 +11,8 @@ pm8921: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -32,17 +31,15 @@ pm8921_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
 			compatible = "qcom,pm8921-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
-- 
2.39.2

