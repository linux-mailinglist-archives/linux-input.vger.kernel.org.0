Return-Path: <linux-input+bounces-6373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D419B9723BC
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 22:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9AD1F244A5
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE68317623C;
	Mon,  9 Sep 2024 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl4fSYa7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02913B2B0
	for <linux-input@vger.kernel.org>; Mon,  9 Sep 2024 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725913934; cv=none; b=JG5UUm9FLo9vKJkThXPD9NU2YKcBXxCcE2cRf1vZAaJYCnRj0MtlTDb+rdE2mQViMjdJ6LCTWYYTxrglbp7wBDyUn2POcOkU61ycLOwEO4t0RrESfo8/pFC0NXKPTMzalzCdeltH38OPDT4jh3c5UM0cWRoiCZlrPtew4dMClsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725913934; c=relaxed/simple;
	bh=kbKiqmucJyArKgR3xr50CXFA7M+DUcILpDwu7OHBxF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+hwA9gGGEqI2D2lxe9ChJx0N6tLztMR16hCf28T6PLmWZHhXikf7liUYBqdVhwA0PC5IOoZo7y4Ci2RdBCRZN/wrb8ymYmFJYmGb9FZeGVNSn1WA/Ic3k0cjpm9zFOruYmoE8jJaAPZ/r9VG9BdrIy/VbH/xl3Gi82zJAngWU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl4fSYa7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206b9455460so39377535ad.0
        for <linux-input@vger.kernel.org>; Mon, 09 Sep 2024 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725913932; x=1726518732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1N4xVF1ei9/Ktxsre7AID2lFh75C0GoLvtSOUs2cWQ=;
        b=kl4fSYa7W0lgdadwSUkneBpkfmBtFS/bGX8N2t63owupmZkyuL1qB6UdGfobhZuNF4
         4uPtNt9+gOTiEEi6g8zn5ue5CeKWFug9qiuCDZpynVpYp5QoosCUQgC5/KgDgi/zRt8G
         U9VInXdd/HFP/eHbPoPEsIvP/pMuXHRSKW3ZVxQFtKGql0cwEEY4wiCvaCwjpL8DuFMl
         6LiiyQXQcw359bOB4N1tgx+zAypHerHIZ4+hsmvaDxVFaKEQ5PZ9AvV6LcaTMFULPXNx
         Y0FLrd5Lwxjhd+RUgRHUZe52zLybLjtSDbHLDVovpGXQp5ptTfTg7XJk7t9bXVP6pXXd
         Eg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913932; x=1726518732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1N4xVF1ei9/Ktxsre7AID2lFh75C0GoLvtSOUs2cWQ=;
        b=Vqizm84oGLedz0h8vCMTPH0ByL2jqgIW3FEMi5GRf0Kb/aMTprjDIL7sKC05ERqcBv
         qNNq9K0E1OUaXkrINESki/NmFFWflXTnSIiXfs9xUvK1TnbOQa0w/jueGLoG8Oty27RO
         leYg1beO7XyXRa0uykEauHdvSPplFYqqB0LvGWc2dNJZupRunPzuBravOmVBZV6M073A
         1WyZN0/iVOGDHVSiJAzB7dfbdVU/BvHduF2wzCoMozW3m0kuaaIiWgy996erzFtqvhgg
         FV48pn5/IVHHMnU1cjLKspZen4aq7Sb8Qy/Mfd/S+l/pq4bbrEfv7LHu4EUu1e6Uo5ye
         SBmQ==
X-Gm-Message-State: AOJu0YwQWtxn39Z8wd/Eb0eM1jVPY2CxVvDOd4hvc4Kt+n5Wtr8uHIdb
	9TyYb6ca61cDvSGtOmHzRaON6/gv4SKsTXZ2Q10yN8//BQ0tCjiEfwh7YQ==
X-Google-Smtp-Source: AGHT+IH0PLywJd0F8g4UsbCiQuywopeyGC5pqmhXuSTYGNaLLZoCWqMwqJyBhAQILaTwCH77nWRRjA==
X-Received: by 2002:a17:902:c408:b0:1fd:8dfd:3553 with SMTP id d9443c01a7336-20743a2de20mr11250635ad.18.1725913931704;
        Mon, 09 Sep 2024 13:32:11 -0700 (PDT)
Received: from localhost.localdomain (71-34-65-148.ptld.qwest.net. [71.34.65.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823736630sm4406787a12.9.2024.09.09.13.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 13:32:11 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Joshua Dickens <joshua.dickens@wacom.com>
Subject: [PATCH 1/2] HID: wacom: Support sequence numbers smaller than 16-bit
Date: Mon,  9 Sep 2024 13:32:07 -0700
Message-ID: <20240909203208.47339-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

The current dropped packet reporting assumes that all sequence numbers
are 16 bits in length. This results in misleading "Dropped" messages if
the hardware uses fewer bits. For example, if a tablet uses only 8 bits
to store its sequence number, once it rolls over from 255 -> 0, the
driver will still be expecting a packet "256". This patch adjusts the
logic to reset the next expected packet to logical_minimum whenever
it overflows beyond logical_maximum.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Joshua Dickens <joshua.dickens@wacom.com>
Fixes: 6d09085b38e5 ("HID: wacom: Adding Support for new usages")
---
 drivers/hid/wacom_wac.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 74258a78d0408..cef08737a6240 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2512,9 +2512,14 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		wacom_wac->hid_data.barrelswitch3 = value;
 		return;
 	case WACOM_HID_WD_SEQUENCENUMBER:
-		if (wacom_wac->hid_data.sequence_number != value)
-			hid_warn(hdev, "Dropped %hu packets", (unsigned short)(value - wacom_wac->hid_data.sequence_number));
+		if (wacom_wac->hid_data.sequence_number != value) {
+			int sequence_size = field->logical_maximum - field->logical_minimum + 1;
+			int drop_count = (value - wacom_wac->hid_data.sequence_number) % sequence_size;
+			hid_warn(hdev, "Dropped %d packets", drop_count);
+		}
 		wacom_wac->hid_data.sequence_number = value + 1;
+		if (wacom_wac->hid_data.sequence_number > field->logical_maximum)
+			wacom_wac->hid_data.sequence_number = field->logical_minimum;
 		return;
 	}
 
-- 
2.46.0


