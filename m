Return-Path: <linux-input+bounces-6104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B696A66F
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 20:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98525280F35
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 18:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C15219007E;
	Tue,  3 Sep 2024 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nigd5Utz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B7E18C920
	for <linux-input@vger.kernel.org>; Tue,  3 Sep 2024 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388001; cv=none; b=OPIGE2hdUOCBZ6AF9QoketgottBtTzfurHX6ReJg1EwveLR4Fdl1w7bjWeKISIrM0jbpW+9gellBGut4n4NJ2VbGRzc/3EwfqYTH2Tm8pJgiJO8JKWGqetbioilWjMh/LVJvDe7VfJ19HEa9O5YV1vilqmNb/r735y2ovrnVqdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388001; c=relaxed/simple;
	bh=7JpSXBGb1BxI44IxN1PFq7cJCPJbHqiUbBx7y/j9hoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhkj5J1HK4m/pHnC98jVsQdOnKzIygyYTuQY70RtW0sJmnhjSx899enq7eManMD0xV0441KnXsWaBT/IGmWrP/3VZWJcN6FuKpGjF89m4j3cnFZh+L/A9seD120dCbuvXzdbpkrI1sG4N90OpInYhCveN1PYEpIfzAIfOfSuv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nigd5Utz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-715abede256so4280983b3a.3
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2024 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725387999; x=1725992799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DI6s7dWiW924OiqukqGABugkqrC1Rn9q3M20Tece3BM=;
        b=nigd5Utz239oskzXMITmBHB2O2MXgNAbdTnBw0wQfqfb3pvobg76ExOBOjkSpypbpj
         +BvH9hzJkzjAoW4tbLjsXMO9mNtMdD+Pk+Qd3rGiAVFnw1U3MuZFQ5SUyg1HN/aY/C3h
         LvJfDHicpQCQsqAaYNIeBZyrKXDzNCjFuQvhyNdZ9DCr4pTJz69ZYqQwR30sRUMxzKPt
         gQkE6iit2RX1gDjHMd+BRxb9TeohER7hyAm7JXBYt8L2mgU2JATR2/b40nP3H2E3X7YU
         S5YNs/fUGHYX/15f1gHN+2/CK2YmgprExPunjV2vz5t9CJXEmKBpD2vGbDN9sV9dMVsw
         QKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725387999; x=1725992799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DI6s7dWiW924OiqukqGABugkqrC1Rn9q3M20Tece3BM=;
        b=oA+5/OscyxiCzPnBnXuLj1mjSZ07AxcxxYaCjyGkwZ/yInyvBLI/H/JfQlHhJfAVbx
         4SsdMPbwMxoU8hG+yy/KtPU19mm+9LQdjQxl3MpW08XcNdMciCu/e6WiD8dhNoIiVmu3
         WD7j5QHDlcvlKlMVrtQrgXIcJm+QTusM3/s94o+SRofvVs/MPytP37ppK0chjKbEh/WC
         fvKnP88Lb8O4Swb8ycF+mZpofY/FRYHJNol2wbSBpHz0mYFrv6WS3+C+BFx9JtbqqMuc
         qiBXBckj2KPfTqKbN0u7kvKkauIf24vxtUCyrJHULllRjesEQwJV+24WoG91rkcQpsQv
         4W6w==
X-Gm-Message-State: AOJu0YxatnMBv6K4+dfUMLQ3wKbpQDkBogCNsNkH0ntE+rF8uWNUh1AJ
	xo4uOJat0fPTUCpaZcHDvyGwTTBo2+YLk+Yf/eXNGa0ZuX7h7RfwFnfarg==
X-Google-Smtp-Source: AGHT+IFJlMZ8rG69ai60wOR9dFaySQVDORMWR7DBMDp63v5y5uHBDj63bECtBv73ZmpW70aWcFLeyA==
X-Received: by 2002:a05:6a21:1693:b0:1cc:dedd:d8ff with SMTP id adf61e73a8af0-1ced62de827mr9400929637.43.1725387998612;
        Tue, 03 Sep 2024 11:26:38 -0700 (PDT)
Received: from horus.corp.onewacom.com (71-34-65-148.ptld.qwest.net. [71.34.65.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778598f64sm168666b3a.165.2024.09.03.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 11:26:37 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [RFC PATCH] HID: wacom: Stop mangling tool IDs
Date: Tue,  3 Sep 2024 11:26:33 -0700
Message-ID: <20240903182633.870892-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

In ancient times, an off-by-one-nybble error resulted in the Wacom
driver sending "mangled" tool IDs to userspace. This mangling behavior
was later enshrined into a function so that devices using the then-new
generic codepath could share the same broken behavior. The mangled IDs
have not historically been a major problem for userspace since few
applications care about the exact numeric value of the IDs. As long as
the IDs were unique it didn't much matter. Some programs (cross-
platform and remote-desktop applications in particular) /do/ rely on
the IDs being correct, however.

This patch rids the driver of the mangling behavior.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
---
I'd like to get the opinion of the kernel maintainers on making a
change like this at some point in the future. There are _very_ few
userspace uses of these IDs (primarily: drivers, compositors, and
tablet control panels) and my plan is to update those bits and then
give some time for the changes to roll out to users before re-
submitting this for real. I don't expect any kind of breakage since
we'll be taking our time with the rollout and userspace needs to
have handling for "unknown" IDs anyway (since Wacom periodically
releases new pens).
---
 drivers/hid/wacom_wac.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 2541fa2e0fa3b..facab5bd37e41 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -671,11 +671,6 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	return 1;
 }
 
-static int wacom_intuos_id_mangle(int tool_id)
-{
-	return (tool_id & ~0xFFF) << 4 | (tool_id & 0xFFF);
-}
-
 static bool wacom_is_art_pen(int tool_id)
 {
 	bool is_art_pen = false;
@@ -1010,8 +1005,7 @@ static int wacom_intuos_general(struct wacom_wac *wacom)
 		break;
 	}
 
-	input_report_abs(input, ABS_MISC,
-			 wacom_intuos_id_mangle(wacom->id[idx])); /* report tool id */
+	input_report_abs(input, ABS_MISC, wacom->id[idx]); /* report tool id */
 	input_report_key(input, wacom->tool[idx], 1);
 	input_event(input, EV_MSC, MSC_SERIAL, wacom->serial[idx]);
 	wacom->reporting_data = true;
@@ -1379,8 +1373,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 
 			input_report_key(pen_input, wacom->tool[0], prox);
 			input_event(pen_input, EV_MSC, MSC_SERIAL, wacom->serial[0]);
-			input_report_abs(pen_input, ABS_MISC,
-					 wacom_intuos_id_mangle(wacom->id[0])); /* report tool id */
+			input_report_abs(pen_input, ABS_MISC, wacom->id[0]); /* report tool id */
 		}
 
 		wacom->shared->stylus_in_proximity = prox;
@@ -2514,13 +2507,6 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 		input_report_key(input, BTN_STYLUS2, wacom_wac->hid_data.barrelswitch2);
 		input_report_key(input, BTN_STYLUS3, wacom_wac->hid_data.barrelswitch3);
 
-		/*
-		 * Non-USI EMR tools should have their IDs mangled to
-		 * match the legacy behavior of wacom_intuos_general
-		 */
-		if (wacom_wac->serial[0] >> 52 == 1)
-			id = wacom_intuos_id_mangle(id);
-
 		/*
 		 * To ensure compatibility with xf86-input-wacom, we should
 		 * report the BTN_TOOL_* event prior to the ABS_MISC or
-- 
2.46.0


