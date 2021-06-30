Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752363B8191
	for <lists+linux-input@lfdr.de>; Wed, 30 Jun 2021 14:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhF3MEV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Jun 2021 08:04:21 -0400
Received: from [94.230.151.217] ([94.230.151.217]:44888 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S234148AbhF3MEV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Jun 2021 08:04:21 -0400
X-Greylist: delayed 588 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Jun 2021 08:04:21 EDT
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 6C5CC23B1D;
        Wed, 30 Jun 2021 13:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625053921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=y1XL/hYUEe4pWSBZNrr6vcPc+Q9l5vvzj2hUWj7Z/8E=;
        b=xDa463UlFhTvYmEfNZHhVAEKesM/Fvsx8lNCXI/nHZk0c96HA1PwzRxv67vuoRbaxM4O6C
        KeA7+kjSFY20sCaCqD3MEDYYzU3MqQmcV6OrQY2xuxrwE5aDhgw5WoYC/5PcY5LegotpM1
        9iq8aCLCJkq0rQejGMOt/4MFnGO3UAw=
From:   David Heidelberg <david@ixit.cz>
To:     john.stultz@linaro.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH] ARM: dts: qcom: nexus7: define touchscreen properties
Date:   Wed, 30 Jun 2021 13:51:14 +0200
Message-Id: <20210630115114.19808-1-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change makes touchscreen work as expected on Nexus 7 2013 (tested).

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 3cf7650ca086..e7ed775abc5d 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -306,11 +306,17 @@ i2c@16280000 {
 				pinctrl-0 = <&i2c3_pins>;
 				pinctrl-names = "default";
 
-				trackpad@10 {
+				touchscreen@10 {
 					compatible = "elan,ekth3500";
 					reg = <0x10>;
+
 					interrupt-parent = <&tlmm_pinmux>;
 					interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+
+					touchscreen-size-x = <2240>;
+					touchscreen-size-y = <1350>;
+					touchscreen-swapped-x-y;
+					touchscreen-inverted-x;
 				};
 			};
 		};
-- 
2.30.2

