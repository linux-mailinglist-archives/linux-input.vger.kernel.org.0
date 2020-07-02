Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DB021223D
	for <lists+linux-input@lfdr.de>; Thu,  2 Jul 2020 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgGBL0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jul 2020 07:26:37 -0400
Received: from vps.xff.cz ([195.181.215.36]:43636 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728646AbgGBL0g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Jul 2020 07:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593688847; bh=kwgWUPQHVNL5P7EKwsJlCg0NIkarJ3r+wsUpQ/WUKtQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=hMUlCpFcAbnfx+ZjZRBBrRmbEJyF0KwxvMCu1S2D3kSxndg5t1N5OP+CI7cIMZ7ra
         9o3sZ4hIBngB4F7s0ndKjHUSgIKpJprKQO7sr87RKEMnvh9iRRS1YrUZySpLkV7T7s
         BWIICoFQljF2Fr/S6vV2wV5mrAaiDBSN1qfM+DVY=
From:   Ondrej Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] ARM: dts: sun8i-a83t-tbs-a711: Increase voltage on the vibrator
Date:   Thu,  2 Jul 2020 13:20:41 +0200
Message-Id: <20200702112041.1942707-5-megous@megous.com>
In-Reply-To: <20200702112041.1942707-1-megous@megous.com>
References: <20200702112041.1942707-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Vibrator motor is weak at the current voltage. Increase the voltage.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index a278a1e33930..1e086e979348 100644
--- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
@@ -434,8 +434,8 @@ &reg_ldo_io0 {
 };
 
 &reg_ldo_io1 {
-	regulator-min-microvolt = <3100000>;
-	regulator-max-microvolt = <3100000>;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
 	regulator-name = "vcc-vb";
 	status = "okay";
 };
-- 
2.27.0

