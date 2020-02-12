Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECBD15A3D8
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgBLIso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:48:44 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42675 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbgBLIso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:48:44 -0500
IronPort-SDR: Nvw0FT5zA0bkzPThUG2AA6A6CyiVIcwX1e1euyqRCQly8KIXYXYI4vTzvFzN6zK+qNyo5pnEx9
 mRkeaWYeV8FEeRZOlwZwAVVxkO+uDRhIS6qS9YWGyEVeM2/zEwwDjjXmZydLcn0EmH+lYxUHfa
 prGX0QtgKiS6Z9B6FVIpzws4QnedpA3rUKZlf3jO484dyaagCs5+6NEEwOz8GtqPWIGt5viz2K
 BV7dwBpOilLJFv7Ui2IGt24qt8OOyMP8GBnCvXZmdD/I08Fim/rVvVJyUiB1TH7evOm5+ycy/x
 RyM=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45742651"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:48:43 -0800
IronPort-SDR: 3pRdBghNyuIZJ2UHCP3UcZGr+zw1Ego2Jw9McQffzAszi6NoRvRAEEdOjTcKLVGdvvoVzp85rJ
 2EWmlCv1Xwr7+wa7KuLK0SHnN++qe2TpIq2gGeduRH/8/qgmDtNzBcHfwwbrOmoZP3yLvybTzZ
 FrRl2I4qlmUOopKJ498nJ6/dRfCR3H8rqQVkoKjoIGtE1TzaxaC0eDtCWADUtD7mnGsGpj3R98
 b/Ndp0kuDI21fuwxf6zeEz8QsrM9GZRW6wNxQsNX0qKsLaWw2smqk+RrmpvD7E3BIt1g/EQhY7
 8OM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 48/48] Input: atmel_mxt_ts - Fix compilation warning
Date:   Wed, 12 Feb 2020 00:42:18 -0800
Message-ID: <20200212084218.32344-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 715952a6200d..79b92b20cc91 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2046,7 +2046,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.17.1

