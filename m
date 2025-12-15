Return-Path: <linux-input+bounces-16580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46233CBDD62
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 13:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D83793065003
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559C238D22;
	Mon, 15 Dec 2025 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="WlgM9zOd"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFED230BD5;
	Mon, 15 Dec 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801841; cv=pass; b=PiYNPx6jv+y5vRlZqWlHlzMVSkDsZU8lyqfgfig/MwRxt5+ok5s1LaW5ADScySAKrqfrXMEL3aScmYv5e+xV/17mM6FcxIYTtAhAo4fBDxdAE/7RU1BM1ODlr/LlkAxFxnWchwB2zLYUJesHuwmhLSPvL+PxTIJ75JdplXuEAsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801841; c=relaxed/simple;
	bh=OLHayUs7V9b/o+/hh1s8WHuPya3qVcW0Bybto2UJzF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlFQtm88kNEnD1gRWnhfIHijOHgg73tAmJKjYjIy83Kn2zD26s03DOMgCKjol4S5l3nC+R2cftSAgHgkMvmZRqhNBkaDV2mYVAOxAOU4fa/U8CCRoCdPoEtzt4M/aoNgpbvm/BtRBrw9HNGcx1thnv+8wvkbxPc7T++Qy/5K4cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=WlgM9zOd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765801797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NLE7W6B1mOuoDcXwW1XAoLLAmagS6oyKJKxl7CaU1nywuPYY3WFykZQnYFo07fQYOEEGdZvjsMnJTZwpjGw+sJ5HMZSJ/npyFcmP/rfXed9xAelll1JkW2b2RPGc+oBK9QNxwo+O5WVsNZ+B/ztKm4RAmxkLTY/ABFfNYGuwuuk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765801797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YFvkp8sx9x7p+ety3YU1OWBYrz0nSL8Cjejt5tXhoXY=; 
	b=GjE8xM3YZHW8+IBDQMM7+Lr9wDE8nQikU8UfVwX8Z47g7i8UTmS5hc854UZMJyjXf40Lw7c1mP3xqmrtaPmbeGU8fmzOMdzTgRdJtAHbsP37rEkYXBAPbC7PtZGl3OynEafhF+KZa6/o4QW9+v3fM8vLLosemFHWFgM/uk580Fg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765801797;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YFvkp8sx9x7p+ety3YU1OWBYrz0nSL8Cjejt5tXhoXY=;
	b=WlgM9zOdeK7/1T9h5CDUKt9jGDi0MbmpLvxiZIH86qNNrjY/Spwu376r2z1gVMFe
	BAqtFRIFBORKjIbyCWx/kd61UBCFCxfoEJwpq4ePIzOqWX3rx9dBYZjSPoqn4FzSSuc
	22YsFV0ckstqo4BcsYs/f2ZinvAJJZ2QkFOjJBHU=
Received: by mx.zohomail.com with SMTPS id 176580179655941.66611173233514;
	Mon, 15 Dec 2025 04:29:56 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 13:29:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
In-Reply-To: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
property. This makes it impossible to model devices that have ADC inputs
that should generate switch events.

Add the property to the binding with the same default as gpio-keys.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
index 7aa078dead37..e372ebc23d16 100644
--- a/Documentation/devicetree/bindings/input/adc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
@@ -42,6 +42,9 @@ patternProperties:
 
       linux,code: true
 
+      linux,input-type:
+        default: 1  # EV_KEY
+
       press-threshold-microvolt:
         description:
           Voltage above or equal to which this key is considered pressed. No

-- 
2.52.0


