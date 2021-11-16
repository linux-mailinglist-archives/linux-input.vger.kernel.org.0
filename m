Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4912A4532B4
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 14:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhKPNSR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 08:18:17 -0500
Received: from hosting.gsystem.sk ([212.5.213.30]:34856 "EHLO
        hosting.gsystem.sk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbhKPNSK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 08:18:10 -0500
Received: from gsql.ggedos.sk (off-20.infotel.telecom.sk [212.5.213.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by hosting.gsystem.sk (Postfix) with ESMTPSA id 90A317A0229;
        Tue, 16 Nov 2021 14:15:11 +0100 (CET)
From:   Ondrej Zary <linux@zary.sk>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
Date:   Tue, 16 Nov 2021 14:15:02 +0100
Message-Id: <20211116131502.24603-1-linux@zary.sk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAO-hwJ+huX5wFQjwzZ+o9zOonCuifiyQ2rZosTWW7or09_SfiA@mail.gmail.com>
References: <CAO-hwJ+huX5wFQjwzZ+o9zOonCuifiyQ2rZosTWW7or09_SfiA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Iiyama ProLite T1931SAW does not work with Linux - input devices are
created but cursor does not move.

It has the infamous 0eef:0001 ID which has been reused for various
devices before.

It seems to require export_all_inputs = true.

Hopefully there are no HID devices using this ID that will break.
It should not break non-HID devices (handled by usbtouchscreen).

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3ea7cb1cda84..ac114b76057b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1880,6 +1880,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
 			USB_DEVICE_ID_CVTOUCH_SCREEN) },
 
+	/* eGalax devices (SAW) */
+	{ .driver_data = MT_CLS_EXPORT_ALL_INPUTS,
+		MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
+			USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
+
 	/* eGalax devices (resistive) */
 	{ .driver_data = MT_CLS_EGALAX,
 		MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
-- 
Ondrej Zary

