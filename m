Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740C93437A8
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 04:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCVDyK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 23:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCVDxo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 23:53:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4379C061574;
        Sun, 21 Mar 2021 20:53:44 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id o2so5839232plg.1;
        Sun, 21 Mar 2021 20:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3Ufi0jzK1QTqOk3lxQWPXZ3q8d2AUcWGXV7scJ/HqnE=;
        b=tOor6UtxMGEMkVXErCwo73HRCp9bMB5iz5QbhQZGaYkvavoapR7f2D2gu41OORhrx4
         Raz4bs+tUw6UAQ/J5zQunEVcUH+Ik1nJDI5aYWyeZenaM5bTnDN4HzGgRN7wvLCbuOjW
         kyRREtfvncPA8iedHqT5ID2bVuBuFHbwAy4RXj96l4vuR6TD+feei5qyxwBXfzAc8siy
         fLuuEcPRMGs7EhdBuYcL+cN5m8Fs+FeMLWTmg11oIJNWx2q50n0fSmqhiV2UJMgU/9HZ
         xQAFV4QJxD3inK9b9jUjG5QNFASgIXlyq+1V/ui0C+GCFgm+JuW7/mwioiInVN0z0l64
         M+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3Ufi0jzK1QTqOk3lxQWPXZ3q8d2AUcWGXV7scJ/HqnE=;
        b=boAdcYKvFIICmQAV75WXouvbfGHBXzVjG871kEpDVKX3EK0CDKb5HewA3GBweHskbP
         U9yTW/68KBzOBhoLZwuqYunFZEmHMLvyxGCl1k0IYWcfEQjYJLMT8vjyfOcN23kxIMpw
         L+QzxMC1eM4AyRGfUTYqX0YpmGT7q9lOLIuGyIX96S581skO4MTczmGWkDuxFqv3nT5k
         pdbAnPcOvZkAXTSYbyQXt3LVI4tDufZRtlpQ18yjViontzSv05a/OjH6SwimpN5hrsvX
         cGYYnjEKfcn7ExIxKc0pOFIQPRHY5HtSRBgKZS3RZATed1YmkwdErO4mqB5MCorLz+KK
         iNCA==
X-Gm-Message-State: AOAM5326LGsUpYM3WKvbITzmkK7ylpD2KF2BsaRkREVAcL+++FpmgcSr
        ISlQLmnpM99nuoIKIfTJ2T2uuDa8CM4=
X-Google-Smtp-Source: ABdhPJzuJtvnKd4bLPPWtJGao+aXEqJr4SwiqRunr75pE8Aeode2gHazhv67BpvqXqDkFet0XSuyNw==
X-Received: by 2002:a17:902:e80a:b029:e6:c4c4:1f05 with SMTP id u10-20020a170902e80ab02900e6c4c41f05mr25320543plg.33.1616385223569;
        Sun, 21 Mar 2021 20:53:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id x1sm11759217pfj.209.2021.03.21.20.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 20:53:42 -0700 (PDT)
Date:   Sun, 21 Mar 2021 20:53:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] Input: serio - make write method mandatory
Message-ID: <YFgUxG/TljMuVeQ3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Given that all serio drivers except one implement write() method
let's make it mandatory to avoid testing for its presence whenever
we attempt to use it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/ams_delta_serio.c | 6 ++++++
 drivers/input/serio/serio.c           | 5 +++++
 include/linux/serio.h                 | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/ams_delta_serio.c
index 1c0be299f179..a1c314897951 100644
--- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -89,6 +89,11 @@ static irqreturn_t ams_delta_serio_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ams_delta_serio_write(struct serio *serio, u8 data)
+{
+	return -EINVAL;
+}
+
 static int ams_delta_serio_open(struct serio *serio)
 {
 	struct ams_delta_serio *priv = serio->port_data;
@@ -157,6 +162,7 @@ static int ams_delta_serio_init(struct platform_device *pdev)
 	priv->serio = serio;
 
 	serio->id.type = SERIO_8042;
+	serio->write = ams_delta_serio_write;
 	serio->open = ams_delta_serio_open;
 	serio->close = ams_delta_serio_close;
 	strlcpy(serio->name, "AMS DELTA keyboard adapter", sizeof(serio->name));
diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index 29f491082926..8d229a11bb6b 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -694,6 +694,11 @@ EXPORT_SYMBOL(serio_reconnect);
  */
 void __serio_register_port(struct serio *serio, struct module *owner)
 {
+	if (!serio->write) {
+		pr_err("%s: refusing to register %s without write method\n",
+		       __func__, serio->name);
+		return;
+	}
 	serio_init_port(serio);
 	serio_queue_event(serio, owner, SERIO_REGISTER_PORT);
 }
diff --git a/include/linux/serio.h b/include/linux/serio.h
index 6c27d413da92..075f1b8d76fa 100644
--- a/include/linux/serio.h
+++ b/include/linux/serio.h
@@ -121,10 +121,7 @@ void serio_unregister_driver(struct serio_driver *drv);
 
 static inline int serio_write(struct serio *serio, unsigned char data)
 {
-	if (serio->write)
-		return serio->write(serio, data);
-	else
-		return -1;
+	return serio->write(serio, data);
 }
 
 static inline void serio_drv_write_wakeup(struct serio *serio)
-- 
2.31.0.rc2.261.g7f71774620-goog


-- 
Dmitry
