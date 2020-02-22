Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBC716924B
	for <lists+linux-input@lfdr.de>; Sun, 23 Feb 2020 00:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgBVXV4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Feb 2020 18:21:56 -0500
Received: from vps.xff.cz ([195.181.215.36]:34184 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbgBVXVz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Feb 2020 18:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582413272; bh=qyh2OlARxoLc6jQbO/NQcybKEjpkaFE5bGOvLXVrtSU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LjoOPj4St3DnRfbWcKLv0tZmk9I25Jh9//0tE87FGKiS/D59r2V/1IBKeS/BIf5CA
         uSSlifj/4n2AExCoXYJi2llIV299w6d0gnk8azsYMLYYMXVwQ1hu8hrWRfiUSG74TO
         4TIdXcf4qN1XjlZ6pRP5avLGYg68IT/dg3ov8qcE=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] ARM: dts: sun8i-a83t-tbs-a711: Add support for the vibrator motor
Date:   Sun, 23 Feb 2020 00:14:27 +0100
Message-Id: <20200222231428.233621-4-megous@megous.com>
In-Reply-To: <20200222231428.233621-1-megous@megous.com>
References: <20200222231428.233621-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The board has a vibrator mottor. Hook it to the input subsystem.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index 2fd31a0a0b344..a22920275e99b 100644
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
2.25.1

