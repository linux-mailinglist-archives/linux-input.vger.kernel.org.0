Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8910204422
	for <lists+linux-input@lfdr.de>; Tue, 23 Jun 2020 00:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731183AbgFVW6W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jun 2020 18:58:22 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:41933 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbgFVW6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jun 2020 18:58:22 -0400
Received: by mail-qv1-f68.google.com with SMTP id er17so8797357qvb.8;
        Mon, 22 Jun 2020 15:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L4Y8hD02oqZu+SaOfCPnfs+mi7sp7RC+va/DwYkp/jI=;
        b=uTuIiRQvB4uyMU1H5dyzVAb2Cj13RdSzOMZfoP3E8J+RbSeGFZ1PlNCz/cpbGZMBQ8
         xsxuemDA9eR0d57VfImYtBDaV1xuN2yLnwNO2gdpolJDWTPLW7TssPh4YrQq5tumKzeH
         n3ln0TwjB1SPCAfF7PAJuuoBlKWFnF4mGXNtQiFRAWKt9+MNiD1DnGFyXK2MnPmxt532
         AM1/2R0oZCGUw7f2eVGeqL39YKodh2yPV4tu/JDkx2E0Ge41byhUfaxN9mvVU9lWQvRn
         Q8+9S/kFdetE88aFeYixslIiXhzyBH3r3/excn6CmfeYMzOULqwHw/rOtB5DGnCg23KV
         axaA==
X-Gm-Message-State: AOAM531Cn990jAad6jdjPlMmYojC/sghT9SGVdH+XNfiFviprfC+7NGV
        ZT0MQdsTm8EMk4UoPVkL0QU=
X-Google-Smtp-Source: ABdhPJzosPNj0FDkbrBMzhphyKJPb7ilUkHZtMoeFjZdiLNxE4eeQcfAqdINpPDfGpKXHeC03fzF+w==
X-Received: by 2002:a0c:f80a:: with SMTP id r10mr7904974qvn.238.1592866701168;
        Mon, 22 Jun 2020 15:58:21 -0700 (PDT)
Received: from DEK-X230.gerbilsoft.gsft (pool-108-24-134-99.cmdnnj.fios.verizon.net. [108.24.134.99])
        by smtp.googlemail.com with ESMTPSA id h52sm7583112qtb.88.2020.06.22.15.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:58:20 -0700 (PDT)
From:   David Korth <gerbilsoft@gerbilsoft.com>
To:     David Herrmann <dh.herrmann@googlemail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Korth <gerbilsoft@gerbilsoft.com>
Subject: [PATCH 2/2] HID: wiimote: Don't use device IDs for Wii Balance Boards.
Date:   Mon, 22 Jun 2020 18:58:11 -0400
Message-Id: <20200622225811.544-1-gerbilsoft@gerbilsoft.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Wii Balance Boards only have a single LED, so the player number can't
be displayed on the board itself. Don't bother allocating a device ID
in this case.

Note that on the actual Wii system, only one board can usually be
connected at a time, and it's listed as Player 4 on the HOME Menu.

Signed-off-by: David Korth <gerbilsoft@gerbilsoft.com>
---
 drivers/hid/hid-wiimote-core.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 9662c2ce5e99..fc25479028bf 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -834,7 +834,7 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
 	__u8 leds;
 	__u16 vendor, product;
 	const char *name;
-	int device_id;
+	int device_id = -1;
 
 	vendor = wdata->hdev->vendor;
 	product = wdata->hdev->product;
@@ -882,12 +882,18 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
 
 	wiimote_modules_load(wdata, devtype);
 
-	/* set player number to stop initial LED-blinking */
-	device_id = ida_simple_get(&wiimote_device_id_allocator, 0, 0,
-				GFP_KERNEL);
+	/* Set player number to stop initial LED blinking.
+	 * Wii Balance Board has a single LED, so don't get
+	 * a player ID for balance boards.
+	 */
+	if (devtype != WIIMOTE_DEV_BALANCE_BOARD)
+		device_id = ida_simple_get(&wiimote_device_id_allocator,
+					0, 0, GFP_KERNEL);
+
 	if (device_id < 0) {
-		/* Unable to get a device ID. */
-		/* Set LED1 anyway to stop the blinking. */
+		/* Unable to get a device ID, or this is a Wii Balance Board.
+		 * Set LED1 anyway to stop the blinking.
+		 */
 		leds = WIIPROTO_FLAG_LED1;
 		wdata->device_id = -1;
 	} else {
-- 
2.27.0

