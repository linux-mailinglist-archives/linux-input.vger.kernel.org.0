Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA532509E
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfEUNim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:38:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34242 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728393AbfEUNim (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:38:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 70A553EDBF;
        Tue, 21 May 2019 13:38:42 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0172E608C2;
        Tue, 21 May 2019 13:38:38 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Breno Leitao <leitao@debian.org>
Subject: [PATCH] HID: multitouch: handle faulty Elo touch device
Date:   Tue, 21 May 2019 15:38:31 +0200
Message-Id: <20190521133831.4436-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 21 May 2019 13:38:42 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since kernel v5.0, one single win8 touchscreen device failed.
And it turns out this is because it reports 2 InRange usage per touch.

It's a first, and I *really* wonder how this was allowed by Microsoft in
the first place. But IIRC, Breno told me this happened *after* a firmware
upgrade...

Anyway, better be safe for those crappy devices, and make sure we have
a full slot before jumping to the next.
This won't prevent all crappy devices to fail here, but at least we will
have a safeguard as long as the contact ID and the X and Y coordinates
are placed in the report after the grabage.

Reported-and-tested-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index ef635964cfe1..a344a3cf5398 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -642,6 +642,13 @@ static void mt_store_field(struct hid_device *hdev,
 	if (*target != DEFAULT_TRUE &&
 	    *target != DEFAULT_FALSE &&
 	    *target != DEFAULT_ZERO) {
+		if (usage->contactid == DEFAULT_ZERO ||
+		    usage->x == DEFAULT_ZERO ||
+		    usage->y == DEFAULT_ZERO) {
+			hid_dbg(hdev,
+				"ignoring duplicate usage on incomplete");
+			return;
+		}
 		usage = mt_allocate_usage(hdev, application);
 		if (!usage)
 			return;
-- 
2.19.2

