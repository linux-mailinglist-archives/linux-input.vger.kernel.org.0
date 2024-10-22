Return-Path: <linux-input+bounces-7607-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 298609A9A14
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 08:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A691C236A8
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 06:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4573C811EB;
	Tue, 22 Oct 2024 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LCk1RjZ9"
X-Original-To: linux-input@vger.kernel.org
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83A450EE;
	Tue, 22 Oct 2024 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579269; cv=none; b=IFI/eHhqTkrrtpAsLamk2U70EtxYJi8qiUoUeT2wC5+Fgk2dkW4NPU695eA5DB5CYytNGDbVqyjeF62AzXFFAjfc6ntKKSyZtv1Xp8Hki9DE6qIiiVuG1ZbmAIn8OUv/dD6U9myw+x/RSs/JmUvrPtXnyEAnDALk2GomEdWR8RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579269; c=relaxed/simple;
	bh=/Rtherh6G4s3DKg4Gvy5k+OPh7haftGZetc+ElhE4/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nm+rMvwbBhM07KOGCG245dokzo9rzPkueyIfWWfnRp2d30GLZKaQ+Ir3NxErZxGoOhFA0ejF1rLcsOOEXjngOztGyb9vIuiNPP3QbPNYOrXmIgGDLYtQh9kcipOsn82jBISv20fkBl0dkJE1HYeTai9IwtN+KOxMVcwgudInGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LCk1RjZ9; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1729579257; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=r+bQE7SGQ7KFc2WhT2baZdGYgS7r72dTBFl4RS6pOO4=;
	b=LCk1RjZ9kZNOQY95rXhxQClQ93ZonyCEeYc6ySkXS5diDqrzQc8KxIWkbSzYu+QO5WFvol9QxO0ZeIjlkyoVJSncu39APRaM4QAtC2QndGfbeyBtIGH+jQwvd3+LFiLhUUafCRSYRR0ydSVnba9KGAx44chYHOQXAfMV/2S532c=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WHgxcR0_1729579256 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 22 Oct 2024 14:40:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: thatslyude@gmail.com,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] Input: serio - Remove unneeded semicolon
Date: Tue, 22 Oct 2024 14:40:56 +0800
Message-Id: <20241022064056.112575-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes an redundant semicolon.

./drivers/input/serio/userio.c:89:35-36: Unneeded semicolonReported-by:

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11431
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/input/serio/userio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/userio.c b/drivers/input/serio/userio.c
index 7fbf747fb20e..7f627b08055e 100644
--- a/drivers/input/serio/userio.c
+++ b/drivers/input/serio/userio.c
@@ -86,7 +86,7 @@ static int userio_char_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	userio->serio->write = userio_device_write;
-	userio->serio->port_data = userio;;
+	userio->serio->port_data = userio;
 
 	file->private_data = no_free_ptr(userio);
 
-- 
2.32.0.3.g01195cf9f


