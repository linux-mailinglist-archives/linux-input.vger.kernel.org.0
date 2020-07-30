Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714A52332F5
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 15:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgG3NYx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 09:24:53 -0400
Received: from vps.xff.cz ([195.181.215.36]:55014 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728852AbgG3NYw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 09:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1596115490; bh=kwgWUPQHVNL5P7EKwsJlCg0NIkarJ3r+wsUpQ/WUKtQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=j3fW8rnNRgLJBrdU8YKFuPb0BDRXF6DZp+BBw0feOkeXDPCGSOBjlvnDU/IUNTkWa
         a55S2ChfFInDfsHqCHz6zQ2kT/TgyEM1o1LXk4H1UGGf9QSZQ9wZlWHqZHSVmlLdpw
         x3eWK/2LbPy3vgL8/eZLO67UwmVpGD7OknqyubAE=
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
Subject: [PATCH v5 4/4] ARM: dts: sun8i-a83t-tbs-a711: Increase voltage on the vibrator
Date:   Thu, 30 Jul 2020 15:24:46 +0200
Message-Id: <20200730132446.3139980-5-megous@megous.com>
In-Reply-To: <20200730132446.3139980-1-megous@megous.com>
References: <20200730132446.3139980-1-megous@megous.com>
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

