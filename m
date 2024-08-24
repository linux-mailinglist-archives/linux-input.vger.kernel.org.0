Return-Path: <linux-input+bounces-5813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75395DC04
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A531C216BF
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A4E154C05;
	Sat, 24 Aug 2024 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAVt/xQZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EB0153BD7;
	Sat, 24 Aug 2024 05:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478663; cv=none; b=u8NncynDpia0KJzvQCZcY5hl35kBnZp/6VB57vSDHK1ISmsMU6KZe2S0C8oGkspsm3vGowEqZiHcaFGqetObu43gIDTFpeTlmWh2wcTNcQviRnho+DTK58FJkH+jfY/fbfyKoTQ0q2ETQ+KU8C6T4OAaEELwnSogdK9LceXHmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478663; c=relaxed/simple;
	bh=XpESOWzC6fCu4/oArcc42Qp3xJuY/+ezjsEMmGagwYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWKQ9NudfPT5XP85f2eTefjpAN31ZKASS8aqT7AXTICZYsUzHAmFtkgi9oYDRDperGTpbeAs9t0CjQVVQf0vz0I30Zr36PIMwbd4w3EUKeVqGN+z2/BkxehHyQsOoK7ySTiBdD7Ew35tFAXAo/W120UajdXQECmLZkKYpqf/4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAVt/xQZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-202089e57d8so17384835ad.0;
        Fri, 23 Aug 2024 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478661; x=1725083461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvY60QkB50ssU4IYdBdAE3/BwfGIyIBrZW4hREQwiPE=;
        b=DAVt/xQZxLBHJa+riychGFLxxwNnuqlfZ9HPOCBctmAlZw3mKQD+XGdu4H0VNJoDlP
         7yVCwcgucSO9SBMkx2nau76d1wK2jAMCfJbcehx55ZnpJl5mSQV44EqLu3Ov4yalBeGG
         UgjX5u35DxEv4qWXioGJgKAtJuAUk5KUnJGMAtueFQONcqxq+rs01G2h/VkoTHwq42O1
         +CiEVKieSOkSoLxVF+7fhHOF9K1MM2tKFMahsnvC/Zpaqh305Tx4CzxcPveqx4mFnbi+
         XNMQ19mFxCyFMrLpa9s0urjo35/wj4YzdeT/2P6/lN4P38u/c+/8FKq9csRAlfjsNeEY
         8/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478661; x=1725083461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvY60QkB50ssU4IYdBdAE3/BwfGIyIBrZW4hREQwiPE=;
        b=Wv0a6A8ql1OaGfCTsGRVIYbsY3JjxlMMsM8UXNLKgCjH6Q5WYX3nLUtFYYBpVyMV74
         GH1cA2Iqc51PD+nm+bJ0xTgocZFZ9sM02y/8Yqqtx5LQqvLfH0gosHeMbl/8pMfwxbYW
         81gtIlLFyALrKQ7Ab04cJQ2aQL6rbUxf5Y7R1TEpRzWk1ug6RMXWY1NPZbu93WtzexYb
         qoocwoQDzRWClqfiHAH6rDnT7z5bimqpARiSRotcdia3EnzMyN6XboD3/ZXuKtbvP5Ck
         Km8v4FEPqVYSmGJ1w0xNTBgVlIU/5mSsPXTL0bqlCIwHRKaVuWD53ejshHLANQL1wDBU
         Ph3w==
X-Forwarded-Encrypted: i=1; AJvYcCVJrHhmSv2XnO0qVCV6EtuNODTVRIM8Ksix4zdry9LqB/2hd1iroUtfLdkV3sTBoaLjBHbFmiBvPvOboQ==@vger.kernel.org, AJvYcCVzmsVuJG4aTZYBJK7yL76q+rUxflE+ftEt5Jtk9WGqCtNAFYvifqzk3KZPxdhK7mN8Rsc4umVsmKee8lu9@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOYD0IuH+0omcVm1Sw1H3f63CM6ciWKXJ39ew6dOKme/ARe4r
	rYSzaZ7cyKN1l6EBrZHIRYdTEl+kaTLetEjdYbt4XVJyS9di6zv9cvR0iA==
X-Google-Smtp-Source: AGHT+IHP0C8cjSmWUCaFdzPkid0uOjIAE3LGGbSbJ9M2x5/ZjSYT6z+u7PtETZEpIMF/dZS9jwJ/UQ==
X-Received: by 2002:a17:902:c412:b0:1ff:5135:131f with SMTP id d9443c01a7336-2039c509ec7mr81719975ad.25.1724478660961;
        Fri, 23 Aug 2024 22:51:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] Input: zforce_ts - handle errors from input_mt_init_sots()
Date: Fri, 23 Aug 2024 22:50:29 -0700
Message-ID: <20240824055047.1706392-6-dmitry.torokhov@gmail.com>
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

input_mt_init_slots() can potentially return error which needs to be
handled.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index a6f6cc5d8a3f..a4956f1eebb2 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -826,7 +826,11 @@ static int zforce_probe(struct i2c_client *client)
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MINOR, 0,
 			     ZFORCE_MAX_AREA, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_ORIENTATION, 0, 1, 0, 0);
-	input_mt_init_slots(input_dev, ZFORCE_REPORT_POINTS, INPUT_MT_DIRECT);
+
+	ret = input_mt_init_slots(input_dev, ZFORCE_REPORT_POINTS,
+				  INPUT_MT_DIRECT);
+	if (ret)
+		return ret;
 
 	input_set_drvdata(ts->input, ts);
 
-- 
2.46.0.295.g3b9ea8a38a-goog


