Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A4C5E022
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2019 10:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGCIqs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jul 2019 04:46:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51333 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfGCIqs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jul 2019 04:46:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so1309940wma.1
        for <linux-input@vger.kernel.org>; Wed, 03 Jul 2019 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7D6evORasNEkFJ1pXrTToF+6Lejs/mV9BhxHTP2Fbw=;
        b=g2mtvbigRsAq7sCMmenw9M5UEia6/CE6L6tz8DNAVYtHgqrgVUn5GLI3LzEJQPwonZ
         i+7wil7K5eMd2XK0M3C24lRx0vDRsJ41n0aH8gVR0tkrn5loFS0Uem4wvNPsmnxm/Q0G
         c0KFSkMHwdPBLzWt9l+6lfGGV4oLXcUg9JEImOiWaIRyL9vAKNVhFgeOA0faJBLtWVel
         Maoq2vND/8WiUFUWe7acEkbVJoOEQbjZ0N2YS7oPs5M55fkNwPywqAA8d2WdS4gUi9RZ
         LbiUCqcEDEg037t9YtNsrsVwFUUnyuUdWt6rqrYBvp0u2xZN1oyt+QZwR/YB3I7iS9wu
         B9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7D6evORasNEkFJ1pXrTToF+6Lejs/mV9BhxHTP2Fbw=;
        b=EaIhw1uVRe7jgt3UoQ12V3CWsI4zaS8gl4HbGIcwBo/NKizrR4KlrhmXJck/PwNuPP
         8yg8hx5LjJwLTIGgR2n7GiJH8RMUrrrI8JKbuBcmZ6XcMRMQxxeykmksEA+cJ/ujJ856
         iF4oCI8xeKmquN7InSSGbzzdyrmoRkOd49VCdpguCxB8WSMnBh1VBGXYbGIyx/DuVDBh
         f8bXpakUwWv/vRiQY/OL8wTx0dXxLiUngwLWrhlafaIWC4oadweRdLAPgbpS3+UzB4SY
         1AOzeFIlzSg01MX4IFugu8H8WXN9gtkUY2nAwKF51umoW3lwFnXvFBcdX6ECVEMM1Pdj
         eksg==
X-Gm-Message-State: APjAAAW/O/FDNx6qbRAJIvcAsBFGxZJmkPz/579DXnWSywe0cYaewgtO
        uWfpKpJ/UQnUYfwcipKeafU=
X-Google-Smtp-Source: APXvYqxe6ZtnoAxGu/QI3dpFmRt45f6zUB6crhagXDRCo3T6w6g5wcVCIs4uPtAlyz/3vskf9KObwg==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr7266120wme.145.1562143606285;
        Wed, 03 Jul 2019 01:46:46 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id z17sm1120893wrr.13.2019.07.03.01.46.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:46:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] input: max77650-onkey: add MODULE_ALIAS()
Date:   Wed,  3 Jul 2019 10:46:42 +0200
Message-Id: <20190703084642.9425-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Define a MODULE_ALIAS() in the input sub-driver for max77650 so that
the appropriate module gets loaded together with the core mfd driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/input/misc/max77650-onkey.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/max77650-onkey.c b/drivers/input/misc/max77650-onkey.c
index fbf6caab7217..4d875f2ac13d 100644
--- a/drivers/input/misc/max77650-onkey.c
+++ b/drivers/input/misc/max77650-onkey.c
@@ -119,3 +119,4 @@ module_platform_driver(max77650_onkey_driver);
 MODULE_DESCRIPTION("MAXIM 77650/77651 ONKEY driver");
 MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:max77650-onkey");
-- 
2.21.0

