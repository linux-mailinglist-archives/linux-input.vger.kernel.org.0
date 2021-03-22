Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD04343697
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 03:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhCVCVA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 22:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhCVCUq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 22:20:46 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50DBC061574;
        Sun, 21 Mar 2021 19:20:45 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id s2so11302696qtx.10;
        Sun, 21 Mar 2021 19:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9AU2DB+pmmcrDJyEBFaVoN1J2Q6WrBbWMuX+gq4b6pM=;
        b=AxnJYgzhVeVx3EIRJJYSaIhO4xPA0CFBaDhSPKGF6q462yYhswCdrNhcnyCOVI8qSx
         s/aVpuRd0qxJh8p+aRw5+0F8p01hH02bxeDTtFV+kk4fmb5p7Y3a7CCl3buCKmEtCeds
         rBrCdJaZmhcTDk0TnvDKM6zPm4KnyKP9mIEFZXFdueqquGmz4DYi8Eb+uL63tPUd6It3
         KFinZm3Sl7YxbNDqX3sHRMLS0hM0qls8M0XuKl9mqx2sdJ7SR5cb0Zpx4jzyRQzw2g51
         WgY6sh+3KDmwu9ledvw8ylXriNpig85AHCrG063q8Zc1m8M1Uc+JAJ7e5XqZACFRz8c8
         gBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9AU2DB+pmmcrDJyEBFaVoN1J2Q6WrBbWMuX+gq4b6pM=;
        b=VWSlmLt6ZXNOuU86Jl+jIWQUzfPfPfeTyQpSlOp0QvvgCAeOGDPbAkFjxAiAIiDRJf
         0xvZEwQog+TAwIlZUROyYuR0eR4iOf+knZ4qxQ1XBTEgDsdaL4+d8R0UXo0h1P4eIsd1
         o6otiDWhqUo7zyc+IJMPE0r97miZrpx/cJLmA1F3PGC9Vnkx5wNPgx59TsGd6HOsmj0E
         2KiALLR7wuPjji4NpGr69U+i7cfCPvsW9keeZS56HgdpYs7MqSK8dp8SSWoQIJdW0aC8
         hBaDbk9XJ1rb1vDJ3y8X6GWaTqDHdA/86QiK7FFGmBn+Ci/s8orGCUgKuIFY0cq7CYct
         K9BQ==
X-Gm-Message-State: AOAM532xzqSwRWIeFwog7gS5smuPQzWR4zjuPElcsXAQX5smJNkRFWZ3
        fDqMKUxYTO7gQPQ+hburTVxPQQdOEidFk5+4
X-Google-Smtp-Source: ABdhPJzvPYrlzJedkYJmwvueXlsioPxrKs8lZFkaezbOvpk5rYJCyAne8QxPh3DW4UxT7XKF+YENUA==
X-Received: by 2002:a05:622a:149:: with SMTP id v9mr7659070qtw.172.1616379645056;
        Sun, 21 Mar 2021 19:20:45 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.190])
        by smtp.gmail.com with ESMTPSA id s133sm10096253qke.1.2021.03.21.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 19:20:44 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     hdegoede@redhat.com, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Input: Fix a typo
Date:   Mon, 22 Mar 2021 07:50:30 +0530
Message-Id: <20210322022030.3857089-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


s/subsytem/subsystem/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/input/touchscreen/silead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 8fa2f3b7cfd8..32725d7422de 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -486,7 +486,7 @@ static int silead_ts_probe(struct i2c_client *client,

 	silead_ts_read_props(client);

-	/* We must have the IRQ provided by DT or ACPI subsytem */
+	/* We must have the IRQ provided by DT or ACPI subsystem */
 	if (client->irq <= 0)
 		return -ENODEV;

--
2.31.0

