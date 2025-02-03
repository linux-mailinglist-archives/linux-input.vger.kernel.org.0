Return-Path: <linux-input+bounces-9728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DFA261A0
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 18:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233FE1885974
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 17:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E6020C472;
	Mon,  3 Feb 2025 17:43:44 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952A20C465;
	Mon,  3 Feb 2025 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604624; cv=none; b=IQMEXvo+lBH4ou+fEwsF8qd28uSfFQbxCagasx4wh/WpU8slM1liK6j5CLfZBMvkIBEVPfjNLOPsazqy7ITGp+bjXiwwnI2X/MR7odODg0pY64Qrj5V7/i4ozKFq6nSpPIjTX60Eb2og/6YIJ5sT2aAWFkOWwxthyuil2rVSddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604624; c=relaxed/simple;
	bh=WLIamMlAFXA2Le4+oolkI/zjY7g2VfaMuLajhBSSvZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpvxSrSUdYEKN8Dz3jyzzIwMXMK5BAdN9gzDVY3OEa+SxlKfZ0xUIvD+azgbmXF95/WPL1uAFtsYDrQ//rCSnWdFzA+E5adhmzEMXuFdsRrcvh4/Zhgm7UxY+onfMJpOcSkMTDv61dK+jKTPK/YdopEHfmZYVRy5XIiQ7RVy6/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3ba4:0:640:5b85:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 45C7260908;
	Mon,  3 Feb 2025 20:43:33 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PhnTWxOOeeA0-pd7fQ1ih;
	Mon, 03 Feb 2025 20:43:31 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
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
Subject: [PATCH 1/2] dt-bindings: input: goodix,gt9916: Document gt9897 compatible
Date: Mon,  3 Feb 2025 18:43:08 +0100
Message-ID: <20250203174309.21574-2-adrian@travitia.xyz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203174309.21574-1-adrian@travitia.xyz>
References: <20250203174309.21574-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Goodix GT9897 which is a Berlin-A series touchscreen
controller IC by Goodix.

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


