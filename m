Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B192E2A4E3
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2019 16:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfEYOaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 May 2019 10:30:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17159 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726951AbfEYOaj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 May 2019 10:30:39 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id D7A5F801C288D102A183;
        Sat, 25 May 2019 22:30:35 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 22:30:25 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] Input: tca8418 - Remove set but not used variable ''
Date:   Sat, 25 May 2019 22:29:21 +0800
Message-ID: <20190525142921.18812-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/input/keyboard/tca8418_keypad.c: In function tca8418_keypad_probe:
drivers/input/keyboard/tca8418_keypad.c:269:24: warning: variable max_keys set but not used [-Wunused-but-set-variable]

It's not used since commit 16ff7cb1848a ("Input:
tca8418-keypad - switch to using managed resources")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 6da607d3b811..3bbd7e652533 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -266,7 +266,7 @@ static int tca8418_keypad_probe(struct i2c_client *client,
 	struct tca8418_keypad *keypad_data;
 	struct input_dev *input;
 	u32 rows = 0, cols = 0;
-	int error, row_shift, max_keys;
+	int error, row_shift;
 	u8 reg;
 
 	/* Check i2c driver capabilities */
@@ -291,7 +291,6 @@ static int tca8418_keypad_probe(struct i2c_client *client,
 	}
 
 	row_shift = get_count_order(cols);
-	max_keys = rows << row_shift;
 
 	/* Allocate memory for keypad_data and input device */
 	keypad_data = devm_kzalloc(dev, sizeof(*keypad_data), GFP_KERNEL);
-- 
2.17.1


