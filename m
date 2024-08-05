Return-Path: <linux-input+bounces-5337-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4899477EA
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 11:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB55280F15
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C276814B965;
	Mon,  5 Aug 2024 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QkATNqlY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86272145327;
	Mon,  5 Aug 2024 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848672; cv=none; b=k4IZfJKHvQQb/pSaTU/fR801ZEm7qd1QYhvWPVdyXTDuvQZxwR8fZD936Lz2Dl5ORSgROai5kxm6bpRF94VGDzxcVEbj/jNweFBqp3HmpubUOvjgWi3EqKUEaAmsN2LN8xtk+8Ylty6T2P8UgSuLOR8NOV2aGxsji5k1Upgfz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848672; c=relaxed/simple;
	bh=KBRKLckh7wQOcZPAb+DBayMKbbiWVVVv4cT0/iGxF1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MrvrOFgmleEaSRwCWE/f+Pqa88E+8CSRXhEppzcGIc4V7kZqC5vOjQ57y6BZD3FEW1/gKURbyyTanQvZMHxmPaVxf6tDzgsUbXFESi1Kfja9RqVD0cZ67A2ydMg2TFA07O8om249aRe2qFPRL2sCRH0P/vKuGcBVjd6KcXOo+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QkATNqlY; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 25175211BF;
	Mon,  5 Aug 2024 10:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1722848136;
	bh=QOED+ANpUoo8V/ba7IwkfN3s+t7dw1REOL+ohfmBxQg=; h=From:To:Subject;
	b=QkATNqlY+fWa7/ulLCCl3or1AOW6GJpSOosluXWRv8v8csljoc/JHynTvE2w8eaQ1
	 wC25+dkR4idD0j8dxyRgtJTN8xhbtlR7CqrjAV/nu5ggMqY1ar4bInIJmBjfRAcpwz
	 5Ew7sqbf3n8N7mX8Y7dTCpOMXWUJt+voEUpzNX4K/bycQ8nBMwZkgAjjfNzHHMnU9u
	 X88jW5D/mVj6uRLiIAIPMGZNP7KIBgd2aKl3Jq7UxJnE6gvxxzFDOXWcm6eIw/sUO+
	 1crSEDA8ugxU8lY9mJi5wdNsyBF1BYOXhNMS6MTU3r9YI1+5LPgYfvWD8cH8hPusVe
	 du7Mi8lmnYYNg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v4 2/2] Input: ilitek_ts_i2c - add report id message validation
Date: Mon,  5 Aug 2024 10:55:11 +0200
Message-Id: <20240805085511.43955-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240805085511.43955-1-francesco@dolcini.it>
References: <20240805085511.43955-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Ilitek touch IC driver answer to plain i2c read request, after it has
generated an interrupt request, with a report id message starting
with an identifier and a series of points.
If a request is sent unsolicited by an interrupt request the answer
do not contain this identifier.
Add a test to discard these messages, making the driver robust to
spurious interrupt requests.

Fixes: 42370681bd46 ("Input: Add support for ILITEK Lego Series")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4:
 - just return in case of error
 - removed reviewed by

v3: https://lore.kernel.org/all/20231222183114.30775-1-francesco@dolcini.it/
 - series taken over from Emanuele to Francesco and resent

v2: https://lore.kernel.org/all/20230920074650.922292-1-ghidoliemanuele@gmail.com/
 - first version

v1: not existing, patch was initially sent as v2 by mistake
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index e1849185e18c..5a807ad72319 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -37,6 +37,8 @@
 #define ILITEK_TP_CMD_GET_MCU_VER			0x61
 #define ILITEK_TP_CMD_GET_IC_MODE			0xC0
 
+#define ILITEK_TP_I2C_REPORT_ID				0x48
+
 #define REPORT_COUNT_ADDRESS				61
 #define ILITEK_SUPPORT_MAX_POINT			40
 
@@ -163,6 +165,11 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
 		return error;
 	}
 
+	if (buf[0] != ILITEK_TP_I2C_REPORT_ID) {
+		dev_err(dev, "get touch info failed. Wrong id: 0x%02X\n", buf[0]);
+		return -EINVAL;
+	}
+
 	report_max_point = buf[REPORT_COUNT_ADDRESS];
 	if (report_max_point > ts->max_tp) {
 		dev_err(dev, "FW report max point:%d > panel info. max:%d\n",
-- 
2.39.2


