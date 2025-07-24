Return-Path: <linux-input+bounces-13677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E3B0FEDC
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 04:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1201F5466D5
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 02:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E62213A41F;
	Thu, 24 Jul 2025 02:38:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D574C70831
	for <linux-input@vger.kernel.org>; Thu, 24 Jul 2025 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753324732; cv=none; b=I7acl9mbWsy19VuS2WDeJCHQpaLEzA9rkivuFvvvNSAQKzVHwHa2lXSooozPaIzUX76BkTJb1HIZGL9/X8QUVd9KKWb6Gf5c7QGuAsdm+FgkRbyF6haRV/YDFJU5fUQecc1Lfxd0r08jEpCEKRlwHMcGg99nhms43/VqgJV3tbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753324732; c=relaxed/simple;
	bh=1AkS+pi5LxZn3vwxti7gJq8GZmrCLAyuoYEwbtRxi7k=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=JZ7Ang2x3lIQlRiVja7mCkKRQABzfyzPj0J159U/95WFkUYiDCXWdPcI+WJFE5KEzwxO3mx0GmuFRcSl/TwZzx4A/VARmdVc0xXBdJrJH03q+9hbKdUqfccJ+D2eTBJQMVVsqIjehvaRpGD9V7ZDCcKRDVC1p1iRR2J2/Xls/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bnZv9502Xz5B13c;
	Thu, 24 Jul 2025 10:38:45 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 56O2cFsJ034722;
	Thu, 24 Jul 2025 10:38:15 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 24 Jul 2025 10:38:16 +0800 (CST)
Date: Thu, 24 Jul 2025 10:38:16 +0800 (CST)
X-Zmail-TransId: 2afc68819c98ffffffffd9c-f1828
X-Mailer: Zmail v1.0
Message-ID: <20250724103816237r5sdS6T9M3uypp0-8vi4w@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <jikos@kernel.org>
Cc: <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
        <liu.song13@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IHVjbG9naWM6IFVzZSBzdHJfdHJ1ZV9mYWxzZSgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 56O2cFsJ034722
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 24 Jul 2025 10:38:45 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68819CB5.001/4bnZv9502Xz5B13c

From: Liu Song <liu.song13@zte.com.cn>

Remove hard-coded strings by using the str_true_false() helper function.

Signed-off-by: Liu Song <liu.song13@zte.com.cn>
---
 drivers/hid/hid-uclogic-params.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 4a17f7332c3f..ffa14a4621ef 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -20,6 +20,7 @@
 #include <linux/ctype.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
+#include <linux/string_choices.h>

 /**
  * uclogic_params_pen_inrange_to_str() - Convert a pen in-range reporting type
@@ -59,7 +60,7 @@ static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
 	size_t i;

 	hid_dbg(hdev, "\t.usage_invalid = %s\n",
-		(pen->usage_invalid ? "true" : "false"));
+		str_true_false(pen->usage_invalid));
 	hid_dbg(hdev, "\t.desc_ptr = %p\n", pen->desc_ptr);
 	hid_dbg(hdev, "\t.desc_size = %u\n", pen->desc_size);
 	hid_dbg(hdev, "\t.id = %u\n", pen->id);
@@ -74,9 +75,9 @@ static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
 	hid_dbg(hdev, "\t.inrange = %s\n",
 		uclogic_params_pen_inrange_to_str(pen->inrange));
 	hid_dbg(hdev, "\t.fragmented_hires = %s\n",
-		(pen->fragmented_hires ? "true" : "false"));
+		str_true_false(pen->fragmented_hires));
 	hid_dbg(hdev, "\t.tilt_y_flipped = %s\n",
-		(pen->tilt_y_flipped ? "true" : "false"));
+		str_true_false(pen->tilt_y_flipped));
 }

 /**
@@ -119,8 +120,7 @@ void uclogic_params_hid_dbg(const struct hid_device *hdev,
 {
 	size_t i;

-	hid_dbg(hdev, ".invalid = %s\n",
-		params->invalid ? "true" : "false");
+	hid_dbg(hdev, ".invalid = %s\n", str_true_false(params->invalid));
 	hid_dbg(hdev, ".desc_ptr = %p\n", params->desc_ptr);
 	hid_dbg(hdev, ".desc_size = %u\n", params->desc_size);
 	hid_dbg(hdev, ".pen = {\n");
-- 
2.27.0

