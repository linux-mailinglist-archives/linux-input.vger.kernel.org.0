Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E29FEED
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfH1JyV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:21 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:45663 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfH1JyV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:21 -0400
Received: by mail-pl1-f174.google.com with SMTP id y8so988243plr.12
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UQnwzKcveqCmOUaA3/3c8b6J5UefneOvlIC1zJw4bkw=;
        b=CZi2n7W77Z0A7UyWNTMUBJtOH8WJK7Ggqtowll+q3WUbEImB7ARxf5S2RU1880C8Vn
         F22+VNw0MEfFNkSWeUg1mwlvkYRchzdZT5dZFlbQajBH2oL8Z3kqCDr3Nx69K72daNuO
         uG5pzY7geX6lIYrWLClTXk0WBMG1aCCD1ih1XNOf/N6loFYc19fUjn5vhejcPBrfYN/g
         iKTSYyr5psTjy7kH74iqFCQm44fbhfX0Di4ViQ0kamAtFAG+8/wpsRTKwg7yJf9cFsmt
         h4ZGJBLu8Qu58qzWMIEtqTBVK4Yv9N4iD0Lv8I1p5TYO9YMAymVnooT4J8exMG9Sow0o
         ISYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UQnwzKcveqCmOUaA3/3c8b6J5UefneOvlIC1zJw4bkw=;
        b=BZ35WPEcPDiL7rBQB0u7qPVsCs1eonmK5q6MFhgb7wIvPzJ/N4uscRWxNIQWW6phUB
         B4Cn2rCImmoNX9A7YKeyqjBdnv2ahvOwuj9tJUfEEIS4snLKqzELnVHQFk3ivuMbnZlz
         631w8eyJkvK+Aq1f4HNYURk/AiHTGHHgxKNS7cZdl5YUDrIrX9c+0FmxvZSV9K45nCXa
         fK3pHmjdExaux+eCheK1t7UCIUC41wupOh2TgBHUXd/naUdV2Z/AOPLG/NTe7Md1FWNk
         80k1BkiWPsvV+UDKsUz4bTpC6U+n0bJdOfIH7HK7BRYjgilq6ZplPxbmWO4/yJY95a4Z
         L3Qw==
X-Gm-Message-State: APjAAAWCL3Us6YHfl1zm/CoYAdsSYgI35azPNkBl+Uka4K3ooXGG/bIM
        ZC5g4ieMg1VswNDAGwk4D3lfIoEU
X-Google-Smtp-Source: APXvYqzo6NwiDSB73LYa79Qw5+Gu0rESWTZU38nCxLV73kFUc8a4keCtjl5+K+ciUkA6mjkGA6/xjw==
X-Received: by 2002:a17:902:3064:: with SMTP id u91mr3485177plb.244.1566986060286;
        Wed, 28 Aug 2019 02:54:20 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:19 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 6/8] Input: atmel_mxt_ts - add active to idle timeout in T7.
Date:   Wed, 28 Aug 2019 18:53:47 +0900
Message-Id: <20190828095349.30607-6-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

T7 has active to idle timeout information. Add active to idle timeout
information into structure so that we can refer information easily.

Change-Id: Ie4682cff3d3bb1b8b537702656862eb34f64a0b8
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 723ff75e798a..3a17adf04e2a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -94,6 +94,7 @@
 struct t7_config {
 	u8 idle;
 	u8 active;
+	u8 activetoidleto;
 } __packed;
 
 #define MXT_POWER_CFG_RUN		0
@@ -2176,6 +2177,8 @@ static int mxt_set_t7_power_cfg(struct mxt_data *data, u8 sleep)
 	struct t7_config *new_config;
 	struct t7_config deepsleep = { .active = 0, .idle = 0 };
 
+	deepsleep.activetoidleto = data->t7_cfg.activetoidleto;
+
 	if (sleep == MXT_POWER_CFG_DEEPSLEEP)
 		new_config = &deepsleep;
 	else
@@ -2186,8 +2189,8 @@ static int mxt_set_t7_power_cfg(struct mxt_data *data, u8 sleep)
 	if (error)
 		return error;
 
-	dev_dbg(dev, "Set T7 ACTV:%d IDLE:%d\n",
-		new_config->active, new_config->idle);
+	dev_dbg(dev, "Set T7 ACTV:%d IDLE:%d ACTV2IDLETO:%d\n",
+		new_config->active, new_config->idle, new_config->activetoidleto);
 
 	return 0;
 }
@@ -2218,8 +2221,8 @@ static int mxt_init_t7_power_cfg(struct mxt_data *data)
 		}
 	}
 
-	dev_dbg(dev, "Initialized power cfg: ACTV %d, IDLE %d\n",
-		data->t7_cfg.active, data->t7_cfg.idle);
+	dev_dbg(dev, "Initialized power cfg: ACTV %d, IDLE %d, ACTV2IDLETO:%d\n",
+		data->t7_cfg.active, data->t7_cfg.idle, data->t7_cfg.activetoidleto);
 	return 0;
 }
 
-- 
2.17.1

