Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5C64F9A7
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 05:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfFWDjC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jun 2019 23:39:02 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:16853 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbfFWDjB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jun 2019 23:39:01 -0400
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Sat, 22 Jun 2019 23:39:00 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45WdHr60bmz8r;
        Sun, 23 Jun 2019 05:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1561260681; bh=6rWwT/M2vE/I6kyvL39qML3gsn3rpdxw11YdcunZg2w=;
        h=Date:From:Subject:To:Cc:From;
        b=FBSysJyhNzHTfU3kF7yTHX8Uo8AgM8zYlf5KAu1rR2QoE8pCKxX/IyDiom2tlV5+W
         LC3dnauYY2a/RCukHeF89Jps1UAfhklIccfRakL4PbvKkH9IYEM6gB8EfLKY1oEdCS
         F8X+uifg66wq8lV6Rwyisd6SoD0rDSK0VPgKEFcecLLI8QnrAGLK9NaPzKWHRYtLU2
         nBYGru0RjiW7dvd1h3JrruNaVKNzVP8YHs92I4aQKCLsoaHCsgVko7LPgo5HsJQWRR
         KuatVgVYpQuXLOcJ91JgvRRqU4ZTNeohBquljPyOP7H8cYGvXWTLbgwDCEGWt/GfHJ
         0OcoViKWPDPKw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Sun, 23 Jun 2019 05:33:06 +0200
Message-Id: <11bfd688a4cded256ed5419ae93557542b95af3c.1561260511.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] HID: fix error message in hid_open_report()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On HID report descriptor parsing error the code displays bogus
pointer instead of error offset (subtracts start=NULL from end).
Make the message more useful by displaying correct error offset
and include total buffer size for reference.

This is present since ancient times - "Fixed" commit just
promoted the message from DEBUG to ERROR.

Cc: stable@vger.kernel.org
Fixes: 8c3d52fc393b ("HID: make parser more verbose about parsing errors by default")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
 * against v5.1.13

---
 drivers/hid/hid-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 39eba8106d40..88b8db620b4a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1142,6 +1142,7 @@ int hid_open_report(struct hid_device *device)
 	__u8 *start;
 	__u8 *buf;
 	__u8 *end;
+	__u8 *next;
 	int ret;
 	static int (*dispatch_type[])(struct hid_parser *parser,
 				      struct hid_item *item) = {
@@ -1195,7 +1196,8 @@ int hid_open_report(struct hid_device *device)
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
 
 	ret = -EINVAL;
-	while ((start = fetch_item(start, end, &item)) != NULL) {
+	while ((next = fetch_item(start, end, &item)) != NULL) {
+		start = next;
 
 		if (item.format != HID_ITEM_FORMAT_SHORT) {
 			hid_err(device, "unexpected long global item\n");
@@ -1233,7 +1235,8 @@ int hid_open_report(struct hid_device *device)
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

