Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA3A192A17
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgCYNgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:37 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53281 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbgCYNgg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:36 -0400
IronPort-SDR: MAY16midAjYW6QnVmLZdWoPX/0bGvCgcoxkwQJjegVIhttLkcVVwNYlZ0MWAidDgW/jHf2eV31
 2qm7DDUlkPI5NxJgdycRW+CqrOS10UuWtUp5Ab8FpQtP4LhoS0E8Ipn9uMlwhNfHrUg+tPWXOx
 c5UBR4juHPQDs85rxs+VDlHMexlW/Sovsu45DU3fFXheNmhXraoIf5n6FtIKnMwBUX3rm/V2G9
 OjTQkTMyuGOL+IWbEeX6dU/er4xZVNQi5LNwJPc2Tku0LCGp/2kXL9+4KL8AxUHDYKdznJle7K
 l+k=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099806"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:36 -0800
IronPort-SDR: vrZ56uqQWDO4Rty+KVsYwE1rXfKwwKRgqMqFckGO+bLIIyRZFjaLmWA0usIvkS4xTOclItQXVd
 Iq3+uq3TP9mFTqt4El/V9sMZqOMHykeNDOxxJlg1UP0fxDStAfbWMbg2w8nPvqsKDr8AFoCGkx
 WAK14tuRXIH44cAhatvNyhPJmxevqBYiq6IfpEGYsHbyxJ5rXiqzf6IW7cvjKnlhwU88LKlLb+
 Cku9bglXU2ZY+s/L56PbW9BjqBx0oacpa2Tzpp6rjP3//EdCBtJfeJ4kylyyjcWK3S3r6Kne89
 3oA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 44/55] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Wed, 25 Mar 2020 06:33:23 -0700
Message-ID: <20200325133334.19346-45-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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
index 384b53717139..bbec5a8e0bb6 100644
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

