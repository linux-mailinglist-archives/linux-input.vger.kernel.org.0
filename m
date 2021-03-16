Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB2B33E06E
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 22:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCPVWm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 17:22:42 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:55728 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhCPVWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 17:22:36 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id CE4FBB3395A; Tue, 16 Mar 2021 22:22:35 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH v2] input: misc: max8997: Simplify open coding of a division using up to 64 divisions
Date:   Tue, 16 Mar 2021 22:22:33 +0100
Message-Id: <20210316212233.50765-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316211822.49830-1-uwe@kleine-koenig.org>
References: <20210316211822.49830-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The for loop is just a complicate way to express a division. Replace it
by the actual division which is both simpler to understand for a human
and more efficient for a CPU to calculate.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Changes since (implicit) v1:

 - drop now unused variable i
 - s/DIV_ROUNDUP/DIV_ROUND_UP/ to make the compiler happy.

Nota bene: Better do the compile test before calling git send-email :-)

Best regards
Uwe

 drivers/input/misc/max8997_haptic.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index c86966ea0f16..ad82837c7ad5 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -65,15 +65,10 @@ static int max8997_haptic_set_duty_cycle(struct max8997_haptic *chip)
 		pwm_set_relative_duty_cycle(&state, chip->level, 100);
 		ret = pwm_apply_state(chip->pwm, &state);
 	} else {
-		int i;
 		u8 duty_index = 0;
 
-		for (i = 0; i <= 64; i++) {
-			if (chip->level <= i * 100 / 64) {
-				duty_index = i;
-				break;
-			}
-		}
+		duty_index = DIV_ROUND_UP(chip->level * 64, 100);
+
 		switch (chip->internal_mode_pattern) {
 		case 0:
 			max8997_write_reg(chip->client,
-- 
2.30.1

