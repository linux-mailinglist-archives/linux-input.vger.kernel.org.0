Return-Path: <linux-input+bounces-5823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50195DC18
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4331C21823
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C521B17BEC2;
	Sat, 24 Aug 2024 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmD1UIKk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34917ADE7;
	Sat, 24 Aug 2024 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478671; cv=none; b=Y96t3wzYPFw83TPUmMXiCcbioJoN/+abedROLSs2G8HY9vnIvTR5b4ltsWsWcKTOId+w6Jea+8bQK5PM4c0S5SkSuXCqE40o4ugQQlwgyNc3B9Hsz9lIsVGDbHIS4m/jHI6s0ejhc9RJIgkTEPYB3KEdxqytvAw00KXTjgmCmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478671; c=relaxed/simple;
	bh=aQGY6xAtKC5ai++QfYurQDsQP1cuvTCiWT35ho4XmaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/2SXqublejezpIDaswD25siahVUBUNsg0OkNOmLputiZkyDeQLAeJ2i1Hen+jPFoJhOtUjG+ikgwdjaNJ+MsbbiCXFxFfJz0Fk2RiikRkPII9vQeY9+0J9T4c7p6/2LP8SlLAruzkeaPtUBnzA1fAJpfe5eEZtUMT/uSOYbVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmD1UIKk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-201f7fb09f6so23565945ad.2;
        Fri, 23 Aug 2024 22:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478670; x=1725083470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJU3qXpzKeb4nsoK17LBCwJKBBq5lMc52NwCSFijnLQ=;
        b=UmD1UIKkEt8CU4J5rT1cluWsy9Ox6pFeyN6ja18WexwOR4+uScyO+gUrraT1neoF7u
         v8a5ucIp7mctNoDQ+OSqHxDkJ7gWywJRR4I8JOS6loZoycrNmHDTjgzagkiMKryxoxVI
         E9y5TQWeA+7csn0s80r2UNReRCJ68EBp7Mu3sJI4FNEutvS0Pl3WPGp8vcnOwAbpIQdw
         tGNeJMoFTmhs+KsH3yS4sJwdMk8hsvEpO/NAEKLwibMQpw9Fho3ywIdymxYjtbMRHJwZ
         In9nUApQjw3VVaedWB5q5qAgsaq1gC036gnP4swbpeTkiolt7M9QzhM2tgx/ndQovHuO
         lxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478670; x=1725083470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJU3qXpzKeb4nsoK17LBCwJKBBq5lMc52NwCSFijnLQ=;
        b=r8nlN5ktY+WvVVZ9io19HAvDSxM5kNDeGZ4Gn9NSwJQr8MLXzAjsdhN/A94nTS1NWL
         KaCsnvlKIVNYv8hjPWmYaa/crinD2IFWxtLyEs+SKZ0NpyJtO+/5TD0El7seSyBH0R1c
         xQexOhVQot+CFotQjzRzyskHQG1pQGSIuTd9frKn74G9BDAV/EgYDFdtzaCtf1b7FKuW
         y6aG3HdoCTmFm9zxR4HqrVI9dE41XYTAXuk5Puz7hgTKTmDRj1OBCHJEs6pVbsDV5LHQ
         1aeqjJ1zTFcjVS57Vuuzd6YKLSq3ZVahGyeJ+ahmYVqL2Kk/0s+tVlki3Kq68uJEufAl
         7fDg==
X-Forwarded-Encrypted: i=1; AJvYcCVS8yKySrr6R4YL7e5iJhoNr6kgE2ljPp/Ttsgq/sy2rD0TtvXG6iSrfQnEIhybaAXvjb7Ly1wdQGP15CMK@vger.kernel.org, AJvYcCXWDAZ7DG/2evCQ8MQavKaiScYAQ9X6Gf3B1O3kaEAUsOWH1pTGgpT5kqx6tNiMvtck1yE9u6WYEmE2QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuG7xZA0NgcxjoDxwFwf3zxNAEEUTRGxMIzuejRMUoAbAG+CPo
	mg/0EeYhJbSaJJxx+Be2Ay4jy9cM8w5cSVHaw52QWi6U8OuA9S1AVPvPvg==
X-Google-Smtp-Source: AGHT+IGq9kREupQXaSZ9urzIaEkaT9A5FfRpU8spntREOHyQrXh1KlsQwu6RzG2INF03PIS9k0U3Wg==
X-Received: by 2002:a17:902:e546:b0:202:4640:cc68 with SMTP id d9443c01a7336-2039e545b61mr49283775ad.59.1724478669429;
        Fri, 23 Aug 2024 22:51:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/18] Input: zforce_ts - switch to using devm_regulator_get_enable()
Date: Fri, 23 Aug 2024 22:50:39 -0700
Message-ID: <20240824055047.1706392-16-dmitry.torokhov@gmail.com>
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

The driver does not actively manage regulator state past probe() time,
so we can use devm_regulator_get_enable() to simplify the code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index c6b506a01b2a..316901c751c0 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -107,8 +107,6 @@ struct zforce_ts {
 	struct touchscreen_properties prop;
 	char			phys[32];
 
-	struct regulator	*reg_vdd;
-
 	struct gpio_desc	*gpio_int;
 	struct gpio_desc	*gpio_rst;
 
@@ -675,11 +673,7 @@ static void zforce_reset(void *data)
 	struct zforce_ts *ts = data;
 
 	zforce_reset_assert(ts);
-
 	udelay(10);
-
-	if (!IS_ERR(ts->reg_vdd))
-		regulator_disable(ts->reg_vdd);
 }
 
 static void zforce_ts_parse_legacy_properties(struct zforce_ts *ts)
@@ -742,16 +736,11 @@ static int zforce_probe(struct i2c_client *client)
 					     "failed to request reset GPIO\n");
 	}
 
-	ts->reg_vdd = devm_regulator_get(&client->dev, "vdd");
-	error = PTR_ERR_OR_ZERO(ts->gpio_rst);
+	error = devm_regulator_get_enable(&client->dev, "vdd");
 	if (error)
 		return dev_err_probe(&client->dev, error,
 				     "failed to request vdd supply\n");
 
-	error = regulator_enable(ts->reg_vdd);
-	if (error)
-		return error;
-
 	/*
 	 * According to datasheet add 100us grace time after regular
 	 * regulator enable delay.
-- 
2.46.0.295.g3b9ea8a38a-goog


