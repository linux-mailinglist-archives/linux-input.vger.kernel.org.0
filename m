Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558F59DE03
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbfH0Gax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:53 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48270 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfH0Gax (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:53 -0400
IronPort-SDR: YBEPAir3ElVIEgqGKWe5QdFKEtdVYhdYJ7gofQpPn3A0YWYwFg/nsVJcMZP0pRgYcjFg/vbUL1
 MoTLDf9Bh3HdwhF58MGhUlaSwLN8CRH/kzydopGZzv8F81W4XfjZYDkMAyS982Hh0e15zPWRJo
 3EhqisxxipVed93eaf+Uzrz+aZGUuXw8LKJApU2CDJtGy01M5GxzIwCdsX+x6jqZi3c7RmF5xG
 g9poifMqD7BPqrO8XpQcVvKOVaXMHiQAK/naqvCMWIMpQg7k+g2RQNF1Nc4Oxdu8eNTUzV8Ohz
 Jl8=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784631"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:52 -0800
IronPort-SDR: GY7yAxJI/h8zxi+ANY1TOggqq0DcRPA3fB1gVd5AngkTEGZMylFrlfcZI9eKXtOhIQp6yN5XCo
 NYtE6qy9C/f5OOdjzqWaV5QxumGLzS78FywvgLH9LuHL/4lA5rIazKStf7IrBo6YblgrD+JY9G
 w9a609WAShpULm5ppUJRSq23t9b78tyqlFES5e+rNFlQctkVEGHpy0SUU6fzjCuCfFUieBnrBT
 wCh6WdeId27tj1v14yb4zq+d+0ijJiz3CU/13JEjhZvMXicoAQUQXHpDaXIz221RRrY66CL3pa
 UBw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 38/49] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Tue, 27 Aug 2019 15:30:43 +0900
Message-ID: <20190827063054.20883-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063054.20883-1-jiada_wang@mentor.com>
References: <20190827063054.20883-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
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
index 169107413823..e9a895473ed8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1561,6 +1561,8 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
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

