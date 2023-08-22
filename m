Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68CB07836AE
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjHVAON (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbjHVAOE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2D6180
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5007f3d3235so2592522e87.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663237; x=1693268037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=AFq9FsDjXeMJ7lx8HFvijF2tRZbC2o8wFWxSNf8VZrRLFPSR414/O1Hu9vZJqJgHOi
         zZ+FAdds3Jyy3Cpb4Xy5jp6ylyRQcv9TUBFDtK1mPVE/bAux8WFPh83tqGWqRguW0S6Z
         gTW+6+Vp3C+8Gm31FBApl21WqnuC+FZs4+XfkVdCMeuVWqW+07z/bJ6z/BLCP09awCiA
         26WAB2Hvwna+N5gwYfsvucWZjaGPcEjDuk9gkoJRHLu1OR1paknQ8mMob6hG18b4F7bt
         hQ9Oz1z8eYZmKXRh5AUGjuk9isDOO0Ots99ifcAPL6ubKquE6p9kE2JNp6rC9Vtu9pLY
         0Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663237; x=1693268037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=TS9fHHJsUToNaKmLWTsKGRZyPurhjz1bwKUZxZ2C9Xp1tZ2gz1Kvap0twR5vKBUV7m
         bjBYWZ83v2iGK5v2o3N+NgHjPlmaeCQwz6HzCHx3owpfenyjHIVv/TVmOmXi04VZNGEf
         B39SYKZdnQuTFghpDHxSPWw7mZvhzmv8nQ5h7mvpiH3NBGIPjW6Gi6TvaSVcLPxPLaSH
         7FW1EkO68nspwDKrSB+OyQB47MXLSjaOeozu+ePXNHxdvc5zG7zhOUhUptce3cznuG6O
         OyTOXiggcXT+7MwRGSRJc5hqKUNLD9Oym2TplhHGoofOBbmNPL27stieOnH6GqNHRMW5
         knFw==
X-Gm-Message-State: AOJu0Yz5Fk0WenQfG6oYSmyn4G9crLf2HwaNPU6Xa63SCikngykhAtP/
        jfMKj27cAjEzH3DkpB30OdAosh9tU0RGW5BPzzQ=
X-Google-Smtp-Source: AGHT+IFclpn5O91wT/xHDsDA764ZyAThh26nraBTLmtXPv260yBdCw5oHgigZncR0Zr2CPhJwDLQrA==
X-Received: by 2002:ac2:4e91:0:b0:4f8:5ab0:68c4 with SMTP id o17-20020ac24e91000000b004f85ab068c4mr5509360lfr.59.1692663237270;
        Mon, 21 Aug 2023 17:13:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 07/32] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Tue, 22 Aug 2023 03:13:24 +0300
Message-Id: <20230822001349.899298-8-dmitry.baryshkov@linaro.org>
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

Move sdcc1 device node to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2

