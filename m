Return-Path: <linux-input+bounces-5825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4D95DC1C
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54482281144
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F040181B83;
	Sat, 24 Aug 2024 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6boee5+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF717BECE;
	Sat, 24 Aug 2024 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478673; cv=none; b=FnXlNFHhTkgByup8fOzdyOYcpeaRNptk1BsbVJB+NLqQ5bjpqNa57uZE/Ixxc1biWr9WZmQH+9JPc8P3ygvKeIzsyYSgFMhvIMTe9fWTRE9UxsnGLj4UGyCfe8g4ADRGd+DD13XooFkCRWBXylfuICkzw0dRGZb7HYARtMbBNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478673; c=relaxed/simple;
	bh=pKUHKSHsiWT/Krt0Ih5WrZx+zlIygzOxXTii+DWPROo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+LygsBxkkqMMHjECFnswItQWeMhGeu7h83GWnn1G97WMU3PO2tK46tUEEq+XJSS0dwqg2zumFEa1dadfP31gWx5aoCQ6/oDvMfeMqc27dZ5huNHo7OcrY187Sonlx+y+pB9QHfwDyJf7r2yx1QtuH1NlDZGBkwQL+ayqChXhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6boee5+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fec34f94abso26160325ad.2;
        Fri, 23 Aug 2024 22:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478671; x=1725083471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3aQhk/CNuOCmAWy8KuscMnFEZUSU7TNPDgoCpOzq2M=;
        b=d6boee5+EmGwXGI2+LYKnfSv8ube2kZFv4ar8J3ozDT1IogGWJCqMRvsm0OY3if57a
         5VlLIJprnJqZWKFYf1sBSuMG58PIjY/sl/eN+U+uHgt1KCW/Gj9rsbzd48Av2k18HW4p
         qs+QV7RZRdBoAx7xme2mWuOIGASt2KPAJ2xEKsh9NHQkI/0EWMGTpGiFY1gPCfNkl0bw
         HRpfcJibU8fDRPEaxhrtrKvQFhKYOQpX1LB8h167oQZH4xquXh4h9h6OveRirEaAdDSn
         K8UC5sTLA04aZvgBfLHPuQOYACvGC4vGMle0DHUdRv6yiu0EAkUBktyLYI8JQ+HpHtLF
         aQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478671; x=1725083471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3aQhk/CNuOCmAWy8KuscMnFEZUSU7TNPDgoCpOzq2M=;
        b=nZi/xQNuVMCPgXien6pnkMyfH79kGgxcFGzZqpLGbJj+DKfUr9KRIPiDk8ATYffLgY
         PnHzV5gbaRX9M5vr6QjyArl/T3yPb6N6c9aOwUFyqCjhav2Rw0cefqmYOrBUjmknRN/N
         Oak2wr8MJcC8v2gCWOC3C+hgfzlA0kU+0/URdYYA4wviLd8xPJbOBHlUSxDkj2v1gUue
         M9bjworDoPfECkxcsiHgT1pTRocIQfHLoPbjpxgNW2Jy9tYlHPIH1buT4ULj6iW7x5C5
         C5o/QbLSNeerrJWdiyvzUnOaRlZR5BX/+8X3UjgUFXdaYaJBlWncfvqnieUrYR5EnVGI
         bOxw==
X-Forwarded-Encrypted: i=1; AJvYcCVhcy/910GEcvkLASmcxLpaN8VcgiFmLR0giZV/JngpLNovbgVFNRqQeDxUPqaqoDiF6arkZnPhugPt5GLT@vger.kernel.org, AJvYcCXpS33WmsdvXXactMus42HaO6VYHqoXag4vtKtGd54AWG7lpNORQW5KFq44UkWsj2AJyP2gIP09l9JHwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBpXn9N8GCanuUlrkTr+Xdn9AwEloAMpzoz7f7t3UBvKWnha0
	gmLQgXf+jCE196tpP5ExOsi9294dqeix8Grahcl+BKCwM8Or9htS
X-Google-Smtp-Source: AGHT+IEz/YMP6ziVNvymOtS/B0DVnJwn2iKo2DX15n+4D7DvWYJja/XnL4bII0NSaTz7eEUH+o2YSw==
X-Received: by 2002:a17:902:d2c4:b0:202:348d:4e85 with SMTP id d9443c01a7336-2039e4cef90mr46586285ad.39.1724478670935;
        Fri, 23 Aug 2024 22:51:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] Input: zforce_ts - remove assert/deassert wrappers
Date: Fri, 23 Aug 2024 22:50:41 -0700
Message-ID: <20240824055047.1706392-18-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wrappers are extremely simple, used once, and do not bring much
value. Remove them.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 116f3aa6350c..5df4f9e8fb2e 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -146,16 +146,6 @@ static int zforce_command(struct zforce_ts *ts, u8 cmd)
 	return 0;
 }
 
-static void zforce_reset_assert(struct zforce_ts *ts)
-{
-	gpiod_set_value_cansleep(ts->gpio_rst, 1);
-}
-
-static void zforce_reset_deassert(struct zforce_ts *ts)
-{
-	gpiod_set_value_cansleep(ts->gpio_rst, 0);
-}
-
 static int zforce_send_wait(struct zforce_ts *ts, const char *buf, int len)
 {
 	struct i2c_client *client = ts->client;
@@ -672,7 +662,7 @@ static void zforce_reset(void *data)
 {
 	struct zforce_ts *ts = data;
 
-	zforce_reset_assert(ts);
+	gpiod_set_value_cansleep(ts->gpio_rst, 1);
 	udelay(10);
 }
 
@@ -807,7 +797,7 @@ static int zforce_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ts);
 
 	/* let the controller boot */
-	zforce_reset_deassert(ts);
+	gpiod_set_value_cansleep(ts->gpio_rst, 0);
 
 	ts->command_waiting = NOTIFICATION_BOOTCOMPLETE;
 	if (wait_for_completion_timeout(&ts->command_done, WAIT_TIMEOUT) == 0)
-- 
2.46.0.295.g3b9ea8a38a-goog


