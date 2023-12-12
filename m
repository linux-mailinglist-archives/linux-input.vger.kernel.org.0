Return-Path: <linux-input+bounces-731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BA80F8C2
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 21:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70C31C20D20
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 20:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D0065A75;
	Tue, 12 Dec 2023 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSzkrGt9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1D6DC;
	Tue, 12 Dec 2023 12:57:46 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5913b73b53eso568306eaf.0;
        Tue, 12 Dec 2023 12:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702414666; x=1703019466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NtwutO0Yef1IT5J57pTjQTn8pKKW2uFYT3a6IzSDIk=;
        b=iSzkrGt9YcWtIwy6TK/BkeZjGiJ6aRvsDLMoLYbXvHumtXEvFHK016tRckXNdSsgXL
         eUK3LsD0Pkt7OEFdvich6/HHEcOfgqG+eSlPO3XRCXO8xEKiaZdi5Grvg5e8G1eLKBY8
         BeZkpOFhj5FuY1qWPSUGvzZr7buSfEFo4Td2Z0w1qhqWPJ410y+3mospynj3/fXAkTS0
         OaPmdekPiEkt8+yHpBIJEq1lfOW4Oc2mZndzXyJBFIo/R70HBO5x4vmkMTIW5GNQzL0t
         BMMXDD7/bKGS08cOClFhIDqAmuOYME/25wpWk1wncDo6kysZd78UwSqakg2QfdG9geZE
         CU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702414666; x=1703019466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NtwutO0Yef1IT5J57pTjQTn8pKKW2uFYT3a6IzSDIk=;
        b=tNpZpb9D0qHc8ZZFSjLnCphKQiXfd89emxd1IUj5a2VDLsNrdzXL9qJdvwVen0jMAR
         kAo64JxQ5Ch1aLuw7gIUbs6MsWMeR2p+SCm7cvEXL2QrCMARyYsL1Y7xETGl8DcGf6PW
         yR1LwcV4/PxIoWyLzFbv5YlBlSpaIu6Q5aHx2MhF21Nfan7+ku/svouDFXwSmkPeB/2+
         /6Mb/B50rywp0W/UjuNZyKlLqIEDa69nikDruD2TmSFjQO4BInDHjteTuILyL/JJijmw
         MLzfy39AP36mzMZ2/qAunbxKAiCDLM4/qtOMgheVBVXHE+5gwuxlDR5wXf8a7xQ/vDEv
         ceqg==
X-Gm-Message-State: AOJu0Yz7qEnFltk163W3pz6B/FxLDpyPEVfyt8wC1KrO0fU7aGCL8W6e
	AEidSIY7KU1ePhQO12C2/uC1wrcKeMx4/w==
X-Google-Smtp-Source: AGHT+IEJjhRfAy7pnP/eL1tGE6KOLoprpMkpj+uSUAQSFJlvI5Px2dDNj5hSKoUX5IzshPV9ZhdqGg==
X-Received: by 2002:a05:6820:551:b0:590:96a7:34c2 with SMTP id n17-20020a056820055100b0059096a734c2mr5493515ooj.14.1702414665903;
        Tue, 12 Dec 2023 12:57:45 -0800 (PST)
Received: from guyc-asus.. ([173.216.104.94])
        by smtp.gmail.com with ESMTPSA id h26-20020a4a281a000000b0058df6ae23fdsm2634981ooa.33.2023.12.12.12.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:57:45 -0800 (PST)
From: Guy Chronister <guylovesbritt@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: elo fix coding style errors.
Date: Tue, 12 Dec 2023 14:57:44 -0600
Message-Id: <20231212205744.36089-1-guylovesbritt@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix whitespace errors and missing spaces around ==.

Signed-off-by: Guy Chronister <guylovesbritt@gmail.com>
---
 drivers/hid/hid-elo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 2876cb6a7dca..d91d6ef4de9a 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -33,7 +33,7 @@ struct elo_priv {
 
 static struct workqueue_struct *wq;
 static bool use_fw_quirk = true;
-module_param(use_fw_quirk, bool, S_IRUGO);
+module_param(use_fw_quirk, bool, 0444);
 MODULE_PARM_DESC(use_fw_quirk, "Do periodic pokes for broken M firmwares (default = true)");
 
 static int elo_input_configured(struct hid_device *hdev,
@@ -193,7 +193,7 @@ static bool elo_broken_firmware(struct usb_device *dev)
 	u16 fw_lvl = le16_to_cpu(dev->descriptor.bcdDevice);
 	u16 child_vid, child_pid;
 	int i;
-    
+
 	if (!use_fw_quirk)
 		return false;
 	if (fw_lvl != 0x10d)
@@ -205,13 +205,13 @@ static bool elo_broken_firmware(struct usb_device *dev)
 		child_pid = le16_to_cpu(child->descriptor.idProduct);
 
 		/*
-		 * If one of the devices below is present attached as a sibling of 
-		 * the touch controller then  this is a newer IBM 4820 monitor that 
+		 * If one of the devices below is present attached as a sibling of
+		 * the touch controller then  this is a newer IBM 4820 monitor that
 		 * does not need the IBM-requested workaround if fw level is
 		 * 0x010d - aka 'M'.
 		 * No other HW can have this combination.
 		 */
-		if (child_vid==0x04b3) {
+		if (child_vid == 0x04b3) {
 			switch (child_pid) {
 			case 0x4676: /* 4820 21x Video */
 			case 0x4677: /* 4820 51x Video */
-- 
2.40.1


