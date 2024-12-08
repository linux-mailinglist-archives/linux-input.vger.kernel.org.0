Return-Path: <linux-input+bounces-8431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9E9E84E6
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 13:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DB1281365
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84534145B0B;
	Sun,  8 Dec 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Pm154T5N"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A161E515;
	Sun,  8 Dec 2024 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659325; cv=none; b=jow8VCZwoPXzze+8OjPBMOqFwYWGwd/JEBKkTHcBlzz3L/bWGxjlETwpCIVw8/yTdv43rOO4ccn1RR8cnD/Zc/EszMwFSYQDX1SylEkxmHWpjuBOe49U0CZ1SiVBSCUqym3w0BDnSWGqCKPUf59ErBSQ4hA9QYUwv2w1FKP/Hkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659325; c=relaxed/simple;
	bh=DfE0Lq82U3YoOJS14Z42A57RH5/Ctp8ywYnwx8g1JgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5aDdHfMKWVcm0Ib3WSjAUxxH6GSZLIwtNiltstnEC9olqGdPQBms+zxT6MoiCUynQzLV8yTM/eknOwfCpQoIVhgumj/AEqP2C8Q8Ab96SfCgzBQq5w3Jh2UjQR2IyaVtmlP4ofbGgI4tzZ3TZ7QyBm/+akJSlFTWoDx2tbZ4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Pm154T5N; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733659313;
	bh=DfE0Lq82U3YoOJS14Z42A57RH5/Ctp8ywYnwx8g1JgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pm154T5NLRc01cJCJienk3sw7NhczBNkDJM9U5eJhlgSKHG22QABDj/o8U96edAYP
	 tzQSMqgnOFRjCJqYcLEN7esfDFnA4Yb/vkqPz7RnYtBQKGFR2hBKyrgajTW/iyrG/Z
	 FklILiuzfyYe5S+f+Hn27YSkrViZCbNidsNj1L+E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Dec 2024 13:01:52 +0100
Subject: [PATCH 2/2] HID: uclogic: fix test for CONFIG_HID_KUNIT_TEST=m
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241208-hid-ifdef-kunit-v1-2-cbea6077a233@weissschuh.net>
References: <20241208-hid-ifdef-kunit-v1-0-cbea6077a233@weissschuh.net>
In-Reply-To: <20241208-hid-ifdef-kunit-v1-0-cbea6077a233@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733659312; l=1573;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DfE0Lq82U3YoOJS14Z42A57RH5/Ctp8ywYnwx8g1JgE=;
 b=EpWz2U9rW134ujLblN/T/YQYzXosoDKU6JU8Uk1jeZB26/BZsOB59A1g7FqW9OHI342/BouTb
 3XUFsJ7ejPVB7q4Z+7OeATt/IxYGYO2Kl5ULAvZuQoPjpDUgZVS48t7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If CONFIG_HID_KUNIT_TEST is set to "m", the #ifdef test does not work.
Switch to IS_ENABLED() which works for both "m" and "y".

Fixes: a251d6576d2a ("HID: uclogic: Handle wireless device reconnection")
Fixes: a64cbf3ce631 ("HID: uclogic: Refactor UGEE v2 string descriptor parsing")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-uclogic-core.c   | 2 +-
 drivers/hid/hid-uclogic-params.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8008933c052f5c9b5df9dadc5bce353f3c5b948..a824df67add9eb1d3dd7776fefd8f6f079bf509b 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -571,6 +571,6 @@ MODULE_DESCRIPTION("HID driver for UC-Logic devices not fully compliant with HID
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HID driver for UC-Logic devices not fully compliant with HID standard");
 
-#ifdef CONFIG_HID_KUNIT_TEST
+#if IS_ENABLED(CONFIG_HID_KUNIT_TEST)
 #include "hid-uclogic-core-test.c"
 #endif
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index ef26c7defcf61ced86b07100002e572780f23305..b5d4bb77c83c7e1ab3051d3b619993bc1b08204d 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1860,6 +1860,6 @@ int uclogic_params_init(struct uclogic_params *params,
 	return rc;
 }
 
-#ifdef CONFIG_HID_KUNIT_TEST
+#if IS_ENABLED(CONFIG_HID_KUNIT_TEST)
 #include "hid-uclogic-params-test.c"
 #endif

-- 
2.47.1


