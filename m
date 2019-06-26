Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7187C56D57
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 17:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfFZPLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 11:11:42 -0400
Received: from smtp120.ord1c.emailsrvr.com ([108.166.43.120]:60325 "EHLO
        smtp120.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726948AbfFZPLm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 11:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1561561355;
        bh=D5/zrBMP6scQMsXyVW3verDUx90+S2RZUhZpsdIoTZI=;
        h=From:To:Subject:Date:From;
        b=l6agZFOF8VYEU8o2DS7C5L5dxHmsvyRXuv0PV1p8MzIHqazXJy8LVgjQ2AJc35FjF
         N7kNoYfu73aS5GGUJp6CzJoJzAHhhzKrvUlok0VqTY+l7p9kWXLLBx6fXaIVkEwzRR
         3ZHbwD6XLp9m4Mb7aduWT1Cjstdx1+CrTH4n9j/g=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 90CBAC00A2;
        Wed, 26 Jun 2019 11:02:34 -0400 (EDT)
X-Sender-Id: abbotti@mev.co.uk
Received: from ian-deb.inside.mev.co.uk (remote.quintadena.com [81.133.34.160])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 26 Jun 2019 11:02:35 -0400
From:   Ian Abbott <abbotti@mev.co.uk>
To:     linux-input@vger.kernel.org
Cc:     David Herrmann <dh.herrmann@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>, Ian Abbott <abbotti@mev.co.uk>
Subject: [PATCH 1/2] HID: wiimote: make handlers[] const
Date:   Wed, 26 Jun 2019 16:02:11 +0100
Message-Id: <20190626150212.27967-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626150212.27967-1-abbotti@mev.co.uk>
References: <20190626150212.27967-1-abbotti@mev.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The `handlers[]` array contents are never modified, so use the `const`
qualifier.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/hid/hid-wiimote-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..5b216f1eef58 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1586,7 +1586,7 @@ struct wiiproto_handler {
 	void (*func)(struct wiimote_data *wdata, const __u8 *payload);
 };
 
-static struct wiiproto_handler handlers[] = {
+static const struct wiiproto_handler handlers[] = {
 	{ .id = WIIPROTO_REQ_STATUS, .size = 6, .func = handler_status },
 	{ .id = WIIPROTO_REQ_STATUS, .size = 2, .func = handler_status_K },
 	{ .id = WIIPROTO_REQ_DATA, .size = 21, .func = handler_data },
@@ -1618,7 +1618,7 @@ static int wiimote_hid_event(struct hid_device *hdev, struct hid_report *report,
 							u8 *raw_data, int size)
 {
 	struct wiimote_data *wdata = hid_get_drvdata(hdev);
-	struct wiiproto_handler *h;
+	const struct wiiproto_handler *h;
 	int i;
 	unsigned long flags;
 
-- 
2.20.1

