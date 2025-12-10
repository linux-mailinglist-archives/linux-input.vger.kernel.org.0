Return-Path: <linux-input+bounces-16517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD9CB1C32
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D03EE301EA62
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 03:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEC08C1F;
	Wed, 10 Dec 2025 03:00:38 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64671C860C;
	Wed, 10 Dec 2025 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765335638; cv=none; b=oQaakGzVEEjMD4rvtTkONvCuWzpG4Ije3jOGD53TfSp4q3IXlfUxuBJ/XTMUDl3jIEJQjShYr82iAMfE6HvEubf5RYFVENF8cV2W0EM3eM1AbPTsqMzpsegIEktrQH5t83xTeLahvOtkS5jLVGm8+WzHuWGA7CsNg6OxnhPAyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765335638; c=relaxed/simple;
	bh=6vd8EPLKxMaqhQHIaokagG+vK55VXHfEaeZLArocAbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqtqajFcHmCXeXR6+/SeH7cCQUzahzPiaMHMTO7p119VazNwfuX9JWrD6RSkcXO0/4wwfkqiuOtOUzVaSOArOkdHm1UzS3qyGLlQJpNPqGxrTYMNBZsatQhcsuEMy6BvCIzGPyubHhHbGb+P7uohTipkD2/fqrvclxrknTqyT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAC3X2tN4jhpoGMoAA--.1160S2;
	Wed, 10 Dec 2025 11:00:31 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: dmitry.torokhov@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: louisalexis.eyraud@collabora.com,
	bisson.gary@gmail.com,
	julien.massot@collabora.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer dereference in probe()
Date: Wed, 10 Dec 2025 11:00:13 +0800
Message-ID: <20251210030013.913-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAC3X2tN4jhpoGMoAA--.1160S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4DJr48Cw1DGw1Uuw1fXrb_yoWkWrX_Wr
	yYvrn7Wr1xKryktrn3Krn3ZF9akw1vva48X34Sq3s3t3y5ZrZrWayqvryrZw4UW3yxGF1U
	J3Wkua18Ar45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0MA2k4t7ewIwAAsG

of_match_device() may return NULL when the device node
does not match any entry in the driver's match table.
The current code dereferences of_id->data unconditionally,
which can lead to a NULL pointer dereference.

Add a NULL check for the return value of of_match_device()
and return -ENODEV upon failure.

Fixes: 3e9f0b3e2b27 ("input: Add MediaTek PMIC keys support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..474ef36605dc 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -335,6 +335,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct input_dev *input_dev;
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
+	if (!of_id)
+		return -ENODEV;
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
-- 
2.50.1.windows.1


