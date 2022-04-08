Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1E34F9497
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 13:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbiDHLzv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 07:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbiDHLzt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 07:55:49 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90719E38AB
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 04:53:44 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id d7so9745045edn.11
        for <linux-input@vger.kernel.org>; Fri, 08 Apr 2022 04:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TuDwf9DmfKjZ+Hb8XYy4JWoDUAtU27fdQoF6Y3FaEbI=;
        b=I9Hti15oCiC+1r9/T+zZIT1MUflgV81Xou4UucCb06wTS93uAeuHskYIC9qzSXemRD
         eQoiI+Et4U5fTIebjGWx7pp4sE3m+9SZKqNJf6N9MMNSfrrZOo8GNMtoL5c0JCYao5qN
         i5z/LeQE8KtHM9y0Hq2hdON+yPvGYIVgGgRsuJnhPKmeFIoRUd7sjFTS5TvTM3N7Rc0S
         ugMHzrx/VUpxWwxdHzpIPsfMqKiaSXnXBH4GNOfcSDkMSZnwa2TfPdubUPYOqCUxoI1H
         C6XhOWhbmHfrBcs3NYRlqQqBU8VyCczN4WqLVpHXOtNOghRAxOLVKWUINX3iRTSNNoCB
         HMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TuDwf9DmfKjZ+Hb8XYy4JWoDUAtU27fdQoF6Y3FaEbI=;
        b=ko7YYt09eMNbIC1EL3g/HzBy8S5Jtx82O1i93HFisvg4LS4zzO/HHDhaCoS1ASmtnC
         VADAXT1uZYHm/qp5foaG/dYJeXLqAo2R9u0oYpIzRZIQ9+hLpTT+C5IPK8ISZ+PoyAlA
         yIVJo95MxLbrubXZng3wzxrbwyZKubIKVemZOtgR3qxcy9imqsmWdFxM0UzpipmC+6Sq
         ZK4Yrw+3FELBTlwNyQTygb5co3e5kPEt33ILJzsKLQDmNDuTgss0EtSwDRxXwJxR7o11
         P5GrwQrNoKh9gSl7aoZfUMr4zwBO+/gytHAZBYPjhjQokUCELivKp2d5rJzfJ7uBOqPh
         8aOg==
X-Gm-Message-State: AOAM531nmZ+r2VI9cWjTMhgS2sIr7vxfkXWEWac2w//6KkLnraXFyeQQ
        zfCp/2Jgdp/Ot7tY3RZgxG8FSAQ+ZP+Iww==
X-Google-Smtp-Source: ABdhPJx9CMUuOFZ7M6KLhPEfsnIyRxwVd/e2o+GD6WcluNzSPL96cEabbtQ9QSpF8hxSTM+ijA1puA==
X-Received: by 2002:a05:6402:1652:b0:41d:5896:a7b0 with SMTP id s18-20020a056402165200b0041d5896a7b0mr517524edx.128.1649418822970;
        Fri, 08 Apr 2022 04:53:42 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r29-20020a50c01d000000b00415fb0dc793sm10470899edb.47.2022.04.08.04.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 04:53:42 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics
Date:   Fri,  8 Apr 2022 13:53:10 +0200
Message-Id: <20220408115311.237039-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408115311.237039-1-luca.weiss@fairphone.com>
References: <20220408115311.237039-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
This patch depends on the i2c10 node introduced in this patch:
https://lore.kernel.org/linux-arm-msm/20220408114205.234635-2-luca.weiss@fairphone.com/

For reference, the dt properties are based on the following properties
from the original vendor driver:

vib_f0_pre = < 2350 >;
=> awinic,f0-preset = <2350>;

vib_f0_coeff = < 260 >;
=> awinic,f0-coefficient = <260>;

vib_f0_cali_percen = < 7 >;
=> awinic,f0-calibration-percent = <7>;

vib_cont_drv_lev = < 125 >;
=> awinic,drive-level = <125>;

vib_f0_trace_parameter = < 0x05 0x03 0x02 0x0f >;
=> awinic,f0-detection-play-time = <5>;
=> awinic,f0-detection-wait-time = <3>;
=> awinic,f0-detection-repeat = <2>;
=> awinic,f0-detection-trace = <15>;

vib_bstdbg = < 0x30 0xeb 0xd4 0 0 0 >;
=> awinic,boost-debug = /bits/ 8 <0x30 0xeb 0xd4>;

vib_tset = < 0x12 >;
=> awinic,tset = /bits/ 8 <0x12>;

vib_r_spare = < 0x68 >;
=> awinic,r-spare = /bits/ 8 <0x68>;

vib_bemf_config = < 0x10 0x08 0x03 0xf8 >;
                                 (0x10 << 8) | 0x08
=> awinic,bemf-upper-threshold = <4104>;
                                 (0x03 << 8) | 0xf8
=> awinic,bemf-lower-threshold = <1016>;

 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 67d14bda3797..4691a5e5c8e5 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -296,6 +296,35 @@ &cdsp {
 	firmware-name = "qcom/sm7225/fairphone4/cdsp.mdt";
 };
 
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_HIGH>;
+
+		awinic,f0-preset = <2350>;
+		awinic,f0-coefficient = <260>;
+		awinic,f0-calibration-percent = <7>;
+		awinic,drive-level = <125>;
+
+		awinic,f0-detection-play-time = <5>;
+		awinic,f0-detection-wait-time = <3>;
+		awinic,f0-detection-repeat = <2>;
+		awinic,f0-detection-trace = <15>;
+
+		awinic,boost-debug = /bits/ 8 <0x30 0xeb 0xd4>;
+		awinic,tset = /bits/ 8 <0x12>;
+		awinic,r-spare = /bits/ 8 <0x68>;
+
+		awinic,bemf-upper-threshold = <4104>;
+		awinic,bemf-lower-threshold = <1016>;
+	};
+};
+
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm7225/fairphone4/modem.mdt";
-- 
2.35.1

