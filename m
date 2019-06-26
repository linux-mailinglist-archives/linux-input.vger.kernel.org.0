Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5C56D58
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 17:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfFZPLn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 11:11:43 -0400
Received: from smtp120.ord1c.emailsrvr.com ([108.166.43.120]:51876 "EHLO
        smtp120.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbfFZPLn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 11:11:43 -0400
X-Greylist: delayed 548 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 11:11:42 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1561561356;
        bh=w3ydv+jwbRffdkB8VL13vocRK8V/OnsN33vW0u4uKM0=;
        h=From:To:Subject:Date:From;
        b=jT/f1qqdorE5Dhm9QjlYIs5CCFJa3AvEZmh5q/zDQlAMEIwvfLjtSgXvzxmH7GuVg
         NYejSidEFxfhs0mjFQPuAJyVo/otGVYU96GiYE0YvxZLxDrUiPIXka5HIlb+vQfFpl
         UfEZbqQXGZULh9V+hA8kR1ckvinsP4/4SYh/63Vo=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 15EABC01C6;
        Wed, 26 Jun 2019 11:02:35 -0400 (EDT)
X-Sender-Id: abbotti@mev.co.uk
Received: from ian-deb.inside.mev.co.uk (remote.quintadena.com [81.133.34.160])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 26 Jun 2019 11:02:36 -0400
From:   Ian Abbott <abbotti@mev.co.uk>
To:     linux-input@vger.kernel.org
Cc:     David Herrmann <dh.herrmann@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>, Ian Abbott <abbotti@mev.co.uk>
Subject: [PATCH 2/2] HID: wiimote: narrow spinlock range in wiimote_hid_event()
Date:   Wed, 26 Jun 2019 16:02:12 +0100
Message-Id: <20190626150212.27967-3-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626150212.27967-1-abbotti@mev.co.uk>
References: <20190626150212.27967-1-abbotti@mev.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In `wiimote_hid_event()`, the `wdata->state.lock` spinlock does not need
to be held while searching `handlers[]` for a suitable handler function.
Change it so the spinlock is only held during the call to the handler
function itself.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/hid/hid-wiimote-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 5b216f1eef58..3c59c3a019f6 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1625,12 +1625,12 @@ static int wiimote_hid_event(struct hid_device *hdev, struct hid_report *report,
 	if (size < 1)
 		return -EINVAL;
 
-	spin_lock_irqsave(&wdata->state.lock, flags);
-
 	for (i = 0; handlers[i].id; ++i) {
 		h = &handlers[i];
 		if (h->id == raw_data[0] && h->size < size) {
+			spin_lock_irqsave(&wdata->state.lock, flags);
 			h->func(wdata, &raw_data[1]);
+			spin_unlock_irqrestore(&wdata->state.lock, flags);
 			break;
 		}
 	}
@@ -1639,8 +1639,6 @@ static int wiimote_hid_event(struct hid_device *hdev, struct hid_report *report,
 		hid_warn(hdev, "Unhandled report %hhu size %d\n", raw_data[0],
 									size);
 
-	spin_unlock_irqrestore(&wdata->state.lock, flags);
-
 	return 0;
 }
 
-- 
2.20.1

