Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59515A3B7
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgBLIqw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:46:52 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:17160 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbgBLIqw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:46:52 -0500
IronPort-SDR: vFO/8iMOZvLe/WosgM0kvioR+B+G1CGZPhfwfFgpU+vhMixQ3N6C4omLoVOizpAn11+Dy+XCdk
 5AeFru3dJxqq33BJRxUgOyRA8lozNV1n10SgCBzLxRgrNhUqfLDr7e8djhWdXtl1fjjmHcAlwA
 y0eZRbCm7TnYzcp/hHOSvsIvpqWBAztYiQCHqR412AFi+ZFe87Q5iJ899osycgcAPV8QKfREnj
 gS6VzIGNMPySfsPt0IhKNanCTHehOzcMpHoIO4ojPMpL3T4bxeJeLkR0EqsN0B7eth2OBfKTKH
 Vjw=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45742604"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:46:51 -0800
IronPort-SDR: fdA655HmgTAOotSneHGqhJEogb7ZZo+mL8tnC6RBLs9q2A0bPO8EFjy5LG2ju/chHEMJ4ABi/d
 4gS4m96Xyc8HSesdSMcT8AMC5cBsZ+YEBC4nbkgSdQH3PsToD5I8Lk9Yol8A5CGOddb7CvTbyt
 U59Z/VF8PpFXzF3Wh+SaQ0zQWwR1cl2cDdhxzIxwj9AaJ5lkSvF36AgYMpE9iPK+NPesH5MhXg
 2ODKXT9mfzxQ5KdCJiTRR6HfvPSZZHdZSvVdV7sSD2RvqciEFrOh1gbsNKnvfcqd3M96xzfx11
 bKM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 37/48] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Wed, 12 Feb 2020 00:42:07 -0800
Message-ID: <20200212084218.32344-38-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 865c207a0d72..2a5a5a362a13 100644
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
2.17.1

