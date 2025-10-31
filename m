Return-Path: <linux-input+bounces-15842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7BC26D58
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 20:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23398403311
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 19:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1236831B832;
	Fri, 31 Oct 2025 19:52:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8E285CAA;
	Fri, 31 Oct 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761940322; cv=none; b=meZohVRFNjBxza1UM0bTCsSqkhf8K/qf/Ehxq9fvVqOY8RHqRVE/irvhoamJcy9rOvUsr8qIZuj6AUOR4XJqG7nwxvQvI0P+GCtceDoo0FUUYqCj1bNztaCphQI5zkMAkH9Jd4oe/EJdaa+u9Bf0nBANy9BENfHGg46jAbsnr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761940322; c=relaxed/simple;
	bh=f47jV7OFWwfnBq5ZsXpvjaNfTAGs2LmH562peNfEJpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFh+6d51HNh5A/RSg+4KN+0ufoG2cwvcml3m55lX0O9TrrzoIKUGSnfiVz6L0wxmJxhqxOnJuPA70fVELgN0gIl4iJy1HjvcshcSevLdODyHm6EkEe2YYCXlYZ2B1tfWuOlxeVTYp0+ZATinLugHucUjZwPRNF4JeQEP0TDAvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59VJvKXm001678;
	Fri, 31 Oct 2025 19:57:20 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59VJvKr9001674;
	Fri, 31 Oct 2025 19:57:20 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v7 6/6] ARM: dts: imx53: add imx53-qsrb PMIC power button
Date: Fri, 31 Oct 2025 19:57:18 +0000
Message-Id: <20251031195718.1586-7-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251031195718.1586-1-akurz@blala.de>
References: <20251031195718.1586-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the board hardware user guide IMX53RQSBRM-R.pdf, the
mc34708 pin PWRON1 is connected to a button "SW6"/"POWER", connecting
this line to GND.
Add support for the imx53-qsrb "POWER" button.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..977dff72b9e2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -139,6 +139,19 @@ vgen2_reg: vgen2 {
 				regulator-always-on;
 			};
 		};
+
+		buttons {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			onkey@0 {
+				reg = <0>;
+				linux,code = <KEY_POWER>;
+				debounce-delay-ms = <30>;
+				active-low;
+				fsl,enable-reset;
+			};
+		};
 	};
 };
 
-- 
2.39.5


