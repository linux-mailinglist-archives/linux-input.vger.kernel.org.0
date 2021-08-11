Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7493E8902
	for <lists+linux-input@lfdr.de>; Wed, 11 Aug 2021 05:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhHKDuw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 23:50:52 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42448
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233217AbhHKDuw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 23:50:52 -0400
Received: from localhost.localdomain (unknown [222.129.32.23])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B74C3F092;
        Wed, 11 Aug 2021 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628653822;
        bh=PYo4QCNCe15ujHarEaQLzr8YVZRviZIHfwrmiuZ0iLw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=vJcZ9aTGMBd1sb8HdwfBSR+RupCRZyd7vFRxzG+nTLLI1FTDJfLz5DDDXj04gJX2r
         DAulGVpDO7nzQYqjUm8jmivSz3SmdBKGj8eDoGMVJ6D1AakZXTBFksreS97lCKMREf
         SAduN556G5WEqZsqcNCTPsHxCh7Q2gs/j+vQ52NzkWQ6yYkF0zDGG9Tbj4Of6/5mq2
         mGE5mgJqS2j0764zbn1vNGL+CcQn9savIMeKVdKjFmNgsnNyHFJ3bZiWQhzSYQ8q1e
         a44beMX26sxrUXeycDautU43zwD+Mp1BtDna+Cu0HeS/VCtQaytdHyTTRVa4MC9cTr
         LJvcsqo82eoJg==
From:   Aaron Ma <aaron.ma@canonical.com>
To:     aaron.ma@canonical.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: psmouse - disable non-wakeup armed PS/2 mouse when s2dile
Date:   Wed, 11 Aug 2021 11:50:25 +0800
Message-Id: <20210811035025.44773-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit 684bec1092b6 ("Input: i8042 - enable keyboard wakeups by
default when s2idle is used"), kdb is enabled to wakeup laptops.
Kbd fails to wakeup when touchpad/trackpoint is used on ThinkPad.
The touchpad is not set to wakeup, and it shares buffer with kbd.
Send disable command to PS/2 mouse when s2idle, make it clean for
kdb to wakeup.
Enable PS/2 mouse when wakeup enabled.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/input/mouse/psmouse-base.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 0b4a3039f312..85dc9810d6ec 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -21,6 +21,7 @@
 #include <linux/libps2.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/suspend.h>
 
 #include "psmouse.h"
 #include "synaptics.h"
@@ -1457,11 +1458,13 @@ static void psmouse_cleanup(struct serio *serio)
 	 */
 	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
 
-	/*
-	 * Some boxes, such as HP nx7400, get terribly confused if mouse
-	 * is not fully enabled before suspending/shutting down.
-	 */
-	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE);
+	if (!pm_suspend_default_s2idle() || device_may_wakeup(&serio->dev)) {
+		/*
+		 * Some boxes, such as HP nx7400, get terribly confused if mouse
+		 * is not fully enabled before suspending/shutting down.
+		 */
+		ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE);
+	}
 
 	if (parent) {
 		if (parent->pt_deactivate)
-- 
2.30.2

