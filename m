Return-Path: <linux-input+bounces-12130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39938AA7F94
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 11:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A746C983FD1
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041281D63EE;
	Sat,  3 May 2025 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Nz9Q+Dit"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA41B3956;
	Sat,  3 May 2025 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263334; cv=none; b=I/fvHit5nWmMlTg6K7/HhydiBSNo5NDOTObsrEs4QvPsSl3QjXpz7RP9rmEh7KvzSjpZnHstblGL23NaUogOzMneCdYCzJujtgfR2KED/6Hku2lB11etAXbEfSL0ecuRLFrZfFNJDI+UYg+9UvoxDkjOZIbB/Cx8Cv6dhVJ80o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263334; c=relaxed/simple;
	bh=JDWmFaDxoZVY3gQxu6nB8V2vVs15BbtJjuJfl1PZll8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwbNb3QJkm2dTLWjBcTPcPHlSX/SRnvSDLgLMqcsE2o9wRIUymmKjkIoIBH/k4us80bkD3ZFC2qz5sVU2ckbiQvLhg/ZAZK/M7Z4yPDssY8SBqpmsf9fVKUkeb+a2XuVonoMCYNai/YGdaiou9ks8j8egJTfqst2Fk4Ko7czvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Nz9Q+Dit; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1786925ED4;
	Sat,  3 May 2025 11:08:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdsQ83TAFIVs; Sat,  3 May 2025 11:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746263329; bh=JDWmFaDxoZVY3gQxu6nB8V2vVs15BbtJjuJfl1PZll8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Nz9Q+Dit/VyelFL41ecgnR90UZhdFzNfLWY775bu2LKk/svJh5IkP/id4PJ9wngZI
	 ZXeYLSbaLldv8ZHKp9Pe20Z9nbjWqm/DNrqFhbWDzO9r2YR+M1Mi2imuTTrf9fe5xK
	 CHNmZA5NQ8PhE5PIS4dFoySAKwOuSzC9ii+0w6orajs4n/Rpk1vr3pjciKNCNI++ef
	 sPoUxHqpDfM0CPNrp9Khu+9wUz5Jtt9ge7DdYcHoye6DIab7sxKHjGaFlYMMVdj9ZH
	 4rSMI2pyKKzrae4zCNn6SqXaHCyl9EADkbIwbs8s7GGspQ39SLBzsLQjmytYCCBzdS
	 W4XoP3AxGCOIA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 03 May 2025 14:38:27 +0530
Subject: [PATCH RFC 1/4] dt-bindings: input: melfas-mip4: document
 linux,keycodes property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-mip4-touchkey-v1-1-b483cda29a5b@disroot.org>
References: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
In-Reply-To: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746263323; l=1179;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=JDWmFaDxoZVY3gQxu6nB8V2vVs15BbtJjuJfl1PZll8=;
 b=zHf3GWA9mgYVqAJKyKz0DaMzGfak5Y06FmzYPjE0g+4kmNt4/kC7UZED47jPidQGFvLrquOV+
 4dcJ3oE6pwJAyXbBJ6qT2Itv40jINxBlS4OLe8Mg6PlzAJeFXYh/2G7
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the linux,keycodes property. The property values are key codes
which are used in input key events generated by the touchkey device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
index b2ab5498e51900e887fab4d9b5239cccccec2ea9..16d1031ee017604ac56109dfbebfce6a05491c60 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
@@ -7,6 +7,7 @@ Required properties:
 
 Optional properties:
 - ce-gpios: GPIO connected to the CE (chip enable) pin of the chip
+- linux,keycodes: array of keycodes to be reported by touchkeys
 
 Example:
 	i2c@00000000 {
@@ -16,5 +17,6 @@ Example:
 			interrupt-parent = <&gpio>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 			ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+			linux,keycodes = <KEY_MENU>, <KEY_BACK>;
 		};
 	};

-- 
2.49.0


