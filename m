Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A87C33E057
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 22:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhCPVS6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 17:18:58 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:55342 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhCPVS3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 17:18:29 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 652CEB33909; Tue, 16 Mar 2021 22:18:25 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH] input: misc: max8997: Simplify open coding of a division using up to 64 divisions
Date:   Tue, 16 Mar 2021 22:18:22 +0100
Message-Id: <20210316211822.49830-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.30.1
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
 drivers/input/misc/max8997_haptic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index c86966ea0f16..6baca94ed424 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -68,12 +68,8 @@ static int max8997_haptic_set_duty_cycle(struct max8997_haptic *chip)
 		int i;
 		u8 duty_index = 0;
 
-		for (i = 0; i <= 64; i++) {
-			if (chip->level <= i * 100 / 64) {
-				duty_index = i;
-				break;
-			}
-		}
+		duty_index = DIV_ROUNDUP(chip->level * 64, 100);
+
 		switch (chip->internal_mode_pattern) {
 		case 0:
 			max8997_write_reg(chip->client,
-- 
2.30.1

