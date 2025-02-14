Return-Path: <linux-input+bounces-10028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B00A35638
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 06:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 648F87A240B
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 05:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266A31802AB;
	Fri, 14 Feb 2025 05:30:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F4186E54;
	Fri, 14 Feb 2025 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739511016; cv=none; b=OsyDjP6sdSkZO4fYoOSAzL+vXXrIjuIqLmCdDtYmnt9+ZwzCooQC0Fu+Wd4WoplMpCIzMR3DHrIJiFrpCAu+TXm6ovW77bB/0BAizTWiqajhKIOnXKx+3BWrvdxcSngLco+MDC5oNLPI4j7CXQMvZchaF4zPTzuY4QodmG0ANRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739511016; c=relaxed/simple;
	bh=naQspt9rQxqLhYKrvz5bbzsUon+98m/GSA7HK5hENJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAWrsQDTleTjN3zebfVr1sm1Wl+XbsBSXmtqHDj4nWKEFCEBFC6n2+t07KBlDkRBd3uJw+9+arU9xpnbOeY5OLHR00AQ/mKTjZmBX43yRG27IMU1wCXvJRW+NA7cJg0lv8U1ZOsclHZ0EjzpCi2dOi5ntrtbveR61XFqCuQfZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c10:2d9f:0:640:f6ce:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id C9B4760D69;
	Fri, 14 Feb 2025 08:30:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5UJF7UBMgqM0-ZHxD7olK;
	Fri, 14 Feb 2025 08:30:10 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH v2 1/2] dt-bindings: input: goodix,gt9916: Document gt9897 compatible
Date: Fri, 14 Feb 2025 06:29:58 +0100
Message-ID: <20250214052959.222668-2-adrian@travitia.xyz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214052959.222668-1-adrian@travitia.xyz>
References: <20250214052959.222668-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Goodix GT9897 which is a Berlin-A series touchscreen
controller IC by Goodix.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 .../devicetree/bindings/input/touchscreen/goodix,gt9916.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
index d90f045ac06c..c40d92b7f4af 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - goodix,gt9897
       - goodix,gt9916
 
   reg:
-- 
2.48.1


