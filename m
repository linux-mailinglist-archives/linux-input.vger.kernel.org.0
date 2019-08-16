Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC771907F0
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 20:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfHPSyi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 14:54:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34313 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfHPSyi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 14:54:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id b24so3575816pfp.1
        for <linux-input@vger.kernel.org>; Fri, 16 Aug 2019 11:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKqEgkDZq8MkXoz90HUN3rh39wfqY8xlBFvZPAvWRlQ=;
        b=XiaW0R1IB0tWSU5qtCIWGQ0JudkUOkt0J0FaJzi+et8oVRlqfphWuPGLbMJM1be2+G
         G1dnsRUCxZvasuSRoq6LWMzBZvYRRJIGD0rxkS0S/n+T7IImBodYiMnM15dcfZ4GiGG8
         YAA5Q+mhdYFeaD7/nsZCwuBtZx0NCW8KEJvCDZnk39g/GpMZ9s/aznz6QMxvhiz87GPI
         NYOZJ08JAWF0pmoQK2VCy9j18zvpUpNMPk5Yp9rVcpQe5rdA9UPxr3o+hu6TcOCGNTMG
         oQmdyi9QxJiK6th3mx0XJWFhytlBn4e18p5RFUzf7VocFQEJtSbX5UVcDH9K5YLnTc49
         73/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKqEgkDZq8MkXoz90HUN3rh39wfqY8xlBFvZPAvWRlQ=;
        b=SSpHRYYglYIzaN/c1HkJCKgrhsVVY/fvKD3/W2JeTilke85AgG3nmHH/ifOyYwFBnv
         rG6vnNO5P2ATQpmrV9zO3NtmJazfZ5SS302KdM0uQNZ0XM3HFx9gia1OoAS1T81GdwIH
         46fbqzYSU+M1eZjGjDSvijUpylcmbAuqBth31Ca93OxXe7qp3BISFwiLy21YNVxDsBqN
         hB0zD16D6phxuFi6EBGS4VbPvk5HEBhB6YFPo5QqPg6fTSphXCJ1F14HRG8iORA1sDQv
         3RCH+mmt780zrIu/62oYALPOsaQ81chGvUeO0BDfzrUWuNUfufOcHXUFdNTkY5vyFkBc
         It+A==
X-Gm-Message-State: APjAAAXUNOuBRWD7QfEweZkcpnooGsUFjaD4jLVc62RQ2bsyybWSpPYQ
        hG0FvRSOqIccZqiEVxDyN2WkV+Nw
X-Google-Smtp-Source: APXvYqzH6Q6L1wVYDt8qeSf954Ldpu8uvaVrwOcqAoOG0i4iy8IskIMFg7f2E9zAxoI2gJEbPi7B7g==
X-Received: by 2002:a63:5f01:: with SMTP id t1mr8251401pgb.200.1565981677701;
        Fri, 16 Aug 2019 11:54:37 -0700 (PDT)
Received: from horus.lan (75-164-171-222.ptld.qwest.net. [75.164.171.222])
        by smtp.gmail.com with ESMTPSA id b3sm7572154pfp.65.2019.08.16.11.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 11:54:37 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH] HID: wacom: Fix several minor compiler warnings
Date:   Fri, 16 Aug 2019 11:54:26 -0700
Message-Id: <20190816185426.25137-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Addresses a few issues that were noticed when compiling with non-default
warnings enabled. The trimmed-down warnings in the order they are fixed
below are:

* declaration of 'size' shadows a parameter

* '%s' directive output may be truncated writing up to 5 bytes into a
  region of size between 1 and 64

* pointer targets in initialization of 'char *' from 'unsigned char *'
  differ in signedness

* left shift of negative value

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Reviewed-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_sys.c | 7 ++++---
 drivers/hid/wacom_wac.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 53bddb50aeba..602219a8710d 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -88,7 +88,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 }
 
 static int wacom_wac_pen_serial_enforce(struct hid_device *hdev,
-		struct hid_report *report, u8 *raw_data, int size)
+		struct hid_report *report, u8 *raw_data, int report_size)
 {
 	struct wacom *wacom = hid_get_drvdata(hdev);
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
@@ -149,7 +149,8 @@ static int wacom_wac_pen_serial_enforce(struct hid_device *hdev,
 	if (flush)
 		wacom_wac_queue_flush(hdev, &wacom_wac->pen_fifo);
 	else if (insert)
-		wacom_wac_queue_insert(hdev, &wacom_wac->pen_fifo, raw_data, size);
+		wacom_wac_queue_insert(hdev, &wacom_wac->pen_fifo,
+				       raw_data, report_size);
 
 	return insert && !flush;
 }
@@ -2176,7 +2177,7 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
 {
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
 	struct wacom_features *features = &wacom_wac->features;
-	char name[WACOM_NAME_MAX];
+	char name[WACOM_NAME_MAX - 20]; /* Leave some room for suffixes */
 
 	/* Generic devices name unspecified */
 	if ((features->type == HID_GENERIC) && !strcmp("Wacom HID", features->name)) {
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 50074485b88b..db55c9ea181f 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -251,7 +251,7 @@ static int wacom_dtu_irq(struct wacom_wac *wacom)
 
 static int wacom_dtus_irq(struct wacom_wac *wacom)
 {
-	char *data = wacom->data;
+	unsigned char *data = wacom->data;
 	struct input_dev *input = wacom->pen_input;
 	unsigned short prox, pressure = 0;
 
@@ -572,7 +572,7 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 		strip2 = ((data[3] & 0x1f) << 8) | data[4];
 	}
 
-	prox = (buttons & ~(~0 << nbuttons)) | (keys & ~(~0 << nkeys)) |
+	prox = (buttons & ~(~0U << nbuttons)) | (keys & ~(~0U << nkeys)) |
 	       (ring1 & 0x80) | (ring2 & 0x80) | strip1 | strip2;
 
 	wacom_report_numbered_buttons(input, nbuttons, buttons);
-- 
2.22.1

