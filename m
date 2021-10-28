Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F013D43E9E9
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 22:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhJ1U6Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 16:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJ1U6Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 16:58:24 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B526C061570;
        Thu, 28 Oct 2021 13:55:57 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635454555;
        bh=iU+XFbXQ5x1nQ3jO5MtLXH4WteHt7kqPsbwW0F5WHZ8=;
        h=From:To:Cc:Subject:Date:From;
        b=NX5AO2BpT1tqtkrm2S0G0qdTWr4/yd0VT5yG7XpXPrvMH6EKe4Xmb5fGdCkU8m/bT
         Qqkti85uw1a5Rjs4Pdg4/lexxmjdQUDsHClk2z4RwX+nCwwKb5uFbSDa48HsrlkJF2
         ZGihtEZSbxdfC5tjYA9cYUfgDrb84DcYJPHFLWd4=
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org, Brent Roman <brent@mbari.org>
Subject: [PATCH] HID: input: set usage type to key on keycode remap
Date:   Thu, 28 Oct 2021 22:55:42 +0200
Message-Id: <20211028205542.499280-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When a scancode is manually remapped that previously was not handled as
key, then the old usage type was incorrectly reused.

This caused issues on a "04b3:301b IBM Corp. SK-8815 Keyboard" which has
marked some of its keys with an invalid HID usage.  These invalid usage
keys are being ignored since support for USB programmable buttons was
added.

The scancodes are however remapped explicitly by the systemd hwdb to the
keycodes that are printed on the physical buttons.  During this mapping
step the existing usage is retrieved which will be found with a default
type of 0 (EV_SYN) instead of EV_KEY.

The events with the correct code but EV_SYN type are not forwarded to
userspace.

This also leads to a kernel oops when trying to print the report descriptor
via debugfs.  hid_resolv_event() tries to resolve a EV_SYN event with an
EV_KEY code which leads to an out-of-bounds access in the EV_SYN names
array.

Fixes: bcfa8d1457 ("HID: input: Add support for Programmable Buttons")
Fixes: f5854fad39 ("Input: hid-input - allow mapping unknown usages")
Reported-by: Brent Roman <brent@mbari.org>
Tested-by: Brent Roman <brent@mbari.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..21d8cc64064d 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -160,6 +160,7 @@ static int hidinput_setkeycode(struct input_dev *dev,
 	if (usage) {
 		*old_keycode = usage->type == EV_KEY ?
 				usage->code : KEY_RESERVED;
+		usage->type = EV_KEY;
 		usage->code = ke->keycode;
 
 		clear_bit(*old_keycode, dev->keybit);

base-commit: 42d43c92fc577dca59ed74aec7868abec8d6ca6e
-- 
2.33.1

