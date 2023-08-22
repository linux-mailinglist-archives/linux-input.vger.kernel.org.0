Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9020E7836EB
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjHVAPM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjHVAOZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C428FCC8
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007f3d3235so2592684e87.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663248; x=1693268048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=zSBBD2CcULdMHnkRK+6cPNlLLbcoVe8s1L+TCFuDUHTXd4JNnhPUZmYrZFz43pkP4O
         RvlELkuKM/N7u4L8AU+XyqHcLSHQS2FAMtmtUyqjW/3+5MvoBVROcLhmKJIObGiqj9An
         LejSE0VR0IV8zIiGFpZoQPTzsL3ZPgTBOhZbd7ELo3sVwNs40UAk5ysXIwWBISPFHm+Y
         MV30zLBuKu6kZn4wHVIAz3QsoMI/XvKE4cXqeHHZzFF3fDD8KCCAM25WPoudFF2XGFAd
         TDnllUNJ9suP3u4BzOJvbM9Wh4ICyejFgiT2wvJ+KEpyGaWdlTih/tYC3yhDPzyr3u/y
         D/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663248; x=1693268048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=KjQDzMIOdRVyk/w87/kZppOpYIQmMXdtIrfuNwMMJ1Yx6z5ydUYyXB5XCrCZv9npRT
         6heluPfnUM+EKP8ATKZ49uL3o3dHVb7q+dAWE2p8b1pE9cCpyuQfoTvvjRFc2NQuFmcw
         pIloi7n6TT0vOfIis9mw4WRbxT7GkYpYd95WbB/VnXwoGH62KHMbr7zn2/r7B26QTnyl
         Z2R8EXEA4WK7XU+VzgmFTMqdb+MwWg8IbHYhsetk0wcl7zYNblIitreroc5uhuB8Qpq4
         Y/ovnO3oq0T1wHus9D4E5QfGrXTY83kqW4rBATqfpqyv3SMxKUtg+dx0ziNBMDcyZ7V/
         LQAQ==
X-Gm-Message-State: AOJu0YynH7EWiAIq44lmkJAoLwvuFtO/aZREAcDXYEXMo4A40s27v1Ld
        F+005MEY/rklyTu5+1nDtQ2txg==
X-Google-Smtp-Source: AGHT+IG/tYBjyRNFgPitFQY76/MoQKE5OgrgdCWz91oOWK+q5wsTUk0qzSQm02oN+Cns3hpSWOxQjA==
X-Received: by 2002:a05:6512:2389:b0:4fb:8aeb:d9be with SMTP id c9-20020a056512238900b004fb8aebd9bemr6966417lfv.30.1692663248084;
        Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 21/32] ARM: dts: qcom: pm8921: move reg property
Date:   Tue, 22 Aug 2023 03:13:38 +0300
Message-Id: <20230822001349.899298-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 4697ca33666f..fa00b57e28b9 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -31,9 +31,9 @@ pm8921_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8921>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

