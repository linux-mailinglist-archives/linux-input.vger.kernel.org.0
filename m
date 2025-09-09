Return-Path: <linux-input+bounces-14565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF0B4FD5F
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 15:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5727D16B0FC
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6997A35209C;
	Tue,  9 Sep 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="aMJvw+AE"
X-Original-To: linux-input@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4003314C1;
	Tue,  9 Sep 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424709; cv=none; b=RSxA0lgjV3YkXkRgaKpSxRT/FNLbEpuB7rbUDwMbDYU+69pVsDNtwTAOnVOjnwfRtIceTK2JBs/MnO1upXcJm6S18+dEF6BcIlKNbKfXI8BFjN8StM5CLr+0dVKoeL4qEPBj9gnFjkHMwtzPCdaLdnhIQ9+IKQL+Ub/VZxCjBYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424709; c=relaxed/simple;
	bh=FlT7W0/J3zxEIOtm/dP6L7RmnHSRfjzVbrAlelngAlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chJqwnONRApVLDwsaDYdW271OpR8eiqVRPKeTJ1y54dD9m9hbckI+vn6kezqFK0p+ewbUimpSUX6X73kvtNW92B2j245IDLKC5ca90fFm5pDTSfKYUgfVg8ZibZ50q5TjQOo3HzczuwqlF8aPErFxujYwiYxjB9hzwIheNdLX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=aMJvw+AE; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1757424244; bh=FlT7W0/J3zxEIOtm/dP6L7RmnHSRfjzVbrAlelngAlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aMJvw+AECLnus3QgnTXgdFILMEaryvHTcJR4K+tYFTAX3CW42a+/y+9mEuwV5HDo2
	 cotkXRo9pff6+XQkfmg1g7cHptfMjzmdpuEifKGtNWyO7V/IzLLNHRgjJoB+5/R8DC
	 d9WXpMW0PDllnmk5gITqq37ewujZKhDIHr3k2nAg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 09 Sep 2025 15:23:08 +0200
Subject: [PATCH 2/2] Input: pm8941-pwrkey - Disable wakeup for resin by
 default
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-resin-wakeup-v1-2-46159940e02b@lucaweiss.eu>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
In-Reply-To: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Courtney Cavin <courtney.cavin@sonymobile.com>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Bhushan Shah <bshah@kde.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=FlT7W0/J3zxEIOtm/dP6L7RmnHSRfjzVbrAlelngAlc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBowCpxYxRNRMVNMYjmF7ir7BZ+PIuD6035dlrlv
 CCR3+yGisGJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaMAqcQAKCRBy2EO4nU3X
 VqfsD/9V9Tt7r5/HwTQYc6+73mp8hxTu4Hbv1L6FEle9aTIzUk6k0NDx86Q+g3IzKIQYqSJjuzh
 vueJF35iYxl/n6QYT+rgfy+18oBH4crDp++9QNaMKeo7LDAWApvPgZvaiasyyNOQ+Wd3wSw/2xG
 Rm7gN96lg5d4Q+tbqUhqxY6RajFrcYtjwMaej4lGIcjdfjCCs3l8uKTG1PZQjybU21wawNhbmBr
 hKhoLK36lqRurYEPUUsWZfzfK3Kjhz/nQS6wzLgCyupX9x0Es4LJk2a66FNJQZaDmUACisSsr5g
 ZM9wNexpj5UqUrCdJsCmtmITRKBYRVMkXzXQxlIRE1WkecFFC9iFPvQERExrf2nhREwm3wqWEXn
 UY7fsbe050eeB3mqd31V3KM5DN+zIA2kVv7ypeIm6KxeSboL0o5iZ3S6YtfTJcauJBCpG4x0Zid
 2Fw+2opAmNhwzGTGV30gNtgMC8MZHpNMw4ijjQj6PKBnRmRRr1I//tQlqEH7sMGHN5wPFvGZUD8
 SISTXrHFjvpXsX7QKCsfLRidBW7v5aWkE2QmDvj+o1waos8D/dnvqGvZIzdfk/aMgDKAVNcZvve
 qvkxTTaghGqDRo+60AESnC+8jN6vZFQMcR9kbZRyz6qZgMgsO9U0VoGwBof6dpeEyNV6edvzjtc
 qWtxDx4VYSbSIYQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

'Resin' (*Res*et *In*put) is usually connected to a volume down button
on devices, which is usually not expected to wake up the device from
suspend.

On the other hand, pwrkey should keep wakeup on. So do not enable wakeup
for resin unless the "wakeup-source" property is specified in
devicetree.

Note, that this does change behavior by turning off wakeup by default
for 'resin' and requiring a new dt property to be added to turn it on
again. But since this is not expected behavior in the first place, and
most users will not expect this, I'd argue this change is acceptable.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/input/misc/pm8941-pwrkey.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index d952c16f24582bfc792e335a1fc954919561fa87..53249d2c081fba8b8235393e14736494bf9b238b 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -60,6 +60,7 @@ struct pm8941_data {
 	bool		supports_ps_hold_poff_config;
 	bool		supports_debounce_config;
 	bool		has_pon_pbs;
+	bool		wakeup_source_default;
 	const char	*name;
 	const char	*phys;
 };
@@ -245,7 +246,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
 static int pm8941_pwrkey_probe(struct platform_device *pdev)
 {
 	struct pm8941_pwrkey *pwrkey;
-	bool pull_up;
+	bool pull_up, wakeup;
 	struct device *parent;
 	struct device_node *regmap_node;
 	const __be32 *addr;
@@ -402,8 +403,11 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		}
 	}
 
+	wakeup = pwrkey->data->wakeup_source_default ||
+		of_property_read_bool(pdev->dev.of_node, "wakeup-source");
+
 	platform_set_drvdata(pdev, pwrkey);
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, wakeup);
 
 	return 0;
 }
@@ -424,6 +428,7 @@ static const struct pm8941_data pwrkey_data = {
 	.supports_ps_hold_poff_config = true,
 	.supports_debounce_config = true,
 	.has_pon_pbs = false,
+	.wakeup_source_default = true,
 };
 
 static const struct pm8941_data resin_data = {
@@ -434,6 +439,7 @@ static const struct pm8941_data resin_data = {
 	.supports_ps_hold_poff_config = true,
 	.supports_debounce_config = true,
 	.has_pon_pbs = false,
+	.wakeup_source_default = false,
 };
 
 static const struct pm8941_data pon_gen3_pwrkey_data = {
@@ -443,6 +449,7 @@ static const struct pm8941_data pon_gen3_pwrkey_data = {
 	.supports_ps_hold_poff_config = false,
 	.supports_debounce_config = false,
 	.has_pon_pbs = true,
+	.wakeup_source_default = true,
 };
 
 static const struct pm8941_data pon_gen3_resin_data = {
@@ -452,6 +459,7 @@ static const struct pm8941_data pon_gen3_resin_data = {
 	.supports_ps_hold_poff_config = false,
 	.supports_debounce_config = false,
 	.has_pon_pbs = true,
+	.wakeup_source_default = false,
 };
 
 static const struct of_device_id pm8941_pwr_key_id_table[] = {

-- 
2.51.0


