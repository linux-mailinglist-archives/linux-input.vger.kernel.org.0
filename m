Return-Path: <linux-input+bounces-13194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF4AED9A1
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D77113AF228
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B800258CE1;
	Mon, 30 Jun 2025 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="f5CowVq/"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E382586DA;
	Mon, 30 Jun 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278798; cv=pass; b=E5S3rCMvdFgkLHbsMx88Pdqrn+jN8DGwbitJXs8chiRyoSZPVgv40N6CqzoZqy/P1puHM2xVXsR9br4mewYm+hhw3SAKBbpcxXy3ZiGWo/Z+9NYcFZKDpud7NrhSfy/gJxapgzSfPwHxwUSapEbOSa2n6j0sI2AF7qziZyi2xaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278798; c=relaxed/simple;
	bh=ASq0tjpTaHDZM4PzpTdawhPcb7Wy65QFKCDV1OzNB0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKLIDb38y1dwgoJHYktaAeb8dVhD6v5OXVL2Wx9bWiEIPGqZAV//fHQJ5sSwRnwkSiFymw+vfzsbyWPXv5uGVK6M2mDrBDT+ChfMPSFk092OugxvpJo3VU3M3AJA3FdiMCbYbONyO5qorwF6gg1IH2L+9GDdLFzYVbVY1wv60UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=f5CowVq/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751278776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UenH2PSwuBcCB0VSc0tN7EZqkcRncrF0BlEgwCF+98x3a2QZvtPfHafdjPmS0npBh0rdxF2slFXtsonSe3J+xjU/ES0LuJtnViVuiU+ZraEeQQc4yfy8T1bavVqwtPyYCDsrajgLf/TjBUO0HEJBZ/KJNMaF/pCKc6O7WPJKicE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278776; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6PpIVd/iyvJzOX8nF42c2ZQhA/JbIIXEjxLRd183mMY=; 
	b=T1ET82UWFUv5RWR6gcdxiXnuqnbJXS0i7ydKBYv4u2Yr8iPH1VYOd8CZwX4uzD2DXZzKFrnRckm6V1kjhk/eghCWfnhfN6RrQesArjh4O3uMcXMZJNGS7PFBjr2fD2rv05W6dUck4dZz1Z6ooSENh1YBR0NUyenfHzp/88rZbUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278776;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6PpIVd/iyvJzOX8nF42c2ZQhA/JbIIXEjxLRd183mMY=;
	b=f5CowVq/qV4oeWU9rr+BLMx+h7M6sWL+uKZOpIB+9YjpaaLW8Ye/kNtQn/YHEYSB
	AiiNmHxJHZ+VQgyqqJo6rn8SbQLwLn3LOAwcpo94KVcSruABG2tP9PIIsYdbAcTW1iK
	4yWnAoFepGgA7zFkOlfSfXiek/wMfzQseQR/L+wA=
Received: by mx.zohomail.com with SMTPS id 1751278774601621.415894842219;
	Mon, 30 Jun 2025 03:19:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:24 +0200
Subject: [PATCH 1/4] dt-bindings: input: adc-keys: allow linux,input-type
 property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
property. This makes it impossible to model devices that have ADC inputs
that should generate switch events.

Add the property to the binding with the same default as gpio-keys.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
index 7aa078dead37816294732501e1983ab869f38311..e372ebc23d1651d73ef3749a56d54872067037b5 100644
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
2.50.0


