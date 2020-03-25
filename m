Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003A0192A23
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCYNgt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:49 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53281 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgCYNgt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:49 -0400
IronPort-SDR: BBLp2cZZVJA3Tprc9xsnZHKF40uzrZ5qKXYNOYmlU/rJqJmPvAACKUzzgCl8lHqVZXVLrkkMxQ
 SkOnky6dLxKEj9Dg7J/8v6cGu41vQzB9bfeV6iaTFuwkYyYqysO6zLq1InYnomRX9r6qnjRM7y
 d09sUd6oOkpJdn3xpTnBZMgHCa7Ve9uCJx1+GHotG9swvuEXgFWVNFVPqJ/uPDnBnYH4kYzFLl
 GYF3Rwo9q+WkpRTikJCAnHEJomX1Ijf4uONo3bKirbdp9pWoF4jPsqE4AxTWtpsh9s06az0qsA
 NLk=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099827"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:48 -0800
IronPort-SDR: OG6R1QgU6QCRNZYh6/i9lD0NZki/HC/AUdRIqzmnDjXG3G3h6sDjxQ8Y2kfNj47S9vyhm0cOdR
 9Wpf3Uv8gVTjWaaKMbdRLsHsr/fpA71eREV0T6XgsxYrPqkekbm7WwDcLwfmFokRONO3xOfdFe
 qrifl1QI6TCwZgsP0c1UcRp4V9WxTa3kM4H5gPIn5ejyhKj1JoydcQqzsaaTvuyFXlaZIBo28K
 j94JUSJOeIK9rVluQMrKXIxxgYHAuB+K6b9hdOF1XByVxjhlO2iz4MOcyI/helCRMu5U1HF2yV
 lyI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 47/55] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Wed, 25 Mar 2020 06:33:26 -0700
Message-ID: <20200325133334.19346-48-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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

