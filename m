Return-Path: <linux-input+bounces-15294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0FBC2A73
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 22:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E803C3534
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 20:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5581221FB4;
	Tue,  7 Oct 2025 20:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLvQ+COn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8821D90AD
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759869373; cv=none; b=RHtBlTUpneGP2f6i9nn0Pi7wcb3noLO6TKpcyOwddJ1hG8Rv9nkmvQ0MLJcdnNLH/rK8UIVhcuff6IPazsjCqB1dvoK6gc+LhOK+VslkSkrT3J9veykcrY4Iv7Tj0UP7QTnxYLJeOLFTjqH0AP87hqi22vDG8TJndbFRElgTqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759869373; c=relaxed/simple;
	bh=X30O3tuyaGnUdYn4ZevXlMz7qK4brBb8HMxNaffjlTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMVLt7+f0FLmQUH6H1hoEH9A5pqrf07JOq4pA6fVb9XvG+PA4eneDqO99mB69aE0iQTkcltMObsinf7X9gH7ZatDKn1tx287EhQuNfvsYSS1d9w14MYhwbDIVcH3582PUMOTYmEH5xaRqFPqiRof4AdvJHoA8Pr4FEcxwWoUlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLvQ+COn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so4722777f8f.0
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759869370; x=1760474170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mwcpw0zy4R46b7XzPVyh5saCrP79aFOpHXUMlFp84UE=;
        b=GLvQ+COnWwysbYu9qXh2CDzHK2PLnluNwyQUiURSDjMv9aiMdFVCktxx+Pu6g6Sgc2
         JaaLdj32OI091+GkjdnFzXjeaOei6OHZzSkFilzBC1lr90gOpWsiu4btmV58G22P8Djc
         mb89+4LcAcC9NxKVGGT/C0SfNxGD0BiZYq8LgFpAzsfFgkq9QEb5aXnWO5sqvzcWIpUv
         jZlDBvQz/s00izscGRthts2eUv8ZfSfVAjFG+peEcaHTadrzNImKx2ZZ5bV77ZHxyOX1
         LDZC8OuyelwohZ3Gp5wXEZRjs1grYx73uTAQ6q56YScgXmMwUHtktVWVp1YYf9mg4gGz
         30Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869370; x=1760474170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwcpw0zy4R46b7XzPVyh5saCrP79aFOpHXUMlFp84UE=;
        b=kzHZsI0n67B9jx8B9UsuzHOgRRJwk6w12i/Zuy77MXR48iN9oeoQqsoJcFImXs9mEr
         w386GSFLp5ZXLCEG/KyhhGCtnjHhf5FXjUcFoXoaD3iUMTDJsxVs4N5NhKoEgckDA75s
         lALTSLajn900s7yfR9eVYbf/kl2vcanDA4ethM8/t5UcXlkWrAHPa+f3XDVM9If/5oYA
         PJBiANEMB0hb1dLBCrXOr9mpUWWtBVtN4X3IStSiIv8UuNkddZSmpk5z6FH152JtFS4H
         FmCaTY8AohV/Caipl+byEpQWQCrwswVSHu7xQY5b3cN33zqIBAjCwlN1Yb5bk+tdN8zK
         7Ifg==
X-Gm-Message-State: AOJu0YwZ2CJOmIeDTatEC/IKSAdGWu2FT74jiQ50hn3HlnQfUdB42MVI
	m4WSfRG80KL3DPmd1TR3NaMaiF8Dvr9fscy5SzELCZNAPuxlsSMmwGnvcS40ND4=
X-Gm-Gg: ASbGncuAgsSWt0nscQDxWSjtUWvSdfHvYZdOZuReE5l0580LWaSFvbQ/z31FlYvDMKv
	oeJsVzAB/IpwIt3Xq55ocFmhfneVN5HHbbLHFR9h2wzzVoGhQ1hXF9d/dWwjoTn4UcBipYoeAZH
	6yIGiFWnw9hCUFpw+shklFVaGY+uifVILhPmHZKfzDcnREldG/1SPWzil1RNncya4GAUF9FQsZu
	Cus2NHnmKXtlK38Q94BzI9L1kLCo6WRIBpcgLz9zQxYaHiO4Gyb95wcdz4lA92m23sitwLh8Su5
	SbS31G+yKcozWOb0UcyAmZpZ4CJkD+4TtXd66lIW8wdqwwqOngFKeBWGN9xRIrfY9T2fKqS0IOQ
	FsFLai4e1YtRKKI5FyQbrQbAE6w6U/5HIVHc+L7l2yfw9sL4KOIfIkcYZklylnJKygMy76oTYVJ
	nK4fjfPhzwyC+wKYJG
X-Google-Smtp-Source: AGHT+IGPLtE8dj0u0tUPLyujq1JtdE0ZsW+bW3gJIuAcpvuOgESONWNsIxWyKFgjZ67CUoGoms/o1w==
X-Received: by 2002:a05:6000:240d:b0:421:a112:4010 with SMTP id ffacd0b85a97d-4266e8e8f53mr421505f8f.55.1759869369892;
        Tue, 07 Oct 2025 13:36:09 -0700 (PDT)
Received: from DESKTOP.home (188-23-144-33.adsl.highway.telekom.at. [188.23.144.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf94ddsm8016005e9.2.2025.10.07.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 13:36:09 -0700 (PDT)
From: Benedek Kupper <kupper.benedek@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	Benedek Kupper <kupper.benedek@gmail.com>
Subject: [PATCH] drivers: hid: renegotiate resolution multipliers with device after reset
Date: Tue,  7 Oct 2025 22:35:44 +0200
Message-ID: <20251007203544.9963-1-kupper.benedek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scroll resolution multipliers are set in the context of
hidinput_connect(), which is only called at probe time: when the host
changes the value on the device with a SET_REPORT(FEATURE), and the device
accepts it, these multipliers are stored on the host side, and used to
calculate the final scroll event values sent to userspace.

After a USB suspend, the resume operation on many hubs and chipsets
involve a USB reset signal as well. A reset on the device side clears all
previous state information, including the value of the multiplier report.
This reset is not handled by the multiplier handling logic, so what ends up
happening is the host is still expecting high-resolution scroll events,
but the device is reset to default resolution, making the effective,
user-perceived scroll speed incredibly slow.

The solution is to renegotiate the multiplier selection after each reset.

This is not the only bug related to the high-resolution scrolling
implementation in the kernel (the other one is
https://bugzilla.kernel.org/show_bug.cgi?id=220144), but for this one,
there is no device side workaround for,
leading to poor user experience with our product:
https://github.com/UltimateHackingKeyboard/firmware/issues/1155
https://github.com/UltimateHackingKeyboard/firmware/issues/1261
https://github.com/UltimateHackingKeyboard/firmware/pull/1355
This patch was tested by an affected user and has been reported to
fix the issue (see discussion in 1355).

Signed-off-by: Benedek Kupper <kupper.benedek@gmail.com>
---
 drivers/hid/hid-generic.c | 9 +++++++++
 drivers/hid/hid-input.c   | 7 +++++++
 include/linux/hid.h       | 1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/hid/hid-generic.c b/drivers/hid/hid-generic.c
index 9e04c6d0fcc8..c2de916747de 100644
--- a/drivers/hid/hid-generic.c
+++ b/drivers/hid/hid-generic.c
@@ -70,6 +70,14 @@ static int hid_generic_probe(struct hid_device *hdev,
 	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 }
 
+static int hid_generic_reset_resume(struct hid_device *hdev)
+{
+	if (hdev->claimed & HID_CLAIMED_INPUT)
+		hidinput_reset_resume(hdev);
+
+	return 0;
+}
+
 static const struct hid_device_id hid_table[] = {
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, HID_ANY_ID, HID_ANY_ID) },
 	{ }
@@ -81,6 +89,7 @@ static struct hid_driver hid_generic = {
 	.id_table = hid_table,
 	.match = hid_generic_match,
 	.probe = hid_generic_probe,
+	.reset_resume = hid_generic_reset_resume,
 };
 module_hid_driver(hid_generic);
 
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index f45f856a127f..3dd3822cc549 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -2382,6 +2382,13 @@ void hidinput_disconnect(struct hid_device *hid)
 }
 EXPORT_SYMBOL_GPL(hidinput_disconnect);
 
+void hidinput_reset_resume(struct hid_device *hid)
+{
+	/* renegotiate host-device shared state after reset */
+	hidinput_change_resolution_multipliers(hid);
+}
+EXPORT_SYMBOL_GPL(hidinput_reset_resume);
+
 #ifdef CONFIG_HID_KUNIT_TEST
 #include "hid-input-test.c"
 #endif
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 2cc4f1e4ea96..b78fb55ea85e 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -953,6 +953,7 @@ extern void hidinput_hid_event(struct hid_device *, struct hid_field *, struct h
 extern void hidinput_report_event(struct hid_device *hid, struct hid_report *report);
 extern int hidinput_connect(struct hid_device *hid, unsigned int force);
 extern void hidinput_disconnect(struct hid_device *);
+void hidinput_reset_resume(struct hid_device *hid);
 
 struct hid_field *hid_find_field(struct hid_device *hdev, unsigned int report_type,
 				 unsigned int application, unsigned int usage);
-- 
2.43.0


