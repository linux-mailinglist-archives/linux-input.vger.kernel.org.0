Return-Path: <linux-input+bounces-13406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94972AFBBF8
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 21:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE83D17E802
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 19:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A87267729;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFJyM5s2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F758221FBC;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918099; cv=none; b=C7hNePsiXw3e9cTIx3oGIHLmrRnzxVKZo58LQhI5lRfyb2rANxx4luTjxeTUGzct87Jyrlvw3TIdPJGKFQTMifec8oEmJAo+/v63Wwc4n0a8l1SKsDwQorbQ5vLkwHCbEdDOq7qDr/aHhZnQdoHmM7vkTO78g4ZGZBFVundW9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918099; c=relaxed/simple;
	bh=LVwbzxqQObC8WvjPEmgI7RLdvYu34KieafRmiDJ9gsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWx3K6Emo1tE5TkD/5yvwcsPYX4ZbirubYIfJWj3m4FYwqiKVnFOCMXr7L3fA8qCM7CCs9LOWt/XL+Zq2MOzh+l1Lml+3OwocyC4OIDwhObGgSM/Wcqlh5lNOcSbQcPCSJCBodpch120+Ni2wQ3mnQyngPzMJdiVMsu9jJg2qXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFJyM5s2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 336A8C4CEF1;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751918099;
	bh=LVwbzxqQObC8WvjPEmgI7RLdvYu34KieafRmiDJ9gsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PFJyM5s2Y1Zr+yyautWbM8vR19NSIaYM/6Ek4++YNl4jb8TNUNNu6H1aLH0KKvoMm
	 HmUXWgCy7Qpncah0NknGtP9arSlnpRIV6IfLgbkCKzHW8ZD6dJRz3GmttC9p/0qzEo
	 9sxrTgwokTdSkXorFJSUlwL8CV1mOQYylonhAOS7qnKPK6OmJCYoU6B/MDebCRLwjh
	 KX/XCG2MUGB0g0mtgVJ0HoR6tL9d+cYmQz73pNQNwheOBNErTWkGMJlbb0irfpRS4w
	 jBXgFQlxrNr0ez6OYpouwpCc4W6okDNty12IRlXpyn8Kf+lLqp/yA3EImJAbjTLrxS
	 agIHKLmMF0zQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A5BC71130;
	Mon,  7 Jul 2025 19:54:59 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 07 Jul 2025 21:54:25 +0200
Subject: [PATCH 1/2] dt-bindings: input: syna,rmi4: Document F1A function
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-rmi4_f1a-v1-1-838d83c72e7f@apitzsch.eu>
References: <20250707-rmi4_f1a-v1-0-838d83c72e7f@apitzsch.eu>
In-Reply-To: <20250707-rmi4_f1a-v1-0-838d83c72e7f@apitzsch.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751918097; l=1574;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=x6gb2zqcsU2SCeUMlPPeDX08TtoXkuo2DiW8v+WxDNM=;
 b=CP3W0/DjntK/rKWetcgQ7kkDFo2qbGZljiIiBTGWeZs6roaKxqIEsiOw0qI2H3ULgZCApRqJ1
 W4xtD1mVcNqCBzE8XhyR2lfOh4p0Ku2QKd2BHySjtrCmLb5s4Z55ctU
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

In some configurations the touch controller can support touch keys.
Document the linux,keycodes property that enables those keys and
specifies the keycodes that should be used to report the key events.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../devicetree/bindings/input/syna,rmi4.yaml         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index b522c8d3ce0db719ff379f2fefbdca79e73d027c..f369385ffaf0227412b908242de84cd7dbeb08f7 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -89,6 +89,24 @@ properties:
     required:
       - reg
 
+  rmi4-f1a@1a:
+    type: object
+    additionalProperties: false
+    $ref: input.yaml#
+    description:
+      RMI4 Function 1A is for capacitive keys.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      linux,keycodes:
+        minItems: 1
+        maxItems: 4
+
+    required:
+      - reg
+
 patternProperties:
   "^rmi4-f1[12]@1[12]$":
     type: object
@@ -201,6 +219,7 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/input/linux-event-codes.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
@@ -234,6 +253,7 @@ examples:
 
             rmi4-f1a@1a {
                 reg = <0x1a>;
+                linux,keycodes = <KEY_BACK KEY_HOME KEY_MENU>;
             };
         };
     };

-- 
2.50.0



