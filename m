Return-Path: <linux-input+bounces-9150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEAA0A8BE
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7399E1884903
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D772F1B0F1B;
	Sun, 12 Jan 2025 11:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="VZ3310pG"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970A41ACECA;
	Sun, 12 Jan 2025 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682365; cv=none; b=pJETQegvsOGIsz8Dmnw/XMAHkF1adB219j4drI1EOLp1gKI0YmBnxPEQkCWcSHnwv9o8bD5YUBptioZid6FcOFWc7Kq1tzgsKUXa6dWfEQcH903hurIH9jN4DoPdn+yx3nca5vLySUnMQktDIaHRtwvVC10NnVx63FM5oaYOZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682365; c=relaxed/simple;
	bh=Byet0scy3vn+n34qIvg/D+B8GMepJS3vmBmJBmXrP30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA+d8hDu5oLsaz67Va2UtW485Sfgn892h2RX8cYdVNX7bFy289yZDl597c+gGS/Zi/FMJ0Rjn2QPE67i5iaSeUltpvFUX171AKMTP8/T4SbDoAVJjkyt4kmvG/JDPoaz1u3jL8mPs+5gPScuSE+HgWAhaB02VE1RfLwhMQz38M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=VZ3310pG; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4YWD9j5d3Cz3w6T;
	Sun, 12 Jan 2025 12:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682361; bh=Byet0scy3vn+n34qIvg/D+B8GMepJS3vmBmJBmXrP30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZ3310pG5QZBJteAEuviMvy0ywxWD7BBfXmRlxEfXfaCXHIRod9onOMxRs3YzCFjA
	 1P2kz+gZEB7eg0CPNKB81pKFvBQ3VldpX88DyhIzLBH3MSjAIF193iFBzMFmagxNGl
	 0BgUKNVFC7QS89U2Rf9fi7U6v/qvIVbKiTYMoWw8Dl6d5z5FWrIWYDfOBgrHn5fnfH
	 bYjhjZupnl2jdS9/Fvv2+2u6/A9rPbu5wNdkn1ii/WP5kI5f64rMaPNMazr2jDVOjZ
	 KPZknRlDI6uf6aJj5LOPA0A9MSLmGJTtnTlC2yyjR9PKzAr8HFDBk4WMjFjWkQqp/p
	 3JBhsis97JY9A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4YWD9j4tZbz3w5q;
	Sun, 12 Jan 2025 12:46:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9j25cKz8t3w;
	Sun, 12 Jan 2025 12:46:01 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id AB33E1C0241;
	Sun, 12 Jan 2025 12:45:56 +0100 (CET)
Authentication-Results: mxe85d;
	spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=git@mayer-bgk.de smtp.helo=localhost.localdomain
Received-SPF: pass (mxe85d: connection is authenticated)
From: Christian Mayer <git@mayer-bgk.de>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	Christian Mayer <git@mayer-bgk.de>
Subject: [PATCH v2 5/5] HID: steelseries: remove unnecessary return
Date: Sun, 12 Jan 2025 11:44:06 +0000
Message-ID: <20250112114438.2196-6-git@mayer-bgk.de>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250112114438.2196-1-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173668235707.6976.8796768661026332211@mxe85d.netcup.net>
X-Rspamd-Queue-Id: AB33E1C0241
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: eVNMYVQgFdpy11FtfIqa+qH4fcOqWptNQDRVQGyOaahlvG2MlEg=

Remove unnecessary return in a void function.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 1a935802880a..d4bd7848b8c6 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -370,7 +370,6 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
 
 	hid_hw_stop(hdev);
 	kfree(drv_data);
-	return;
 }
 #endif
 
-- 
2.47.1


