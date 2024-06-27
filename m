Return-Path: <linux-input+bounces-4659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92B919FA3
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 08:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43852B2115E
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 06:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCE745C16;
	Thu, 27 Jun 2024 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NZS4Oppm"
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F74500C;
	Thu, 27 Jun 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471302; cv=none; b=prWDpDuYJQ3Pr5hm7OwTjyB85+K76NYZzmDOPvAmILhhkpJUh/KIgXS8FHmWKFM036uK6EuLhPKONYkimDgN6RlarO92Fu0z6+VavycfqQreMoSAd/3reuKpvC9A/qKx7yH/QGDnPyD3qi2ROkeMStHZBCPp32EJRvoWy8Jx7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471302; c=relaxed/simple;
	bh=1HXdA6M6KAUeAAzN+YBpdYa42kM0BsZHdz1BSdufsmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpdJqsEIHYWZzhL8psKgwsw62JPLw4JTWZvtZkorKLEK1tQBcUDauZ5DaJA8a0ixUp+JDv/ydcHslXeN13KCYYEbPC4uGh7L118NcteI4vvIJktfmMA7ziMLv90Q0+bxqzmEatgrbcSHrRgS4RVlZPK4mOFdwnU+l8v7kVeN16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NZS4Oppm; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F480C000A;
	Thu, 27 Jun 2024 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719471298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pM2hUFcFpuiz5NRTmI0ZT1jIADywFVObzv76mhdSL3Y=;
	b=NZS4OppmavFZ9s52wgpclLPMHjbI7AS6tSABLu2NQoyg+rvwkYnCj4ugDwna4WZMOL9vwH
	q2GPM923lCloll4SQ401O+woLRL7l1vPxriKxt3QXZ6NIKkuYhzz7q3dK9aGZPPwAE8b77
	KMD+U9UbqcLCyfhc8qLfFN0HndraA1+zuRBnO9llmmSmEQ7kQGYju4ybuEzBGUUiBKJM0N
	Rd/7eJL3hN3b5pTIGtM8VmpNLF39H9gLUgnZNWjUpMZDxBIUrDINq28IO6c4Tp2gWvqwb1
	BGCoPF1BK1wDNmyWHKHv4YN+jX2pMH2OoZzHmez2fSXk1YFcLjEpXXuevq7tRQ==
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
Subject: [PATCH v15 1/3] dt-bindings: vendor-prefixes: Add TouchNetix AS
Date: Thu, 27 Jun 2024 08:54:31 +0200
Message-ID: <20240627065434.4915-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627065434.4915-1-kamel.bouhara@bootlin.com>
References: <20240627065434.4915-1-kamel.bouhara@bootlin.com>
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


