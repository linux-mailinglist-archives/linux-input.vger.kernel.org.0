Return-Path: <linux-input+bounces-12069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A2AA0B9E
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 14:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4F9484453
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22E729DB74;
	Tue, 29 Apr 2025 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TegnK+wG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30963175A5
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929702; cv=none; b=XUxyCVdJX3CU0RUQb96ET6vJezEv3KknMINR2Tpy0t7D4/s90T7rooHQ2NFVIYobEH9dGYp8teZ6KViZcKMl4Py+5tVYJ9x7Cenp23zh4kIJUxBN71dAmpGKrTBJzm6HXdSKAhWZhJaxNc4zpbXQlxL0l6EgdOVj2gvdI6Ww7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929702; c=relaxed/simple;
	bh=NmF8yS/LxdAbYcspSM7wM1E23FgaPA0F1ktxVtmS+Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUJTFZM+ocolX4d4nUK2M1ymBorCojddrta3QMGjWxICpYoOOo/VQjNNEhHSDfnua6GaUi1pWOodHMUijDZ9ZkGkt9hger5DNtZKFbrnJ3DAMatq2kD3+sOig5hzshgGgCy66CoMA3663hv5/mJjtGM1pM60sHv5w513FVtrFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TegnK+wG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1327386066b.1
        for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 05:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745929699; x=1746534499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koN3i9u1yWXLoLucqgVgrkyci1pR0i09zyThj3OeDXw=;
        b=TegnK+wGnKXleT3TcpazA6IB3/nqVd3m2vlSMEK6iieXe4+OZ3M2lJY/QoVOJGreAU
         7r9Ij9ygHqG+0Nm/LZ+rZAvWZD17hrwGSGXGfBMEWcvIx5sJF3Lvsmv1rMcHB1pVOcfP
         1uD/e4nXd1gag0u/cKJrHTNQ4CIEMgR1qXAAakGV19MmJpGIeT6W8I4jE+v0OvbDzsKi
         /1mUOEh+2/b3fAvgMNBDfr2LeO34hGo2VyIqPWYuItE3YYUl76m/C42vKWj92KLYC/lO
         ahZuWswjqVqMU7D8alZqTZ3CRTmrh3KflUkDvAfxXq3N2jV0pkisnZhMF+wQAB0GKB7v
         pq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929699; x=1746534499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koN3i9u1yWXLoLucqgVgrkyci1pR0i09zyThj3OeDXw=;
        b=upiL/ZWegUGOLzN2CZKqKcYtCnPTDPqxtu1mxN5DhpjLR0Rojd75nwVq8v0KFZS6i7
         0Xpdo9vJSoDt5+XzoneL3U7gKabxnJHJtY6ygT4a3zwes5EFIJWyZJR7/SEtI7MsiIN8
         tiyUiQsz1sXepZmJ7/w8jnHRffqnmSyfpayTOxgVQQI+L/xBHyWVje88md6RtWHpvZi7
         +g7bjalDw5FcbW/txdhdYZIxbEWJUuNuISJiBajVlutA+P9tdWdVpA91eDO6qCKzQV5v
         iZ0ljwZD9ZEo0+ESH/6tGt05j3a05caeZSGgu885U5/V6Mw72lvPi8MjffE7aWuKLNV9
         Z/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVwO9E+gRDmBVolTce3FOfX2A+Mvgpsfad/31rHh5w78WQPKQ99SepNOt5B31JccYhcZZ6hhSCKqQeGpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLyghGyuivvXN4hzAHr/bvphGeNEnArs5GwOFcI6R6asV1SU6
	cUap1jVcSg+M9+7Rjq3F7xVppdyuziUY/wR/3dlwi2U5/ovEsAu/
X-Gm-Gg: ASbGnctRA4kLQN6cWcjeK3nj8KHFpCgD1SssGppn1fmNgPW7RM+nnyGwAGUE2C6m8+h
	3Hu8WQmHRCQ7TwKP/tylQKHbBROwpn344cFZ1tTodiWVD8fIUYNzliSzDAlJjGQKE1b9htdIbRL
	/C44fJSJMQZpi+hcHR6BEZwyvbszxcW/TSjlfA8YKLguymDDVA/piDrOvQSoTcJlu9n1iwLHi3A
	+bh8y8i2ueFEhqdA5Zd3P+rmcf6yM7nO7uzmN/znrza/XudXy5U++yi/bPX907R0+GyW+DsjlWB
	RJF1svewy4X8QSBK4g4WYLo9V3B3c4b1d4ANY9eMkc5rFCOtzLCATWHRhQP1sg9sBJj5vHQs0w=
	=
X-Google-Smtp-Source: AGHT+IG1cQ9kMKsOk9UcxUNfRkjZe36IRUreA2Ii4HOx5L8MjlYzzS9/KmX0g0YbwebVrk2HrnGwpQ==
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr286707466b.17.1745929699093;
        Tue, 29 Apr 2025 05:28:19 -0700 (PDT)
Received: from p1g2.lan (128-78-204-97.abo.bbox.fr. [128.78.204.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf77dasm768290566b.87.2025.04.29.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:28:18 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH] Input: mtk-pmic-keys - fix possible null pointer dereference
Date: Tue, 29 Apr 2025 14:28:15 +0200
Message-ID: <20250429122815.72724-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mtk_pmic_keys_probe, the regs parameter is only set if the button is
parsed in the device tree. However, on hardware where the button is left
floating, that node will most likely be removed not to enable that
input. In that case the code will try to dereference a null pointer.

Let's use the regs struct instead as it is defined for all supported
platforms. Note that it is ok setting the key reg even if that latter is
disabled as the interrupt won't be enabled anyway.

Fixes: b581acb49aec5 ("Input: mtk-pmic-keys - transfer per-key bit in
mtk_pmic_keys_regs")

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 5ad6be9141603..061d48350df66 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -147,8 +147,8 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 	u32 value, mask;
 	int error;
 
-	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
-	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
+	kregs_home = &regs->keys_regs[MTK_PMIC_HOMEKEY_INDEX];
+	kregs_pwr = &regs->keys_regs[MTK_PMIC_PWRKEY_INDEX];
 
 	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
 				     &long_press_debounce);
-- 
2.47.2


