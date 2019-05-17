Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0B521F80
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 23:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfEQVRw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 17:17:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38600 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfEQVRv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 17:17:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so8494923wrs.5;
        Fri, 17 May 2019 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j0QSp/nbNAN5CDGxs0f/bvo6nU3WJJBo15TSLrfM3Y4=;
        b=tiIXZ4sutgDVVU7SE8IeUiaj7yo1qHobxFKA+nnT31hSDFk46N7ENbC8r5EX2YtJfC
         BwCALt/MhUi4ZJnosTP6KRMyJbIygrOYxXPYS4fZ1g1UOxYNMX/4GI8Yg4/KkV8ytxkv
         byFEMejpRmPz3YupaSXtzS4QlUvfYeB0teT9/m5QN4iiXDiEdsMsnbYZynUKrRxcHUfZ
         NR5xY2Rf1rsY0eBQy6CjzgLk/qGocDmwyRHcZaSxWbC52WJolbkeH2/wmKVGKEyUx77E
         W06EjMuaSOLbiO9vfNuVT7CnMKD0H2QVmbbvmaDdmo18r+Cyx4uHhetxf+i6FvlztObr
         ZfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j0QSp/nbNAN5CDGxs0f/bvo6nU3WJJBo15TSLrfM3Y4=;
        b=KDJEf85lF6OuYf/Xb/UvZYJf4MNx/CC1BvO4Fcp2chjHZPV7d/6JLX2qlJlvyhK+j/
         TOFYwaJrxmgb3cTE3uGBqEYHfLAl3+nVJkyCjr3psOgDHm3cjk/eGiv+VdXnU8yPi1p3
         UHHM+Y7/drXHPe3vynDKVqBl1ptbxGIgZutN8tFXrxAwCdtqzInUxA3jizqAt+s2r4U8
         Tww3NU0ANkBC5GdFwsVHbqv6wGmELG9cStUKOjGqeOgpcW+aFPom7wfiXZ6OTKDX+MZR
         khEpq3rPueFKet4CklnLiUzK7hGyeA5tt/0S1W2IVkpewaLhR8ZnWBBIVM7Ves9Xai38
         dqeA==
X-Gm-Message-State: APjAAAX0iUc+miem5dCqTtjeQD9pS176EuDN6UzHIxvAmyv/q9nmJP/7
        DlWdN0Y7ElnZcYoIpKeAsZs=
X-Google-Smtp-Source: APXvYqzQicc/iutHtLatS68TF4Wqp76ixuQit1ne4DOx7ecZiAUY9JpudaWRxE60ze3r41OtMhdwVQ==
X-Received: by 2002:adf:fa88:: with SMTP id h8mr1792358wrr.32.1558127869602;
        Fri, 17 May 2019 14:17:49 -0700 (PDT)
Received: from vaio.lan ([93.55.208.142])
        by smtp.gmail.com with ESMTPSA id 88sm20085400wrc.33.2019.05.17.14.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 May 2019 14:17:48 -0700 (PDT)
From:   Stefano Manni <stefano.manni@gmail.com>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Stefano Manni <stefano.manni@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: atmel_mxt_ts - add wakeup support
Date:   Fri, 17 May 2019 23:17:40 +0200
Message-Id: <20190517211741.8906-1-stefano.manni@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add wakeup support to the maxtouch driver.
The device can wake up the system from suspend,
mark the IRQ as wakeup capable, so that device
irq is not disabled during system suspend.

Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 5c63d25ce84e..2e0abc0b665d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3041,6 +3041,7 @@ static const struct dmi_system_id chromebook_T9_suspend_dmi[] = {
 static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct mxt_data *data;
+	struct device_node *node = client->dev.of_node;
 	int error;
 
 	/*
@@ -3125,6 +3126,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto err_free_object;
 	}
 
+	if (node) {
+		if (of_property_read_bool(node, "wakeup-source") ||
+			of_property_read_bool(node, "linux,wakeup"))
+			device_init_wakeup(&client->dev, true);
+	}
+
 	return 0;
 
 err_free_object:
@@ -3156,6 +3163,9 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
+	if (device_may_wakeup(&client->dev))
+		enable_irq_wake(client->irq);
+
 	if (input_dev->users)
 		mxt_stop(data);
 
@@ -3175,6 +3185,9 @@ static int __maybe_unused mxt_resume(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
+	if (device_may_wakeup(&client->dev))
+		disable_irq_wake(client->irq);
+
 	if (input_dev->users)
 		mxt_start(data);
 
-- 
2.20.1

