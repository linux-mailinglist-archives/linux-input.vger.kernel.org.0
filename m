Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923D2E825E
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbfJ2HW2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:22:28 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729625AbfJ2HW2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:28 -0400
IronPort-SDR: Ei1YBRCCr4eXO/OGrWHVxaMcFmAD2ViCstvgqRYcyAF23A9qHPZG21dDUVow50QUJUivQlVYyf
 ZSkMl9lBqRfN+dKXIDQ25Xf6FWP7U9tP6kgEfWw9W9DYvOUCxWayARtjSgsLBiIuXcw8KFsD4s
 23+RX4rjwSlcKF6ywc0ynLmrA/SqUxaCGz5NazbNiYTnwWfNGb6J3YAavmVDwW53Yx2ATEakv6
 nO/tWRl2bcewf6KkyWM4Uk9RKxqkzfD7pRW+0FzqGApF5ZqD4I2VURliApOT47Dyy0uA9nptu/
 GPs=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509435"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:27 -0800
IronPort-SDR: eG3KNV1mamRYbiu2O9ZymRqGOyK0hWJco/KNEB1JnmGt6GIMNDTcrNgW9BomlDgtMEFoUrvIM2
 YxG/nMDIcnfljEutsY8XMNFkoyh/aRgGEKugS8HgQfcxHw60F0dcerccu5CL9No0q0sVBc4OqB
 cFbTchmr0IsGdseC3IZs1BIDGZSr7JLny7w6MVzhC75hsR61gLwk7vHceVoLg7Hzebm+mOczoA
 mc/kEBSLjGiibX/kO5TnJNQIbU5QB0wLQKe/mvMEwpr3+tfHEbDjOk4vMWBfziCDIbhZPfp0R0
 7wM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 37/48] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Tue, 29 Oct 2019 16:19:59 +0900
Message-ID: <20191029072010.8492-38-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index 13583971eadb..4a0dce1aa1d5 100644
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

