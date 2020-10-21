Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F38294EB6
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 16:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410083AbgJUOdU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 10:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410075AbgJUOdU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 10:33:20 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F51C0613CE;
        Wed, 21 Oct 2020 07:33:20 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so1599134pgg.1;
        Wed, 21 Oct 2020 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmZGMIPGGmtLtowrdMYO23WbB3s1asSBgU+m0EE+qT8=;
        b=ATLgApS7Y80FNwvZ59Dzx4Y98S/P7jDo7kQJJJgQP3SLNhb61qwUzAke6Z4Us9MI+w
         amFiRq8p/6tr3CPdWn/v5kf5ev+H2TBTcFiBg5/oLWrG4YzsSgicwBIhw3DYfaTJdRa9
         EsA7RQbQ1NMsWLqWoydbuIuMu3sUV3Lz/rMbT7ulWLk0kGH4cNx15yinvtuXWwBHwvMj
         rJoOiPdrOxs/mAZIs90I5BZZJlw4WyoumAjK5AAVoWOdUOjrL87jQG4McHNX+ei+saDn
         RAIeG/e8G5EOKIifz8d0NF5cjN7sD5MXYIxmwnaUaDZeBGiBbEVw2hNeO4O9Pt70OVNU
         2+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmZGMIPGGmtLtowrdMYO23WbB3s1asSBgU+m0EE+qT8=;
        b=Q8VhHMh90VyWHuRovZg1L6u1f460W8F98tIgVTKqgKJY69YtrC+Nxs8Ce2sOM3Ducg
         Lk4uQ5jBh14xDrQTX4F1XUWBNx66ECWN2AZuSBCzIT0bU53FdaPMOop8g/m8479A8Y18
         ig75NUDuAZYFMtbEbTUisqXum2tdpYpStH29R02jfUsXMRZ7rx0runKj5sx9HiXV7vgF
         itaAS9Vg+rorXw1EbAxvXqVEZIsRZC/OsuI5I5uchUCTnxB5rEUKRvUeXvIpwfPgQFxy
         fcQRvRyYGzrj0zW9Q8tx8nZUz5Xp0xl8/K/yCcQuNBIdgvN6nvyWynJBaef4k7QtEc1p
         K0sg==
X-Gm-Message-State: AOAM532mi9HUu3iLFrP2ISeRK2Te09b0ZP3B7SXUje1u/U9ZF72IXKD6
        qZsh2BG1WzCQNSOCG0losFeJvE1sJ/Iy4A==
X-Google-Smtp-Source: ABdhPJxgXiLfVVGS1CVUIv3UPK1Ykt7ymME4AIy868lfIv7CRi+oitwagPm+kMMymcxj7wHx2GyD0g==
X-Received: by 2002:a63:3004:: with SMTP id w4mr3606200pgw.249.1603290799359;
        Wed, 21 Oct 2020 07:33:19 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id hi22sm2384987pjb.21.2020.10.21.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 07:33:18 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: i2c-hid: show the error of failing to fetch the HID Descriptor
Date:   Wed, 21 Oct 2020 22:33:05 +0800
Message-Id: <20201021143305.475182-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i2c_hid_probe should notify the user of the error of failing to fetch
the HID Descriptor instead of silently exiting.

Link: https://forum.manjaro.org/t/elan-touchpad-working-in-live-but-not-in-native-os/31860/55
Cc: Barnabás Pőcze <pobrn@protonmail.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 786e3e9af1c9..577d324be16d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1099,8 +1099,11 @@ static int i2c_hid_probe(struct i2c_client *client,
 	}
 
 	ret = i2c_hid_fetch_hid_descriptor(ihid);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to fetch the HID Descriptor\n");
 		goto err_regulator;
+	}
 
 	ret = i2c_hid_init_irq(client);
 	if (ret < 0)
-- 
2.28.0

