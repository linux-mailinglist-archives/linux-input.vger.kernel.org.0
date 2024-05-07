Return-Path: <linux-input+bounces-3556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 385388BE66F
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E701B28393D
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5DC161939;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huv6oeXF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98189160781;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=q6b7Xu4VZMupgDhj15HT42hqTpSMrltyXkdgkI4PbKKZjrPasVY3dOSXdvDVffx6YUgwzqS0Ht7EADPpl2+k/XRrcj8Fs7wWDENjbyGq8LOeo+noff6Yz3ur9zqaNYwS4GCLQEN2iguCop7fOzyDIyUyPetky3YLJSNjbFZ4X1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=GIO4K7Jzi7e58ru4SZwn+yKyWIyZbt9nbponGMhXWbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JF4f9LURaIip+3wH3kEU4jU1SibhHFCNOxcjshRbH30jL8l8lEh/LxWeYJq++odgj5mzCb8ZQa2Tiis8Bg7FU64730zff7tnSwL8UgMxPba6zzVlOBnx9wGsLKD/z3xRUuNGfL96F0XCtet44/TDKuZrGvsyLBwis8OfqH6jJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huv6oeXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4017FC4AF68;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=GIO4K7Jzi7e58ru4SZwn+yKyWIyZbt9nbponGMhXWbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huv6oeXFI2fbbRUp2ra+wqxFNEvKmHMWZFyGScm4lKhBIHOCLWf2cy0VjMX39V0/R
	 CEDdludXc1Uh3+jjTRKWPmkpvYr92jy273U19grzAA8J2akyOBYY2SXzC7h3+8oSrq
	 uNUg1gl+XESUcCzpfgYXcihcL5OeNNZTqHzxAEgfD4m3JiswHtmNBG0ApSodshmXt4
	 YTTa2o+Pkz6eygeTXNqdimvwCTwxMz7orh9Rk087rEeS8HeYh0RTxwIGe89O5/IXK1
	 bHrxf/n4tSsbwxTT+2TVfSk/UEWj12+AOzwOhbDUnLoMKuBnQKjz6Kui7m4anB8qWO
	 nk2oLFxArl7Aw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Cs-22KF;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 3/7] dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
Date: Tue,  7 May 2024 16:48:17 +0200
Message-ID: <20240507144821.12275-4-johan+linaro@kernel.org>
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

When the power supply is shared with other peripherals the reset line
can be wired in such a way that it can remain deasserted regardless of
whether the supply is on or not.

This is important as it can be used to avoid holding the controller in
reset for extended periods of time when it remains powered, something
which can lead to increased power consumption. Leaving reset deasserted
also avoids leaking current through the reset circuitry pull-up
resistors.

Add a new 'no-reset-on-power-off' devicetree property which can be used
by the OS to determine when reset needs to be asserted on power down.

Note that this property can also be used when the supply cannot be
turned off by the OS at all.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index be84f7ed0abc..a62916d07a08 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -36,6 +36,12 @@ properties:
   reset-gpios:
     description: Reset GPIO; not all touchscreens using eKTH6915 hook this up.
 
+  no-reset-on-power-off:
+    type: boolean
+    description:
+      Reset line is wired so that it can (and should) be left deasserted when
+      the power supply is off.
+
   vcc33-supply:
     description: The 3.3V supply to the touchscreen.
 
-- 
2.43.2


