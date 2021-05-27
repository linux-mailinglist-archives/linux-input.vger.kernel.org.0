Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EC83934D9
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 19:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235068AbhE0Rda (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 13:33:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:51330 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234594AbhE0Rd3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 13:33:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622136715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Vcp0ishBAVDXErBr76dnKHnF04NivYv1vP+Y4e0QWgU=;
        b=vkDySjB8Zt07EvJMg+2lKAUYK9E7EP82QLUORhga5AEeuJbxSQGeXeXRRycT/3559+UqAf
        NcO0vvMcwgBCgFkOQ8wVVFaGQxzEHuWuJP87wOvML9WQpHaFzcqhCc0/PQ1dKeUziaLRh6
        XzeHXi4YHfUEv5qkdqLLhXGCNxRnj6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622136715;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Vcp0ishBAVDXErBr76dnKHnF04NivYv1vP+Y4e0QWgU=;
        b=zNbZ7sv8GQFlGwBk1ddnxsd2yDElvn2I2Z97CjljmXPSgiVg3xUG651ie0vZ17aeoRPVLe
        pA/b7hLNn3iUjQCA==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3B262ACC5;
        Thu, 27 May 2021 17:31:55 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: elants_i2c - Fix NULL dereference at probing
Date:   Thu, 27 May 2021 19:31:53 +0200
Message-Id: <20210527173153.16470-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The recent change in elants_i2c driver to support more chips
introduced a regression leading to Oops at probing.  The driver reads
id->driver_data, but the id may be NULL depending on the device type
the driver gets bound.

Replace the driver data extraction with the device_get_match_data()
helper, and define the driver data in OF table, too.

Fixes: 9517b95bdc46 ("Input: elants_i2c - add support for eKTF3624")
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1186454
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Use device_get_match_data()

 drivers/input/touchscreen/elants_i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 17540bdb1eaf..29b5bb03cff9 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1396,7 +1396,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	init_completion(&ts->cmd_done);
 
 	ts->client = client;
-	ts->chip_id = (enum elants_chip_id)id->driver_data;
+	ts->chip_id = (enum elants_chip_id)device_get_match_data(&client->dev);
 	i2c_set_clientdata(client, ts);
 
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
@@ -1636,8 +1636,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id elants_of_match[] = {
-	{ .compatible = "elan,ekth3500" },
-	{ .compatible = "elan,ektf3624" },
+	{ .compatible = "elan,ekth3500", .data = EKTH3500 },
+	{ .compatible = "elan,ektf3624", .data = EKTF3624 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, elants_of_match);
-- 
2.26.2

