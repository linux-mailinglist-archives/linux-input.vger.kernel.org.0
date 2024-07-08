Return-Path: <linux-input+bounces-4908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84592AB15
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 23:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C6ACB20791
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 21:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208EF1CD3D;
	Mon,  8 Jul 2024 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="s4mS2YWd"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBD81211
	for <linux-input@vger.kernel.org>; Mon,  8 Jul 2024 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720473588; cv=none; b=DNadYCBdVNpNticwNx59G/x4eHkYC8fy4XpKE2eYWIoy0InrWnu6VP2JGOYhmTPQM01N+4mXfmUM5jr9Sf6Hw0LVjqNWbXsYCbXQ40Mrqco51SaxKEzPiIUw3xfi7FrmoqhkrvyIwifsSyUQtWAlskqkOKun0sMTc7EjDqhFvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720473588; c=relaxed/simple;
	bh=+9bov4b0rpFN94QqXm69hQxEhb78+cKop8lMQ74U6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z46YVBQ4dlPKvA0Hzo1gRBLS8MASOibUG/FOomX4wUEqPfmFR5LbDV1Ns1QOIWho19N3KRHCW1PuKBdlBNe6edYYbDJr06vvXZJvrgOzcF9TmhUg0jRTAjtp6KPnYAFP6fRDrMkyt4eYFkFjy2MmrmW6FDa5armVa46HvyKp49Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=s4mS2YWd; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 48DB288247;
	Mon,  8 Jul 2024 23:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720473584;
	bh=XVwwjLM1OzJ5dj7JxSBIHLVcSYmOt3IZcIGC97ekOuo=;
	h=From:To:Cc:Subject:Date:From;
	b=s4mS2YWdFoXLgb3iYDn/BAWOefbanKIvkIFUe7GTj1VQEsTGuB5LcrnbtmQKXY5M8
	 tC8XdBMPylvghT3DjwxUl62pr1m8dPvuo3RPAN9Ggrk6tAprRxIvsGaaDpbOpJnnde
	 rlbHd7rgtFk6Hiq0IgJc+/fM/XaD0cM8xqWrTmmlRP+PxIlrA7dizfKnZ9nWq4uw1O
	 7fNlk6bDxuiUx4sleYQ8L7A9PW8ELQBhARqMAQm/s9Quc/5vSMREmALI/sqTaHQx1r
	 e09TPXk4IYtn/7H9VV0LXc3kea4JNEPnciM9gr5UDk68kvktAjle7/B9KD/g0Cfdn2
	 CPQ8bSrbAYcwQ==
From: Marek Vasut <marex@denx.de>
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel@dh-electronics.com
Subject: [PATCH] Input: ads7846 - ratelimit the spi_sync error message
Date: Mon,  8 Jul 2024 23:18:57 +0200
Message-ID: <20240708211913.171243-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

In case the touch controller is not connected, this message keeps scrolling
on the console indefinitelly. Ratelimit it to avoid filling kernel logs.

"
ads7846 spi2.1: spi_sync --> -22
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@dh-electronics.com
Cc: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 3dc41687aa1d9..f7bc0a3e56d86 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -834,7 +834,7 @@ static void ads7846_read_state(struct ads7846 *ts)
 		m = &ts->msg[msg_idx];
 		error = spi_sync(ts->spi, m);
 		if (error) {
-			dev_err(&ts->spi->dev, "spi_sync --> %d\n", error);
+			dev_err_ratelimited(&ts->spi->dev, "spi_sync --> %d\n", error);
 			packet->ignore = true;
 			return;
 		}
-- 
2.43.0


