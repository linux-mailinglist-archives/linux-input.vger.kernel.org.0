Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495B89DE0C
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbfH0Gb1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:31:27 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48284 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfH0Gb0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:31:26 -0400
IronPort-SDR: M46BNPfhmQVo/DIjkipkD6xkMVnF8+yu9iCR3A/TnYwm9EBXhKgsLXdfBXu/+nJV9VBzuxCNU3
 +8++P+dzgoaGNzUgMZN4JV2OP4a3It9qbBMohURbSHSQ5ECMwG6c7IO22fXwQLMqCty1ysfWuJ
 F89ABq7kqOM/oB4cSIbRVTycH+NxgsmqNpj9k+BE/O5UKdTkl55UZBLxdEFmuuew1tu+3bxvci
 3mwh1Vts53LfSNG0TM9M6rURSNhr2afVagOKtEeMLn2gp/l2sGoN/KZ44tE2n2Azkm32U62OOj
 TFo=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784645"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:31:25 -0800
IronPort-SDR: 0XSlNpYrWOeJVL5VSUp8TlgYTJgI6Ssqp2P2P3BgNkuFAOpeFzQX6yfy7AWgPjfapZk5fMgtq0
 dxnY5RCrKNargebFI52OhuE4YFHeTPvNc2XtWj9mADc8qMRBKqONGmAh+P9Vjblrlfg1RRxKE9
 ewLtpfuY+wFauA97JrpyuwVt1xMOs8F2zW3nSc4CSZAzNnWf7TB4KmY3lkKIUVjmHWc3l4a6hL
 A8xcTBdaZdO50MX2Tnp1+9sp6kW2WcFYiwvehxl0+9MeXUiWBKpi4Wt6UfNT2/7oFmwS5mTzPR
 4Zo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 42/49] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Tue, 27 Aug 2019 15:31:23 +0900
Message-ID: <20190827063130.20969-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063130.20969-1-jiada_wang@mentor.com>
References: <20190827063130.20969-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently Driver probe continues with a warning message when it fails to
get the proper multitouch object configurations like TouchScreen resolution.
But Driver probe should fail in case of above scneario because it will not behave
as expected without the proper touchscreen configurations.

This commit modifies mxt_initialize_input_device() to return error when it fails
to get the proper touch screen configurations.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 716b91e6fd66..41d92d765aa2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2759,15 +2759,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	case MXT_TOUCH_MULTI_T9:
 		num_mt_slots = data->T9_reportid_max - data->T9_reportid_min + 1;
 		error = mxt_read_t9_resolution(data);
-		if (error)
-			dev_warn(dev, "Failed to initialize T9 resolution\n");
+		if (error) {
+			dev_err(dev, "Failed to initialize T9 resolution\n");
+			return error;
+		}
 		break;
 
 	case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 		num_mt_slots = data->num_touchids;
 		error = mxt_read_t100_config(data);
-		if (error)
-			dev_warn(dev, "Failed to read T100 config\n");
+		if (error) {
+			dev_err(dev, "Failed to read T100 config\n");
+			return error;
+		}
 		break;
 
 	default:
-- 
2.19.2

