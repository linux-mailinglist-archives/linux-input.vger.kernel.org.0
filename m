Return-Path: <linux-input+bounces-16836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C3CFE9BC
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7826D30E231C
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52075350A12;
	Wed,  7 Jan 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLIe8NtN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4534FF7B
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799355; cv=none; b=eWcIGC0Do5br3N3shPHTVwn3dYtpKU+7invKD8JqF0UcA2TpnBqadn2KrQ7mbdQnxo2a0i2WkmfjA+aOGshMTPbWVycUwHzPgwZ/+xjHTP98f9A7NtruOwRsCjeIB2KHrR57ME8qcipmPBbcbQIqUngLvjN1pN9ObztunfPsygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799355; c=relaxed/simple;
	bh=WeExB8/grjxLUFEigkWewtNCvA12STz7GgZKX8vemec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3d5eTNxrrIlwsDY+8AlOd674Rz3C4HUO4h3bJw9Rn3+UmVUYdxCyDl4oJYSAY9LM/xM253h0w9iCIf06k8I+ikxH+oj2HDA3Y+PswPSVOw/4YNRLaxcyRwN81D7yDUCkeJ8tvVgucQT9yq/2lpP2Zm5haxYXKa7s8zhtcxVX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLIe8NtN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9191065e9.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799352; x=1768404152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdbM9ndfMi2CZNeCF8/8zbcP3/V0I17HI/boLt75HwI=;
        b=CLIe8NtNhbrlR6Ajrs0wFIZFWhln5gEN6iKG0y4sWL3PqRuOivu1coxw0d97dd/fei
         mHpuAeRdv7aAdBwyZHnC257C0uDm6D9vsbPvrlQ1rnBtBDun9HJYIYOSgInTlqzd8SY/
         qVUVV2L1dq9OIHfAIy0k/ZkgMF6F5bctF2vqfpl6pIeYXoLFMrjcCo1Q0+bybBrgSEI1
         HnnAY0SIrmg2tmZbuSZ+1TBY0ii7SyMrZr3Ss234FV7+6qAExyDBZ7gjushZMVpVX61q
         Vl4J4n1zEf22DAweMCYxlpKSIGsGJb+6DxdDVhsuS77J6kn2T/anoPgr8Zmd69Gj1yfW
         2MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799352; x=1768404152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QdbM9ndfMi2CZNeCF8/8zbcP3/V0I17HI/boLt75HwI=;
        b=bY4WttX0KWVly0uzuRmvM1kzZuh+RSDxGc7OkVYWhsDtksOjx9MOxBmIfXfrIqwEZb
         mo1IsNau0wQ1hkZNsVrTteQGXTW3+Ll7snsxnB/zB7yOxzrLDHxReeRt+OH075mxTzs/
         T4vGk5A6Wrl14OxLIbf01NHaQhqmMcjPBUCJTWVLXsUDCOUzxWrw86xDFzAshvBRabux
         iOB8B9APCg9avJDx3Y2Ch9caT+1dD89aHpL8m2pQOEuwKLY1Q+BdFMdoAmeo6UV6K0t/
         ts6qmYH7HUCY8Q70rd/k5nVBB5EDCrx4UieU07JbNAF4nCxwoehk3fEWVS4cWKtXM8xH
         IS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFW2130MBkSpJ/AG/1W6s4EL79iWjuAB6mVf/qjKfpEd/cJkPez8gJJWEog0OPlQp+0e2mmuH6xATizA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcx7LCh/3hrAsncUgrdD2owq5SViCXm9mYuKdoe7Cm3UqfgwC
	kwIMQvK+5aBI+a7yHYyp6Pyh32pqm8InegCSp8M912HqL6wVLs4+l/kP
X-Gm-Gg: AY/fxX4HKo2pCsswedM8NAh+EeYuQNOTnPZHCnWt5siXWqIgu3fnZu3SwuNaxKpX2vc
	UFCoWMg1iJTbWevDzo2/8+tl5EIeb+sT4vov1GMlsM1qbkL80WxvPZxHKDWjdHlmlZu97TZdX8f
	SaG3yEVAB/cdyqLqSmjvlODRQutYBI8cjCpH4WwfWG857UaOEvOdR60nRUE1/0iOojdGnYs6QMd
	TjFWcNuIGlRkW0s7/7fIHcI1BrxrjvEvrwv7U8VApgxChDEP2m1GI4hrbcgS4yBP26+IFaGywNj
	YpsNUwXqunW4amlfaccqfw7q7baxG1PJi/OMyH6kYb1d8cYM8cEEDoUyYd4pnunX8+3ytd3NAZi
	6BLJn9ouOF1GxwvVBddpSA5Gya4brf7Pg5uKQfJ52nHt0mDIbm/n77RDP/g3LBiefs88dQAlEqy
	6Y4cgCb6gLN5I6D0DGtwmjjQ/PCw75mr970Fi/uQ8=
X-Google-Smtp-Source: AGHT+IFW4v1M23MnWZOGq2XuWv/7NQ6xbzgVsqtYbBW5KB8zdRPqUl1XfyZAIJ8gab2N+RgaYYTqNQ==
X-Received: by 2002:a05:600c:681b:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47d8486d5e6mr34816615e9.12.1767799351941;
        Wed, 07 Jan 2026 07:22:31 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm112064125e9.1.2026.01.07.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:22:31 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v3 1/4] HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
Date: Wed,  7 Jan 2026 17:22:12 +0200
Message-ID: <20260107152213.143247-4-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107152213.143247-2-sunlightlinux@gmail.com>
References: <20260107152213.143247-2-sunlightlinux@gmail.com>
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

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
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


