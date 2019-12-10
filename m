Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D14A118336
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 10:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfLJJOO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 04:14:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33836 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbfLJJON (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 04:14:13 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so8759332pff.1;
        Tue, 10 Dec 2019 01:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqFt7LYiGaMiHS6zNR6E1TcA8nx+ziLBCWAwkxGQf5E=;
        b=D1fkLSvsib5JK6nRPfIpjQYBwsMTT1T76hJU4YOna4SY4x9zCq0RTmUxg2bg4M/K+8
         1GGJ7u/H2TYoiV9FoN4lY6YAyuQLKgGKtw8whm2WkUTdxqQkMkfU6X0yZRoI2QQV0ERA
         0mFABveSFjq/rAs7GYi3sn1BwyQwO6e9/2sLJY4NnC8FwbQK5kPXQzlAJm2Lfda+47HX
         u/IMIZB7zBQmG2WdvxmMq1wvTk3VR417xW+DnJ482jRwoxJiOYfb2s5Xfny9NlKylgkZ
         teMHO830USWOEOQnhf5KqOs8kgW9XAqWaRyjfBgzLvpcqRn4GwIYR7pYr911GmjpYZeO
         Yu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqFt7LYiGaMiHS6zNR6E1TcA8nx+ziLBCWAwkxGQf5E=;
        b=eUch42OLRoBIJwG2WSmFrcRugiVVbHnwpdxa+Kb5sGSsau92oqWOmCRKvUqqYjkfBc
         nYq6aiWvflrKLMst/1Y8rPvd0WuOUtpfZLboeUwdwq3DsZhRZ8LTIPy0qmPDu4yCdZMi
         EgmTBG9WcAv7ZNY5TUNm4NAoPADOIKMHmBc7HTw6viqMXH2vONKXs/w1sWlnrtHKw+3y
         2q6iEmWN78yl50mUGAYfoRwYLXM6f3An5NpXBG7JjzEMnrHi3hUDNgGjpiXkKWfv4219
         IxQ17uXJtD3EswmAiRRtgbHz896fsQwb0+WjUweqg5WjW9N9vSgGkNUXe+uMgB9ZOccb
         pRNg==
X-Gm-Message-State: APjAAAWaYdpc7y0NiiZ/Y2/X/unq9P0GMKkGPjAyukh34Lp6iBM1tEqk
        SV+Jav+kEFGwhfsemjlKcy0=
X-Google-Smtp-Source: APXvYqzeP0ChOYN8FIPxN51uS0GDDAILHcIPOn/3Ojn9+m0DHD9ESMJvRLODYRoCCiyUU76hakHd0A==
X-Received: by 2002:a63:4416:: with SMTP id r22mr23393138pga.254.1575969252757;
        Tue, 10 Dec 2019 01:14:12 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id r193sm2561351pfr.100.2019.12.10.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 01:14:12 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: sun4i-ts - add a check for devm_thermal_zone_of_sensor_register
Date:   Tue, 10 Dec 2019 17:14:01 +0800
Message-Id: <20191210091401.23388-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver misses a check for devm_thermal_zone_of_sensor_register().
Add a check to fix it.

Fixes: e28d0c9cd381 ("input: convert sun4i-ts to use devm_thermal_zone_of_sensor_register")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/sun4i-ts.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 0af0fe8c40d7..742a7e96c1b5 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -237,6 +237,7 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device *hwmon;
+	struct thermal_zone_device *thermal;
 	int error;
 	u32 reg;
 	bool ts_attached;
@@ -355,7 +356,10 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
-	devm_thermal_zone_of_sensor_register(ts->dev, 0, ts, &sun4i_ts_tz_ops);
+	thermal = devm_thermal_zone_of_sensor_register(ts->dev, 0, ts,
+						       &sun4i_ts_tz_ops);
+	if (IS_ERR(thermal))
+		return PTR_ERR(thermal);
 
 	writel(TEMP_IRQ_EN(1), ts->base + TP_INT_FIFOC);
 
-- 
2.24.0

