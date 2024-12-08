Return-Path: <linux-input+bounces-8432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E39E84E7
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 13:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94FFC1884ABD
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 12:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86777146A72;
	Sun,  8 Dec 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nlIUSUNe"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A524E1CA;
	Sun,  8 Dec 2024 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659325; cv=none; b=rg8wE4ce7zwxC3Tx4Pbv4wpsu3Cw+oC4Yf5WdfvCT3Q6ebYk3wEtaaDndZuaGd4YGWV13aXkKumFI999oKPb50nco/m4kkUxns5JX920sto2c7lpuqNESE/KXhQ57GMpEUMpOxU55flRCOi0V6NGXwethq844prCULLt2rkzRzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659325; c=relaxed/simple;
	bh=2TuFi+ljqxYKujk/z785d3q7u8TD3NVQUriVfeWj/wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5SUR6YIbP9CBZn6G37yNUgzVz7F1pQ0v4eKPLEup82hf/OgHBGPwaKVTk80j5q+R7RU79x+VZuMioG1yiq5rKZREu3UFm5X0zeH7hxFbfbajMsRKWb92k0Nm/kngAhBMcfW0u0gDEwWI1fJU27mhR5D821mq5iKmvaINxHW+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nlIUSUNe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733659313;
	bh=2TuFi+ljqxYKujk/z785d3q7u8TD3NVQUriVfeWj/wE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nlIUSUNe7jn57LUTnlzpNnauOn+zjY1efF31GzjGdZZHTl4p56KB079XJD6EWXuDs
	 +mGvHPKcmkM4vrMu0KYKU1+fMyVvR14KfyWrey3ii7qrf5x2bEnpplk8/hG2fIQ7B2
	 dUQgWzCO8dOUvpa167wZL+MaueTBDAm/Y1ro9CuM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Dec 2024 13:01:51 +0100
Subject: [PATCH 1/2] HID: input: fix test for CONFIG_HID_KUNIT_TEST=m
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241208-hid-ifdef-kunit-v1-1-cbea6077a233@weissschuh.net>
References: <20241208-hid-ifdef-kunit-v1-0-cbea6077a233@weissschuh.net>
In-Reply-To: <20241208-hid-ifdef-kunit-v1-0-cbea6077a233@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733659312; l=811;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=2TuFi+ljqxYKujk/z785d3q7u8TD3NVQUriVfeWj/wE=;
 b=dRQGWFg3B/+jFQ1FC/sI7AvlWbB5YjUIUkFHVcZL1twtGqYnXQggpaogLaIct8/m+R8w8ZDXl
 +E6xiv6qW2TA7Zo1TxW/2As06gPB0CTrHoJErEppB3knyrOsGRIzRGc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If CONFIG_HID_KUNIT_TEST is set to "m", the #ifdef test does not work.
Switch to IS_ENABLED() which works for both "m" and "y".

Fixes: a608dc1c0639 ("HID: input: map battery system charging")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index fda9dce3da99808e04ce66dd7beec6731173e75f..8f065d89979c3577dcc17a6f0d52468d69f16c87 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -2388,6 +2388,6 @@ void hidinput_disconnect(struct hid_device *hid)
 }
 EXPORT_SYMBOL_GPL(hidinput_disconnect);
 
-#ifdef CONFIG_HID_KUNIT_TEST
+#if IS_ENABLED(CONFIG_HID_KUNIT_TEST)
 #include "hid-input-test.c"
 #endif

-- 
2.47.1


