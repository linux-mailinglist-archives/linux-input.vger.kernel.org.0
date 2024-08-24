Return-Path: <linux-input+bounces-5821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081595DC13
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E80BB24B67
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7A317A58C;
	Sat, 24 Aug 2024 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAqTNgps"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C84117625A;
	Sat, 24 Aug 2024 05:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478669; cv=none; b=OC/vAdxsyxxDTSehjIT+m4+WANIBaxF/N89DxhtdcB8RFGyN7CRnyU8ZYYKtiLDaV6DGu3eXH8NjqWGgvMWMFr42KQEJQcz0s6r5kjfmpHuNRTRck16ERGFDOI6GgOxd4n6Nnf9SLkYFE5ZnJP7vxzadBWBzPa0HMmM+KpoJwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478669; c=relaxed/simple;
	bh=sXJokwmwypVXYkriPam/tpr+/sHFGQ1h4EjwJIMaEcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlqD43nvzrJMjJQPq04uTKd8Tl45p94FDifabekm+hYDgb5O+j30BrDoYQoctUA29wzF/YUupG+MmWd4kES3UXt2LCZrzaVjuL3Ufz/WRyikEQ8GetHOi4wv0ubFjaAQpzbldeJ/cwjbeFaVdJyCfgZAPJm3HtKFd9oWAAb42/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAqTNgps; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20230059241so23086855ad.3;
        Fri, 23 Aug 2024 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478667; x=1725083467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CWMnsLFQR74RvzlYOC3kpIV2wtjWs90jpX0t8PRdXg=;
        b=AAqTNgpsD8O69hgsRWwJ0KfQXpgOkutWjTMBU2RhG5uELS10DFcvzLlZ3BexJMPNtp
         I5mFG36ZDDs/0joBISeZgVMQsKm5hn7BHD/LqPRzGu7fspLRO8mV5l1pNXVcvB/FB3n2
         TVhOBkJZ6Zqvez8X/PFGSidy72lFybu0Aulsflx0z8ehr/uvwVPjCbwuR2h4HjijVVwh
         X7p/OBvM5+OAshWtFk2PWOq/TRl4ZSEpd5Swm9RTUBzNRbmCYSM2fTTasR+lmWQnW/M9
         GGLvol/oWQbEdFkg4anwFuTR1VNk4wS5X2f2IqmAagGaISfNfiTCSFJrMff65Zy2Rw+x
         kmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478667; x=1725083467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CWMnsLFQR74RvzlYOC3kpIV2wtjWs90jpX0t8PRdXg=;
        b=GEIia+mycZ0i6txOUOn8tf36f70mvM4S5AWuvo33/h0oI8sfO6IcAzEMKn7U8r0ZR2
         QJ4ebToIaf+Y+imGn7MfjzuxoZ2xZwOLQbmbLE9ms/AEtceB+HtzERZqEjvbTadzjUwT
         BcOM0euQ9oRRrPqaOe6YQ0f0GfDAEXN6kl84SSVyh64a3PMp3ERvG8q8BbvsIiMrCDP/
         7FPIJRGsmPDm6yTbCWAt/IV+PJ55mnaqHglhz1Xq/N2YtROKfNc0nLM9FOdlYw8U+7bS
         iaAYk3rpxa1Gvfg5dxIP4pdJ6/CTwdO1tLN0sJM3u+Rwnnj8rj/jxiAmlD35G2ZLhwKt
         Xv7w==
X-Forwarded-Encrypted: i=1; AJvYcCW7aZImOEgcdfnnmCNdmuI5Ir8k0jr1xFSLn08weOyU40bRvnwEaU0ORP1rMMfnAZpv+sZKP+OLCfOx2g==@vger.kernel.org, AJvYcCWf+eTag9wTO+LBj63GXT2SfChYWPAQfxIKBTxCrayw0ynKtK/YScfgGOl2ed9gdFWYl9/UKUorF7FWAofO@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYCK+f3WY/WK9TB1PTCEOFNVLtQ9bRg59ySfS5xsFu2rqr9Q9
	Yc3i3l734siQ4GWY2JOBQlFq7baEyeAyjEmxWF/ahM4Uyyo4wKZl
X-Google-Smtp-Source: AGHT+IH6axTfumE8irq09ckupeuyyfaUTjSdf0aW5ZKXalnBzWKFxW7G+PxKpAVVIGgXozFsEWghAw==
X-Received: by 2002:a17:902:ced0:b0:202:e83:eb11 with SMTP id d9443c01a7336-2039e49513emr50276245ad.29.1724478667341;
        Fri, 23 Aug 2024 22:51:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] Input: zforce_ts - make zforce_idtable constant
Date: Fri, 23 Aug 2024 22:50:37 -0700
Message-ID: <20240824055047.1706392-14-dmitry.torokhov@gmail.com>
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

The I2C ID table is not supposed to change; mark it as const.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 78f561510f8d..2ae079db8884 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -855,7 +855,7 @@ static int zforce_probe(struct i2c_client *client)
 	return 0;
 }
 
-static struct i2c_device_id zforce_idtable[] = {
+static const struct i2c_device_id zforce_idtable[] = {
 	{ "zforce-ts" },
 	{ }
 };
-- 
2.46.0.295.g3b9ea8a38a-goog


