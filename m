Return-Path: <linux-input+bounces-676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFC80C934
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 13:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B43B211BE
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC25A3A26F;
	Mon, 11 Dec 2023 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XNJ4ic/3"
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAA8D5;
	Mon, 11 Dec 2023 04:14:42 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51D461BF204;
	Mon, 11 Dec 2023 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702296881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyU0MrPkAquO0yDvZ3LG19USjtRAx9Zi0FGDGYHw/pQ=;
	b=XNJ4ic/305M6+X+lKQnyuEWHW9sv0O3tlNi1Fl2mff859EFMspqQe1X8fJmcrcTIvsuFPd
	1OFj6e9wErqMZuUBHRAA8Lwj17meEPSlkJE80aHnhS1j+ivxdgiZetReOxviqNFFra0VyZ
	0f96UiHbLVxM53dVaQSIR/9YCpzJmhzUlN8Wpy6udLvGz8JsFWoONtK7TNYEenMP6xRdu2
	04pCZd/m7mwJU6lfsBLewF1r5D9sNIs+xeKRIW3/hKPUoTmWwzVpZ2oNiq7aphNhe8F7W9
	0CKcIn+enSCMga8N1jjbtbS5ldgPNx1iy7x2bM49PH0lOOVHKxlEoS11OzU5Ww==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	bartp@baasheep.co.uk,
	hannah.rossiter@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add TouchNetix AS
Date: Mon, 11 Dec 2023 13:14:27 +0100
Message-ID: <20231211121430.1689139-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
References: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Add vendor prefix for TouchNetix AS (https://www.touchnetix.com/products/).

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..78581001a79c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1400,6 +1400,8 @@ patternProperties:
     description: Toradex AG
   "^toshiba,.*":
     description: Toshiba Corporation
+  "^touchnetix,.*":
+    description: TouchNetix AS
   "^toumaz,.*":
     description: Toumaz
   "^tpk,.*":
-- 
2.25.1


