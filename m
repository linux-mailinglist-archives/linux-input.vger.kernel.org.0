Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFEA1CA36F
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgEHGAe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:34 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgEHGAe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:34 -0400
IronPort-SDR: wx5lcPgAIvKthU+o1pnkDxnkR3ZWqDIuviQJOkGLHpSnvbAX59sn8+I686wpJZF6aVdFIPbu5D
 WhzV2pwj99lqHacrAjWSxnwHnBWCXPbHYpcrTg9eMJhWsNT74+Brm4PSrBMbt+9WOXF2WNZFlJ
 Gk+tgJhSr+0i+IiJXX5jfETO3sQiY4IljDSiBHEJP0QpGbdjma7gkSv1ZDgiZ4azV/GqfWGKD2
 B2SqVZTHKpe4L4pHj3eeFP1YFlHUPTtUC8FeFe+TVF9H5KKMOYaMry8uDw8SMM0bFO1ml2LxuO
 gQg=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670194"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:31 -0800
IronPort-SDR: QAo7m3QQYupEXooelzHaYh1lYz5veRgq+ucjfc7EFQfJ/esQyhQ/pUx+4UdQieaL+3Oifd98Al
 PdEG8uW3XnojBoIdZMni4Onw6pN496QWwYtsu/k4AN3D41+mOEH5Kck1zYvrXISiHE/R8ErdTg
 WMa+q9hndqZ5YkQTkzxkXliQgrVzchjjOkNyyl/DjquRmqMaZ5hfNdIBX1vmWCPdbA4+PQ4qWQ
 QPFnwvDCyPhWIujD2zGgDC8VL+zK3wBsxFH4cADie2iRbbpBqfLzrAayKRqrT8diiaDsq37Pwk
 L2s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 56/56] Input: atmel_mxt_ts - Fix compilation warning
Date:   Thu, 7 May 2020 22:56:56 -0700
Message-ID: <20200508055656.96389-57-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fix "make W=1" compilation warnings from Atmel driver
as per the compilation logs.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b518c316757d..8d3941e5d2ce 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1990,7 +1990,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.17.1

