Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFFB393D81
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 09:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhE1HMB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 03:12:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:44724 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234927AbhE1HMB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 03:12:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622185826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BwgXQ9oy+Jp0j3qXdKyBDPbJOS4YWNwV57qE6gV32HM=;
        b=meEbrH/VCJvx/3YxQuUsrCcMxFqbox2ZUmxPvz5MG4sz6ewPNGYsnjUdgVxhcDNyXbj6W3
        D2WnwR6fu187Q4dypeD9IJVJJbTqHLH3h7qKe5+/1GPIXhmyj83YmrXl1gTCJddxMvtwNf
        VSnHr2TvffnwMfH2THSi7xCnuG54O+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622185826;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BwgXQ9oy+Jp0j3qXdKyBDPbJOS4YWNwV57qE6gV32HM=;
        b=tRvr7VV6MsFwhC2BjgGbBiA3s8ziOcN0AjqKALMgEDjQx/iSEaGPX6KmNq5ZzAip5plSC6
        tW9yC2VOOfTj+uAw==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 09938B175;
        Fri, 28 May 2021 07:10:26 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] Input: elants_i2c - Switch to probe_new
Date:   Fri, 28 May 2021 09:10:24 +0200
Message-Id: <20210528071024.26450-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210528071024.26450-1-tiwai@suse.de>
References: <20210528071024.26450-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that we get rid of the usage of id argument at probe again, let's
switch to the new i2c probe method; this will avoid for people
misusing the possibly unassigned id pointer again.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/input/touchscreen/elants_i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 0f9e3ec99aae..68f542bb809f 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1369,8 +1369,7 @@ static bool elants_acpi_is_hid_device(struct device *dev)
 }
 #endif
 
-static int elants_i2c_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int elants_i2c_probe(struct i2c_client *client)
 {
 	union i2c_smbus_data dummy;
 	struct elants_data *ts;
@@ -1644,7 +1643,7 @@ MODULE_DEVICE_TABLE(of, elants_of_match);
 #endif
 
 static struct i2c_driver elants_i2c_driver = {
-	.probe = elants_i2c_probe,
+	.probe_new = elants_i2c_probe,
 	.id_table = elants_i2c_id,
 	.driver = {
 		.name = DEVICE_NAME,
-- 
2.26.2

