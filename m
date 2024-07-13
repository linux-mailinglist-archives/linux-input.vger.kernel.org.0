Return-Path: <linux-input+bounces-5023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27A930626
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 17:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D08B218AF
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 15:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9068613B5A1;
	Sat, 13 Jul 2024 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="Zd3KrMJS"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B53168DE;
	Sat, 13 Jul 2024 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720884515; cv=none; b=lE3wAOVdWQWMUwHEDDn9cUKvsbBTWtWVMu1aWEfWPbKfOfZQd91mwRWezVB8GcoQecnUZnJHaqyg7GNzGdyzV5aZLczpGZj9so3yqwFTeVTB6eBGjZQm4HMCPS+EZ66FM5Ju1aKetUPe9O44g3SdKaYRKOaVd81zwUHek7PP9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720884515; c=relaxed/simple;
	bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8R6re7AxQ6FPaddfbZqdZ4DavXjorDPuKQYUYhv5COoeigulvsD5OKgOKmHBi620GSzQppInPS3OvjEUJ1dEoj3f40msqmMy07VHL2HRq03criG5Fd6slVH8FE/WxHu058DJ9+woiGUxofw2Rfk6VHOOQVz3vsLaBDA35whH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=Zd3KrMJS; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 0D411424C4;
	Sat, 13 Jul 2024 20:28:31 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720884511; bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zd3KrMJSLxY93a7cxIwPEdn4JFvlXxpbX8mNEq6/xc494fbxnhe0xbOuR8pKKuuy9
	 Imu3PO3dIGGu0kGAFHAAJUV4Q4UZ++M//jOwPuDoxNjrtzNK0wzYtry6UQ5oj7EgYh
	 TnqJgG+6JbQXEiEjqlMdcSqnNtNjt/crr0tUIzKCZpV0s8eel2DQemMRrGotCZJHUT
	 brtwngy/QvXTAf4mzNvEDSzlgl2PiZ8aCQcmbHS1zWUql7ky30KS6L44aPPvChtLKh
	 BE6wQdIJk+qfOl1Lf0aUrlqlGOg5ZAz14nyBGyHxqhhMkBG74o27+YCo/fRh3IpeKH
	 GYkAeHBi3tIPw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 13 Jul 2024 20:28:08 +0500
Subject: [PATCH RESEND v4 1/2] dt-bindings: input: zinitix: Document
 touch-keys support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240713-zinitix-tkey-v4-1-14b7e2d5ace3@trvn.ru>
References: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
In-Reply-To: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>, 
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkp0cu1MACVyVpuDVJBYBw4VoHCjeQtTmUgzdo
 4v/gVXJ5yKJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpKdHAAKCRBDHOzuKBm/
 dQscD/9OBExcnwbqNYQ1OoZpAOZcN0W1DPaWS3MolhH0qTeTsJYQT0cdd6qP/4VLaEb7UsZDNAI
 SJXKnppoV+DrC7Fm0Y4zKJIwvxCSrKWRcSda7lrc38EprKcNdfIkjgBQdJ6/bZDP01obLJkPjDV
 E0+tG65ON/9F8r1cMRD7cKwB7/Ks7mjIbSR4h9hhylO6VA/tt3c7hss2tKzWpJIeIvVSYpLLMIt
 DYTUe2P2USkpOcgp/O0X+X+aY5mfgFQsfZnrIOBM7EM4Wot+A00vm9JRuyEkEFel51EmMstpBzZ
 bF4OcUizgw2JePQYkhQpNu9I3hr3KCsRQ6Ldl59hOSR/E5bTXPa4TRD79XnrdTw5Cy/UHZgarTv
 HAOtvZtgcCQZAuVUK4kCGKHnu1Cn9EZYm6qoY2VkON4uY68LdP2Pf1F/slXpwj+J2LvCIalgY0S
 iEzx5LmqHkpQnxx4FUDraAlLFXTiQWNLUb/udoPT1+A2M+ws6T4VGe0liGgA8ShybXf++EWy27S
 MeZuyhJG3Vb1P0Esgh0cCB9E9KsiP7jAnv97Zl88nTBYTxG4ExJ7zSY+Ea7D8RTNk+bwqwGRBqP
 7hjUvs4md4RdEIUeahxiKnOPAfQt3JAneaUSkoRl0i28CA/rBzC7waO3+u0C/LK7on7wAE698Te
 b3sNWsVXWk0Ty+w==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

In some configurations the touch controller can support the touch-keys.
Document the linux,keycodes property that enables those keys and
specifies the keycodes that should be used to report the key events.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
index b1507463a03e..3f663ce3e44e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
@@ -16,6 +16,7 @@ maintainers:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - $ref: ../input.yaml#
 
 properties:
   $nodename:
@@ -79,6 +80,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2]
 
+  linux,keycodes:
+    description:
+      This property specifies an array of keycodes assigned to the
+      touch-keys that can be present in some touchscreen configurations.
+      If the touch-keys are enabled, controller firmware will assign some
+      touch sense lines to those keys.
+    minItems: 1
+    maxItems: 8
+
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-fuzz-x: true

-- 
2.45.2


