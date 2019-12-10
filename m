Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08740118464
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 11:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfLJKIG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 05:08:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45157 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfLJKIG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 05:08:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id j42so19263924wrj.12
        for <linux-input@vger.kernel.org>; Tue, 10 Dec 2019 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f0Q3rlyg/cD4ZOuBBjfL4TrA9kTX5CvG82OdXXHMeyo=;
        b=bPAQRmcUhvcJNrCY8U7uC5UcrXODzhonZEpp5pvH3eBhWeItFe9oJZ+7mU+grlWMUB
         LyGr7XOybE5aYoGNDEzvfr16Lb5+PNyqbaexFf5v3U0AKjVqFh79aRh6Cdoi+mZDT4QY
         7Pxc7HuvIxH2JF581adlgDJA/Zq9+vfWPSJxxWOUaYSPAbNLqn6ATy+31BnEWDXSt11a
         ARILRU7f90mkzQNytOD5nOmmmT9DqDGLuYwifxNxo7TfKkr6LdKkayAQpSzPXqM0gFaN
         Iy4OuxVSYpkx0CqrwwmL/n/hMvtzPK45NiaGAzVJwlTovdlyLEy8Qukf3T5s9sf4GDC5
         TEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f0Q3rlyg/cD4ZOuBBjfL4TrA9kTX5CvG82OdXXHMeyo=;
        b=bupS6SR0ue4J8x3g4HRa9XhsWY06K/METo8h1DQ4JzqrnCwNq/Pte+CkZREKu1iWNk
         6tomUHGbAKA+E5l1Guht8WTvuCoM+yxVZXtZrn9DBCwKhdEBXPSJrfjOnmVI1DPqLGro
         w+a4Vsjb1pnp17Q8ks4ngX34foevJhqoOadVU6MQTbSwtrk+8pl1hub8P7ppDePAxaPD
         acEKfhm0NK4jSTvzrBarICDv5mhhYmnSUNiS5wdO4Ptwr+vXr4W8pbttmSfPJnBmqV/H
         ijaeCjamUsglGvruYTu3mHqaHTAOVuyKDMI7dYSNOn0C0Mm9HVjK/zvqjpgI3eLBSJ/7
         QBFA==
X-Gm-Message-State: APjAAAU0Z6iELGsBRAFcgWNK5D7t+FBoKt5GHphUurRosbFxQielEVCm
        V7KRVc8XKjMoJrzQkgikrp1+Sg==
X-Google-Smtp-Source: APXvYqxuVThypfwC7Fvv6ys4Y0xFGCC49P5yn1lExjo9Q6sxcbnAKDrS3fV7I0Yhnd4ByPDj/bTPJw==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr2371552wru.6.1575972484233;
        Tue, 10 Dec 2019 02:08:04 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id t8sm2658949wrp.69.2019.12.10.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 02:08:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] input: max77650-onkey: add of_match table
Date:   Tue, 10 Dec 2019 11:07:53 +0100
Message-Id: <20191210100753.11090-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We need the of_match table if we want to use the compatible string in
the pmic's child node and get the onkey driver loaded automatically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/input/misc/max77650-onkey.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/misc/max77650-onkey.c b/drivers/input/misc/max77650-onkey.c
index 4d875f2ac13d..ee55f22dbca5 100644
--- a/drivers/input/misc/max77650-onkey.c
+++ b/drivers/input/misc/max77650-onkey.c
@@ -108,9 +108,16 @@ static int max77650_onkey_probe(struct platform_device *pdev)
 	return input_register_device(onkey->input);
 }
 
+static const struct of_device_id max77650_onkey_of_match[] = {
+	{ .compatible = "maxim,max77650-onkey" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77650_onkey_of_match);
+
 static struct platform_driver max77650_onkey_driver = {
 	.driver = {
 		.name = "max77650-onkey",
+		.of_match_table = max77650_onkey_of_match,
 	},
 	.probe = max77650_onkey_probe,
 };
-- 
2.23.0

