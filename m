Return-Path: <linux-input+bounces-5071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8C933E08
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 15:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E47B2820CE
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660FB180A88;
	Wed, 17 Jul 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="cYIHzjHQ"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3C1802DA;
	Wed, 17 Jul 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224562; cv=none; b=Ld26mrjzfxCG7JiwONrzLEwpqxdhDdC7jsbbYqq6FcX5LAHEWS7n7rqV4SV8xTlAWqeRVcY6JLvyvDPNfj6IP61v15wQ2cpDaB/sNnC9MAiUaBhS8P8EGiY/YzFO7A1pHkxc/Aod6pAkqRDWTGUXGyUj8Iz13SDYww6k1xNpOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224562; c=relaxed/simple;
	bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJC1oT3B2lgcdzZmZnYv2R37gxq4nXbwUvNIiF3S76/oYKFoAht9S8sclEbpgDGbUG7qCCps+zdgWvTRnj/dovVM6bi7StmFUdgprnju44Tq7yCcR/3m2GfFAAQIKtjTLJFz+wv56XHIHXMzhIOjkNndxoHor1dLUuYddCaOA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=cYIHzjHQ; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id B9B45403F4;
	Wed, 17 Jul 2024 18:55:44 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721224545; bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cYIHzjHQV7CBHagqdBR3sm699Tg0u27LnoYgRWx2Ot9iLkl9q3CaE/Gmx4cPmA7N6
	 joo6QeX3G7iY7c8DpMAsZobbBQ94YwDCkkdL6vyNliMMooFlZCT+H2nSrUMzwdc/Zi
	 CM3YNb90aU35fyILeYerGqJBfLjaFFV0R7ZJdX5rVYxkiV7zVb2W/3lpmvcG1v+SME
	 GHBzW4KOPUkuaURxW5D9IWmI/TNeE9RlTuZrI8Q9vrP43JEc4a1FZdtUildeXu6ubI
	 +xTr0ZeiGlhLl8oWnZlNtbp+UjuEau7JxyXpPwf1zgwC1whsw+N1uxyRLIwWjlsFQk
	 e3nO42Obi8otQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Wed, 17 Jul 2024 18:55:33 +0500
Subject: [PATCH v5 1/2] dt-bindings: input: zinitix: Document touch-keys
 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-zinitix-tkey-v5-1-52ea4cd4bd50@trvn.ru>
References: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
In-Reply-To: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=bmIgxc0PzdJDo8ZRzTqn8JeYF2n5fgLK8q0l12myA9A=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBml81dHjEAfCI3XnrhUSe8s0YNX8R/sQ0JhiLgi
 SArsSoo6bGJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpfNXQAKCRBDHOzuKBm/
 deDZD/9QMcV+Ppzf0xMsZS3V5LJMgoYMmYZ8J6acMpNDpYmvCqvMzqAA+vdHq0eMHK3fVtLh9hE
 7pdB0935ETiu1xK31P5QOSsse8acU1/P6Jdq7yO+11w26GTEHgXAzRYIKSJyBSDRT1VQ/IBYFN/
 R9ym/77u6quaTHbdgJLUHbeB1NSyPIcm0hgk35qJZaCYC3a6Dxoxe47WAbM7wUqq3XOnLwZKHuB
 dYm6X2s/u3MkO8mxgJHOaidepHO7I/QQ7UNzMQukXAggs7EndBgqIYRnJHorVEs7uLJxt203mHu
 SO/zfIlyF8DjUwQZx1bbUEhLEAZk/fwffXVrkyf7XssZK9YIcwlp6v364gz+AWpTN+qeabCR60H
 bV3K/TLpD245v9YJkT8Mfd9Vl9ZTmY9dlg9fv5NI1p3zcgGVC8v+s/+QZeRHrjsBuNnm10Z2jQU
 UDXxA6UfpGSWWtnh4Q85MbIR4C+ddut7KVI96c63v23G9oaofj8xERDpby5I3BiHp7a/Y20zpM4
 77uc1w5QXFXyKeEvI1k9iAs6iTghLOtRT/bMBIBlo3obqjbYUh1at8uPGv7duAf3gd+KsljCEHv
 k6FjWHibLkDZTfzQrKLWMZlHIYohc54qYRogjEBqrVHUIYnXMLH2i4NVHyo4/xLc6C4El1TrcmN
 Gm7AtnnpUrIcbHA==
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


