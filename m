Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D91F7B1973
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjI1LEO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjI1LED (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ED410D9
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50307759b65so20714461e87.0
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899022; x=1696503822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNKbEzWv4/hQlocpzzstUC1xw4nRbc19xDIUSYTkKZk=;
        b=eq6zKc16Essi3mNVQIb2Cty3Pk/KosL7DLBCSItZmXDkhx47Blf6DbU4KiQJFG3JMf
         RBd1yNxqBzK7YdvOh/q906JrtIEATwN6jqzfrlYbY/EK0lMA9ZbPlKw3z72D1d42FUkA
         jfmJmXVU+Xkypml+No4vTssMr6UcawScqJgeDyRjmmE9Gthyk4ykb3Zl3ukzNjJKo/pF
         b9mNTBcPmYOawto1uFwLgICD8i4Zm5wjzljd/viPpiVJtHnCjnqRr7nIv5M8WU7JKFND
         l8NOs58N8g6vIUxC/wc7ESVmE+ZEuAmDxxX1lus9/52T44wo/438ozCeXxxSnFU3mOLf
         KpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899022; x=1696503822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNKbEzWv4/hQlocpzzstUC1xw4nRbc19xDIUSYTkKZk=;
        b=MyfrPxGUPRMeMTLVxvkcUlxXfC6JFZIjIiWIvUGLFrnWpx1xmjcSGITHJgyglX5Mu7
         yV0Z4lfBLwzkFz7KQklACjx47V4RKnxMZzvAm/yLhsi9XoIJE4UdpqMeSLFbt0Kqe0+c
         2Ts/VkdJ1MPFVAngSDmVw6JCF/kPgJt1THDutTeZJiiqoccxbyWNAQINtUq792/2TQ9k
         wtQJhM1v+xVyuXlWbCCGvF4ROIcCeLS1hDXZbwMPsRTjx2QPqdq4nrHs7Y3ntTfdV5Kc
         WJKqGZSCD0E3I3W/uFyL7bFeCJYN2udeuGsyGtWTmcqcRfaw0jLh4Vn9zaifTGLzHa8u
         wc3g==
X-Gm-Message-State: AOJu0YxtEi1/1kJu/Kcr2+otDNjUL/pXlM+xc6dARW2JdIcm4gB8yvPW
        wasCjv89vDdgEf/WrWr7sdpQeA==
X-Google-Smtp-Source: AGHT+IFcAUnO++6KidGXwF0sBdfWRRFH0HS9WCPRE9MM7UYw/o76g6BIFUq1cB4lLZJ2+R31XqeBcg==
X-Received: by 2002:a05:6512:34c3:b0:500:bfcb:1bf9 with SMTP id w3-20020a05651234c300b00500bfcb1bf9mr768030lfr.67.1695899022031;
        Thu, 28 Sep 2023 04:03:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 36/36] ARM: dts: qcom: mdm9615: drop qcom, prefix from SSBI node name
Date:   Thu, 28 Sep 2023 14:03:09 +0300
Message-Id: <20230928110309.1212221-37-dmitry.baryshkov@linaro.org>
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

Device tree node names should not use vendor prefix, they contain a
generic name of the device. Drop the qcom, prefix from the SSBI node
name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 07e712e890f6..b02336bd8370 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -258,7 +258,7 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		ssbi: qcom,ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.39.2

