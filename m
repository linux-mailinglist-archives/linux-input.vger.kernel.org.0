Return-Path: <linux-input+bounces-5338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980039477EB
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 11:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54866280BEC
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115BB14EC7E;
	Mon,  5 Aug 2024 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zzrc9kfW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8623273459;
	Mon,  5 Aug 2024 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848673; cv=none; b=ciA4rTyKPuG3VoUaPZfdd4lR4coEzhg6W7X0E/e1dHIJMvf80MSbc4lj4wKb/EPs189te8YO5oNSfYivp7F41OGYZt7r7HTrg/exraLovrOPEGTYNYTIbXCK3cQXczlBQu97uY9XHbKZIJ/yjbrwI6x5QBLIB6I5bhJMkMYBAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848673; c=relaxed/simple;
	bh=Xdg9MTm5ISh9HHbRmA0mpCPLms1iymH+FNp/AmvGXBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+slu7pdzK88CCPbH1MlwfLZQsZA+D/6RQZg72l5Kcs6iwhmvn70vOOGwSM6lZirMU/HOLUWB1Q/qieX/vp9dVoB+Fq3l8g9StfchGgrI67sEFFRXGabGbKIn5XSLHUA+KzWUjf7DjZXVyQd8YratUk2U5RrPVhJw/lr7Jj+Elk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zzrc9kfW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BB88F211B4;
	Mon,  5 Aug 2024 10:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1722848136;
	bh=Vz4kl9A1fCdrJVDPCUDHiuZIc2J1bH3TwP7xBqLCRKk=; h=From:To:Subject;
	b=zzrc9kfWvFbDd+vwhsrjbwOxFMZyd6m/Dk+ekpkGIG0sgXgVMFvNO+g6LeMkLylNH
	 zWv6PLB2578aSQ+Ga9dCBXvEuQoeoozgG2vAIJEB6xHKLbcu7PMrKj22h0C022ESHb
	 f1ZyBiTLx2UE+JAh6+ZVVOdOg0EWeEtDMYt8deSvoapPkw+Kz3ERMlU9wKHtjs1yjb
	 eR+bG3QDb+5SLZHVOXXN1x5PqKP8nrS2C8Qx36/51zBFnHQCqEHledepT5fdgbdFvV
	 7OplJgNHlKPK/ZDxWKbwlxxLMfxorcYGYkohOZjK7ghyjTcJ20/MQ2Fm/W1sL2TYh7
	 KX1AvlES4ZZzQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v4 1/2] Input: ilitek_ts_i2c - avoid wrong input subsystem sync
Date: Mon,  5 Aug 2024 10:55:10 +0200
Message-Id: <20240805085511.43955-2-francesco@dolcini.it>
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

For different reasons i2c transaction may fail or
report id message content may be wrong.
Avoid sync the input subsystem if message cannot be parsed.
An input subsystem sync without points is interpreted as
"nothing is touching the screen" while normally this is not the case.

Fixes: 42370681bd46 ("Input: Add support for ILITEK Lego Series")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4:
 - remove err_sync_frame label, just return in case of error
 - removed reviewed by

v3: https://lore.kernel.org/all/20231222183114.30775-1-francesco@dolcini.it/
 - series taken over from Emanuele to Francesco and resent

v2: https://lore.kernel.org/all/20230920074650.922292-1-ghidoliemanuele@gmail.com/
 - first version

v1: not existing, patch was initially sent as v2 by mistake
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 3eb762896345..e1849185e18c 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -160,15 +160,14 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
 	error = ilitek_i2c_write_and_read(ts, NULL, 0, 0, buf, 64);
 	if (error) {
 		dev_err(dev, "get touch info failed, err:%d\n", error);
-		goto err_sync_frame;
+		return error;
 	}
 
 	report_max_point = buf[REPORT_COUNT_ADDRESS];
 	if (report_max_point > ts->max_tp) {
 		dev_err(dev, "FW report max point:%d > panel info. max:%d\n",
 			report_max_point, ts->max_tp);
-		error = -EINVAL;
-		goto err_sync_frame;
+		return -EINVAL;
 	}
 
 	count = DIV_ROUND_UP(report_max_point, packet_max_point);
@@ -178,7 +177,7 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
 		if (error) {
 			dev_err(dev, "get touch info. failed, cnt:%d, err:%d\n",
 				count, error);
-			goto err_sync_frame;
+			return error;
 		}
 	}
 
@@ -203,10 +202,10 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
 		ilitek_touch_down(ts, id, x, y);
 	}
 
-err_sync_frame:
 	input_mt_sync_frame(input);
 	input_sync(input);
-	return error;
+
+	return 0;
 }
 
 /* APIs of cmds for ILITEK Touch IC */
-- 
2.39.2


