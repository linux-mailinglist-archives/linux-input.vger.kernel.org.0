Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 659ED8FE35
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfHPIi6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:58 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42050 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfHPIi6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:58 -0400
IronPort-SDR: bJDvfmK7W7Dp+vt0VfiWyVQXmgS8F8OdYDNtdPjnZj2LxSmO/JqwLC/cQVO56puVrLYwpUFkk7
 viM3zGRy+rZ3XkyWoPU4Ibd3TtUmGt2vXNwcX9JNhvX3eVyjqtci0iS/d4xZaFXG7G4Itycv18
 dNFEqPYNA2MzgO/Fo3bKEd11P/8MEljoSjBrUiwY7U+15gVDopkLgHLluotoSny3sNk/bljQ9T
 4oJ3k9g3iXjAsCupPYDJqYpgb+O0ZbYADSJPt5FxXpsC7jVmURtFror1dzARuZlqBJghX6xfds
 H6Q=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507258"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:38:57 -0800
IronPort-SDR: KIiv3wif9mW1SXUBGBWoBPp61yd7mEa405/fvPDmOxkZ5GxtLnLkM20fv4h8ySFE3cBdAvZsNs
 ttdHh9UkByB16wbztMjQhq1H0qxuimzajaBKrnouFej4c1UgAoSwIaRhAx6pOBTwhejUw3KBsw
 wN5oJLz+mEdfq7okVVFGDDArsMAmBidF9+T+IaY47vOUsCO0pwgC+bh6C4eougQkCqGi8VyQTC
 ywoSVUxzQ0Ztne0MuQ5h5VM+45+REcNndSjKQAXjUms/QlRn3qtppZoDthWZFtenMVItKfFoFv
 Dbg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 61/63] input: atmel_mxt_ts: Add NULL check for sysfs attribute debug_msg_attr
Date:   Fri, 16 Aug 2019 17:39:00 +0900
Message-ID: <20190816083902.19659-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083902.19659-1-jiada_wang@mentor.com>
References: <20190816083902.19659-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

In some scenarios mxt_debug_msg_remove() can be called from
mxt_remove() even before the data->debug_msg_attr is updated.
So a NULL check is required for data->debug_msg_attr before
accessing it.
There is also an additional change in mxt_debug_msg_init() to update
data->debug_msg_attr only when sysfs_create_bin_file is successful.

Consider the following scenario: Atmel MXT driver module is being loaded
hence mxt_probe() is called, then mxt_probe() calls mxt_initialize() and
in mxt_initialize() function if the Atmel MXT is in bootloader mode there
is a possibility that it can return before calling mxt_debug_msg_init(),
with a value of 0 meaning no error.
In this case data->debug_msg_attr is now at the initialized state only,
which is NULL as allocation of data pointer was done with devm_kzalloc()
call in mxt_probe function. Completion of initialisation will be deferred
until some later time.
If there is now an attempt to remove the Atmel MXT driver module, in
mxt_remove() there is a call to mxt_debug_msg_remove() which calls
sysfs_remove_bin_file() with a NULL data->debug_msg_attr.
Therefore, we need to have check in mxt_debug_msg_remove() for
data->debug_msg_attr being NULL.

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: Mark Craske <Mark_Craske@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index fd9a96ec3fd3..1179f90a8077 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -615,21 +615,26 @@ static int mxt_debug_msg_init(struct mxt_data *data)
 	 * so it is safe to update a single struct bin_attribute entity
 	 */
 	debug_msg_attr.size = data->T5_msg_size * DEBUG_MSG_MAX;
-	data->debug_msg_attr = &debug_msg_attr;
 
 	if (sysfs_create_bin_file(&data->client->dev.kobj,
-				  data->debug_msg_attr) < 0) {
+				  &debug_msg_attr) < 0) {
 		dev_err(&data->client->dev, "Failed to create %s\n",
 			debug_msg_attr.attr.name);
 		return -EINVAL;
 	}
 
+	data->debug_msg_attr = &debug_msg_attr;
+
 	return 0;
 }
 
 static void mxt_debug_msg_remove(struct mxt_data *data)
 {
-	sysfs_remove_bin_file(&data->client->dev.kobj, data->debug_msg_attr);
+	if (data->debug_msg_attr) {
+		sysfs_remove_bin_file(&data->client->dev.kobj,
+				      data->debug_msg_attr);
+		data->debug_msg_attr = NULL;
+	}
 }
 
 static int mxt_wait_for_completion(struct mxt_data *data,
-- 
2.19.2

