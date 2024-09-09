Return-Path: <linux-input+bounces-6374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309989723BD
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 22:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F30B236C1
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 20:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6917313B2B0;
	Mon,  9 Sep 2024 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il7UZta0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3006189F57
	for <linux-input@vger.kernel.org>; Mon,  9 Sep 2024 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725913936; cv=none; b=hEB+9TYeFeEPrsBoaFRaNn16fAGnLxRBOHjtMcai+sWvq/ry/sEJTXRN3OkRWUHvz8aVUtm6tVlbc/ylOIX41oRZw2ZMZ7hqs7TMbNcga7VOC8l+1ANutCTb0hnDt3oUfkXYFt8u+o1gJxEHPxlgyuJl78cBJ1XwqAvUnx/T6ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725913936; c=relaxed/simple;
	bh=i+Xy7PVzbOh9JFFzQIGZ7nRYDld0P4P+Y5hcjj43uPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSmoNfZ4zpbCc2lGsWoE42YigaOtukVZXqUopH9MJGGZYFF02ar51CAl3AVCAiveCTy3WPG5Wf037QQrZVEEfPs1Jjf6fX4qixSlqg8XUs2rVJrk0tHy0Ko+Xb3OLArjO5pRu7SRlmsDW2Wh/uaLrzsqR2NUV7F8dFFaE7gmoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il7UZta0; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so3787848a12.2
        for <linux-input@vger.kernel.org>; Mon, 09 Sep 2024 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725913934; x=1726518734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vpYjGJ0ua1E6dpg64gj/fCqbz10Lnv+rQh/+Bu1a34=;
        b=il7UZta0ilW9tpt5GKU0X+3TlUj5X6xN/H6XBOyFPAuNoe/NkVW29YeO6kqSoNAJL7
         Ya/fO/nyuyIzhSblrAcd6dL0o7eVNC1XwALH3YTS29H+KPIOUlVZ7acaWbXH/tGzhHpL
         khX7AwAU6Z5g5cN8udFur/GEiYEB1TUYsqefQqx3+N7WwyHRv26OfwwGnkgfsVfvoDXA
         6NKathWY1zA88MuBnsEqTZ9ejMR/DTHY0NvKyYejDyxGOKX5wami8M7sFhnIScnJadoY
         a7AJn9NHNypMmxRUdyC6FO1YbyVXQNXdzbQILp3SsYg8a5JPUxBV5Oju1rXO/DwMnNrb
         pQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913934; x=1726518734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vpYjGJ0ua1E6dpg64gj/fCqbz10Lnv+rQh/+Bu1a34=;
        b=lj57UL5hBnBHYoYwNTn1bOoHKtPoQudkiWRVIFzgfMItrj2GOsW9KGYCcg4/eKsX9q
         +fGAIuKl3aV0AmjUO7u27AeVgZc/IWkMLZerrDHwqfHGcp9ef832FsvmRm/OR52QJkm4
         IXxsMt1hVDZ0DW8T4Szm/HG8jQApeKuDk/QrOM8PnaSLo95mZj8lweDdiG7iUJWXWq6r
         kXW9Ygc9rHywKmhJLL07ctHpKGEO4sI0MeTSqqjaHzXShVbo3G0vAEnrj4wbuJSJSal6
         8PSdG/PDtk7ZCrmcb8p0EMkfwf7JHQ0Ia0k7Nh8N3lVpybPBq9m1O6upioXPN7j5+Vp6
         fLKQ==
X-Gm-Message-State: AOJu0YwTMga4ZSj4VIC4elhNnDJ7uXcLrD/K6kxat6GNBd89dpXKQHeZ
	RFfMI+x+hRjA6G2X20oyEzB32m+QOGQezOXSPvPJa0/6W8Ivjm+n1SRGnA==
X-Google-Smtp-Source: AGHT+IE1Co5ZzvgNe2RSoq1O0EGmAYwsbT06K9fYsY+ykgO/+Tie+ZCuho1Wwy1OZv2ZsyFdB786kg==
X-Received: by 2002:a17:902:b696:b0:205:709e:1949 with SMTP id d9443c01a7336-2070a817383mr89638155ad.57.1725913933671;
        Mon, 09 Sep 2024 13:32:13 -0700 (PDT)
Received: from localhost.localdomain (71-34-65-148.ptld.qwest.net. [71.34.65.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823736630sm4406787a12.9.2024.09.09.13.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 13:32:13 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Joshua Dickens <joshua.dickens@wacom.com>
Subject: [PATCH 2/2] HID: wacom: Do not warn about dropped packets for first packet
Date: Mon,  9 Sep 2024 13:32:08 -0700
Message-ID: <20240909203208.47339-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909203208.47339-1-jason.gerecke@wacom.com>
References: <20240909203208.47339-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

The driver currently assumes that the first sequence number it will see
is going to be 0. This is not a realiable assumption and can break if,
for example, the tablet has already been running for some time prior to
the kernel driver connecting to the device. This commit initializes the
expected sequence number to -1 and will only print the "Dropped" warning
the it has been updated to a non-negative value.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Joshua Dickens <joshua.dickens@wacom.com>
Fixes: 6d09085b38e5 ("HID: wacom: Adding Support for new usages")
---
 drivers/hid/wacom_wac.c | 6 +++++-
 drivers/hid/wacom_wac.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index cef08737a6240..59a13ad9371cd 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2388,6 +2388,9 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_STYLUS3, 0);
 		features->quirks &= ~WACOM_QUIRK_PEN_BUTTON3;
 		break;
+	case WACOM_HID_WD_SEQUENCENUMBER:
+		wacom_wac->hid_data.sequence_number = -1;
+		break;
 	}
 }
 
@@ -2512,7 +2515,8 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		wacom_wac->hid_data.barrelswitch3 = value;
 		return;
 	case WACOM_HID_WD_SEQUENCENUMBER:
-		if (wacom_wac->hid_data.sequence_number != value) {
+		if (wacom_wac->hid_data.sequence_number != value &&
+		    wacom_wac->hid_data.sequence_number >= 0) {
 			int sequence_size = field->logical_maximum - field->logical_minimum + 1;
 			int drop_count = (value - wacom_wac->hid_data.sequence_number) % sequence_size;
 			hid_warn(hdev, "Dropped %d packets", drop_count);
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 55e0c7a9fdcb4..c8803d5c6a71e 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -326,7 +326,7 @@ struct hid_data {
 	int bat_connected;
 	int ps_connected;
 	bool pad_input_event_flag;
-	unsigned short sequence_number;
+	int sequence_number;
 	ktime_t time_delayed;
 };
 
-- 
2.46.0


