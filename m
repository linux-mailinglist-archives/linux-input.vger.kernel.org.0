Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FC921EDDB
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 12:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGNKXu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 06:23:50 -0400
Received: from vps.xff.cz ([195.181.215.36]:46218 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726831AbgGNKXl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 06:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594722218; bh=GszcDyWuzeoUstoycZg/BqelDXcPSvv9p22i7U58TFw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=DI5/RFmy4sKWgydJvRQnpNDnYGVJuc0b4ZcD1NprlN1NtaamjnbbebHgesCNRgIzW
         EQm7qHc8pfNEV0ODtUOcKosEPR4FfqVSDOE82cbcbqZwiF4GJYOezAL4rHvx0Eqs/5
         S3HhZfmD92Zl8WYYtLARIpAgtvwJDntZk5wngCSY=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] ARM: dts: sun8i-a83t-tbs-a711: Add support for the vibrator motor
Date:   Tue, 14 Jul 2020 12:23:02 +0200
Message-Id: <20200714102303.3007896-4-megous@megous.com>
In-Reply-To: <20200714102303.3007896-1-megous@megous.com>
References: <20200714102303.3007896-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The board has a vibrator motor. Hook it to the input subsystem.

According to the PMIC specification, LDO needs to be enabled (value 0b11)
to achieve the specified max driving current of 150mA. We can't drive
the motor with just GPIO mode.

In GPIO mode the chip is probably just using the regular CMOS logic
output circuitry (typically limited to around 20-35mA, but not specified
in this datasheet).

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index bfc9bb277a49..a278a1e33930 100644
--- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
@@ -99,6 +99,11 @@ panel_input: endpoint {
 		};
 	};
 
+	vibrator {
+		compatible = "gpio-vibrator";
+		vcc-supply = <&reg_ldo_io1>;
+	};
+
 	reg_gps: reg-gps {
 		compatible = "regulator-fixed";
 		regulator-name = "gps";
-- 
2.27.0

