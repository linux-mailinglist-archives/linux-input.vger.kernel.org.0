Return-Path: <linux-input+bounces-7836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F599B9E18
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2024 10:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CCAE283061
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2024 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F515AD9C;
	Sat,  2 Nov 2024 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TnW7RKUQ"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-208.smtpout.orange.fr [193.252.23.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A67602D;
	Sat,  2 Nov 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730538699; cv=none; b=MvKbrzti6PI73wfH/KsG3YFQBlrEbWUqlnsO14HaSjoUBRRl4xR7l+uNwMEEAITbS1OPSrI97XSA8ZEkdFefYPPNSKUVOlotFIgRUdUncYlkGxQkEq9UmINT9uDuEgnjvC3FlXbzh+PjHlc/h0Yg6IdFKFHD/u+JVZovkYYWkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730538699; c=relaxed/simple;
	bh=09RQbKlqt6XRTpsKw2i7evCCtKnn7OJGygYBz22r6Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSUJltxc50YI8xIHADtB01z7SHUyUld6GGSuq4ky12r2EzDGtJ2Nk14GQqzDiLOJr08Y0laj2CU9EocNjDrNTjDFNViT669s/g4oohTL/PqnczDLu9q9u/H7y4Ri8IRudtw/aMSEswhvXv9WZ+X/d/QnavHz9Jg8wQh8ngGgXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TnW7RKUQ; arc=none smtp.client-ip=193.252.23.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7AAPtgsTpxsCM7AAPtZ4Di; Sat, 02 Nov 2024 10:11:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730538693;
	bh=fD8a0DZn/OzvIOnxOUi7PPNUVxckolPAfxV+EYthlhk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TnW7RKUQC0mgs1fH6WEflc45Mjo+1rSL9kYDhTmlMXEwF8UEatZc74nr4LcMkgKYK
	 NMkKxL815STEaQyFa6UzNIeOWjN8GtiPcdsXyI2o5j1qvr49DpLlpF93C8UZZfRHhr
	 /qcCiP4xTp8fWr1y2JJj02byF+MGMqiHQpUjQXHf436W6uJFwdcm6TNUqFK6YfOJPO
	 RTxBrx3PKPqxGgs6Z8Mnq4veYv8KLQN0JrZP5zMDwFfjzP+uqvNra6Dt0iU5pbXNTN
	 I+N2zvojMsGDCPVyvsAg4l+dDm1Kc/RIzxmDtrXF/jzhIGxpY/04q143HBsiYp1/yF
	 PlhX50Uzy5uWg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Nov 2024 10:11:33 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: synaptics - Fix a typo
Date: Sat,  2 Nov 2024 10:11:24 +0100
Message-ID: <f3365eab359feb9adc6e2dedcffc976f3b272d8b.1730538673.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/synatics/synaptics/
A 'p' is missing.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/mouse/synaptics.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.h b/drivers/input/mouse/synaptics.h
index 08533d1b1b16..899aee598632 100644
--- a/drivers/input/mouse/synaptics.h
+++ b/drivers/input/mouse/synaptics.h
@@ -21,7 +21,7 @@
 #define SYN_QUE_EXT_MIN_COORDS		0x0f
 #define SYN_QUE_MEXT_CAPAB_10		0x10
 
-/* synatics modes */
+/* synaptics modes */
 #define SYN_BIT_ABSOLUTE_MODE		BIT(7)
 #define SYN_BIT_HIGH_RATE		BIT(6)
 #define SYN_BIT_SLEEP_MODE		BIT(3)
-- 
2.47.0


