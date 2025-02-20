Return-Path: <linux-input+bounces-10209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC0A3DAED
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 14:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785673AD40E
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCECB1F7586;
	Thu, 20 Feb 2025 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESFL38GH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58E433BE;
	Thu, 20 Feb 2025 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056958; cv=none; b=iI11bAbkXs6hr6BzHq6XhBWUwm+hrbCSv15yk4uw2m99pEzk/uxoHXQKzNpryhU9wtbgfFqU0DmSOmk7Jr2kkM2vhpCHgla2eu7o2ipUcRuXWe+Id/ZIw1wpEQ7Ko4EfZjQduoF8+O9HIscSlQlS0itzkSgvLRvd95r/EF+y/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056958; c=relaxed/simple;
	bh=W/AaU9zQ+ebqSlBRJDmH5DuXDrw3yPJKEFkVtD+zW+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TEhiovpQZEEMkiGCxp7OcwL5+ClBpplxqmypo9gAcrsUySsapRNufcTF+qUEKNcQ83XFL0iPXEuptCx447G6Kq4B8vk8gO0CcDJDvyuw55TisYiBsOM6yb7nGvzlVJwPLgWW8ohBMaMkYeWAiia9p9pqPBoPPz/vIg6OeAn35Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESFL38GH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-545284eac3bso970489e87.0;
        Thu, 20 Feb 2025 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056955; x=1740661755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gk7K5xKt5lap69DIxnTu5qNeauqSAnaZ5fDcbkzPww=;
        b=ESFL38GHN6X0P5/0/u64BCVq9kez5lNpLSYno4j6k0d4zBb1Z+4KOFc2/Uj6Pk4JQe
         gWEylu+4KanJidu/KGQAVDsvnCWtwllHH4rq6GAGJV6GhVl7JB9tOsoQiCA+bLt72nzO
         U7dmdwu/01Ne+I1zs0ws6A1rEH8gwY8ezEyXdeVxuOR7zRpYGh3jhNGD6cDR4XUrTfXN
         VA+yXN4h76pzGNBpcC2/F0Dp5vV6DaqVZvFwsMPeYKvxkhOduT6znWKyrss2TWWQqu72
         tWWiomh/F5uTEbp7jeAfBZAj3C3yWyr/rDSFHZ0LLFDtDYvxsLRNN3/bdaUSTUdzdp5f
         WNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056955; x=1740661755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gk7K5xKt5lap69DIxnTu5qNeauqSAnaZ5fDcbkzPww=;
        b=bCFMP3O1eKOHXwKT0t/vCed1R89sdslk6xhMdcc4dXH1BOimzgkA3RcrFyKA1Qbr+M
         SuQYt/qvHQuHEkoL4kPy8CaS5vgvAGhrTiPnBP94ViNYz1zskaJ7Pem9DWGZMEEOvdW4
         l1iQ7/2eH9E7W03gAmooZG2RoB1qp5dMxoXZwajr1WxIB3O1aRcaimiW9X96THpJ9/tR
         ZYUjgy1uuTl7rXuko7G4DGqxEqy/Bo08+NQEu606ALVbcYgvDp6KvNBSFNNqiJu80YYj
         gvScLum+1k3fbshbvs6DwHY3I8vNCvbRtfH0yiDZCogHmFHKfCjm3Bcd41rpmANi0UT/
         a35A==
X-Forwarded-Encrypted: i=1; AJvYcCUYIt2Jp6DVb0P8G27fI2z8PxkTzX5nuUU420tPjsPsebByvCZ+jnjkzLKJxAxQqEroSh1CVxt7JIlZyG7I@vger.kernel.org, AJvYcCVJIAHAQ5XVEK+O48NsurIRM79WzBphT9feKEqKqXXvD5QBclO4Fc/uSWGeVpGlwIrcuprkkpnQyva1jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0vzzWLzWIhCB936Np7xPjLcDWqoq9j3fMrxSBnqVEgr0StZ3l
	3S2j8Y5cgACd/lnAxUb2DWKFS6+O9oCLGm2MSmQ3tLU+0NFbsAsS
X-Gm-Gg: ASbGncv2cYLlkXD2RhkftgGAjgDF8YmtnZet4EbGOBM9DLRipQGOPzjb8uPUZMn33hC
	8gk3x6iiR3JoSkWUeox7lQo30wb5Z5mwMFP83pWT1LfDji86MOFrMrYAgjUCu89lON5mSVEp/HC
	3xKziOlsFhN71fafwHEgxqG+5PqtKOooSf0fLChNzCe669tPl7hqWJ6JhsmTLOuiFs0dOAN7A48
	9JoqYESwRUA7A4+w58p13CeJ18vyVbyPiHBFHaNTPC7bQy9zB4pn8igDuwxytN3/4Y5f5t2xPVa
	2En4EawoOLTtKD3QbspQ55wzVbFFwj+xFRqa2ojN
X-Google-Smtp-Source: AGHT+IHrgrWgmv/Wvs6TG1OESMVcUmy2fyvCn7+js39SlyI1RFinqYK2+J4/FDAHnvnRuM3Fo5oRxQ==
X-Received: by 2002:a05:6512:3b07:b0:545:2c40:ec1d with SMTP id 2adb3069b0e04-5462ef22fb7mr3352033e87.44.1740056954355;
        Thu, 20 Feb 2025 05:09:14 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm2194289e87.127.2025.02.20.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:09:13 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: job@noorman.info,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	felix@kaechele.ca
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v2] Input: himax_hx83112b - add support for HX83102J
Date: Thu, 20 Feb 2025 16:07:49 +0300
Message-Id: <20250220130749.2019419-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on: Starry Electronic XR109IA2T LCM

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
v2: Add compatible

 drivers/input/touchscreen/himax_hx83112b.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 896a145ddb2b..8f112e3038dd 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -399,6 +399,12 @@ static const struct himax_chip hx83100a_chip = {
 	.read_events = hx83100a_read_events,
 };
 
+static const struct himax_chip hx83102j_chip = {
+	.id = 0x831029,
+	.check_id = himax_check_product_id,
+	.read_events = himax_read_events,
+};
+
 static const struct himax_chip hx83112b_chip = {
 	.id = 0x83112b,
 	.check_id = himax_check_product_id,
@@ -407,6 +413,7 @@ static const struct himax_chip hx83112b_chip = {
 
 static const struct i2c_device_id himax_ts_id[] = {
 	{ "hx83100a", (kernel_ulong_t)&hx83100a_chip },
+	{ "hx83102j", (kernel_ulong_t)&hx83102j_chip },
 	{ "hx83112b", (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
@@ -415,6 +422,7 @@ MODULE_DEVICE_TABLE(i2c, himax_ts_id);
 #ifdef CONFIG_OF
 static const struct of_device_id himax_of_match[] = {
 	{ .compatible = "himax,hx83100a", .data = &hx83100a_chip },
+	{ .compatible = "himax,hx83102j", .data = &hx83102j_chip },
 	{ .compatible = "himax,hx83112b", .data = &hx83112b_chip },
 	{ /* sentinel */ }
 };
-- 
2.34.1


