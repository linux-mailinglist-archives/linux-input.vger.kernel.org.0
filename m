Return-Path: <linux-input+bounces-9665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F611A248C2
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDBB1188764E
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B6F15D5B8;
	Sat,  1 Feb 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="SmvaAuZl";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="aM6IE2jV"
X-Original-To: linux-input@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9FEC5;
	Sat,  1 Feb 2025 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738410231; cv=pass; b=q/YH+R4XOU2GP02k8AORruM80iWvrexUdqvXMMK9gRmuSTbaUD2zmDyOPadgckp7/jniGVcg4Jw1MPoyG1NohSCPKUJc61UvaZ++jvdHkmZ+Ej+gJsT/yoKRj4npKSsXo8KDRLl4IucNhxjAgBFHAiqcKa9WnDmifbJQzxFSbWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738410231; c=relaxed/simple;
	bh=R5iYuhin7mnI7s+ZFLSYDefbLQC4LM90aSkkIMtochk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bDx1cCxtGXrxzOs5ON9qCXAkPsAZFqtNdG6CySC6VKRH74ZNCordKLzlwMRK+cVf5K6QSRtfLlIu6zeyBhblOR2Iv39+Rw8BuAWHm+33IfW8yjkmrl7rZVQrdQ6JYG1m2eAB0FJDew9oG6ruz2XGCewCRtH8Xn+6ZQ+cFy0NE5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=SmvaAuZl; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=aM6IE2jV; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1738410211; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ESXdnj+V8KnGK/paZT8+0Zh8NV92oxIY2LJyD7rB0u1XopQeYSITA+LsfuhA9cqTsd
    dwb5LpftI+7J2/6ru/KCStLvYCzmvf8pzA/bUGe0wLUqCZjlE5JsX3jm3t4W9DKUCrvp
    TDVz/8E1mQm1GlNtdMbeF5GXmr/uUIeL75/xNH68nK7F6EFy87Dkxd4w8+TQtkRj45Sq
    Rmeyn6aM1m0PKLeDn7W6v+hsGIHlY5TISQQnltt5nBafp12aytrm1YSOcWTvkYsEmPyg
    Pkdmg3GNTY/8s6Z9VOviEtaCgpNqz6VNanwVu9RYhREu1tB044ox+WhCvR2T+GN52J9I
    qslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738410211;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0prJYhYnQTL/LGkgoUJgytbfGVTjzoxrZKJjyjqhFCA=;
    b=Fr9jEq+emXXNPmGdIAzsA2KVhgm/FYfGloXoKzPr7zhSZR5zsqQxZXFpvJh2KbbZL9
    kMgUqmZDUT2wIS1n/L9jpjlXuZWWvjBcIiUhUS06g3pQQwq8NlvCtedC7A3mPbWNOndF
    vMg1BIR4fe9tMntiuD83d9NgkElt/GeKKX1qlDs5Akx5/5QjTjvIgUXbiMOAR5RbHagj
    X+gjVnMPi8+izAQdJWYRwrWS0E0U8IGMPAhDgOHBut5JXfoou6oA/FZ072n1LKh/3yFw
    DyyxxubdcxFBWqwu6KIBbCxkMXoFaqOdaOSdfsLdL97azW09VlYokFUNHHhB1eFX6Yuw
    HVHg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738410211;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0prJYhYnQTL/LGkgoUJgytbfGVTjzoxrZKJjyjqhFCA=;
    b=SmvaAuZll5rKZEkyoglMIRudJjAiHDALHjeuzlcj/RF5LNB4sPSkKUSU/dVf4UC6/W
    X/EAsD7jTCulxc0zTy8b7fHyMXg1x63n5dhAhFQ515+vB5zdK0ZtSD09ShVHa0K43JBY
    wqjYB7jaEJ2orehcXObbBjLBdbQVQcXpfk1twUJs7YhXt+BsMst/ciD+rTJ6tw3N3dXb
    9NeF2NTw115ld42jwjKUt+WY8/n2fMRv8ad0UbodfeXxmIvmf6wg90ap4npf0lGLOul3
    lVarI5dBU9e991M+boNYb1MniPjI7rq/NP6LZp2dgwxoOCjUenysUbQvIKb1wDn/5Aey
    CDkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738410211;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0prJYhYnQTL/LGkgoUJgytbfGVTjzoxrZKJjyjqhFCA=;
    b=aM6IE2jVaf3pey33aKRM0FaOBoCe7wLaUXEnk1M6M6nTA0k05lvqWhft6Jtl0vYZkl
    kLMD1yLVVC85QBvHabBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzEZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id Qeb5b1111BhUCTd
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Feb 2025 12:43:30 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: ads7846 - fix gpiod allocation
Date: Sat,  1 Feb 2025 12:43:24 +0100
Message-ID: <6e9b143f19cdfda835711a8a7a3966e5a2494cff.1738410204.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

commit 767d83361aaa ("Input: ads7846 - Convert to use software nodes")

has simplified the code but accidentially converted a devm_gpiod_get()
to gpiod_get(). This leaves the gpio reserved on module remove and the
driver can no longer be loaded again.

Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 066dc04003fa8..67264c5b49cb4 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1021,7 +1021,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else {
-		ts->gpio_pendown = gpiod_get(&spi->dev, "pendown", GPIOD_IN);
+		ts->gpio_pendown = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
 		if (IS_ERR(ts->gpio_pendown)) {
 			dev_err(&spi->dev, "failed to request pendown GPIO\n");
 			return PTR_ERR(ts->gpio_pendown);
-- 
2.47.0


