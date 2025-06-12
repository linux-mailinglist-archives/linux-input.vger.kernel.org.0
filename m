Return-Path: <linux-input+bounces-12855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6534AD7B34
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5D31893467
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894032D4B57;
	Thu, 12 Jun 2025 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZGUhFo+q"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AB2D4B4B;
	Thu, 12 Jun 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757321; cv=none; b=EzTkx42IPc0HiBGFgn+0PP6Vm/UmnChw5Z3sQM29WHAwrLYU07A8dUVLwU2wTBvHNhq29uZGWXKIw0Mbed5mCVPgGmRthN2FH9YbWAn1sUxGplW+UrgU2wOwsQs+SuKmKemjvxOH9QRE3qnVbeEu0PLCe4QEscAq1FxD7Zekf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757321; c=relaxed/simple;
	bh=/gTnO/1RuBmF8+C1719L1QDUtsDQga6wf1RfvP9AhSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2LmWw3eWGPkqq36mYpUHJQPYU8mc8P9AVdLXPeJX0lIzfgIgHHpxhJo+T5z3cf0oq3mkbOJc/tZjDe4l8AedVoKcbcI9kE7hEx8xOue0qpD6uSKklxPGlNNNmwrO+qhQocHjLzhXRsiIo69UFOfcN9nI7GnoXIzWTFi3Cszy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ZGUhFo+q; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 66BC82600F;
	Thu, 12 Jun 2025 21:41:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bbsKMTDjPi0; Thu, 12 Jun 2025 21:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757316; bh=/gTnO/1RuBmF8+C1719L1QDUtsDQga6wf1RfvP9AhSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZGUhFo+q/BFGAu5M7Rm+qG6vvXM2TU2xlNU3DVi0S24W86l0jyXzaQUdys5Teb4tf
	 it06kj89xWrSSTPIM1zRxr9IbqbNdS/+KAPWv4MjFDaQRsYy5HT/lF+mbWJ+IO960H
	 ga9YMIQKLkrPeJ98Y6MAZEWVYghkGSzcj4bW5HF86FavZPwyxiiUfGXSkpfVftYPgb
	 /BkgjjGWhSe+CUW+e3a64aoTbT5CsW5jOFczvb7WE7CSfynpD3cfzN0nMIKTeyWpMx
	 CRN02Clwf11a2eyoqYZF73NGbcWLUqIhkfz4VYKwVPXjf7jGaoSDTZwphr2VFgKanw
	 C3hPjUcoHooPg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 13 Jun 2025 01:11:34 +0530
Subject: [PATCH RFC v2 2/5] dt-bindings: input: melfas-mip4: document
 linux,keycodes property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-mip4-touchkey-v2-2-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=1291;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/gTnO/1RuBmF8+C1719L1QDUtsDQga6wf1RfvP9AhSA=;
 b=IKwbFJtxDsvMPZQxScvOxo8vbtbodGI4CS/Pn7XjTQzOBjB/DJNvaMF6kwdBhQ5fYhf+GdNwp
 eRulrSHmMpoDx8Cc8v5Uu7jvL2LP2FNXdhEynb9uxIKvShtP/EqXqPt
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the linux,keycodes property. The property values are key codes
which are used in input key events generated by the touchkey device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
index 5532d46f85a235127e2b3513846259aa7372bda5..6d5e0f4b062f44f83484eccd82353d6f150f9d8f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -29,6 +29,11 @@ properties:
   ce-gpios:
     description: GPIO connected to the CE (chip enable) pin of the chip
 
+  linux,keycodes:
+    description: Array of keycodes to be reported by touchkeys
+    minItems: 1
+    maxItems: 4
+
 additionalProperties: false
 
 required:
@@ -49,6 +54,7 @@ examples:
         interrupt-parent = <&gpio>;
         interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
         ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+        linux,keycodes = <KEY_MENU>, <KEY_BACK>;
       };
     };
 

-- 
2.49.0


