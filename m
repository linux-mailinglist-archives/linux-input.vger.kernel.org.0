Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBF03BEAD
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 23:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389760AbfFJVb2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 17:31:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33404 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389362AbfFJVb2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 17:31:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so10707747wru.0
        for <linux-input@vger.kernel.org>; Mon, 10 Jun 2019 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joaomoreno-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYygYmLUCJpx89UgZYIubVgcxi/O7oESBshr0h9GFwM=;
        b=X9hUjZWCqEp36sRvaqJzkhRPjeKs3MRssU6vUmo4T2p6lFXQee63bqb6iZCSHWAcRi
         xl+e9tI6A/nTAPp8LWQh9yHCF+jay6anhkzpCW1IH4VGHXVNWv/zk8UcfwkFBPoEZJdr
         Y7OwJUTap5LYQqZcXV1GqnEoaMe2AByVXxYwuvVnHY/+mlojc7/5lvo+s0YCQQihNOgz
         QfIm7XCk5T1GYmQ38qdjVVd2DL/gJZhtZOkZZJ1PHX31ISsfXSd6loSDG6UyBBBrDzRJ
         Fv4hSNiSdzj+i494EAqrfUPdNmc5eeP7n9hRzOJuaJ2S9Tn/vnwKVhz1F4oFLFJ3p4//
         tTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYygYmLUCJpx89UgZYIubVgcxi/O7oESBshr0h9GFwM=;
        b=RnwMADKH+RAZuvcQ11t87yVkN4pL7EHnauanBxyiT8I1xMdylB08EAkuCxsY7mE5TB
         bsnEfr/a1p7Lb+EZJvwHcOaHYyrpv2vTgLZE7rbrbM+BTXDe20WLudrx/sj74RNjFmYF
         ncisnvMsVfDGVk+u4P+y9yUuyNhVTQM9TI1sAU3scBU4Qc6m01n4TN+dRgYRuP9D4mKz
         KfueAGGwY+PbaRjKch0DSp61sHR0M2WnGz+hvcFT3IZpYIoQdZp4zJoJPwSoK3azKjOk
         wkwxD8ATitPeApDfNBzaS0ZPDj+IU6rvaKFioH5mpjGNPNOrTSffMcgjD5f53oQ/QVj+
         l0FQ==
X-Gm-Message-State: APjAAAXIeTiVBlrFRvpcix3N12ZVhh49n0ntO7ktz2lVLdiNCGgrAtFN
        MsG7qEemKoT53mPVd5yUe8e7hCKz/6Q=
X-Google-Smtp-Source: APXvYqy/u5gu1vvb21uZAuHxmmcY7IPEbiNYULCHDQozGVkQaD+/0eGKVV54/qE3pIhq69sOQ5aQyQ==
X-Received: by 2002:adf:8086:: with SMTP id 6mr39574637wrl.320.1560202286383;
        Mon, 10 Jun 2019 14:31:26 -0700 (PDT)
Received: from localhost.localdomain (212-51-143-162.fiber7.init7.net. [212.51.143.162])
        by smtp.googlemail.com with ESMTPSA id y9sm1283877wma.1.2019.06.10.14.31.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 14:31:25 -0700 (PDT)
From:   Joao Moreno <mail@joaomoreno.com>
Cc:     Joao Moreno <mail@joaomoreno.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: apple: Fix stuck function keys when using FN
Date:   Mon, 10 Jun 2019 23:31:06 +0200
Message-Id: <20190610213106.19342-1-mail@joaomoreno.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes an issue in which key down events for function keys would be
repeatedly emitted even after the user has raised the physical key. For
example, the driver fails to emit the F5 key up event when going through
the following steps:
- fnmode=1: hold FN, hold F5, release FN, release F5
- fnmode=2: hold F5, hold FN, release F5, release FN

The repeated F5 key down events can be easily verified using xev.

Signed-off-by: Joao Moreno <mail@joaomoreno.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 1cb41992aaa1..81867a6fa047 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		trans = apple_find_translation (table, usage->code);
 
 		if (trans) {
-			if (test_bit(usage->code, asc->pressed_fn))
-				do_translate = 1;
-			else if (trans->flags & APPLE_FLAG_FKEY)
-				do_translate = (fnmode == 2 && asc->fn_on) ||
-					(fnmode == 1 && !asc->fn_on);
+			int fn_on = value ? asc->fn_on :
+				test_bit(usage->code, asc->pressed_fn);
+
+			if (!value)
+				clear_bit(usage->code, asc->pressed_fn);
+			else if (asc->fn_on)
+				set_bit(usage->code, asc->pressed_fn);
+
+			if (trans->flags & APPLE_FLAG_FKEY)
+				do_translate = (fnmode == 2 && fn_on) ||
+					(fnmode == 1 && !fn_on);
 			else
 				do_translate = asc->fn_on;
 
 			if (do_translate) {
-				if (value)
-					set_bit(usage->code, asc->pressed_fn);
-				else
-					clear_bit(usage->code, asc->pressed_fn);
-
 				input_event(input, usage->type, trans->to,
 						value);
 
-- 
2.19.1

