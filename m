Return-Path: <linux-input+bounces-5217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD194223E
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 818C81C232E8
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702FE18E042;
	Tue, 30 Jul 2024 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Qvp3oFnk"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB0A18DF8B;
	Tue, 30 Jul 2024 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375373; cv=none; b=A5EE8VDprJKA/VcQbbodlfxiXWH+zL7WeUO3shQLuolbhhLz1BSHANyXo/Rs1DH/waunbQ01WINJkUZoacH6+HyUhQAP+Ll7/v6+uYVy5EFnMK0GUxeW9hhuIdCABtbPYQFYn7DG21EEGZZjIirx8k/uZyaXtKYar4neMn933rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375373; c=relaxed/simple;
	bh=vQHVvIEzQXkW1NLb5klOf1qnkQALOJgVLTI071IIIt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BL4mAKAAG+MtdXMPXSmxCjl6irhY3fNcVvbdrZ7cc0FZJt9cRbjAW9bcHZwdnU2HRgfafa+z8xlFHc4ZMEFxexCPyFf6agu9ou+cK/wQ9ZU9XwrMjIYzzyWy6lYaetIg0fGWjDzCX631sOnH6c1yILIirTEUjL6AF+cvBQylDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Qvp3oFnk; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722375361;
	bh=vQHVvIEzQXkW1NLb5klOf1qnkQALOJgVLTI071IIIt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qvp3oFnkeV/d/RpHj5bv1nBJXiLlrJ65SvzzDSMb7rmTs4O4oX7JFM44vs29rDE1Q
	 wfWGMFGyqAW8r4Jr/nQqtn0GiedoJPrI9+/Dm8pY/r3tNRgVjGkugVSFvVcgichnno
	 2I1GEeLlIRBEF8Mzi4L3l0kXFkcX0lb4qX7RrRKs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jul 2024 23:35:59 +0200
Subject: [PATCH RFC 3/4] HID: change return type of report_fixup() to const
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-hid-const-fixup-v1-3-f667f9a653ba@weissschuh.net>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
In-Reply-To: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722375361; l=2159;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vQHVvIEzQXkW1NLb5klOf1qnkQALOJgVLTI071IIIt8=;
 b=MMeW3AAQPkKElwpHNYNMqNes0wv8iNwkNyVZykY/DhmTs3MGO4z6C8IN4pHcdVEkj8XN0GkAu
 3EoqgATFA00CkIuFDMUC0hmycO6YGxP/FecjMOzuDy2iDBHc51YdyTe
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

By allowing the drivers to return a "const *" they can constify their
static report arrays.
This makes it clear to driver authors that the HID core will not modify
those reports and they can be reused for multiple devices.
Furthermore security is slightly improved as those reports are protected
against accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-cmedia.c     | 2 +-
 drivers/hid/hid-sensor-hub.c | 2 +-
 include/linux/hid.h          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index 0681d8882ac8..d235dbedab8c 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -199,7 +199,7 @@ static struct hid_driver cmhid_driver = {
 	.input_mapping = cmhid_input_mapping,
 };
 
-static __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
+static const __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
 				       unsigned int *rsize)
 {
 	if (*rsize == HS100B_RDESC_ORIG_SIZE) {
diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 26e93a331a51..7bd86eef6ec7 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -580,7 +580,7 @@ void sensor_hub_device_close(struct hid_sensor_hub_device *hsdev)
 }
 EXPORT_SYMBOL_GPL(sensor_hub_device_close);
 
-static __u8 *sensor_hub_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *sensor_hub_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	/*
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1533c9dcd3a6..8b3807609ff2 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -822,7 +822,7 @@ struct hid_driver {
 			struct hid_usage *usage, __s32 value);
 	void (*report)(struct hid_device *hdev, struct hid_report *report);
 
-	__u8 *(*report_fixup)(struct hid_device *hdev, __u8 *buf,
+	const __u8 *(*report_fixup)(struct hid_device *hdev, __u8 *buf,
 			unsigned int *size);
 
 	int (*input_mapping)(struct hid_device *hdev,

-- 
2.45.2


