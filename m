Return-Path: <linux-input+bounces-17007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B9D15DA7
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 00:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B147301FB7B
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 23:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FB226ED56;
	Mon, 12 Jan 2026 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RzPtwHhV";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hb2jodZD"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5A35965;
	Mon, 12 Jan 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261554; cv=none; b=hzRnjTavCChKb+Qm8Msai21C4aAft+WSAKWeD7oZCkVxtEZBayE1Wr1YR7ODq8WFarEUQl0n8uGeefvkUQ02PU7hFVROBg6sY0pZvkqK4d8GEWgB9NatB0iAPHTkIlWfZtwUBGSrqadS748v3rRRucTTO4a17BRyNBNdb5nChrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261554; c=relaxed/simple;
	bh=3wtmsjF6ytyJKH+q9T6I2KTMYI9ITmXA0dzrO7/vE0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCuLz9busJ0S3t7eHefLwgX/XcgNTrllUDnKsRUZ8c+5FC2nlvky9f2za7OSrqtZWlJaeeKxCWBv/+D2f9c1AoEEhvho9eVOpYLSsVCdcsVlTUqYG/P1LePrKMPSOD3X4MxjgidkPPwyJ85mYS/wtdfMEWBvFmsxfHBhY+uPbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RzPtwHhV; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hb2jodZD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dqpsg3k6yz9spG;
	Tue, 13 Jan 2026 00:45:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QbAWgaId1HIkJ1t+Tlb6BWHQEoJKtPVXAYbc0qhwfaI=;
	b=RzPtwHhVTaVmwvudeO14BeOPc9cngK3SPbDUWKsq2W5nrxm9ZfQnWD/mg6O8YBcDohZ9ux
	UdcUinnEgsno2sTxMzZ3XkfSiykKtgc69mT3ELtS2OM4gI0iGRCQtYE2mi6HmJ1Y95hQ3Z
	l2lnKVFq+dKKNs0XsSZQUBRS6c3afrPryAPC35iDR1YzrEiJ+RBkvCRzBycONVxSXv3ZRx
	trcHcngHjHtp79/rOoXmxnDYZ5rjAB4RVEHx7n5iQWPWpPsgZ0BUHY3deBQrnWTPuqr5av
	GrJkGdbnei9QH01C/ezDyYRy2zIm/nH08EJkCqKQi67ANmLg9+5pQUWiszf6xA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QbAWgaId1HIkJ1t+Tlb6BWHQEoJKtPVXAYbc0qhwfaI=;
	b=hb2jodZDukjvhn0MzSmnL8S32+dY99pznJPqyN287KtoE0Dr5+dp5uwLBp/1+IWVrTZLkh
	P4+81UT/t0AY+52udb02nSifv7o48e2Sbi2mfn9YqPNffrv6LXPSOnyvUHV2PrbBm6bqH8
	tx0okzOZ4zYsoioBLEOENuDnODSu3XHNuXk8j0oxTFo/NF8wO1dSYMV0pGvhmwoXv7Pa8p
	lr3F2XReKmsFM0EVx+XXEOwZJXyz9j75YpphOl842oB1SrN+Dp5PUZLKfQmRWV3e1dJikk
	P0kyD2lTmqozBqvx+NZ7m7JJs4hbg2xevCNeiAApY8x/PsO5YYuhFdV3U2oGiQ==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
Date: Tue, 13 Jan 2026 00:44:56 +0100
Message-ID: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 005772ecef2e6c245f2
X-MBO-RS-META: x8mpdwumd64aaqrj3r9zmaoah3fqfgfm

The old Ilitek touch controllers V3 and V6 can operate without
interrupt line, in polling mode. Drop the 'interrupts' property
requirement for those four controllers.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../input/touchscreen/trivial-touch.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index fa27c6754ca4e..a2145a62f9723 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -57,13 +57,25 @@ properties:
 
   wakeup-source: true
 
-allOf:
-  - $ref: touchscreen.yaml
-
 required:
   - compatible
   - reg
-  - interrupts
+
+allOf:
+  - $ref: touchscreen.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ilitek,ili210x
+                - ilitek,ili2117
+                - ilitek,ili2120
+                - ilitek,ili251x
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.51.0


