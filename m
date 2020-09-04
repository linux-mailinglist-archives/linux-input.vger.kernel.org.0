Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D781025DA58
	for <lists+linux-input@lfdr.de>; Fri,  4 Sep 2020 15:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbgIDNrn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Sep 2020 09:47:43 -0400
Received: from smtp119.ord1d.emailsrvr.com ([184.106.54.119]:60930 "EHLO
        smtp119.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730642AbgIDNrO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Sep 2020 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1599225716;
        bh=5SJnI8WDnM0hEpvsccPY+yQSaaqaRJ06uiCw7yBDmlg=;
        h=From:To:Subject:Date:From;
        b=eYKsJWfOiinOZwOPFa1lPI3lop0cBdFq6UdYRd7zYzVaKaThjIeNVkz/qOz4zWixa
         J2RDMNmQr7D1LkUQyg0utINYinplmS5imXbuNsey67xPNJq6J40ATGE6HQzghG9/Hk
         zM1JEbeUJo+oz4E4OKgz+hMmVqTDfGMcrs359B6E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1599225716;
        bh=5SJnI8WDnM0hEpvsccPY+yQSaaqaRJ06uiCw7yBDmlg=;
        h=From:To:Subject:Date:From;
        b=PExss+wQoqgJVlLurQZLNPXcgP0OwsxACB1jdFkaomusbvHYp7Qp7A2KZBpkI/KuA
         6rzFTvGrXN45mBHNEOpsWTT+CAduuHShwkifgbJ2K/5NNNOQxyjY2Jgs4IqETOJ8cf
         f2gf7x88pavZQ27MhqhbfoSy5mN6MRsgILy9/ny8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp23.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 54E47200E6;
        Fri,  4 Sep 2020 09:21:55 -0400 (EDT)
From:   Ian Abbott <abbotti@mev.co.uk>
To:     linux-input@vger.kernel.org
Cc:     David Rheinsberg <david.rheinsberg@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ian Abbott <abbotti@mev.co.uk>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: wiimote: make handlers[] const
Date:   Fri,  4 Sep 2020 14:21:42 +0100
Message-Id: <20200904132143.9496-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904132143.9496-1-abbotti@mev.co.uk>
References: <20200904132143.9496-1-abbotti@mev.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: ee464daf-2bdc-4db4-9ef3-697c4738b247-2-1
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
index e484c3618dec..e03a0ba5611a 100644
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
2.28.0

