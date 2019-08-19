Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8114C920F8
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 12:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHSKIt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 06:08:49 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41464 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfHSKIs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 06:08:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so934520pgg.8;
        Mon, 19 Aug 2019 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HKDlSBtnIzq0BMc6jx39dPrg96vkcPlLJ5a4bMvCZd0=;
        b=MivVwUL+4V9mpXHuQnTdia49XkKo6FdhYdE/kPcLqnE79norFs4cZFtdA6mGs6G40y
         TvepMGGs6b5Dap7Wz9IgYYwmQUoKnQFNnKydDwWgFBIoAtJOccZPiQotCeyMHu3Fbyy/
         UA2IELQurymj/DyRiKfuFSEdBlXV/Tv+k6Qf5PzMYOSPrvXFLOVNK0qfPgtIUo6ABqQX
         i8jM+W7aDUtGbCqva6EcVrpLsikRsRKqg59KlXF8TKyPv7YkyocQEGiPulZXK65hii2a
         LgTYndKaKFe/mlUSJbwJcgpfYbun6ixsRK7lgDRH/VTONQZhOU4PKziofyLex3WTHPDo
         1UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HKDlSBtnIzq0BMc6jx39dPrg96vkcPlLJ5a4bMvCZd0=;
        b=jTjitb/2IfxmVcWoPU8FML2wcp3kz+xd783VHOSyqZYLqcRI6T0MN7xVNtBfkDeb4N
         utAMFfAAuyD7hkPOvq3bTqxfmnMO4bYWo/iw+5FZt9q74wv9HdYlCwqBUwJSQA5BKi1F
         Pr3MHz/LH8nXYuanPdOMbzLAOOzpCMVznGvYtK+ZtY1Nqr0Mc4MpSMWv7eLhvyoeCdRz
         odV8fgSDsdqeSKtwLmBGPA2NYs7nxwEUhMT4fObwcPoZu6om2eSzHTIrFQtS2ATC6BCw
         w+p1XO8JaNEefd07UxmAqrpdRJM5cb0HpyS0OFQ9ELlGydjaRNKbkKoe/MnqKcDUldBL
         HVmw==
X-Gm-Message-State: APjAAAW8Tqa0XtKF/0y0gEouD6Q38qIGVK9aVWT8JcW723tsBHzb9+UY
        pqlc3u8VjTiivL0zm9fMsqiDdavXjCU=
X-Google-Smtp-Source: APXvYqwoOtCshDcjjji7IxRwgprn8LjSU7nVxVPnn4odx6G61r3Z5MfEpEHeXrOUmClsxEHmU6RaUg==
X-Received: by 2002:a62:be04:: with SMTP id l4mr22462049pff.77.1566209328166;
        Mon, 19 Aug 2019 03:08:48 -0700 (PDT)
Received: from AHMCPU2457.einfochips.com ([219.65.62.52])
        by smtp.gmail.com with ESMTPSA id b123sm27257181pfg.64.2019.08.19.03.08.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 03:08:47 -0700 (PDT)
From:   Dixit Parmar <dixitparmar19@gmail.com>
X-Google-Original-From: Dixit Parmar
To:     dmitry.torokhov@gmail.com, rydberg@bitmath.org, martink@posteo.de,
        kuninori.morimoto.gx@renesas.com, robh@kernel.org,
        matthias.fend@wolfvision.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH] driver:st1633: fixed multitouch incorrect coordinates
Date:   Mon, 19 Aug 2019 15:38:34 +0530
Message-Id: <1566209314-21767-1-git-send-email-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dixit Parmar <dixitparmar19@gmail.com>

For Sitronix st1633 multi-touch controller driver the co-ordinates reported
for multiple fingers were wrong.

So the below mentioned bug was filed,
Bugzilla Bug ID: 204561

While reading co-ordinates from specified I2C registers, the X & Y
co-ordinates should be read from proper I2C address for particular finger as
specified in chip specific datasheet.

for single touch this logic is working fine. However, for multi-touch
scenario the logic of reading data from data buffer has issues.

This patch fixes the reading logic from data buffer.

Previous logic:
* Offset of X & Y Lower byte coordinate is increased by i no. only(by 1 Byte)
  for each finger.

New logic:
* The logic of reading X & Y Lower Byte coordinate needs to be increased
  by i+y for each time/finger.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/input/touchscreen/st1232.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 3492339..1139714 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -81,8 +81,10 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 	for (i = 0, y = 0; i < ts->chip_info->max_fingers; i++, y += 3) {
 		finger[i].is_valid = buf[i + y] >> 7;
 		if (finger[i].is_valid) {
-			finger[i].x = ((buf[i + y] & 0x0070) << 4) | buf[i + 1];
-			finger[i].y = ((buf[i + y] & 0x0007) << 8) | buf[i + 2];
+			finger[i].x = ((buf[i + y] & 0x0070) << 4) |
+					buf[i + y + 1];
+			finger[i].y = ((buf[i + y] & 0x0007) << 8) |
+					buf[i + y + 2];
 
 			/* st1232 includes a z-axis / touch strength */
 			if (ts->chip_info->have_z)
-- 
2.7.4

