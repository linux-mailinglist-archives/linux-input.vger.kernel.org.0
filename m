Return-Path: <linux-input+bounces-4048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148E8D8639
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 17:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4FA1C21832
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD279132135;
	Mon,  3 Jun 2024 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fe0qzcOE"
X-Original-To: linux-input@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE0131736;
	Mon,  3 Jun 2024 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429240; cv=none; b=ABfJlWCETw9ACyl/DDiiHLS+pN2H93VCHQsn5AUSsXuaA8k37Nv6vxOePUQu5bQWCvRo1kUc3bquTdOmHAGtCUMf8IQLhysxCzHThjcypQVUKtSFzJBm/i5R8zVh4uz84L5eV6HHrdJeZwJjFN9EO2lDZ+wVz2zJc8gspn4KiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429240; c=relaxed/simple;
	bh=1HXdA6M6KAUeAAzN+YBpdYa42kM0BsZHdz1BSdufsmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rniEU+qb6r224TV0xrVX8pXIKCyrwtebLoe6mf8FRdTctFJpSCEHLEXDMkBrJ47Ni7WKg9FfoR/tCUPFpGXZ/07+lQGAZWCwKYEow8HPWgp6S+tW8igyysm2NC6wDG7m3xkC1B4bsNLVI0pS/oXfrUQsATKFkLZ5S/P7mGYjykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fe0qzcOE; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 116AFE0003;
	Mon,  3 Jun 2024 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717429231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pM2hUFcFpuiz5NRTmI0ZT1jIADywFVObzv76mhdSL3Y=;
	b=Fe0qzcOEdTVSeHXb+darvDSQg229NLol5ksrrc27UZ8XiiCn9tIDiz77ciyKkXYL/AHVzM
	rdhh489t+41Zddj4O0ieDVXY7La5SWJxIPDmxQAwnusA6cEuidFCX9HvJmiuSnQIH1BaQA
	O0UsfJvZS2NGFBWQeGB6fKBV681ebA9Z18eNF6HGsb/33+h7KO/cn+4c7/N0zm9h7L0bUJ
	ccRESkhx40xBQiZV1ixtCQalzzpksrO7HN4vjHn3L13nfYVOP03UgT6axWLii3hPFyDBYL
	fRMxW3OEo9ON6Cg130b5BpCF30Bt80taYRhNz1/UmQESzZ+eVE9cJllECRNt0A==
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
Subject: [PATCH v13 1/3] dt-bindings: vendor-prefixes: Add TouchNetix AS
Date: Mon,  3 Jun 2024 17:39:23 +0200
Message-ID: <20240603153929.29218-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
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


