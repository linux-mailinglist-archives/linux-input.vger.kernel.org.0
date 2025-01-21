Return-Path: <linux-input+bounces-9426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2527A185E4
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EC3188B5F0
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3631F75A1;
	Tue, 21 Jan 2025 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW6ofRgV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1F1F4725;
	Tue, 21 Jan 2025 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737489634; cv=none; b=Et3yfuwz3vqh0aM4O+aWRsxVGQf7H3gdUiw5E1yp3oQdY3C0srSYY1PlChPWpJzezAc3wyPg+b9wPMD7yBNuxKtw+iUFzqMFCdH7lAEjSLw2RYKCPthwcqJf4XwCb4iCANCECsyYFx6VleaNryNbQ156FOzxU3jp7UXk7eBAb04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737489634; c=relaxed/simple;
	bh=dHV4n/DsK8cs7MIzV8hr4pqFbAX0fyfGvU+4VCWC2A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkG44G+8kTsSI6K25ArFKXB9UJ5ktm1BuLeY1uL5U7OGq2OF7AM3Axi51YiLNaxUemr1PqeJnshDknVKMagF7wNolJaleypHrUNdB1HFQoJsepASo0595dMgqtLL68vYR5CCAYfgbv2WL1zNp5XeR2FbesLU8RA6psr9SyPzT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW6ofRgV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e0e224cbso3212081f8f.2;
        Tue, 21 Jan 2025 12:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737489630; x=1738094430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2N1YlgQNdx7LxlrloC7QMkubugmuO/YtGTHs/05i/8=;
        b=ZW6ofRgVOY8AJhX9W3VlfSrtUBNG1mUbapMh3D3RUtlo7o/vua/mOHaB4HtnjooaFz
         UwUGXOVuLJ0KAtBFPd02I0x17L8V9m00KGGPBwNIHzNGo4WmsnebmF8Dhhhjfa1EwMT1
         sOSZjRrbhFUv/kFGTncpZVUnKRJy+T4nFUg4CSQkZCc0Pw44f9tOuKcG7+U415ew2GAf
         PpYvNGmu9MNGeg5Y+dQJqvv4+hZ+5aNQq8hmwSQesTdt9fAWRKFGRCGrlLIU8Dkgu0pR
         7VAnwxc/eRK8+KnSVXxh6FjeCypex6lvdWYBBB17qD7K1zQkxJsuVBaxPwAa2u0SSKAT
         EHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737489630; x=1738094430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2N1YlgQNdx7LxlrloC7QMkubugmuO/YtGTHs/05i/8=;
        b=rptX8yuxDVcLIe4ga7yiinH/McdYpyvPAjY5IgC6r75HsQ4mW32SOXc0RPqcfUfTqo
         /MI/xEw+uP31BvEcEXxweKOM/IkN7x2TX26OhtGWrH9knQTQFm0VjJBlTSN6KuJTZOl+
         lEFcLt40uWwaILGEfP47c38gw2aqemntp6s4lwdPEydRMltiHP4T/zsoUspFtR5mDB+M
         6atOHNWDZXNlBiC7YJqD97xiNV/PptPhB+Zl3Hwwni5tZ+qYaj+cslFecyNlVazdm16Y
         ksruE5vROxm2kDFccdqLSYOIfsLe2pzHX7FWq/vVA5u+Hin7osvOXwsXtWX4NZfAVYl6
         /zTA==
X-Forwarded-Encrypted: i=1; AJvYcCV6hIoJveexwu1346qgL7w2nfzUjxuUYwTo2R4vfVp53kw0RsrBmXPgopryctXny33D912iujc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6sO+9LrZabNMhZIbj9ErbIURZGl/sCgq7RPCJqR+c1UZiYNG
	VXO8Wrg/9QUGZz92TiM5WyTT8EFnPDJ3Ce8Y3Yk46bkPz5329c9o7paMyerC
X-Gm-Gg: ASbGncs8sE64X/GoxRCc1eIkc4neCN3cLlH8TyXZt6p/alzxqtPVDt6JlhDaYS1HL0d
	67hzjbHHMnVtN68JZ9S2Ub1/mOgG7Oe7hi3jJhx0OrIpZlIUNwKruqnOfX9upwC54DPpJ4zcD4U
	XHQMCWChiK3EmUuLhdcTQ52HxZAAYp+6fBCWIvGvf8IyqaN8sPPKX6b1dDOvNEcF71iljABoMr7
	MgNaDPAJiMonvXpOQ9UjNu9Om5IbkAi/caAIR2gLenyFkpE8Ww1uPBGzHz+9pLfRH76tNXYjsmP
	h6QKd2Nc0as5566ckw==
X-Google-Smtp-Source: AGHT+IH11nOzlyATB1hkkRENeqT/0e9t9i8wxeN5gd45RNy8t4U54W26NVQs9Kt/GZhIuToDpx/3+Q==
X-Received: by 2002:a5d:47c4:0:b0:38c:1281:260d with SMTP id ffacd0b85a97d-38c12813249mr7010385f8f.31.1737489630028;
        Tue, 21 Jan 2025 12:00:30 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221761sm14118153f8f.22.2025.01.21.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 12:00:29 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	stuart.a.hayhurst@gmail.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	kangyan91@outlook.com,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] HID: corsair-void: Initialise memory for psy_cfg
Date: Tue, 21 Jan 2025 20:00:08 +0000
Message-ID: <20250121200017.33966-3-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
References: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

power_supply_config psy_cfg was missing its initialiser, add it in.

Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 drivers/hid/hid-corsair-void.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index bd8f3d849b58..56e858066c3c 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -553,7 +553,7 @@ static void corsair_void_battery_remove_work_handler(struct work_struct *work)
 static void corsair_void_battery_add_work_handler(struct work_struct *work)
 {
 	struct corsair_void_drvdata *drvdata;
-	struct power_supply_config psy_cfg;
+	struct power_supply_config psy_cfg = {};
 	struct power_supply *new_supply;
 
 	drvdata = container_of(work, struct corsair_void_drvdata,
-- 
2.47.1


