Return-Path: <linux-input+bounces-4012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC48D7450
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 10:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF87281894
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBA6224CE;
	Sun,  2 Jun 2024 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtFdSVVw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3311E535;
	Sun,  2 Jun 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318312; cv=none; b=Ec/pRrZTq4dQXvQq+uVRzZXcKleNnz3YhTxohGL9GwLChTo7UxQbeCzaAhZKCfJNs7uZvMujyjaFLsihhOmhR+aPk5SlL0dI4X4HngLkKJUz/D9ITfjt937yJgGFWuSSLWqx6lx6eUDaWpFoLxcq3DA/aKFy1qobJpEy3gQ0bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318312; c=relaxed/simple;
	bh=e65MDGgz/5t6pNJjm2h6eNurKKcTphF0Q2NEmJmIwI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2XKzPxvH4608GwX6BHnq/cxWfUJ7QGEOWaZet7ZEriuz0IZ2pMNuUJYqCRCRgiTbuHloBzOfga/sHOPWzsBVGJFz7W+RamAd/xlGqw3zqH8XT8lVIbL729evx7vsozYHQ3SaqCAwd8MeSqCI5K+/M43U/KgTwKUQsgXb1EgBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtFdSVVw; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f8d0a215deso1685489a34.0;
        Sun, 02 Jun 2024 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717318309; x=1717923109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4hYHmgrY/sSpNoKlBUHQFCOVOO+xIhSM1LWCgBv6E8=;
        b=jtFdSVVwxMJN+IfM/Qj0maZbLCSUFQHHaaGeWQKBMMEuptqbyqB6XzjZH++P3MQ8zT
         TcSDMy/ZM4w5nXK453/tZq8N3iNB+3kGZM+BBMqvjMO4ZCIpFJZEVwC4910ZONv6AS51
         kfY8J+7HU90M+nKB8TYBWIwzPKZHpqQ32N1WcQESI+Jm5V44Es9PX+R42NAe8zeXlic0
         KnXZo+1tvxddtwtJ8yGry25HrQXto8YQrKpGnGv/h5F0MLWT4dALG39wGIF1B8PONGfv
         UWIIP1RrYj/5St3oxiG5Fv4lRPKk2jlMx0jCKxsqlZE5QVCueuLYsfv4wfKCSTt8gBZ+
         pqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717318309; x=1717923109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4hYHmgrY/sSpNoKlBUHQFCOVOO+xIhSM1LWCgBv6E8=;
        b=WennGhYAEgQpK0EXIxcv3ZIXQQy/JCSwBLtaC2kVqBBbGEXNeGqEcfm4jky2MfZZTy
         BZAIsYZSpO75JGiQgnoRWt9bVCsG/DHw5bKx6AQNqhfJW6Wjv0DbymH0/O1K4PNNkYpk
         y8kkWowmkJ6/V5zGmMfZYkT/ltwh4LlS2wcn8TvB4ZLUUmqt3ap+DStZ3ZNZFsNVlkTh
         bOviKXBakFHuF6jJmO03ToeC5s2nAQazAfWu7vTga3EM2B2zdoPsiw1HUq0q7hgcBzwX
         0AwKx4jeUG6QV9FxhSirfd9TtVRQ3m0NY3SxL8N1ggG+f4c781zAc8Zggf9r6QjTIMrv
         siGw==
X-Forwarded-Encrypted: i=1; AJvYcCVDMYk4qUoQ7Bj0Df9YjQXQoSW4ICA7uBQ6H+1I+SEKsF4UYT772//giJ24SzSWtcBUwNUN+xTHo0wgaR+Wi9cA4GlaKvJE8bO8bcIfTdXME1ZnS4FvzUIu14tpvHVIbGMRgQWANGk4Y/tf7qT6721A0t+D+4wUixCT5sIQ15Dkgpp4tCY=
X-Gm-Message-State: AOJu0Yx3mP6cK49M+s+E0BSSqcnF06GEOeweAI1X5R8/TSLOyCtaBzL/
	jj5C/dRVpjnGUgbVgtD7TM/VA5Ehr0//AHmOTpVREkWHkuqr11VN
X-Google-Smtp-Source: AGHT+IEoQt9fiVgS/wUK8ZbhbZqDxwqVnEkmcyWbSOlcPJ7KPfGB5ccFde9C7qL7s2kTgPWdscxIPg==
X-Received: by 2002:a9d:3e0c:0:b0:6f0:360d:d730 with SMTP id 46e09a7af769-6f911a8e5d6mr2783523a34.6.1717318309450;
        Sun, 02 Jun 2024 01:51:49 -0700 (PDT)
Received: from my-computer.lan (c-98-39-68-68.hsd1.tx.comcast.net. [98.39.68.68])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-6f91054f672sm1016350a34.46.2024.06.02.01.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 01:51:49 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dan.carpenter@linaro.org
Cc: andrewjballance@gmail.com,
	benjamin.tissoires@redhat.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	jkosina@suse.com,
	linux-input@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	luke@ljones.dev,
	skhan@linuxfoundation.org,
	syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] hid: asus: asus_report_fixup: fix potential read out of bounds
Date: Sun,  2 Jun 2024 03:50:23 -0500
Message-ID: <20240602085023.1720492-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
References: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a potential read out of bounds in asus_report_fixup.

this patch adds checks so that a read out of bounds will not occur

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
Reported-by: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=07762f019fd03d01f04c
Fixes: 59d2f5b73921 ("HID: asus: fix more n-key report descriptors if n-key quirked")
---
 drivers/hid/hid-asus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..37e6d25593c2 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	}
 
 	/* match many more n-key devices */
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		for (int i = 0; i < *rsize + 1; i++) {
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
+		for (int i = 0; i < *rsize - 15; i++) {
 			/* offset to the count from 0x5a report part always 14 */
 			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
 			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {
-- 
2.45.1


