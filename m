Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF31B4FF17
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 04:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFXCIl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 22:08:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38482 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfFXCIl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 22:08:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id g4so5955803plb.5
        for <linux-input@vger.kernel.org>; Sun, 23 Jun 2019 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+uWzbOBUrw1HiIIOTY4yflDE1EsmIUcZxX/Mjr4AFa8=;
        b=Xo25iUaZSWGIZzxwsvlGdSbiYO16u5jp9akjUCbaRsb02vS9G19gtVfj2ib5LhLDnT
         UOiAYjI+tKtXCEa9nO+Bb1Hz8020x/+wa8PVDDRZxf1U/LI2MJMM2SN0YonWTSbN6PGI
         t6N3nvz9mA4B9OKsmZOfFUDdBE4zOR708i5oti7zruFRYRV82a6F+bUyBzOX9eeOGMhR
         FvYCrszlvBCF3d6laN2AZjrnmKSMNr6IVnZjRjovtw1lDvk/A+dW5J5Bht+VEeaMky15
         /fLzAfBmOZGaVwUd3ikOb0VrcydrqMJQqMBiMXznKuqL+x/LOWFCQSyPC5opse9qjQ9z
         jIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+uWzbOBUrw1HiIIOTY4yflDE1EsmIUcZxX/Mjr4AFa8=;
        b=Ub57NrEDQwXY1g06YqNZhjKi8418DPcMN68+9Rxf0t/TmQwXb/bJg1K7c6qM8zZaVI
         gCgPW9NVomlLFG0C/XYqJUFZfKoqETV3GlENANKcW/TIQaVh2nRc/GG5FZbMcrKav3vD
         tBBQHHFwzOWYWi2cso81TSdblMlKlEEQqKXmc6sXlabWTAntj/86aMh9MIEtxQnrLItH
         T2ZObL+GciCTw+mocWytkWA0Y3vzvkckmukHnBQh9Y7KU15vO/X6V8wKcclHihH+3b4c
         AUMscOtcQl4LD+y8zpMZplISg//xcawtFEdTS8sbmoQp8rr08YP73//GXdnTXmJMojV1
         R5Mw==
X-Gm-Message-State: APjAAAX5VfPZljLPeiEVTB3wUxwTfG5tBF14c0z8fSVpnUDk1uertTqJ
        6KpomVlx3hhlysHQOSbdlMf9zs6a
X-Google-Smtp-Source: APXvYqy7JmnXczUJlEJem0njK7ut9Conf8ZQJK1KVTGMSQrcor3D+BsSZGWXVxZs/xH2k+qddqj7IQ==
X-Received: by 2002:a17:902:a81:: with SMTP id 1mr143465883plp.287.1561334017287;
        Sun, 23 Jun 2019 16:53:37 -0700 (PDT)
Received: from pingc-XPS-8500.corp.onewacom.com ([50.225.60.4])
        by smtp.gmail.com with ESMTPSA id k22sm10105247pfg.77.2019.06.23.16.53.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 23 Jun 2019 16:53:36 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     killertofu@gmail.com, skomra@gmail.com,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: add new MobileStudio Pro support
Date:   Sun, 23 Jun 2019 16:52:43 -0700
Message-Id: <1561333963-12055-1-git-send-email-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wacom_wac_pad_event is the only routine we need to update.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>

---
Patch is based on Jiri's for-5.3/wacom branch

 drivers/hid/wacom_wac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index a98ad4f..8269f46 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2021,12 +2021,14 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 		 */
 		if (hdev->vendor == 0x56a &&
 		    (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
-		     hdev->product == 0x357 || hdev->product == 0x358)) { /* Intuos Pro 2 */
+		     hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
+		     hdev->product == 0x399)) {				  /* MobileStudio Pro */
 			value = (field->logical_maximum - value);
 
 			if (hdev->product == 0x357 || hdev->product == 0x358)
 				value = wacom_offset_rotation(input, usage, value, 3, 16);
-			else if (hdev->product == 0x34d || hdev->product == 0x34e)
+			else if (hdev->product == 0x34d || hdev->product == 0x34e ||
+				 hdev->product == 0x399)
 				value = wacom_offset_rotation(input, usage, value, 1, 2);
 		}
 		else {
-- 
2.7.4

