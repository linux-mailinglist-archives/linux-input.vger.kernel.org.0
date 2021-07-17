Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FA03CC4BB
	for <lists+linux-input@lfdr.de>; Sat, 17 Jul 2021 19:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhGQRMd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Jul 2021 13:12:33 -0400
Received: from rs231.mailgun.us ([209.61.151.231]:24325 "EHLO rs231.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232010AbhGQRMd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Jul 2021 13:12:33 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Jul 2021 13:12:33 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org; q=dns/txt;
 s=smtp; t=1626541776; h=Content-Type: MIME-Version: Message-ID:
 Subject: Cc: To: From: Date: Sender;
 bh=uzNi6oadPFqgq3lEvBtFvKtLxsXDUj1xpSN0YIyCjPE=; b=l5ETopR67Wv0Z9MbA+Nah8+QJZBMsvWslBFu6QfGYmg7W/HD28fMydVDdACJXPdIYjGzgJwu
 xTxjNcd/ZqjAmApI52Lzcu4ubSOYHOPVqwtlO8gL2ataZ0VHv1G+w2rTnNMaYn+qBoIw/pbm
 RVIxZYwoCq3bs7k9XcSqNsbrm9+M5AzlDRlxWs4AFcVlkZ8/iodkcozJiKQSYj01RdbeACkU
 bloFPmtc9jyFwDhk2iwVl04xqFK1pE/kk2ToCEG0s5xtPq5iX3qz+mFPmAkRlHC2YyQvXUfZ
 YvIpFh9mhYB7t0ou2BrWFDKOQpkRBJXO2fbOjMA7TovqioDCN+2AWA==
X-Mailgun-Sending-Ip: 209.61.151.231
X-Mailgun-Sid: WyI5NzJmZCIsICJsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmciLCAiMTkyNTE4Il0=
Received: from localhost (141.111.129.180.unknown.m1.com.sg
 [180.129.111.141]) by smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f30da2d0100c7cf95b4936 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sat, 17 Jul 2021 17:04:34 GMT
Sender: i@hexchain.org
Date:   Sun, 18 Jul 2021 01:04:31 +0800
From:   Haochen Tong <i@hexchain.org>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: apple: Add support for Keychron K1 wireless keyboard
Message-ID: <20210717170431.i6cubjpihjdxepmu@kotori.hexchain.org>
Mail-Followup-To: Haochen Tong <i@hexchain.org>,
        linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Keychron K1 wireless keyboard has a set of Apple-like function keys
and an Fn key that works like on an Apple bluetooth keyboard. It
identifies as an Apple Alu RevB ANSI keyboard (05ac:024f) over USB and
BT. Use hid-apple for it so the Fn key and function keys work correctly.

Signed-off-by: Haochen Tong <i@hexchain.org>
---
 drivers/hid/hid-apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6b8f0d004d34..dc6bd4299c54 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -501,6 +501,8 @@ static const struct hid_device_id apple_devices[] = {
 			APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
 		.driver_data = APPLE_HAS_FN },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
+		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
-- 
2.32.0

