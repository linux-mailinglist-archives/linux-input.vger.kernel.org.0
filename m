Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06042FA1FF
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 14:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404660AbhARNqi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 08:46:38 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:50896 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404527AbhARNqN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 08:46:13 -0500
Received: from 1.general.khfeng.us.vpn ([10.172.68.174] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l1UqW-00011C-AN; Mon, 18 Jan 2021 13:45:29 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: multitouch: Apply MT_QUIRK_CONFIDENCE quirk for multi-input devices
Date:   Mon, 18 Jan 2021 21:45:23 +0800
Message-Id: <20210118134523.178605-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Palm ejection stops working on some Elan and Synaptics touchpad after
commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for
some devices").

The commit changes the mt_class from MT_CLS_WIN_8 to
MT_CLS_WIN_8_FORCE_MULTI_INPUT, so MT_QUIRK_CONFIDENCE isn't applied
anymore.

So also apply the quirk since MT_CLS_WIN_8_FORCE_MULTI_INPUT is
essentially MT_CLS_WIN_8.

Fixes: 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for some devices")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/hid/hid-multitouch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 0743ef51d3b2..8429ebe7097e 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -758,7 +758,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 			MT_STORE_FIELD(inrange_state);
 			return 1;
 		case HID_DG_CONFIDENCE:
-			if (cls->name == MT_CLS_WIN_8 &&
+			if ((cls->name == MT_CLS_WIN_8 ||
+			     cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
 				(field->application == HID_DG_TOUCHPAD ||
 				 field->application == HID_DG_TOUCHSCREEN))
 				app->quirks |= MT_QUIRK_CONFIDENCE;
-- 
2.29.2

