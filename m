Return-Path: <linux-input+bounces-3555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0E8BE66C
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EA11C2359F
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D484E16192D;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGt5jbgH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814115FCFC;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=HO6JztUo4vzB6Rycqr5pwKOWLdZ9d3qu3G4lBMK6ys7vnGKTfLaVfd/kYXVwHBFM1D4fUDDvKq+aEUA4rKPhBLoO9n4SeUj0puRfvcsOzrV2xcGgezsBIZ6PhbehsHoIui1fNB7+qrUSX/oDP6K7pCaTw4WGHmklKtu5zzZjA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=YIIm3nA6A0qem8v1BHDbNeu0AaDyLJhWVD2pEz5yb2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWXIYFtgrMheNJFVq/5D+kExxjR9xv9ZofEVue5hVXm5KklZIUQw9r+yN+t8j7KHauBDlK1pbWFeu5zFCgVoWX/Nb+VLvWh80NCBQZjYi842Cyx3xcVxShWpDDv6oXiMLMrEA58xKk5o4VerRKsYLa5h06yeDq2naUGAq9F/yuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGt5jbgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BA3C2BBFC;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=YIIm3nA6A0qem8v1BHDbNeu0AaDyLJhWVD2pEz5yb2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGt5jbgHoMdcYgrhzFq7XaxAEKYapGeiW9qct1GQosuDopf/eAhKNtg/kTkPTxrIO
	 Rzf5wIcfVGkp1S+8svUh0POVnMXoSkUs+HDhALkWa5/hVrzQ/JAK7RKYo7R2oVZL9G
	 imZxGAaCorrIeDisyyy7gfdp09h4iylmwSQXoifovWI21nyopshKIFDZ76cb6EycJt
	 fy99zRR3dy7X+xSE1aM0d7FA8xK4GTziKiuGqVkVwp/wD8Abd17EdnZOhcXSxdfdHe
	 ZiMhERN3MaE0XIMHRvpUpValtUDJiRDlMfbtPEM/700MhLttnGbSaMU7sLQpyc4qbb
	 76t1CgBuBoSoA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Cq-1cAt;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
Date: Tue,  7 May 2024 16:48:16 +0200
Message-ID: <20240507144821.12275-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the Elan eKTH5015M touch controller.

Judging from the current binding and commit bd3cba00dcc6 ("HID: i2c-hid:
elan: Add support for Elan eKTH6915 i2c-hid touchscreens"), eKTH5015M
appears to be compatible with eKTH6915. Notably the power-on sequence is
the same.

While at it, drop a redundant label from the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index c1fcf8c90c24..be84f7ed0abc 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -18,8 +18,12 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - elan,ekth6915
+    oneOf:
+      - items:
+          - enum:
+              - elan,ekth5015m
+          - const: elan,ekth6915
+      - const: elan,ekth6915
 
   reg:
     const: 0x10
@@ -57,8 +61,8 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      ap_ts: touchscreen@10 {
-        compatible = "elan,ekth6915";
+      touchscreen@10 {
+        compatible = "elan,ekth5015m", "elan,ekth6915";
         reg = <0x10>;
 
         interrupt-parent = <&tlmm>;
-- 
2.43.2


