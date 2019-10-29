Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664C2E824D
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbfJ2HWl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:22:41 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733089AbfJ2HWj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:39 -0400
IronPort-SDR: Sl/VArKq1YiPmM3imuOplizLMqUwkx3Ks/AMQhKXdnuS1RqDJUCpuLZKJs6TaEZiXoRx+xSram
 WkvjB2s0EYy5p03T9/1+euNZ7xdPt47f5/sMBs7XnTthrXvoLMcaDufvgt2VzHy1yIaOLY2sgx
 b2rImnnVqtFNnt8YP8U8BV2zJlnCqiB8C+t8gmTsFU+kq7AQDbkh8BZhUu5jcMjOq7kNGB/RKt
 hdh7ZdYhOAPqb5CuZOmicvnhnDp7sdiBSio9dKDPf1Xlleh4WsGpkv+nOk+tdWyGAgbSvK5B+M
 qhg=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509446"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:38 -0800
IronPort-SDR: KuEAr4QiyfcFRsg+dUfSgvAU0VZ5J4zJpU1ztGfLe7MZQMLpI+YBqSTt3SlSKUV0hj9+GSFwGd
 ebhtC3tWUrZzN7pdNpkijh+ORnxtmpuT80EfqME/xgtpsE53ck0mM6kFKOpEo2nUY23z6KB1Sh
 0yg+rYUJUX2wcbaF6w0YSYov9Ty5ty78uUJaPDJP6wZ7lZs7BMwYxqvgbXEOPQgGnovbLLLFiV
 vImwsB3vmliTio5gLGL9J/pC2DRaQmFRtfrgJAY7mbC6/zIX1txeiuLvxLYfImrku760zYLuvb
 /5U=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 40/48] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Tue, 29 Oct 2019 16:20:02 +0900
Message-ID: <20191029072010.8492-41-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index a0e5910e6a2a..d05ead2e605b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2186,7 +2186,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

