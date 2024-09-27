Return-Path: <linux-input+bounces-6799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D9988027
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 10:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611171F23B3E
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 08:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988EF17B515;
	Fri, 27 Sep 2024 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KZGq2xx6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FB8189B82
	for <linux-input@vger.kernel.org>; Fri, 27 Sep 2024 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727425094; cv=none; b=U7FhsxiJ/oMjV7h0uS8nob84QFzEFRH+wt2wHwXRXKC5o4v2wl8/RVF5nrsYw6j7bGWtpy2+OeLkEdqwC/0YQJ4iQzmWUCZdLA+vs+D1Q1DLmrBKZFCrGZhZ19Rx2Ax6D+sxPyppitlx7SdrUcAYL5JpusrwjhThJXcZQ3x/L+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727425094; c=relaxed/simple;
	bh=fBHfcEiZZGuP5usLwbcN9YryX5dSN7tGN7MyxGHsLwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEemHxM03iZtcND9Ffd8YK/rWbSIIOlCLb/OrioPEqmFULbpVVmEMHQdmcoeg4XhO2wArJxyZqB2od4E3ZUzF/ktj8Z72w4PIAHKmAnufqOx0xH+xXWOS0EHamrTcCrAX6yvy8AiATp+bZTGz4hfCu+JFILDUnBuSrbdQW8K6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KZGq2xx6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=PySyXx2pxaUYeq
	OZfQ2g3qtreAEhMIkycLX7jWSQHmA=; b=KZGq2xx6j4AeqXzw29kfgDSn6uHOXn
	+evTiZJCH+z9NQXx9Y6j/ayVgiCd9OI+ZeZ2rVcf+60TWwHvQWLoiqKcTEfpL+/3
	HaVWrcTyzwSmJqPIjqYhia3j0h0mFduu6u7yobrVYcWwJz8e/NafVaxqjSjXym8p
	N7LtI0PjXGspE2Jm89M1P/GuNwFhJNoxkgAP6afJb11lvCdrm5H+FOgzzXu29Lx2
	N/pdYd4YWd/6jqJp9AGOTH4QQ/NEh4k9sHAFj//XTHSf5QzRhzUhcuoVQakl/V3U
	JHP5ylrbg3kxjhEXBKwyzncg2FRjHor1Kz2f/pCviwnoTw1p2F33N7kA==
Received: (qmail 1253136 invoked from network); 27 Sep 2024 10:18:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 10:18:03 +0200
X-UD-Smtp-Session: l3s3148p1@nsJ2fhUjOK4gAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: input: gpio-keys: allow generic 'interrupt-parent' for subnodes
Date: Fri, 27 Sep 2024 10:15:04 +0200
Message-ID: <20240927081757.7022-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow interrupt-parent in the main node, so it can be inherited to all
subnodes. This is more compact and less error-prone.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

It would fix dtbs_check for arch/arm/boot/dts/renesas/r8a7779-marzen.dts
and would simplify arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts.

Plus, it is the behaviour I would expect.

 Documentation/devicetree/bindings/input/gpio-keys.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index cc78c2152921..8fc331e01f7e 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -15,6 +15,9 @@ properties:
       - gpio-keys
       - gpio-keys-polled
 
+  interrupt-parent:
+    description: Common interrupt parent for the following subnodes
+
   autorepeat: true
 
   label:
-- 
2.45.2


