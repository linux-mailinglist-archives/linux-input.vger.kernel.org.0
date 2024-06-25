Return-Path: <linux-input+bounces-4612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D9916AAE
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 16:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4867728A6E2
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 14:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774BD16D31F;
	Tue, 25 Jun 2024 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jlTP5wnZ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8314900E;
	Tue, 25 Jun 2024 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326397; cv=none; b=YGVhePG4wGR37GuMxNkvPvEPBcaB/hBKD6f83b10k+rU2BSk8SJFvZ9CoQ4wvLCXVL9Ev6QRFnUKQCNfgNb0cy7bK1dnDqZt/jrcBf/EzY982pYsH2D0FDasl4fR/9UVa0JeAlK27MwWuU7Hy0myTkDY1TbpwHHWmyAMpOcL8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326397; c=relaxed/simple;
	bh=1HXdA6M6KAUeAAzN+YBpdYa42kM0BsZHdz1BSdufsmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPO/uFoGDz0dfwID0tEs2lj3Gw9IJN3Zyf+EU7jXEInKsnrbqSntkcHlS0i/citvjQDApPObBySOX7KghtIv4vF+soI5G6JK80NU+WFYkZ2bmwSAYRNwRaVShHtM5BxZPN39+TXA8Rselff0p+zNlncVyyYZ9CpY7v9T8A7yhV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jlTP5wnZ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95367FF80D;
	Tue, 25 Jun 2024 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719326393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pM2hUFcFpuiz5NRTmI0ZT1jIADywFVObzv76mhdSL3Y=;
	b=jlTP5wnZ/+Au0tt2YDl+/iQ8aSWVWaw80lxI6MYbRMGHhc5HYjr37nUTtQQywajUANE2kU
	g2TEVwx36oVwSdjNppimgFaMV39Nn1YqW3wbUbC9rbfANu2nrIOSPkPzgFpxSdER0mzzay
	DwabXtncYuCeZKMCYcl2jXPpTmx6uee+rtnWRhlrjqn/wRNEg1/sxVNauFghxEUmgIfzWu
	7EBVGsMVqNqQ6vX36GYKp5kz8ZdwEUpZkRa0i8Ioo1kBSj9AJB6UyxNpiRjT5EyPFCTI87
	Um2EC6igL1GaAdEvkP+NAigEmv4aiTDade2pcU/m5hzQ7xRMW7EEdB7ilQln8A==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 1/3] dt-bindings: vendor-prefixes: Add TouchNetix AS
Date: Tue, 25 Jun 2024 16:39:46 +0200
Message-ID: <20240625143948.54452-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625143948.54452-1-kamel.bouhara@bootlin.com>
References: <20240625143948.54452-1-kamel.bouhara@bootlin.com>
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
index fbf47f0bacf1..f102b3abf3fc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1489,6 +1489,8 @@ patternProperties:
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


