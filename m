Return-Path: <linux-input+bounces-5212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C19415C6
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95CDA282797
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723CA19E80F;
	Tue, 30 Jul 2024 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHMFQIAm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023CF1BA889
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354732; cv=none; b=FGErfwuWmjvZJCeIl4J9Jj4jj9EQweOpLo30ioP9HP6hRsrKr/Pl0XsTOiFFyFHP+AAD0Ip9xwMtF5lbZP6idJMo5AUcsZEvs1zufxPKJTuiU8POplYxLq60Xj7QpQQCJYouOXe4NV34uF6/0d/JIoPl+NZZmVFoopttD/7ICbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354732; c=relaxed/simple;
	bh=pCuV0U+CE/5FzqxHlYgYkhiJZ+uemPaU/f6WxnPqLAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkjKWurAXqC4tb3+bT++GYp0kSD9r+wObR/7jOBYh+TzJPQ3LTR6Sgo3WK11Xjm6cLA3sAxILRrqW3KL1ogiO+DQrsIPmZ7SvZG/PEDJQ/0dOEzs6lYVvwy/z2/GiyFStMqup2RN63Kv9xAYiEeW/rWW4ET3fBJzB1ipwK15YuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHMFQIAm; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so3468619a12.0
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354730; x=1722959530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3XSJ6eZ4QQQt8d3kl2QAxniTSgrYj7kobyAQ/bT4fs=;
        b=HHMFQIAmVZZGT/rBZX9GSAqmYZdr/vzn6XXM3ZoIuDQFDb+NGmkiebeHWa09lVoM8e
         Pa41biuSmC1VvEjdWOPr608wQWdpEmlvIe6ZoG6pZnXSms7whoSrHHtN59+N8OYS8MiF
         pmQd40Eo1nCYM5UqrdVfKQgth660m1rDeocIZ14kqv+u0m+4KMhV7Ww+7iGHkGEg2Wys
         5wDKPNWcyql+dxXIJA5gF6CtJLZ+KYUQVrX+X42XRDVjSTR7rbe+maF6CB8JJrRHjRwL
         DylAKEQ3bRJrQcAqeSZvNa5AxydPPPlwCGPu18kPeAhBH+vpRIqxZnYY05VUfSVJinMC
         1BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354730; x=1722959530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3XSJ6eZ4QQQt8d3kl2QAxniTSgrYj7kobyAQ/bT4fs=;
        b=HewZdCeP0fA9nNLvlL/8RUQPkr9UPDwxGpx8KyWSU9oc6T1VZkEMh339hmjaonCROL
         1Qw1wto2cNXtwGSsRbSFCWrtYtcuGtNCTlo4xijRw3aLBmxVlQh9hPcr9A6thSPgCg0g
         YHh2mfAiYqjSKjlEHkGfOmPSOUYxNiysLkxo12LUz7ujvFtlxkdJaCRoCbQeSdljF/MI
         1F38EEhfQI7LO5iWnlY6hFtt1vrZ6MpjB9fsKsieaCKVkXT3enabD1696PsXm1bn57Z+
         U8MmiqQz0+Eg1xy8dlHBJX9fx+H8RhkcV9xbyASJ4VxmVtwkCKHwG61LuhFABKlqEffE
         ZjLg==
X-Gm-Message-State: AOJu0YzIg+Oo4plGuJp+YbfQmIcW6+/lK81uZTYGCUBS3zaBTYXMtN38
	nOYYCBL3A8zMZ/dhq1D5EBIVFYiJXRoZB3jXsyA2MHE+dF5Q/rLCPYZdXQ==
X-Google-Smtp-Source: AGHT+IFxt6hl+/Z18mh05dVq3k5WK0q12F4Fbx8Jie7ZGWwQvTL1IsGUaCK4FncvzZNRNMksZjBfyg==
X-Received: by 2002:a17:90a:cc3:b0:2cd:619:6826 with SMTP id 98e67ed59e1d1-2cf7e60bee6mr13567090a91.34.1722354729636;
        Tue, 30 Jul 2024 08:52:09 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7600054sm12788517a91.47.2024.07.30.08.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:52:08 -0700 (PDT)
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
Subject: [PATCH 4/5] HID: wacom: Add preliminary support for high-resolution wheel scrolling
Date: Tue, 30 Jul 2024 08:51:58 -0700
Message-ID: <20240730155159.3156-4-jason.gerecke@wacom.com>
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

Modern userspace (i.e. libinput) will make use of high-resolution
scrolling if supported. Hardware does not currently set a resolution
multiplier needed for effective high-res scrolling, but we can still
write code to support it in the future.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 24 ++++++++++++++++++++----
 drivers/hid/wacom_wac.h |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 96b158a94ef9c..e45abc973363a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2048,10 +2048,12 @@ static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
 	case WACOM_HID_WD_TOUCHRING:
-		if (field->flags & HID_MAIN_ITEM_RELATIVE)
-			wacom_map_usage(input, usage, field, EV_REL, REL_WHEEL, 0);
-		else
+		if (field->flags & HID_MAIN_ITEM_RELATIVE) {
+			wacom_map_usage(input, usage, field, EV_REL, REL_WHEEL_HI_RES, 0);
+			set_bit(REL_WHEEL, input->relbit);
+		} else {
 			wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
+		}
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
 	case WACOM_HID_WD_TOUCHRINGSTATUS:
@@ -2179,7 +2181,21 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 			 * userspace treats positive REL_WHEEL as a
 			 * scroll *up*!
 			 */
-			value = -value;
+			int hires_value = -value * 120 / usage->resolution_multiplier;
+			int *ring_value = &wacom_wac->hid_data.ring_value;
+
+			value = hires_value;
+			*ring_value += hires_value;
+
+			/* Emulate a legacy wheel click for every 120
+			 * units of hi-res travel.
+			 */
+			if (*ring_value >= 120 || *ring_value <= -120) {
+				int clicks = *ring_value / 120;
+
+				input_event(input, usage->type, REL_WHEEL, clicks);
+				*ring_value -= clicks * 120;
+			}
 		}
 		else {
 			value = wacom_offset_rotation(input, usage, value, 1, 4);
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 6ec499841f709..aeba2f3082f03 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -312,6 +312,7 @@ struct hid_data {
 	int width;
 	int height;
 	int id;
+	int ring_value;
 	int cc_report;
 	int cc_index;
 	int cc_value_index;
-- 
2.45.2


