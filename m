Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03A7E0CE2
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733086AbfJVT4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40906 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733078AbfJVT4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id 15so5234784pgt.7;
        Tue, 22 Oct 2019 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jTkbiAAlMel2JTI9fec6PBcZIJ2pwZr6vga6v88CNRk=;
        b=sMf8gR7H2RF4QhBDjhzNBuVx5Nw48ChPp0C/xkGvbxrIpLbJbIT/PuphsgN5YVxf9s
         +YzwtgBLe/aGdE20ptQhlpG1+SN4a94dI9i43Gx4bdyzeVSAyWN+srE3d7ZKG3lViWyI
         s7nhZgBCC3vqNN4ypkabP8OC+GMI5yoj/8yoWOf3BHQyZTw0XqsKQfmZH+1mLayzbHsb
         EV6tvtSTU0W105F7s0ymu7iMFUAugvtH9JwWQaGpaVZmAOcw4+g+hoi1uj6OzRdDWB/V
         yXMjrSbe7Xmma2RR1xSeUWMigaaM12Pv4GN2PEwPTOJeRL+3V98p49Q9bcDUXWW3q/Zr
         rKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jTkbiAAlMel2JTI9fec6PBcZIJ2pwZr6vga6v88CNRk=;
        b=ZJUsjoZ+nK7pblvbpsUDLSmMUWS7dE1CypUcatA1aw94Qjf7nTDGAa1cvoR76kAOj5
         O/l8gSg7cVtE47as37b+I1ZhZzhWkX7skJWqHOskcl75Am0qpwUsVYdTjyvw/vIKLx2E
         JywoKR7b+YH1/+rIkl/YH98YRLhyL3uEH5CkxH0ahysfTl4ydMCHW6UhoxWdcD9Bw53l
         Bkg3OKYxpsdO7HMCLlqxf13hOYY4kEHSrKbQNyMtbXfkhbjgzAnL5J4RNdlDH8LG9awj
         uGvq3Irfqo9P8wz++53D/LWyH6+VzpPxfGQNG1sKY2cUHInh4fXP1eq4YWXrpi/oyV1t
         7xyg==
X-Gm-Message-State: APjAAAWp34dA9wp+e3/G5zY+YlELCLQDxRFk15mtMAmIh59QjakcKK4G
        KuR3vFhxGsJRwP64GmHmx+Y=
X-Google-Smtp-Source: APXvYqxargZ098lB4IIe5UEpE1uuS09B+gNRGN2EN13mqxC+hC8E0e5VDNiHQyJDrOq7CDCRr57CjA==
X-Received: by 2002:a17:90a:8d13:: with SMTP id c19mr6773513pjo.63.1571774191629;
        Tue, 22 Oct 2019 12:56:31 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:30 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] Input: st1232 - do not allocate fingers data separately
Date:   Tue, 22 Oct 2019 12:56:19 -0700
Message-Id: <20191022195622.66976-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The finger structure size is quite small and allocating it together with
the main driver structure will not increase likelihood of allocation
failing, but reduces number of objects needing to be tracked by the
allocator and devm.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index bfea02202ded..dfc0c6cb0213 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -50,12 +50,12 @@ struct st1232_ts_data {
 	const struct st_chip_info *chip_info;
 	int read_buf_len;
 	u8 *read_buf;
-	struct st1232_ts_finger *finger;
+	struct st1232_ts_finger fingers[];
 };
 
 static int st1232_ts_read_data(struct st1232_ts_data *ts)
 {
-	struct st1232_ts_finger *finger = ts->finger;
+	struct st1232_ts_finger *finger = ts->fingers;
 	struct i2c_client *client = ts->client;
 	u8 start_reg = ts->chip_info->start_reg;
 	struct i2c_msg msg[] = {
@@ -98,7 +98,7 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 {
 	struct st1232_ts_data *ts = dev_id;
-	struct st1232_ts_finger *finger = ts->finger;
+	struct st1232_ts_finger *finger = ts->fingers;
 	struct input_dev *input_dev = ts->input_dev;
 	int count = 0;
 	int i, ret;
@@ -177,7 +177,6 @@ static int st1232_ts_probe(struct i2c_client *client,
 {
 	const struct st_chip_info *match;
 	struct st1232_ts_data *ts;
-	struct st1232_ts_finger *finger;
 	struct input_dev *input_dev;
 	int error;
 
@@ -199,16 +198,13 @@ static int st1232_ts_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
+	ts = devm_kzalloc(&client->dev,
+			  struct_size(ts, fingers, match->max_fingers),
+			  GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
 
 	ts->chip_info = match;
-	ts->finger = devm_kcalloc(&client->dev,
-				  ts->chip_info->max_fingers, sizeof(*finger),
-				  GFP_KERNEL);
-	if (!ts->finger)
-		return -ENOMEM;
 
 	/* allocate a buffer according to the number of registers to read */
 	ts->read_buf_len = ts->chip_info->max_fingers * 4;
-- 
2.23.0.866.gb869b98d4c-goog

