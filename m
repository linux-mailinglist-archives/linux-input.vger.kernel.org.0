Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6742F6476
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 16:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbhANPYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 10:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbhANPYy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 10:24:54 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FF3C061795
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:40 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id v184so820207wma.1
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJZuOyPoke9O1aNcUMwMh4SJuqZZoxbP5+ZVqt4w+RI=;
        b=r2JSG1IJnbN0WfX5sB5L2Cq/teMhRCtH4rBbnSLTPluaLtMGJxUn/XATcotrcaLRE5
         utL3DvHa7fsz/+QlHoykplDmscM0XvWs860rgqW1CAGZzKuEyBjxBcw83hqZnMKvnw0Z
         YCxnS2KxO4crQJsEz4E0IzO1xCMvxSnGajqw6MauczaDwZ55uWYBILR4M9wdIFwkt410
         U42gupjSDuysYDyYU326nDWgeuM8i0W/yEVv3Zq7MO99Dc5/lNwGsto//vFJH1pdLiAP
         JfwY8IOhwEVIFH7EHiedIeOxINfZfuJhYkPpbOtml1nsUFj6vGTLQ2YlsSoaFsidbJpU
         /Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJZuOyPoke9O1aNcUMwMh4SJuqZZoxbP5+ZVqt4w+RI=;
        b=jap6W13Bitd/GMgV9fNpHcwCjw1Q/GIMOj2PPDPFlgcL3Lxl8/GGe/kiDWko4ppAm5
         4IH56xTbz0kojXTsT8j+Q+agjSm7+G5ncKTcyEFvxrm3AcVJRmUlZq5fjJBd/THNOInD
         tnGdlNU4um4LwWmqFdXBjWLMglCdE0k/9HOLsWUebStalXCmN3i0hDrXcDBrP2Ri/ECN
         S+sdLsCzZi9GFRKv65ZlXALulspvuD9AgMvdScOgc0rF1j+1q0J1cjuKDGnLjNaLaX8d
         6U02Pot+Nlh/Rp8Q86ex0KUZgQlgKlZMZTVfh2poClZGj0v8V473XfW8ZqsfP8Tf7Tb7
         4k4w==
X-Gm-Message-State: AOAM533hRFWdZvqDbRw8FHHYbqEwVqha1R1MaDcKcE9HX6hTnldNts7j
        QSeJJEUW0dfxswrKi39fh0chkQ==
X-Google-Smtp-Source: ABdhPJx2UKyCEzuGYIeNsgJs70XmBN475KmSy2OCYzwa33HUGNcgxGsp2/MFTZQ8zEmxhuBBWXKEPA==
X-Received: by 2002:a1c:b3c3:: with SMTP id c186mr4525364wmf.169.1610637819435;
        Thu, 14 Jan 2021 07:23:39 -0800 (PST)
Received: from dell.default ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:23:38 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 4/5] input: touchscreen: surface3_spi: Remove set but unused variable 'timestamp'
Date:   Thu, 14 Jan 2021 15:23:22 +0000
Message-Id: <20210114152323.2382283-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114152323.2382283-1-lee.jones@linaro.org>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
 drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/surface3_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 731454599fcee..1da23e5585a0d 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -94,9 +94,7 @@ static void surface3_spi_report_touch(struct surface3_ts_data *ts_data,
 
 static void surface3_spi_process_touch(struct surface3_ts_data *ts_data, u8 *data)
 {
-	u16 timestamp;
 	unsigned int i;
-	timestamp = get_unaligned_le16(&data[15]);
 
 	for (i = 0; i < 13; i++) {
 		struct surface3_ts_data_finger *finger;
-- 
2.25.1

