Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C62BAF0FC1
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbfKFHFG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:05:06 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:9081 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFHEO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:14 -0500
IronPort-SDR: tcuC1pS3emJO1AlSAutXc/QbEcjegQWoe5MBT5FeJtw8hiQn4vu+Y59QzBnM+ELpCvKXajuVIN
 kSqQoriQMdEAMAv0z3Bqt61bri7spLMQgXbqzWbA3OELOoAG1IwJpZxmNcQSd1a0gSywXong1V
 Tp49O/h5kUZUXhEqKX5WoosnzDTw/4NRfdMAlhJRjDw7hIcZ0LyvHpBA6Ge7py+zrA51qF6Q9P
 3P0npgH8WA3yybTdC9jOkSn5sT9qUc/a7h4+QitvdwdlDVY+ctPdMBrSosdXCsaCdda6zg20tg
 TPs=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42848315"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:13 -0800
IronPort-SDR: Og4fHgY6kITyoI/3Rco2BFCTQLqqF/TIe2seKNCKcxHv2yRdzoZpbOrxTEssYfxmId3TP3mbSQ
 m3d5/zaKz9GDbFKU1SuVZRCwQjQboUp4SvowVn0Apu6UktXN8NMlnSmApXTZrOagTfhbZIVTO2
 K0Plh4OavvqVkNxQ5wRC6dd/JiO1Nm6ewXv5UrWyp9paveN+kkiVwFRprqFytHl8BU+qDwNHug
 zoWF+5zRYC8tQUajKLDBQ+hlL1GlU6wQbZdvNwMdqM5Rne2Ks1Ww+j/Zyd7SbMnwY5UKVmFxaM
 Mjc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 37/48] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Wed, 6 Nov 2019 16:01:35 +0900
Message-ID: <20191106070146.18759-38-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dean Jenkins <Dean_Jenkins@mentor.com>

mxt_process_messages_until_invalid() failed to propagate the error
code from mxt_read_and_process_messages() so return the error code.

Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 054aacc768b8..a5af1f91d704 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1564,6 +1564,8 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	/* Read messages until we force an invalid */
 	do {
 		read = mxt_read_and_process_messages(data, count);
+		if (read < 0)
+			return read;
 		if (read < count)
 			return 0;
 	} while (--tries);
-- 
2.17.1

