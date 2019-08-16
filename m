Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937948FDF4
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfHPIgr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:36:47 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:3892 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIgq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:36:46 -0400
IronPort-SDR: mBs+ofqbYU6e0xEC1QIDRZRLRvdUhZm03Y5rHbxwei19aPJ+7l8qJ9p4KhpBRQBLyDRZ7Kd5eF
 uJA9J0vLDVudvQxT7+AqgTpP7qwVxYjm+UCmUXjFU80mwKaZjBEYLhWw6+DH2hCB/xjdkpYcFE
 ZFFacrlmNNg0CgGG745QZZqoT4Gmh+6NcC7wi9lbWrdRYCvLotVadNUB/Z79wH6TEEEnOaakKV
 tBPYpX856MFrUyEY85hcePc5NqXEG4pnIedG9JHVbA2GoWvnU00NcRG0+9iTdqXcPh/NDUkSeq
 qCY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507151"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:33:42 -0800
IronPort-SDR: 0VHBXFJQ0R4sTn6o/+9gYQ9yPlFv9kQ2omx22O/Q/F7LlAA1ClneB7PRc7VFEPudUI/gApy9Rx
 rIkidyzuYv4AQG0hp6b7PJVc6/Jd7ivG+5752cr/BQ0EhVlujqXvqn5z0LNy9JFPwEm2PXc/i5
 alQjnuK3Qh+x3VfvafvO8YCKfBLQiiuFGK+14GB6l/Dvp5xINVa/frLL6x+34DlH5pecJLHkq5
 /jXf5EwPeBfFei/TJLXfpUwAKXBG8ZJJ9ISobeVpvxuDNnDXWwr/myiTk5QI+b2f6l2+tcJqgm
 OUY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 24/63] Input: atmel_mxt_ts - check firmware format before entering bootloader
Date:   Fri, 16 Aug 2019 17:32:59 +0900
Message-ID: <20190816083338.18685-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083338.18685-1-jiada_wang@mentor.com>
References: <20190816083338.18685-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit d691d3ee6c6de84b38464a423207b3e23cb9dc3a)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ca882231ab41..a7805df83af2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3347,12 +3347,12 @@ static int mxt_load_fw(struct device *dev)
 		return ret;
 	}
 
-	ret = mxt_enter_bootloader(data);
+	/* Check for incorrect enc file */
+	ret = mxt_check_firmware_format(dev, f.fw);
 	if (ret)
 		goto release_firmware;
 
-	/* Check for incorrect enc file */
-	ret = mxt_check_firmware_format(dev, f.fw);
+	ret = mxt_enter_bootloader(data);
 	if (ret)
 		goto release_firmware;
 
-- 
2.19.2

