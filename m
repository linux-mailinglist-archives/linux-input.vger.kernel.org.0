Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D659495F29
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 13:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380419AbiAUMmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 07:42:15 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:35166 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350478AbiAUMmP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 07:42:15 -0500
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 1A5561276C1F; Fri, 21 Jan 2022 12:41:31 +0000 (UTC)
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 78C471276C00; Fri, 21 Jan 2022 12:37:03 +0000 (UTC)
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 584661276BCD; Fri, 21 Jan 2022 12:34:49 +0000 (UTC)
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id 97D551276B9E;
        Fri, 21 Jan 2022 12:32:37 +0000 (UTC)
From:   Florian Klink <flokli@flokli.de>
To:     linux-input@vger.kernel.org
Cc:     ValdikSS <iam@valdikss.org.ru>, Florian Klink <flokli@flokli.de>
Subject: [PATCH v3 3/3] HID: lenovo: Add note about different report numbers
Date:   Fri, 21 Jan 2022 13:32:06 +0100
Message-Id: <20220121123206.36978-3-flokli@flokli.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121123206.36978-1-flokli@flokli.de>
References: <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
 <20220121123206.36978-1-flokli@flokli.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: ValdikSS <iam@valdikss.org.ru>

Signed-off-by: Florian Klink <flokli@flokli.de>
---
 drivers/hid/hid-lenovo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e9466ae8a9cb..7076407a6340 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -487,6 +487,11 @@ static int lenovo_send_cmd_cptkbd(struct hid_device *hdev,
 	if (!buf)
 		return -ENOMEM;
 
+	/*
+	* Feature report 0x13 is used for USB,
+	* output report 0x18 is used for Bluetooth.
+	* buf[0] is ignored by hid_hw_raw_request.
+	*/
 	buf[0] = 0x18;
 	buf[1] = byte2;
 	buf[2] = byte3;
-- 
2.34.1

