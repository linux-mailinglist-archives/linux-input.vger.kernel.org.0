Return-Path: <linux-input+bounces-13974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF029B24D0E
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 17:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC378862A8
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DA32E54C3;
	Wed, 13 Aug 2025 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qUTJpynr"
X-Original-To: linux-input@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B519E81F;
	Wed, 13 Aug 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097833; cv=none; b=E2B0ljvdxy+L0SMZZyc/kt9On91fO42n7KQ4ky3A21Lvx0fI4y3ds8SvKHOaSbxIQzZcXuHthz4uMvnlYoBSIAwhXlylE2IAw8VJEHB6X22MUMJplnBzuvSqHLdpzkdJzWZ0QlJOv25UWJq8/A0U+R+d54UvaruK2UhdzbbINY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097833; c=relaxed/simple;
	bh=3jnLMLVg3BGJcISYP1VX9xuzrcAQf63xQZFl+Xs40rw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jDIjylcyNAY8tR/j28Z9QJPBY8oI0WWr7BsDtBNcrKoqgkNSEwv1i564htO1QqpEnAEhTT91z2zlG2+T3pJX2cTAsVKFYYYyWgzWtAeKQYMXWEZzaPqzd0ck+ZIfD8lNXkjqsd18nz7TTbYsiVGvimBl3SNKG0nDDGD2cCmcDOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qUTJpynr; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DFATnP1726003;
	Wed, 13 Aug 2025 10:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755097829;
	bh=2o1x4I4QKXpgBLS4b5DL2bt8FWiMqHcdhZDndAjneR4=;
	h=From:To:CC:Subject:Date;
	b=qUTJpynrYgnr9u5D8cl/2JlfGTptJlG2Vtu+lcOqTAOrLwapzIoPhGvkeK/0qdZyq
	 Hrb4eL63wxTnAwVsHgd8TC8xRyNii0n2tDWkSFYVezdiQ+izSh97vg0WOG6a3x5SuK
	 d+Ve7YD1FV/MwALD2SeIjCmCGb3NNL56OFZ3Iz9k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DFATh01056602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 10:10:29 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 10:10:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 10:10:29 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DFATXl2179660;
	Wed, 13 Aug 2025 10:10:29 -0500
From: Andrew Davis <afd@ti.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH] Input: gpio-keys - do not print gpio number if using gpiod
Date: Wed, 13 Aug 2025 10:10:28 -0500
Message-ID: <20250813151028.104010-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The value in button->gpio is not valid when in this branch which is for
the case of gpiod. Do not print this out as it will always be 0 here.

While here, there is no reason to assign irq to error, use irq directly.
Lastly, dev_err_probe() returns the given error value, so we can return
directly the result of dev_err_probe() making this a single line.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/input/keyboard/gpio_keys.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f9db86da0818b..05f8ccdfba920 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -580,13 +580,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			bdata->irq = button->irq;
 		} else {
 			irq = gpiod_to_irq(bdata->gpiod);
-			if (irq < 0) {
-				error = irq;
-				dev_err_probe(dev, error,
-					      "Unable to get irq number for GPIO %d\n",
-					      button->gpio);
-				return error;
-			}
+			if (irq < 0)
+				return dev_err_probe(dev, irq, "Unable to get irq from GPIO\n");
 			bdata->irq = irq;
 		}
 
-- 
2.39.2


