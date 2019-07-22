Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F9970813
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 20:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbfGVSCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 14:02:08 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:31568 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbfGVSCI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 14:02:08 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45sqCg6dn3zPY;
        Mon, 22 Jul 2019 20:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563818448; bh=gn9DXzyeO9AAd2DP9WXoW0Kecak/Oa3cIpR7P3HPYPY=;
        h=Date:From:Subject:To:Cc:From;
        b=O9r5JbWtommlaAQKxRlCaDFbFn4HlmCivHz4zrJV2vrIRS7UV+4PnZzkiauXrcm0w
         l9DkRfVr0kqag+tsEfoaBxZy+Ch3wk90qtrmh3R9MaXXirzYpyY8BStca79TsfpTr7
         2cUx7I42uIyTfopxAXAc0P9XhEWGfZx32Ihih0BztfLoXx4PU9Qh740Swlk7hSeIiO
         J/dlrhxbtPO4kcfDC3/8zE05sx4t/2zYmWHflwdUdh5ElxvIiWCPOgDP2e1wGvQboa
         VR+Yy0uMDXBpv1W4mFj8Bz/bwTG/nNM2QExjTjYLYpehQfTI+2g9iHYE9+PmK8/dtX
         H09y+lQb0jWUw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 20:02:06 +0200
Message-Id: <1230b0c19fd21fdc4d0eb30f3e32e67fff86fef9.1563818405.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND] HID: fix error message in hid_open_report()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On HID report descriptor parsing error the code displays bogus
pointer instead of error offset (subtracts start=NULL from end).
Make the message more useful by displaying correct error offset
and include total buffer size for reference.

This was carried over from ancient times - "Fixed" commit just
promoted the message from DEBUG to ERROR.

Cc: stable@vger.kernel.org
Fixes: 8c3d52fc393b ("HID: make parser more verbose about parsing errors by default")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
 * against v5.2.2

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hid/hid-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 210b81a56e1a..bb74b7ff4e6a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1139,6 +1139,7 @@ int hid_open_report(struct hid_device *device)
 	__u8 *start;
 	__u8 *buf;
 	__u8 *end;
+	__u8 *next;
 	int ret;
 	static int (*dispatch_type[])(struct hid_parser *parser,
 				      struct hid_item *item) = {
@@ -1192,7 +1193,8 @@ int hid_open_report(struct hid_device *device)
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
 
 	ret = -EINVAL;
-	while ((start = fetch_item(start, end, &item)) != NULL) {
+	while ((next = fetch_item(start, end, &item)) != NULL) {
+		start = next;
 
 		if (item.format != HID_ITEM_FORMAT_SHORT) {
 			hid_err(device, "unexpected long global item\n");
@@ -1230,7 +1232,8 @@ int hid_open_report(struct hid_device *device)
 		}
 	}
 
-	hid_err(device, "item fetching failed at offset %d\n", (int)(end - start));
+	hid_err(device, "item fetching failed at offset %zu/%zu\n",
+		size - (end - start), size);
 err:
 	kfree(parser->collection_stack);
 alloc_err:
-- 
2.20.1

