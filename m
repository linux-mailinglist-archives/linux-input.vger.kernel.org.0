Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928C88A332
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfHLQXf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:23:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44670 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfHLQXf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:23:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1962469078;
        Mon, 12 Aug 2019 16:23:35 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4C0384F4;
        Mon, 12 Aug 2019 16:23:33 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Matthias Fend <Matthias.Fend@wolfvision.net>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 1/2] HID: multitouch: do not filter mice nodes
Date:   Mon, 12 Aug 2019 18:23:25 +0200
Message-Id: <20190812162326.14253-2-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
References: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 16:23:35 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It was a good idea at the time to not create a mouse node for the
multitouch touchscreens, but:
- touchscreens following the Win 8 protocol should not have this
  disturbing mouse node anymore, or if they have, it should be
  used for something else (like a joystick attached to the screen)
- touchpads have it, and they should not use it unless there is a bug,
  but when the laptop has a trackstick, the data are reported through this
  mouse node.

So instead of whitelisting all of the devices that have a need for the
mouse node, just export it.
hid-input.c will append a suffix to it ('Mouse'), so users will eventually
see if something goes wrong.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-multitouch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index b603c14d043b..0d190d93ca7c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -263,7 +263,8 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_HOVERING |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_STICKY_FINGERS |
-			MT_QUIRK_WIN8_PTP_BUTTONS },
+			MT_QUIRK_WIN8_PTP_BUTTONS,
+		.export_all_inputs = true },
 	{ .name = MT_CLS_EXPORT_ALL_INPUTS,
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE,
-- 
2.19.2

