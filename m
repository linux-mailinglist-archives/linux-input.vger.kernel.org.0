Return-Path: <linux-input+bounces-10492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C112AA4BDDA
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 12:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7723BC754
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21041F30DE;
	Mon,  3 Mar 2025 11:08:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2621F30A8;
	Mon,  3 Mar 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000090; cv=none; b=lYVXN4lnQSQOf1UQkYCU+7HkBFl9Ktdz1K2FHU0K5eZamuVYgUjwKcydwnB3/enjSFY51KjCX+xD89XJxdmEdaiHHsU+wODvCUd+5lUCnA184xlRHkGUQ1+WhFOWoObCWTbCxwcT1+6K/K0pW6pxZSWrcLPfalmb5V9uenzCedM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000090; c=relaxed/simple;
	bh=jRMG5PGngLHs/9xxag87OmjWKDPfKYKNnw6ItHCD00w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YFRcIcUEFFxjIfvx2z+Vorf/mN1j5MwsDFm/6Sikx7xCOEDPN9yGy+9vmVzmH+t+yknx3Z9RR/u96Ja6bBAwU++4+6ZfPhEZyvX6tF8/GfJtpJPsfBbI8Qte7HhCzzp0DSVhuhTCQXUCJZlJGPwzMFKJIuMN2N7noV/ff0pI4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAC3IMqOjcVn5SC5EQ--.43195S2;
	Mon, 03 Mar 2025 19:08:03 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: pali@kernel.org,
	dmitry.torokhov@gmail.com
Cc: erick.archer@outlook.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] Input: alps - Propagate alps_passthrough_mode_v2() errors in alps_poll()
Date: Mon,  3 Mar 2025 19:07:31 +0800
Message-ID: <20250303110731.1491-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3IMqOjcVn5SC5EQ--.43195S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKF1kGFyktw1DWFW5Ww45KFg_yoW8JF45pr
	W5XF15Kryvvw17tw4ktF45CayFqwnFva45tFWkWa4SkF9rtF4jvryvkFZagFyxtr1Y9F43
	tayDAFW5CF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwKA2fFTkT6bAAAs8

Add error handling to propagate alps_passthrough_mode_v2() failures
to the caller. When alps_passthrough_mode_v2() fails, immediately
return -1 to stop further processing and maintain consistent error
reporting.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/input/mouse/alps.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0728b5c08f02..557de3d0fce6 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1994,14 +1994,16 @@ static int alps_poll(struct psmouse *psmouse)
 	unsigned char buf[sizeof(psmouse->packet)];
 	bool poll_failed;
 
-	if (priv->flags & ALPS_PASS)
-		alps_passthrough_mode_v2(psmouse, true);
+	if ((priv->flags & ALPS_PASS) &&
+		alps_passthrough_mode_v2(psmouse, true))
+		return -1;
 
 	poll_failed = ps2_command(&psmouse->ps2dev, buf,
 				  PSMOUSE_CMD_POLL | (psmouse->pktsize << 8)) < 0;
 
-	if (priv->flags & ALPS_PASS)
-		alps_passthrough_mode_v2(psmouse, false);
+	if ((priv->flags & ALPS_PASS) &&
+		alps_passthrough_mode_v2(psmouse, false))
+		return -1;
 
 	if (poll_failed || (buf[0] & priv->mask0) != priv->byte0)
 		return -1;
-- 
2.42.0.windows.2


