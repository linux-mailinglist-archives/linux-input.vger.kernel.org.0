Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A031C93F2
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgEGPKu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726267AbgEGPKu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:10:50 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B45C05BD43;
        Thu,  7 May 2020 08:10:50 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u10so2165654pls.8;
        Thu, 07 May 2020 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHPaRymVXT/RRtPGGSsDfbM2nTSXjaJgAumG3IDMRCs=;
        b=i819Zid9bujthzQEqT/LQEVlN+VrPGpv/O1lFRDQcmSPJnVk+PNQJdkl6kC9YUWsFB
         8IiLVRhxyVgP4kU9cg1pLitPVlvZ0VasazDMJ1npUrm+iarSgDznmIS/cj/sxGtjRKB0
         jRYmOxajzM1LlfQGhrqrJ8814VmcyWwydN/24yfxSzA3LA1GWllZ5O/D8JM4i0gZqm5c
         AaqSV7L72JzJBGNYpYglQMUDg5iHxnFXeF5Rv/oxP7gPopo1NUtpBKBtG54/P1CcFOTz
         nD7E1xtk7yb0xjIdSQlL4bE8EnE9xMjCqk97xX57SCde7O2tAT3duMRG5pg3d24GiSA7
         ie/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHPaRymVXT/RRtPGGSsDfbM2nTSXjaJgAumG3IDMRCs=;
        b=aLvqklacnBAXxuAtLG8hUUQmV1Ax//8w+IRFsibl/Ub0MwYiFY2SlemwXIjo+xsc3o
         QMlc6O6sdYx0yL2tNasM21zZd6Ft4A0ik2IBCJJSTBz3loY1d3zkmowYdYU6ZmpO2giV
         REiuczJHV3d5Kkl4FSALp5gzTIylnOIVHMidwXmnHrhtaNPkKonk8sS1fevo/vqaZwDK
         0oo4XTJQhVIAE+hcz2KdyerXLryVsmor48uq0S38bJso82RMTuHmOoC31tjfebmxHwzL
         VwvEqfZ04IzkmvvAQFWiHj3B71TRadwDy2BWS/rM99d9q7+veA7cRwfpzEy6FIlb5CUE
         2GrQ==
X-Gm-Message-State: AGi0PuY2TO7ILdBY++KuLWiIf7UxSMyNmkKHzanezBHzbdKT257AsrLp
        9LU+VJN65UXRArOkIVd++aZzMDQHFUQ=
X-Google-Smtp-Source: APiQypJKVymrKVR3UytW9PIKPTnQgkWe0I+V8k0XQZrX4F1WO/7TS8P594vlGgDu2lWvpgozekUlmw==
X-Received: by 2002:a17:90a:2344:: with SMTP id f62mr538353pje.152.1588864249839;
        Thu, 07 May 2020 08:10:49 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id d124sm5067944pfa.98.2020.05.07.08.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:10:49 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: applespi - add missed input_unregister_device
Date:   Thu,  7 May 2020 23:10:41 +0800
Message-Id: <20200507151041.792460-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver calls input_register_device() in probe, but misses
input_unregister_device() in probe failure and remove.
Add the missed function calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/keyboard/applespi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index d38398526965..8ee9fdb562a5 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1745,7 +1745,7 @@ static int applespi_probe(struct spi_device *spi)
 		dev_err(&applespi->spi->dev,
 			"Failed to obtain GPE for SPI slave device: %s\n",
 			acpi_format_exception(acpi_sts));
-		return -ENODEV;
+		goto err_unregister;
 	}
 	applespi->gpe = (int)gpe;
 
@@ -1756,7 +1756,7 @@ static int applespi_probe(struct spi_device *spi)
 		dev_err(&applespi->spi->dev,
 			"Failed to install GPE handler for GPE %d: %s\n",
 			applespi->gpe, acpi_format_exception(acpi_sts));
-		return -ENODEV;
+		goto err_unregister;
 	}
 
 	applespi->suspended = false;
@@ -1767,7 +1767,7 @@ static int applespi_probe(struct spi_device *spi)
 			"Failed to enable GPE handler for GPE %d: %s\n",
 			applespi->gpe, acpi_format_exception(acpi_sts));
 		acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
-		return -ENODEV;
+		goto err_unregister;
 	}
 
 	/* trigger touchpad setup */
@@ -1805,6 +1805,10 @@ static int applespi_probe(struct spi_device *spi)
 			    &applespi_tp_dim_fops);
 
 	return 0;
+
+err_unregister:
+	input_unregister_device(applespi->keyboard_input_dev);
+	return -ENODEV;
 }
 
 static void applespi_drain_writes(struct applespi_data *applespi)
@@ -1847,6 +1851,7 @@ static int applespi_remove(struct spi_device *spi)
 	applespi_drain_reads(applespi);
 
 	debugfs_remove_recursive(applespi->debugfs_root);
+	input_unregister_device(applespi->keyboard_input_dev);
 
 	return 0;
 }
-- 
2.26.2

