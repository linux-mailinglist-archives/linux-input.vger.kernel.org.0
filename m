Return-Path: <linux-input+bounces-3165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4D8AD2A6
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 18:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6169B237CF
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 16:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B2154C1C;
	Mon, 22 Apr 2024 16:45:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6B0154C16;
	Mon, 22 Apr 2024 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804322; cv=none; b=eGnuxJQbgUlvTkovlGG7hrRdYkQj9T0qEbXaW3FmP7uKVqe4HswdwGggVamXVxpK+Gu4Zh3BxGUQIef9ILnoH5+defFoPHhYEWql7NzkCUeqKoEBK7rW4KGTqBTJ2V2KASt1o+/WXurN6Zape0DLh5w8GXIphXFte/U8bEXDia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804322; c=relaxed/simple;
	bh=ZU0AzmRKXx2ANsoOAmMx/xfzzuDiR1+nvvVSbTt2Jxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P608ElH8x0I5AqtKAFNbBszNQ9FlWpZiMUgmYtRSappMVbmVwWnKVvnkEiTINBGSdx6DI0JLrdfeWC2T1kP+OkELCk0w4I+VAsRpAgDXJbwqnBxH8j5Du6sFNuxG1PNPXHKOoIFpNqDUulHCB5ipjlgRWbQ855wHf50FVfHgPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D0A31063;
	Mon, 22 Apr 2024 09:45:49 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274773F7BD;
	Mon, 22 Apr 2024 09:45:19 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	James McGregor <jamcgregor@protonmail.com>
Subject: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
Date: Mon, 22 Apr 2024 17:45:10 +0100
Message-Id: <20240422164511.2488261-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422164511.2488261-1-andre.przywara@arm.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James McGregor <jamcgregor@protonmail.com>

The Allwinner H616 SoC has an LRADC which is compatible with the
versions in existing SoCs.
Add a compatible string for H616, with the R329 fallback. This is the
same as the D1, so put them into an enum.

Signed-off-by: James McGregor <jamcgregor@protonmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index c384bf0bb25d..8cb5820774e0 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -22,7 +22,9 @@ properties:
           - const: allwinner,sun8i-a83t-r-lradc
       - const: allwinner,sun50i-r329-lradc
       - items:
-          - const: allwinner,sun20i-d1-lradc
+          - enum:
+              - allwinner,sun50i-h616-lradc
+              - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
 
   reg:
-- 
2.34.1


