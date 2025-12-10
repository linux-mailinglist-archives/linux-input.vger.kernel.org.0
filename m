Return-Path: <linux-input+bounces-16519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CCDCB1C9F
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC203000B09
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 03:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9B72F6909;
	Wed, 10 Dec 2025 03:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9sXRcJl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA102F39AD
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 03:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336843; cv=none; b=u/d8qzLozY6DN20IyNh9UkQQU/V4lhw7JO02ehdG29YR3gFwhLTqjSsVWtk3Op4arw0FyhVtlARtTIH9HULh6C1Y0JU33P7m9sKNmE6yqnIOlaJ08Ay6dtaLLvqbu5eNSV69PpxxwYu0hueURhZF1t6m5bxiV//9amQU33z4n+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336843; c=relaxed/simple;
	bh=ZhvJoJg28WY8WddGDgYpoOtsuRlwXLVvWpwlSL6k1pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HvRBqR2KJz5DbEUxQw9w6mBoUEsZsyRLqF2WJBTaD33DMxpViEyh/yMQbDhToLLkpSV8RjoQ1cHXxjLAlgbZ/Ihx64yg5kLGQxZX+jwbVNOhxsrDu7LwH0PboahWzgWoOWyTpTzIF5/APYiVpp8PFY7VokMi+3ft6IKABxV1MiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9sXRcJl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29845b06dd2so85662785ad.2
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 19:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765336834; x=1765941634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbN+EuPmocUOeBG82RSMhzZ2IRHbxuavHhm0ZQadrtM=;
        b=T9sXRcJl/S7GrTHmiXfaRS4/OWJNrXwvkQZZJWEWwrsW1Zyw7NClhym0Y8hvu7bZej
         yYO0EmKteKyFC7vLGeZegPNoz0z3mlboYeienDj2OXE32dFGJB8q3ro25H1bs5MH7owA
         Jtxh1AIQtfHA59QcOb4FarILHMOw/OOURZLQIoBACZMkB3xmWfKkqSPT/uuIqtSZXU3o
         iqVGhCoTl2LaM7TvAJzn6a+9o2Kmxp6+120LUhdILrJqyg9lXUIYKN0b5hcvcptefy5K
         375Vw9GERejiuqtK/Zj2zbHmaLx/AJB3eXIyL/tyDq5f1PyYtiHpNlPRATv/zidaEKCd
         HTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765336834; x=1765941634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbN+EuPmocUOeBG82RSMhzZ2IRHbxuavHhm0ZQadrtM=;
        b=XBw2MbYoXfeJsYHJCHT6ZO3Gonxr8j5NaJ97KKrWZYR+EEbS0kCbYRWQd8z++mDmwR
         VnjcovGiFmpZSaZwecOpjkHqmXXnG04vZR7617g8/31E2eywMsKipW+Zc1KIebGF5ZkG
         ZnHhqttLYcdn2S2sv1rcZjPZR3CTjPEpRVgL7Ri77tAYrSfSdnJsW5H0v3zcuzE6Ca/h
         EOZNxrgnY1ljRKljhOfInTynj/ATMmwdkqHsRaZG9W5p1cGHRAPhI3//d2HWfYO7SXlA
         l/GORmi6CQtA4CCmswdnUAjfaW0qaH1OKHiipvr+8Gf81bMmPHzVcKq7vlI8dp1kNYmh
         zP0Q==
X-Gm-Message-State: AOJu0YwLvnhWF0HZgL9oUGr9bXU7zdzqLzYd70mDZzkuog4gTr7/A0ZY
	uFl8iFgBqre/+QuLwpfIeAiyq62N4qlWg+8MUb9gcJYNUB2ilTut3AOs3DeAqA==
X-Gm-Gg: AY/fxX7PTW4tVaKkGj12bLu+elvWyE4BMCCCCOGSKP6Iz6hVtpLA6PKrUmtQfvIR0lQ
	VYx9DsUH8LwTmWzGpfqAk5+sRfmkT1zRfmcAo8UW+rgwk5ad8cxrZ7KKCNQU9mpJmUS2iBC8fHC
	BdppFrt07+R5meEsH6uDu5a2/+g/Qvqphwzg0PvN1dz0oSmESdUMrxpOz4AzanwEBsa3i0tubYW
	qPREUvCc+99Oa7GreqIqHZ/nEDQZ8owy7M7yDoJkoORpPJVFhm2egPCuMgSItqNR5SPrFFfRPau
	+HT8XFbMaPeFukKKHmSzWAjO9QLyrDQGg19BPMOV+R0y2qYwxNF2cwz6W/cGIubgnU/+kEuAZxr
	GjO/Yl98zzB72jGLFxOA3+dcyc31YY0OoArGkEM553z1/bnciJTc3AgoDZFvnVgBSFdXb6JWdeN
	27haTUgbu2s2ri/gvtPwuw76rCvASs7A==
X-Google-Smtp-Source: AGHT+IEMtGD+A/RMPic2C2F5xkyR72IvoSEeanxQ+MeKzBVevm0+/eQmMUxld8jyk73UQBIfukkjdg==
X-Received: by 2002:a17:902:fc86:b0:297:f09a:51cd with SMTP id d9443c01a7336-29ec22cac38mr11779605ad.14.1765336834147;
        Tue, 09 Dec 2025 19:20:34 -0800 (PST)
Received: from localhost.localdomain ([121.190.139.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6ad1sm169717995ad.90.2025.12.09.19.20.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Dec 2025 19:20:33 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Minseong Kim <ii4gsp@gmail.com>
Subject: [PATCH] input: synaptics_i2c - cancel delayed work before freeing device
Date: Wed, 10 Dec 2025 12:20:27 +0900
Message-Id: <20251210032027.11700-1-ii4gsp@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synaptics_i2c_irq() schedules touch->dwork via mod_delayed_work().
The delayed work performs I2C transactions and may still be running
(or get queued) when the device is removed.

synaptics_i2c_remove() currently frees 'touch' without canceling
touch->dwork. If removal happens while the work is pending/running,
the work handler may dereference freed memory, leading to a potential
use-after-free.

Cancel the delayed work synchronously before unregistering/freeing
the device.

Fixes: eef3e4cab72e Input: add driver for Synaptics I2C touchpad
Reported-by: Minseong Kim <ii4gsp@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
---
 drivers/input/mouse/synaptics_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index a0d707e47d93..fe30bf9aea3a 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -593,6 +593,8 @@ static void synaptics_i2c_remove(struct i2c_client *client)
 	if (!polling_req)
 		free_irq(client->irq, touch);
 
+	cancel_delayed_work_sync(&touch->dwork);
+
 	input_unregister_device(touch->input);
 	kfree(touch);
 }
-- 
2.39.5


