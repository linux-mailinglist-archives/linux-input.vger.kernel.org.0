Return-Path: <linux-input+bounces-5213-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8C9415C8
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2482841CC
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3361BA874;
	Tue, 30 Jul 2024 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3tM6Z+K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BA81BA882
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354734; cv=none; b=CYg8Lh8824zr/qkGzJiIwlSTbEIEMTyhi5Jd1bN7XSjC6+MFs4qpJiDiXDfY9zLMVAERTpk/FIGUD2FnKCC17sos0olOtmqlcu5i0sfQ0kZWu5Jc/28C7rsC8tm7HIjkrms1m+9AXsB8Bk9NSvsdqML2wZLkw3oypj4rAmw5zSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354734; c=relaxed/simple;
	bh=v5e/IuWMGYfiUxz6H+zHQ+Ep/y19tWPY1QrZkU7uVks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCXS18j+MB2k2lBwg/8W8ARPqFQI4KLJtPiwLKLfV8GLT4xe1h9Hdm6J2vkPVt7X8GrqfyDG390MIn/x41b1mMCIJaCFnKyxIa8+2isoQ03ksaK2vitjY5sgl9UezcOdsAJ6bjy1GVwlkgoc9YFHQo3xjfKXLVG0uCH68zH1gzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3tM6Z+K; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cf11b91813so3014956a91.1
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354731; x=1722959531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QznQgl7IMPwXRn13HQau8DQv3i//tPPE+dJlmMF5Xw=;
        b=R3tM6Z+KIcVYeSOZyV6B99DpOBtE/zqTPl4+XBe4EhX06RzZ4V31v69SDazIiL1U1h
         8EaHiO1owlZTHFR2y+/o4UDWIgYD4OqmeUycf4RgpwbXPGQHfry+1MSshCLXMtDCC7cO
         xts4e76ZmJeQ8pTbliLg6HtBTpd1DZ1LXcrE2LxkyC7P2t/tWcUdAV4zzJ50JBc3Zn2k
         zEOxQydkmfZqUOdW2a76IK4VXTJKyveqqZlWyd3E5jtGf7Wgay+I4g9NB3w9Ggyexn30
         0J71XiOyR2x4JjlcsJrE7oHWxNi6ITub90ZZPxlMabcMDpacRpH91RuGVjHSwt5pj4il
         XXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354731; x=1722959531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QznQgl7IMPwXRn13HQau8DQv3i//tPPE+dJlmMF5Xw=;
        b=R/Wwbc2VpJHQLghOYHxs3NnmP+MOwrJQNVS3QR88i6csnuJa8ZT6qPUYreusX+I4Ni
         6qhsS0eclKF2sJoRJtsBLlRQ9y/cJXRqi1OwkrgxSl+wK4JFMDyeocxiGD4GofIgnEA6
         4gz3gB7DTBNo/NcjZiHBY0AgVGmVFJzw5DcVHm/DoXVwVYkb6WBMKiGHPUlsGy+hwVwD
         4Gd84ZHjSXdHhcEyyy5GvJ1sryzck449404tQCqDCq2YIq1fG25O3aaUrIaXI2IFUvvv
         AWGyAI0wE6w1lu4ngjrPn5xWihvnScYtGd/9DvIkZIqwtu93qUEqdUJ5oH/WmB2gNUUD
         xpTA==
X-Gm-Message-State: AOJu0YxEpyIFFqsNs4GiMdfNcLqNUw+SxRT3D7v8j34RjO8qt2DKWUwH
	LR7IG5des1joNG6qaY6surYT5ZjKsGaZLCFyKMvY8zlIX0MgfKXfGCoCiQ==
X-Google-Smtp-Source: AGHT+IFrCxGoxE87NfNjTcc3J4UGBNaa+Wm/4b/nzFp6FzZnuQ3wSDDOSFDpIcqJdipOhAXik5hr8Q==
X-Received: by 2002:a17:90b:50e:b0:2c9:6ad9:b75b with SMTP id 98e67ed59e1d1-2cf7e72beabmr8118198a91.40.1722354731186;
        Tue, 30 Jul 2024 08:52:11 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7600054sm12788517a91.47.2024.07.30.08.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:52:10 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 5/5] HID: wacom: Support devices with two touchrings
Date: Tue, 30 Jul 2024 08:51:59 -0700
Message-ID: <20240730155159.3156-5-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730155159.3156-1-jason.gerecke@wacom.com>
References: <20240730155159.3156-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

If a device has more than one touchring, we want to be sure that userspace
is able to distinguish them. Following previous standards, the first
absolute ring will be reported as ABS_WHEEL and the second as ABS_THROTTLE.
Relative rings will use REL_WHEEL_HI_RES / REL_WHEEL for the first and
REL_HWHEEL_HI_RES / REL_HWHEEL for the second.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 58 ++++++++++++++++++++++++++++++++---------
 drivers/hid/wacom_wac.h |  3 +++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index e45abc973363a..74258a78d0408 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2049,10 +2049,21 @@ static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
 		break;
 	case WACOM_HID_WD_TOUCHRING:
 		if (field->flags & HID_MAIN_ITEM_RELATIVE) {
-			wacom_map_usage(input, usage, field, EV_REL, REL_WHEEL_HI_RES, 0);
-			set_bit(REL_WHEEL, input->relbit);
+			wacom_wac->relring_count++;
+			if (wacom_wac->relring_count == 1) {
+				wacom_map_usage(input, usage, field, EV_REL, REL_WHEEL_HI_RES, 0);
+				set_bit(REL_WHEEL, input->relbit);
+			}
+			else if (wacom_wac->relring_count == 2) {
+				wacom_map_usage(input, usage, field, EV_REL, REL_HWHEEL_HI_RES, 0);
+				set_bit(REL_HWHEEL, input->relbit);
+			}
 		} else {
-			wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
+			wacom_wac->absring_count++;
+			if (wacom_wac->absring_count == 1)
+				wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
+			else if (wacom_wac->absring_count == 2)
+				wacom_map_usage(input, usage, field, EV_ABS, ABS_THROTTLE, 0);
 		}
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
@@ -2175,14 +2186,37 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 				value = wacom_offset_rotation(input, usage, value, 1, 2);
 		}
 		else if (field->flags & HID_MAIN_ITEM_RELATIVE) {
-			/* We must invert the sign for vertical
-			 * relative scrolling. Clockwise rotation
-			 * produces positive values from HW, but
-			 * userspace treats positive REL_WHEEL as a
-			 * scroll *up*!
-			 */
-			int hires_value = -value * 120 / usage->resolution_multiplier;
-			int *ring_value = &wacom_wac->hid_data.ring_value;
+			int hires_value = value * 120 / usage->resolution_multiplier;
+			int *ring_value;
+			int lowres_code;
+
+			if (usage->code == REL_WHEEL_HI_RES) {
+				/* We must invert the sign for vertical
+				 * relative scrolling. Clockwise
+				 * rotation produces positive values
+				 * from HW, but userspace treats
+				 * positive REL_WHEEL as a scroll *up*!
+				 */
+				hires_value = -hires_value;
+				ring_value = &wacom_wac->hid_data.ring_value;
+				lowres_code = REL_WHEEL;
+			}
+			else if (usage->code == REL_HWHEEL_HI_RES) {
+				/* No need to invert the sign for
+				 * horizontal relative scrolling.
+				 * Clockwise rotation produces positive
+				 * values from HW and userspace treats
+				 * positive REL_HWHEEL as a scroll
+				 * right.
+				 */
+				ring_value = &wacom_wac->hid_data.ring2_value;
+				lowres_code = REL_HWHEEL;
+			}
+			else {
+				hid_err(wacom->hdev, "unrecognized relative wheel with code %d\n",
+					usage->code);
+				break;
+			}
 
 			value = hires_value;
 			*ring_value += hires_value;
@@ -2193,7 +2227,7 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 			if (*ring_value >= 120 || *ring_value <= -120) {
 				int clicks = *ring_value / 120;
 
-				input_event(input, usage->type, REL_WHEEL, clicks);
+				input_event(input, usage->type, lowres_code, clicks);
 				*ring_value -= clicks * 120;
 			}
 		}
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index aeba2f3082f03..55e0c7a9fdcb4 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -313,6 +313,7 @@ struct hid_data {
 	int height;
 	int id;
 	int ring_value;
+	int ring2_value;
 	int cc_report;
 	int cc_index;
 	int cc_value_index;
@@ -356,6 +357,8 @@ struct wacom_wac {
 	int num_contacts_left;
 	u8 bt_features;
 	u8 bt_high_speed;
+	u8 absring_count;
+	u8 relring_count;
 	int mode_report;
 	int mode_value;
 	struct hid_data hid_data;
-- 
2.45.2


