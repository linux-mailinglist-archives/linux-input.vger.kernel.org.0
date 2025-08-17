Return-Path: <linux-input+bounces-14061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD338B2929E
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9FEA4E03BB
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D80F24469B;
	Sun, 17 Aug 2025 10:23:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E52253FC;
	Sun, 17 Aug 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426182; cv=none; b=uVjzh4osA5T3zJWtth4+4A/IUQHO8AKM7j4CIhmQ1bbGbokTin8gqm5cjxnAd0qP49TefoqGyB2bpG98oWr6lxZDc4ezHjTUsPNyDnxEokuWfiZ1JuiuNn9dc3Bi/NdNyRWxvDRAIEOsnYRNsngs0b/+xjG+h0e2RNbRTQsMUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426182; c=relaxed/simple;
	bh=I3rayUSW5zuktXOF5XyLNF+Oo33AU9vj7SNG5c3h+Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLGaggq0q18pvoEfm0uU3WgXoibjeiSlSCqA1Kt2hu+3yn2scgkHoWr5uZOvfdgQ3X0xnL8aPoKF/TVHDgx9fzWWNByir4ARbMA8PvHstdYjd+3n/+CWPP0/qMYp6A8zMHl+XbbiyWUURwBtbv2ioKqwqzNFgkb9V80UgfiU7Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARr9A029792;
	Sun, 17 Aug 2025 10:27:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARr3O029787;
	Sun, 17 Aug 2025 10:27:53 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH 5/6] dt-bindings: mfd: mc13xxx: add pwrbutton dt support
Date: Sun, 17 Aug 2025 10:27:49 +0000
Message-Id: <20250817102751.29709-6-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250817102751.29709-1-akurz@blala.de>
References: <20250817102751.29709-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mc13xxx series features two or three power buttons that may be used
as input device. OF support will be added in a different commit.
Add a short documentation for it according to the reference- and User-
manuals of the mc13xxx series.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 .../devicetree/bindings/mfd/mc13xxx.txt       | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index 8261ea73278a..3c7bad07858f 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -24,6 +24,15 @@ Sub-nodes:
   Documentation/devicetree/bindings/leds/common.txt.
 - regulators : Contain the regulator nodes. The regulators are bound using
   their names as listed below with their registers and bits for enabling.
+- pwrbuttons : Contains the onoff input button nodes.
+  - #address-cells: Must be 1.
+  - #size-cells: Must be 0.
+  - reg: Contains the BUTTON ID (see below)
+  - linux,code
+  - debounce-delay-value: debouncing selection of 0 (0ms), 1 (default 30ms),
+    2(150ms) or 3 (750ms).
+  - active-low
+  - enable-reset
 
 MC13783 LED IDs:
     0  : Main display
@@ -110,6 +119,20 @@ MC13892 regulators:
   The bindings details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
 
+MC13783 BUTTON IDs:
+    0  : ONOFD1
+    1  : ONOFD2
+    2  : ONOFD3
+
+MC13892 BUTTON IDs:
+    0  : PWRON1
+    1  : PWRON2
+    2  : <not supported>
+
+MC34708 BUTTON IDs:
+    0  : PWRON1
+    1  : PWRON2
+
 Examples:
 
 ecspi@70010000 { /* ECSPI1 */
@@ -152,5 +175,17 @@ ecspi@70010000 { /* ECSPI1 */
 				regulator-always-on;
 			};
 		};
+
+		pwrbuttons {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pwrbutton@0 {
+				reg = <0>;
+				linux,code = <KEY_POWER>;
+				debounce-delay-value = <2>;
+				active-low;
+				enable-reset;
+			};
+		};
 	};
 };
-- 
2.39.5


