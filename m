Return-Path: <linux-input+bounces-16814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF10CFD62D
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 12:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22F5C303B1AA
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 11:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB437304BBC;
	Wed,  7 Jan 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKVaRgQ/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E62DEA86
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784806; cv=none; b=uwGU67if0lj1YWV4xjyhT8msTTehyP1mTKhIGwS6MLgVin+Y+zb9Rnv4RRvXQ6bRzy6nYrOi7jga/Ok631DpoIIn+CP/i4MT057vecWXDkYJ1dbWEqvSLzSNhwJ/eveYZfKfLqnUi4R8ciCOXXECvavVfm7m1Bn7QWjzusjNJ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784806; c=relaxed/simple;
	bh=4UpJyomXhJKAJBk8kEwQdBLU/Z1VqDledzUt+c8zgJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+YnlHH70QpuLO70kUuswvaKoDTglBHeAkGKjnXtpQxpIoog7Sid5/T5c3aaKwghKSSEC/XUzPIBg8Yivt39Vzkgb8rGMeDUwBgwdPebYRPyqI+esJYCm4YYPI7vEXQ0A9+6BFxmi3VnVLXpKqcReNhHgN0zuFIGhnqh6qw0fGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKVaRgQ/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so1571475f8f.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767784803; x=1768389603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0Xzx90O227/P+k1Zvoh68FlipQTABA5u9PpS6l4LP0=;
        b=VKVaRgQ/jWZnl/Mrd1aZqQ1417WYdnKTAaLSt3EatYZDmWsX2LK2FMCuDyl01sm4a5
         wky1ITBwTmyDrGRmNp54sMhOsTMMPL7dP4wbnNs17opeamKTlcGE8ogKx4rYcwyzjBay
         10N24xUcV23B2WMwfzXyyhnCGSl8D2/sN/d+yU+cqSD6fU6DAJvj91dAsT4He3B0tT3l
         AvLzrjMoP2/Rd3oKSpwrOi8yse4udvxfnMhR6SmeMLVWrsy086FLpBzVrsR2EcOzU0L1
         FL1Ss+DL5maLOmqabD3dmWJAkZSxJcIbldBLjmezq/vctQhyXiIpUI7Kz3k8jmhr8yOM
         IlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784803; x=1768389603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T0Xzx90O227/P+k1Zvoh68FlipQTABA5u9PpS6l4LP0=;
        b=vzLX54R4Hshi/MNjxc0FYD2dtCfU+L4ZrjLmiigC30qxiGjXa/Ta63ezt+EeO/RunD
         Ex4QbFJ+DrRLx9xh+G9/+VAx1G2wk/snr1ZrgL+rDgwr2244DBfTFsS5jUyGfQb1uPAM
         HAKtbdz7EIWPYrSUe+MPps4DILtooV7ZBRTTXojcLYledmMOib1SXXW7fuO2LqSx4p4g
         lveYWfO8+8hy7iFDxQrE1UELaHiCUdJa7hHBvv2VO2Ax/86HwEt+y+W6gxWav+U4ynJO
         MzDRlY2xyPy3ajkGDPOkM6mBJtbWQuhVm/4wVDujHzS8yjdCADdFn8U9pg2IwraSYl7j
         Ml+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbT7A3x4sJWJVT228hVOiHNSqsyqD8uZQPxgofAe+fb7MOAWiCUS0H1EPP+54IhN0MBZkgjrgqAtFuiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEyc4oO5AgQk2TuVsdmZN1k2PmL4cGdMkQFsivhG8JNY/Z7jb
	Wequ737pgryMwHKAkKwUYvVGhBwtbc8CxZJ8TmaW2HmzmQBV3Qai6c2Y
X-Gm-Gg: AY/fxX5b73/+Jc5xOtBeZtSOKif3gk0TIFBPwP34dqEEy7ZHiX4Zq9ahFuJrE65SN3M
	nJrenncW2lRxEQaF1yxY4J+INVfqKRiDDToR+nOkY+EBHxJTKOvrY2qobWp5ZZNSlujAtRmtV+6
	wJezbiCQ36amG9TP36V+gxpAf86ZqtqSLMe0U568j8EP6M122Yd80ZGjl0FuWq3QGVN7H4YNWu0
	OMWqP2/GvCH5hphq51UA1toO/ehRxMBQMB2SWbTqHhc4eiSjnjmFkJ89GBPguFCxrZb7Ik8v3FW
	fPxQZNT92bHB4bgl0kY6WZVVViK0C5Sv5LvRBL9U+PY3DgIbUao5Y8jLfAGhusun0A2khA+f8Qy
	N6kIK7PaFY6fnf9kY8LTMGruG0F9wvJ12f6ybk2Vg4pv4qDXIMwatJ29dYDhGiyAb8V/WwjBAr/
	zoDH6UiT/ou3lO119v8ohMatiHQ6qKp/zQqKPXslQ=
X-Google-Smtp-Source: AGHT+IFhPXwNn3HSieuU4dTTZKAT+KsFT5sgVhaInEQNM4WnZlAkY6p6XdjzDvxN/HQNvAZcd+OMJg==
X-Received: by 2002:a05:6000:2084:b0:42b:2ee0:569f with SMTP id ffacd0b85a97d-432c37c87c6mr2902184f8f.33.1767784803406;
        Wed, 07 Jan 2026 03:20:03 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm9733210f8f.32.2026.01.07.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:20:03 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: superm1@kernel.org,
	benato.denis96@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ionut_n2001@yahoo.com,
	sunlightlinux@gmail.com
Subject: [PATCH 1/4] HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
Date: Wed,  7 Jan 2026 13:19:44 +0200
Message-ID: <20260107111945.48018-4-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107111945.48018-2-sunlightlinux@gmail.com>
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

Use the existing HID_UP_ASUSVENDOR constant instead of the magic number
0xff310000 for better code clarity and maintainability.

Change-Id: I65cf58cd0cd47acc39b755fa9a5fb7f2ad271046
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 472bca54642b9..eb14b9d13823b 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -317,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
-- 
2.52.0


