Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC82B4B05
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfIQJmG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:42:06 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:59521 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbfIQJmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:42:05 -0400
IronPort-SDR: e2JwyG3KC32Nj3mjx8LWFGVrxsnheeSzU/0jlHsLhz8ctTBmd13zvgnJghCL8/souVH7vkjY8Q
 1p0xdSJBHGiH+D2UsEfl0ct7O/8D/hRl6pfZABW/JqliG4sBhplzFCL35p+HMPmxCLVMoNLlVc
 Me8/HYDz+446GVBjS2co5BeZFKGNUskDlbRDyrMkNHXOVT1heyT1wRV1s1stwPdT2QI7Tp8RhF
 Rto2iyNEcu/GNwroeAFy7MeMdLkrOcGdFVU9YsOPClTD+23apfJtZsK9yyG/DUOmvshdHa1xFN
 hNE=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="43223227"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:42:04 -0800
IronPort-SDR: YOWbk8UlO0ninB242fZykyOir10Jt+ZF/BxRts2ZRD8BYOZqs7fwPzXkeO7tSMJ5ej778EUJLY
 hc1xW/qeWCKKXm0qjSdXS/aSOuWz2tbVYtK5f4TXkOEcOqhbPcc7mY35i/R2ci94XFZFkrP0J6
 r6E0jThO5V94TRU75IocTe+zAcncLht2B+DBW9kZPpFmpHIRE+gcJMP5yaTpRQGARixhq1jTD3
 W1wexbv5/8n3fZF++7giiXKGQwgvcBMK6Fx47c8PzqI6J4Jmy+HU8NVYp3Fxzv+nQD6XB1uL+p
 cKw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 38/49] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Tue, 17 Sep 2019 18:41:26 +0900
Message-ID: <20190917094137.18851-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094137.18851-1-jiada_wang@mentor.com>
References: <20190917094137.18851-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 5a31c1f50376..f2fa62289577 100644
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
2.19.2

