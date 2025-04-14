Return-Path: <linux-input+bounces-11752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDEA88B6A
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 20:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4015C17E022
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 18:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2518291140;
	Mon, 14 Apr 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KV8PEAqT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675F28DEF7;
	Mon, 14 Apr 2025 18:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655589; cv=none; b=byepPAAR2kOwnhpOiwk661ctt4k+hAfexD6qQlA5X+bTbXb1wQW6R7+KyqbAgYHGegI+fP1QgmibkhZdtDgy+S1/vLiQPcxkuinUQ5uA9HdqjQvDwg1cfqvfyTHcniRVsSwLBEfnP3JnonxIdns1GElK7erAPQhjm3EJcqLVkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655589; c=relaxed/simple;
	bh=+88SGD9Y6TwILiF6Uf/BspGVvt2q3dQ+OufY4zaFYcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oSav/tdrJOhBX/uxNwzO4bEQNh+/NPIfl4C0lb6ilYZ7kItbgP7ddowI+hwx5BUwQX19kSMUGgUa94pI2j0ORdxy28LgTqXmx/zgsW67NSk4/23YFFK2pcosjLFhVNB8wP0yqDRpF3qsY72OsbL/caBv+gbXd9xi+XAdIaGyxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KV8PEAqT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso35671905e9.3;
        Mon, 14 Apr 2025 11:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744655586; x=1745260386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/cCqwRykprWosGDLxIipdpZ29vaoxPNnYi97yOxWNU=;
        b=KV8PEAqTMffXPPpZWLTadDdPfQ5zmECn7MVC57EQNqMwGTIIij6TG5kX3TChtFC5TD
         g7lA9Whbm8e8J/0+XqIG2ySZ9JD1CDpI+IC/UTd/lln05cyBVJlSsaAA4l7jHCn2ajEj
         d3uYQEiqKn89bO0ZlQEg1YmkuEqo5TXOCX/FcNAT2q8dfKiez76YWT6dChzfKf0SL60N
         KAJarxQrgWuFva+DMHFz/MMTcyYWih7HP93F8ztnfRRUvLKBKN6+baHgoNZ3LRSPOyAN
         2INBzerRdxn0G2NijN8Q1bgkjA+8SNL+GTKXol4qX4yQ0Pl+f4qCom83qNJ3RJqDPfRo
         /E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655586; x=1745260386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/cCqwRykprWosGDLxIipdpZ29vaoxPNnYi97yOxWNU=;
        b=ssR4KDf/lQDDKwI4X9/q/4M7kP99a+GOSD1XiSTWdE27rOLUSb/Yn8XuI62JO0oaYU
         T7m6us9JyChozGezsKxb+xilbEbbxQAy+93FdVl3fp/f2xAP1hPKRpx6czOIcv2znfqi
         hy0obKahviAkTxDi8z5KfcSydQPLsK8F8kbgZPM+Z/PDfpR6pl4mTjhx9reCHuaL8Bvy
         6pK4iOBEtGfbeTAKoLAdMzwf80ilEhFyH2wG7+V6MC5e3LgVHafZ8Sy8A7Jc6eB15W4M
         FzrMlyCumVaFK+4ehuEH4KAfMGSj3lHeoC6nf8P3rP9QRXXcFA0xDkk0eN6KfiSl8rss
         p2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVni85whoqifGRW5pggmSWuqjZ3cTNtRE37v+nREUgAlB5LhKvQWPl+Jfhpjx878LzcuYCX2PqpUxjrsSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBRAiYSYfsG6pxC70JbCeJzWtUIKzEnR74sGWve97oXDhGHv+
	qfO/Oy4ifHIX1aSk6XVQ0wJyMPqi+XHK3Z878T1HCjxoKb535FAa
X-Gm-Gg: ASbGncul8P+7tYU7saO9YwCzTfKQ6H0rRUt+VuKgp/l06/eC8HguyifMFJr25ADcHPq
	l+Pz1eSx4Z3QFUEHbIkqQgYbgomwkiZzQ3aq0HfaM6HcGSoqbHZw8RrRg4CWcDWYhKSCSTH5IxF
	1sLR8w95WE269nGDdDsP8qQcWoix7HmpSOHp6aR8NvCP5upXGDQ2IdAJUOHgCEJet2y4pLRmHAL
	fy396p/SSA68jRA1tdDLEkPTQjf+fMSy5fh4VoERyhf7/m4izA5BwDWn+/LlqSKUEwgpoLt6K5Y
	TjLvdSviDQ0U1beiRMSJIx2r7qRF2dcFnm1tQe/LoWxfUKMB0Cb+
X-Google-Smtp-Source: AGHT+IEOPE6Pj0stjvMqUCrBnRPKFwojR9gcho1iSvJ3lBqoqj/bjcY2YrPEJnHoSNtbmM2g1Kxl4Q==
X-Received: by 2002:a05:600c:34c5:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f3a93c74cmr121400135e9.13.1744655585948;
        Mon, 14 Apr 2025 11:33:05 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:2c4f:a30a:c7f7:acf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20626c0csm189902765e9.14.2025.04.14.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:33:05 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] HID: wacom: handle kzalloc() allocation failure in wacom_wac_queue_flush()
Date: Mon, 14 Apr 2025 19:32:47 +0100
Message-Id: <20250414183247.11276-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During wacom_wac_queue_flush() the code calls
kzalloc() to allocate a zero initialised buffer
which it uses as a storage buffer to get data
from the fifo via kfifo_out(). However it does not
check kzalloc() for allocation failure which returns
NULL and could potentially lead to a NULL deref.

Fix this by checking for kzalloc() failure and skipping
the current entry if allocation failure occurs.

Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 97393a3083ca..666b7eb0fdfe 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -70,10 +70,16 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 {
 	while (!kfifo_is_empty(fifo)) {
 		int size = kfifo_peek_len(fifo);
-		u8 *buf = kzalloc(size, GFP_KERNEL);
+		u8 *buf;
 		unsigned int count;
 		int err;
 
+		buf = kzalloc(size, GFP_KERNEL);
+		if (!buf) {
+			kfifo_skip(fifo);
+			continue;
+		}
+
 		count = kfifo_out(fifo, buf, size);
 		if (count != size) {
 			// Hard to say what is the "right" action in this
-- 
2.39.5


