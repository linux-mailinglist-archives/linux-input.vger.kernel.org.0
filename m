Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61DE210DF9D
	for <lists+linux-input@lfdr.de>; Sat, 30 Nov 2019 23:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfK3W1c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Nov 2019 17:27:32 -0500
Received: from plaes.org ([188.166.43.21]:36752 "EHLO plaes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbfK3W1c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Nov 2019 17:27:32 -0500
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Nov 2019 17:27:31 EST
Received: from localhost (unknown [IPv6:2001:1530:1000:7c6d:940e:6b9e:3deb:2])
        by plaes.org (Postfix) with ESMTPSA id D0F654037F;
        Sat, 30 Nov 2019 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plaes.org; s=mail;
        t=1575152535; bh=5vE+9+imtN9f4FnW9xL7E0O17/0rF12odZ5Z7xVWr8w=;
        h=From:To:Cc:Subject:Date:From;
        b=NIrWqztaHgJ0ibM/3SNjEY8irNbi7wAqcp/PMcwkW39khCWn9yOKgAr3Y+uAuJg+a
         m39f/1fnouEuJI19smZukeOmMt4PGzs97a/Usu+e0JUyp26zOlpzc172pMm6j6V+qT
         AcaS8MKbVXoFKfbZn2/tOLQiqsvcd5v6EeuII5Rx7ncdex3aY6uu2LaQnf2TMT74SF
         4k8dKRu8DOs8udVF7KZWy7vBZAxD8rJmZXU2UaWqwgaSZBAd6a6GOI4zau96+ATpR8
         fphGSmn00C9KUCl9K6IXtZMsZess9CjR+ROF5KoiV5Raghp5DX6lxor2vZmTmP9WT3
         7Mnc5YRSqS4ng==
From:   Priit Laes <plaes@plaes.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Priit Laes <plaes@plaes.org>
Subject: [PATCH] HID: Add quirk for Xin-Mo Dual Controller
Date:   Sun,  1 Dec 2019 00:22:09 +0200
Message-Id: <20191130222209.5084-1-plaes@plaes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Without the quirk, joystick shows up as single controller
for both first and second player pads/pins.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/hid/hid-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c50bcd967d99..2007e31837ad 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -173,6 +173,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD2, USB_DEVICE_ID_SMARTJOY_DUAL_PLUS), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP, USB_DEVICE_ID_QUAD_USB_JOYPAD), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },
 
 	{ 0 }
 };
-- 
2.23.0

