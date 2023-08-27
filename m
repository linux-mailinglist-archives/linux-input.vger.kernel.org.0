Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22256789E80
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjH0N0c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjH0NZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABF718D
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5008d16cc36so3596135e87.2
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142746; x=1693747546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=s3+Jd3gfOJCfeOPCpaQauIjUavkwbGtlqmxZTAg3gsCkfChs16LbQHqx4ubrtqFBP2
         ltAFfyvai3c0I5rhWD65gPgbbOwUf4m6jDZfP2YJIuvYRVW1/fvBNgmqTp2J5UayUfoR
         DKVpMxVCF5XP/zMba9ha4X88vbtT/VWJgreyqTTMeuRQAvoj9IjEIXPko5E4d4EToLyQ
         VHqmBnNzrc8buPCydPtwZ5usi5B93/UCgduvpkE+2pU1mYbJ6TlDCYsN/sfe8yJbMavv
         d6SMMEJFSgkBvMsHTX6Nv0fcU+DpL4+2eBVl+2+WoZ1LTAYeK+vFExvrl8ZJchzkXA1R
         F6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142746; x=1693747546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=KnmVFDrA0Ws76/h5R7zk4myr/ZqnE5hlAZ+03QVFFSSl7s8SILTFLxZAVq7Han4tfi
         tdwiEzVO3ICMdj1kSXcJmRgsENxWEO3aq95Pn8zZqr2msnOPA41Odgz3EyRklV8erNi7
         OGCsPPCzQjcsfa8juXnQO8E2W3jRHRP5V4sgDQgkcbUjnA7JUUFgtKry1x4lUirl5Ijk
         OGt/81sm/RvVNKz8lq2k85nrfSu9kRTYxbnZ5EBvdckaqkYK3strHM7BRYG2i3ECanZ0
         1iDGyU/o1pWVSrPW4T79Il9kIDoubiPoysqOM9cdNB8WRynjhMhWZUsm8lauivyVU8RC
         5AUg==
X-Gm-Message-State: AOJu0YxPp9vSJCNT2zdfUFr+UKFoK/DjXQh56YvPNFMj08Fl42o+vxSF
        /DAijxMovQuhsZUQr3QQj2pKbw==
X-Google-Smtp-Source: AGHT+IF618NntRTUZL9QE6kKy/+YhJuwL/uQCG7IrxvFDZfGT170u4Qv6yUahroKC+v9sPAfQhkAeg==
X-Received: by 2002:a05:6512:477:b0:4fe:2c6:1d76 with SMTP id x23-20020a056512047700b004fe02c61d76mr14657713lfd.21.1693142746036;
        Sun, 27 Aug 2023 06:25:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:45 -0700 (PDT)
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
Subject: [PATCH v5 23/37] ARM: dts: qcom: pm8018: move reg property
Date:   Sun, 27 Aug 2023 16:25:11 +0300
Message-Id: <20230827132525.951475-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

