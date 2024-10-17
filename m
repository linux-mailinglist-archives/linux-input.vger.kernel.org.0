Return-Path: <linux-input+bounces-7514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7F9A2C33
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 20:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3159E284253
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 18:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAEF1802AB;
	Thu, 17 Oct 2024 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDA90Rhr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442742AB9
	for <linux-input@vger.kernel.org>; Thu, 17 Oct 2024 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189884; cv=none; b=Geul7lXXHMHxqWeJOQlGrXKXx+E/Gs5hYB9V+/aP8LVsSyty7MfN0XDJ9O2KsdxGjPhDaRGeWEPWq+p5ymBXi3mLJBlaotxMR6yoVv7BMMbiIOrT9PD0oeHn4e2fNb+3z08xaf7qMe7SxeSho7q5wJzinkFXkjVOmWyUeuOod3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189884; c=relaxed/simple;
	bh=QsZkGcWPpR+lrBcNO34pa7K4nnXImPy0zKAWolFW7oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9BOuibnSIjEO/lknDIZit9OpZYdPUAvRvUllUb5pY77S4zwffZuZUfboU0xJ2B2nZ9VX3AHsulvBgY+DAjL5h9jAHydcpABL3SzY0MdpE6MMCIvqF+uiwyLuCCSbQm8hsE7mRZAzdHrG2XprRqydRITGfwoDK/G0WYtTgku3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDA90Rhr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso1376717a12.2
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2024 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729189878; x=1729794678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDxPGYmVkoLe4apJd49l1Qr6trGQLdEGeW53l/1fSZE=;
        b=IDA90Rhr3A/PnkanEaK8H0CNoa4NlDzzX1YVjAQ5dkngMp6nmrjKni9pgCt8A3+t4y
         10bqZxM7HUi57jnCWKmeIY5g1TuUwfxnbOlLH5Utt6Ld4Onrm9p/SPuXo0DLqu7qQBb/
         8Nlube4PWaFl8FSOnqIbTGKHWWObFhcbXthbhC2tZ3dct3qSk/gOb/AUzxBFjt1ckY9W
         wI/k4aCmp8YRK+s9saHcA/ZZyG/Q+3LYjW/7swsMmkONQ+g9FNrfQ+oONCRFGnjF5al5
         JHvSjbac4snLcyW1ZUMs33Qks3jsgnoZqek3i2A1h/qG9k32jn2jP6V41LS5qLa3l/hX
         LqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729189878; x=1729794678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDxPGYmVkoLe4apJd49l1Qr6trGQLdEGeW53l/1fSZE=;
        b=ViIXXPSmE3mVUVwSY4WyIQvRs2r/ZwrxFe4dKscdw8RaYu6QxZp3oMUqC5SaynQxDR
         5hhgMlxUK7rXcqu/HDNiO47pRnPAvENNpetCOP3qT37doW818A8dwNzvJOKlGwkbfRJN
         pHpEjW0kTmaXnJl+Sfai05jzRY4JCfE4BhPVQJtkBHBoxcNcxtuBR9v6NrCR/nuFpirQ
         6RHXbJDZ60B8tLXNMmJh7ED13XyJYLYkfXtVlKBvA8TJj68g+jeSKjM88rOuL7Bt2zkh
         He7rE1EVIVDXWl0RlHlhiSQs6gnL0uDK7A2D/4U/BvDexVUcKGephxbLDZAAxamm13JK
         D+zg==
X-Gm-Message-State: AOJu0YyQOHLH+o88hyOo/Vo4CtrrbFjJ1CCThsegpqh74WPX1VcT1iuf
	O1xvC8XUEpTkdadTi8BcwMAkP0e0vNyERFMVCb6xsUP80kYLYKuYxltmOA==
X-Google-Smtp-Source: AGHT+IEdvZkQ1iqYvgwXSBTee3wg6+GIQhzogo8tL0Oa2sZ56o7iddHGSatrK8eUv17OGRKO3E+50Q==
X-Received: by 2002:a05:6a20:c992:b0:1cf:4da0:d95c with SMTP id adf61e73a8af0-1d905efd2d3mr12739538637.23.1729189878075;
        Thu, 17 Oct 2024 11:31:18 -0700 (PDT)
Received: from localhost.localdomain (75-164-192-68.ptld.qwest.net. [75.164.192.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77509e09sm5047907b3a.194.2024.10.17.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:31:17 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Set eraser status when either 'Eraser' or 'Invert' usage is set
Date: Thu, 17 Oct 2024 11:31:13 -0700
Message-ID: <20241017183113.631272-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Microsoft defines two slightly different behaviors for pens that are
being used to erase. The first one, for pens that can be used while
inverted specifies that both 'Invert' and 'Eraser' usages should be
set while the pen is in contact and erasing. For pens that use an
eraser button though, they specify that only the 'Eraser' usage should
be set (while hovering, only the 'Invert' usage is to be set).

We used our internal 'invert_state' flag to determine if a pen has an
intent to erase (whether hovering or not). That flag was previously
only depending on the 'Invert' usage, which was sufficient for the
first type of pen (EMR) but not the second type (AES). This commit
makes the flag depend on either usage being set, and also renames it
to make its function more clear.

This change should not normally have an impact on userspace due to
both the existing driver and firmware design. The driver already only
determines tool type based on the first event in an interaction (e.g.
it will see the 'Invert' bit set when the eraser comes into prox and
then report BTN_TOOL_RUBBER for the rest of the interaction, even if
'Invert' is cleared). AES firmware is also careful to send reports
that work through a set of defined state transitions, even in the
corner-case where the eraser button is pressed when the pen is already
in contact with the display (Prox|Tip -> Prox -> 0 -> Invert -> Eraser).
Regardless, it seems reasonable to ensure the driver's state variables
match programmer expectation.

Link: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-pen-states
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 7 +++++--
 drivers/hid/wacom_wac.h | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 413606bdf476d..fd0de9bae3d9a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2422,9 +2422,11 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 			wacom_wac->hid_data.sense_state = value;
 		return;
 	case HID_DG_INVERT:
-		wacom_wac->hid_data.invert_state = value;
+		wacom_wac->hid_data.eraser |= value;
 		return;
 	case HID_DG_ERASER:
+		wacom_wac->hid_data.eraser |= value;
+		fallthrough;
 	case HID_DG_TIPSWITCH:
 		wacom_wac->hid_data.tipswitch |= value;
 		return;
@@ -2565,7 +2567,7 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 
 	if (entering_range) { /* first in range */
 		/* Going into range select tool */
-		if (wacom_wac->hid_data.invert_state)
+		if (wacom_wac->hid_data.eraser)
 			wacom_wac->tool[0] = BTN_TOOL_RUBBER;
 		else if (wacom_wac->features.quirks & WACOM_QUIRK_AESPEN)
 			wacom_wac->tool[0] = BTN_TOOL_PEN;
@@ -2619,6 +2621,7 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 		}
 
 		wacom_wac->hid_data.tipswitch = false;
+		wacom_wac->hid_data.eraser = false;
 
 		input_sync(input);
 	}
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index c8803d5c6a71e..0c3c6a6aaae95 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -300,7 +300,7 @@ struct hid_data {
 	__s16 inputmode_index;	/* InputMode HID feature index in the report */
 	bool sense_state;
 	bool inrange_state;
-	bool invert_state;
+	bool eraser;
 	bool tipswitch;
 	bool barrelswitch;
 	bool barrelswitch2;
-- 
2.47.0


