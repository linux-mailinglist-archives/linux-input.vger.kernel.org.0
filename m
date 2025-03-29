Return-Path: <linux-input+bounces-11351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A979FA753A9
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 01:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB87189256B
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D21211C;
	Sat, 29 Mar 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B24A4X/w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CEAF9D9;
	Sat, 29 Mar 2025 00:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207650; cv=none; b=e9yDG87As9Y7rrxQTZvjHqXPyj+ejfbsIhY3qdykB4ObxBv+0iKt8d+2lv55mRKmR62HlpH3rAMFI/QEFZolKePswIJPFFJ69adbTNtZ4bsmIHDfv1e337GEK/A+PqmRX/78BXbL9eIDVd+e3sBo7t+45nN6pvgipbmX3r/BzD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207650; c=relaxed/simple;
	bh=8rUeEiRs5sFzADYWns6KAGQf78PTNidFSSdi9nUtNs8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l3UzBS7Rq78wHP0X+t3FWU+oQVcqphPmRa+rZMtR5VFRsnko+0pyPNv73PWCFofJid/AMmV4uy6sVnzXt8hohuCMjZIx6vDPDG9+NLWtQAiPvuqYKEdzQVm2MqmYw5EcY9NhMjfTjp+0hYaUs/2Q6LsDpjg+OXZoEvve0s1WPa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B24A4X/w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so660806f8f.3;
        Fri, 28 Mar 2025 17:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743207647; x=1743812447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir+J2FFZYBEVDyTdXclplrpj5jeD1TUSb67zsHWuywg=;
        b=B24A4X/wSWFwhKKfn46f7CtOpW8wneo4qdFt53wLUyQwA3uiPH6Ibo+Hun2LG/QJfG
         Sx3okqwTgWT61fCe5az9Bd0PXv1ANQI/oqjs8puFjgMQtjcwLODG+d9+4wLT4ag4P3FY
         EJ/rY5npubSz0RekE18wpUBW3xd6pkwYLQ0ISw415Ev4WifBTS1kedtj40Ky2RflEz64
         0MYz3+UO93xNiKrbj5S4O2vUPJ6cJ+YyHacu8NY6nlu9K1cYsf/SiWu3dURRd+DuwR4O
         ZlwOPH7QX6hWHAjaOwxaKY4LjPhlZax+0DXzxReXRRh7K2fuTY6746P7PcERvuLV9iC1
         Er4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743207647; x=1743812447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir+J2FFZYBEVDyTdXclplrpj5jeD1TUSb67zsHWuywg=;
        b=s7Ot7kIchl2o7BvfXQiDbokEz0PtkedOsavOWOeF9szTt7bmezK4CEw6zV2t9orGKz
         fq55cdpswLwmunHHZT3xu4t17vFQyD9BHphuXlGJx2HsgZrL6xsrTRILSJN48CE5eA4H
         lQpWbT5lhLxgtkPLNZLimF5XV9JY/Mm/ZSMQDzZZsfEQ3jwJoVVBz0bWataXhD74yRBl
         U7yBfH9njqWaCT2Rhm3vB10M+kJYWhKZWiW58i6js7CDfqzsutlIafgP/PPWCXmRXy1q
         fun4JxNlX+jqFjKz04+qWSlf+wUJASsH+3qQY46i7IX5HagKy5tCcH/lfIz5cXiPIOe4
         Aufw==
X-Forwarded-Encrypted: i=1; AJvYcCWebT5xjyJ/gsvJvmjrsp4puDwnnndRcObxochy4LYHRoaJ3KIYGIgbQlSkaBmlGO5/Z+2OpdwuUyb8CMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvwvN8dt6sWj2WabfRcdY7JvyQNb2k9gYkEAz0hmDHDRolnJY
	ubIvOeLO1XpDpjyw1rnHDX7NJwBrNXONS8X9g/nRZh4k98WrCy9O5r205g==
X-Gm-Gg: ASbGncvy4Q0bR+Hp63s+MCp3jntjUXbbVOzywh08HGVw8/O9yB5zjpubQ6FV0rkfBg6
	FE8mFlo8AXE/frxNSQXuRJFBUawWhIGzJbVQ+SCw9wawP3l116Le71Hpv/Ld/61P9slWgYnczPT
	1BE3urdRyHBvxC5MpTRqyxbc6WOgOHivo0HJJ1aX22/BYYkl3qfMHmFN8aWxclgFFwbi61jQhUc
	OzucUYo8xgawsiWvaGYbtwn1gLsswW4VClBPBtflQ/3NUXjJm1mIo19KY4P0g4wWYSDWJJm9eRo
	mxe8ZORn1FYr4tuQ0aWmcxR4HYE2SPVulkCUyhm9VzwpGvJx5jGMxJTl
X-Google-Smtp-Source: AGHT+IHn6j5GSZuwlYWn1Vmv0E4dkcQ1FkQ/npze4jpQKkwIq1U90AqzPxdZNx01atDe3I2LKGdq1g==
X-Received: by 2002:a05:6000:2a5:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39c120cb82amr928819f8f.10.1743207647092;
        Fri, 28 Mar 2025 17:20:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:158:857:9a4c:d969])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a3d66sm4010013f8f.81.2025.03.28.17.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:20:45 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: wacom: fix memory leak on size mismatch in wacom_wac_queue_flush()
Date: Sat, 29 Mar 2025 00:20:42 +0000
Message-Id: <20250329002042.36967-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In wacom_wac_queue_flush() the code allocates zero initialised 
buffer which it uses as a storage buffer for copying data from 
a fifo via kfifo_out(). The kfifo_out() function returns the 
number of elements it has copied. The code checks if the number 
of copied elements does not equal the size of the fifo record, 
if it does not it simply skips the entry and continues to the
next iteration. However it does not release the storage buffer 
leading to a memory leak.
 
Fix the memory leak by freeing the buffer on size mismatch.

Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 666b7eb0fdfe..3e4f823f8ee8 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -87,6 +87,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 			// to flush seems reasonable enough, however.
 			hid_warn(hdev, "%s: removed fifo entry with unexpected size\n",
 				 __func__);
+			kfree(buf);
 			continue;
 		}
 		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);
-- 
2.39.5


