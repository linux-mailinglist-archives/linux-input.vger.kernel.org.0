Return-Path: <linux-input+bounces-4869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0B9283B8
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 10:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B041F23364
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 08:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D910B2BCF6;
	Fri,  5 Jul 2024 08:35:18 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97797145FE0;
	Fri,  5 Jul 2024 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168518; cv=none; b=SejqenOC3I8ggaxf+1p99hTzfoOsvWFDWMABJsZn2gXr/YHF/MpPWHQ15TeCcrsBINkPoiakUEtLzSJlSgurkkHO/Qj04J26KGwPzkA0PCP8PWCSEi+A96jB/cNuUMrjjaZwuSH6sB4mdeCVWvcxTpe5KyYVQg5pCe5UjCz5Jts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168518; c=relaxed/simple;
	bh=W51tM3Sdtf5xD4z/lBdRxd4baZPwIZnr6Gb2kXv7IDs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aCrU/e+dIGCsEc2nM+qTIMQU7uoc33AUDry29x3+a5lNLuncgzI+OfoSWYNLiZTlQS9H7+Q26SiGus/FJNEml/XzLK7E1XNd56qxTDIkAKmTBPfeuRPsccteJUlYvUpFlMiqKoC5mj70vDJIGmw8CSjjnIDIcBHpLFfLFvjbj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADX37c2sIdm_zalAQ--.39002S2;
	Fri, 05 Jul 2024 16:35:03 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dmitry.torokhov@gmail.com,
	u.kleine-koenig@pengutronix.de,
	Jonathan.Cameron@huawei.com,
	broonie@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] Input: pxspad - add check for spi_setup
Date: Fri,  5 Jul 2024 16:20:57 +0800
Message-Id: <20240705082057.3006342-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADX37c2sIdm_zalAQ--.39002S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xAr4xAr47ZrW8AF1fJFb_yoWfurX_ur
	yFva1rAw4v9rnFkr4DX3ySqF92ya98XFZ7uFn2qw13tas093y7JryUZF9rArW3ZayjkF1U
	JrnxC34xAF40gjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of spi_setup() and return the error
if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/input/joystick/psxpad-spi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick/psxpad-spi.c
index c47fc5f34bd0..5b53d43c797a 100644
--- a/drivers/input/joystick/psxpad-spi.c
+++ b/drivers/input/joystick/psxpad-spi.c
@@ -344,7 +344,11 @@ static int psxpad_spi_probe(struct spi_device *spi)
 	/* (PlayStation 1/2 joypad might be possible works 250kHz/500kHz) */
 	spi->controller->min_speed_hz = 125000;
 	spi->controller->max_speed_hz = 125000;
-	spi_setup(spi);
+	err = spi_setup(spi);
+	if (err < 0) {
+		dev_err(&spi->dev, "failed to set up spi: %d\n", err);
+		return err;
+	}
 
 	/* pad settings */
 	psxpad_set_motor_level(pad, 0, 0);
-- 
2.25.1


