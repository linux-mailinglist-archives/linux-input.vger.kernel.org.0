Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CE719944A
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbgCaKx4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:56 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbgCaKxy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:54 -0400
IronPort-SDR: FI83d+LP6hQCVO7qeDjAtyqLRylOo0iZxrYFONzU18h1LGhmaQplFE3XNm37X1mpkJqvt5nli9
 gS+CRKsiLu/0FMxDsednGFADXt8IrSjvha+8+sQ3a/olLvttgsqMdGOjC05TclxGuuNoqdFY61
 IRzWk+PsvtQrZ1+z2Ft9qYeddI59LvtqIjevviIONGU4QY9vkJdi53yGvPnNzYJaaWWX9oRrhx
 y67agsZnn1PUqhIBzME8hQ6/Xf5+UhhGFTxu5e1blkc4KiJvsg1WmZMlE1vG4wEmClU25yHvy1
 gwU=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330846"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:53 -0800
IronPort-SDR: 9nLGWcYtbMcKIIL9wJ8C5xMlioyufVD/KUUOGX5rjnF/YBam1WnLR76VJJxlVTMSzARajY1kqb
 5uoPI7prUwh1IphNNqK/uFWD5u4MJv/VSyrNObWXmGeVjRl9ZHoneaJIW3vhfy5iMiOf3Ifjr4
 Evk1leMshBBGptTupOi0j5GbCyYnjH9a63yVLsgAIOtPrymnE6omQDhcMMyjNnQ742yhg7JEFu
 Y7heyLgJatbMc05HedJ7RDpkxiYYbkKaxLvG2j3AO5ZoPNUyTxVxdiW1osCsELvT74YCqP+WTV
 f0k=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 47/55] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Tue, 31 Mar 2020 03:50:43 -0700
Message-ID: <20200331105051.58896-48-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 258dcd8a68e5..069a532bd0b2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2185,7 +2185,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	dev_info(dev, "Config successfully updated\n");
 
 	/* T7 config may have changed */
-	mxt_init_t7_power_cfg(data);
+	ret = mxt_init_t7_power_cfg(data);
+	if (ret)
+		dev_warn(dev, "Power Config failed to update\n");
 
 release_mem:
 	kfree(cfg.mem);
-- 
2.17.1

