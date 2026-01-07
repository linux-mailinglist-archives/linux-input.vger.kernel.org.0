Return-Path: <linux-input+bounces-16842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF84CFEA67
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51BF7301BCFE
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DF738B99C;
	Wed,  7 Jan 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhaW/JjJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4DC38B999
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800562; cv=none; b=u6+GY7WABgyJlsf4Rpyi+ZbG+BwJVsSoojHqobvhvuaPL5uYpNZmUQy37F9zoZuNQ7X11VYJczcF8TvOMlzchethybnRbjdBiXSyqGGnlmx4m2tB9fzyp6YI5vpz/EsalZ40eH4vw0r1vpLJ+EBw2s4iMN51xq+f6ykkHTAIJ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800562; c=relaxed/simple;
	bh=nS6pktisk1hD3TU7J6j1xKmwIjoYqBmyrao11F/mGbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkP0fEvtGCX78asGMC7UUqhACRu90ZwR0b1d+FRpKRUcHQqvC/fG1+a2sWNueKU2xQdaomIxjgzjQFtdEU1JDkstYmcDkXP9gHlmmwF08HH+qAg3RsRqOHNSls0zzpQYXTIyp8ESSGO4ZjL6giNMM8ooXP9395ycMF+YSZ8GUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhaW/JjJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so14771125e9.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800560; x=1768405360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1iAxTFSQoTWeJxaL1NW0AepzE1fhDVEkVj9Fn+hGno=;
        b=mhaW/JjJEgncpb2EtHM6aUrI1FsbJDSFMB6o2JpLx8PRr1PdmgSMMEwY4K4K7tpnmE
         RZ+4YGdZjXP1PfnZSGRXfGIICRLF8gXsKcNACWAxwa6tO6vOL5ya32QYvbte3CJVGd4l
         IBdJoUQ9HJyo8WqPiGXZax58XleGnfE2/o80CVaWK2rbZud+s52QjY2miM6r+s8q3wIP
         AZres6aL+i81e9mu929JmZVl7X097EGc78kreDY4UhcUksaxYxF78ZDw93UXoQ5GNNn2
         uL/hAmWKEsqXL2WkdL3BgT1/ZsIT4mgUlWn6wSahqgIXvxCk1LM9nblOF1MO+0MN5Lqk
         hqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800560; x=1768405360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1iAxTFSQoTWeJxaL1NW0AepzE1fhDVEkVj9Fn+hGno=;
        b=p4CrK0EkDUZ7hBDlse/loSDGijZtLFmd58DHYtH2a4G7i3PFD+wXkMoIdzx6mILPbc
         tubXkAKjvWXlJbDljWA1uZRfdkPbnZIjU34t6xV1EcItS+y1EGHTz0gerT6YUOmh7G8j
         ZSw1ZNsuArQpC+boUSo4EMGpgoE9HIKKggQz6WzauSTyPdtsUNDnT7bCNOxWcnN6KOvg
         7fLRXUQXYCtlqZhGmCg5DLknhmq6P+vK5rVaXFb2MLz1bVIO8RBIY+GAyqGLbi9TM4fx
         Lgl5owasLikajz0882ijzNG9MVFXwCSYPWcQvNVyIHFpSzlzQ+b/wQ2BJRkhieihgdXZ
         rYYw==
X-Forwarded-Encrypted: i=1; AJvYcCWSTbRXFDIVT+k52fyKxt0RX1Hblnt5aNsnonuKDoBY+6F4Z9NrFGSIY8THbrbgPZIaR9KzL4EWrZ7Ykg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx8kc/GrER2itnOiqyCFdY2U9IgfmJXzSJvUp04OW69B5mSbN6
	XIBoOIdTc8botcCbP1JzTsAGsjisbSeayYYp3y+aE4fTmePaOVd0C+k7
X-Gm-Gg: AY/fxX7+XUWpAj6QzaVJmEJYHqcheVZ5Bm9Td0X1tuurueEyArhKARd8Pqyrd7St3hN
	z7Ku+KUv/s//hK+ceyZ1naBTGQpCPuMHjKrl37dzGTt8grCRNIoCb7g1fwiO3dvW2pAWC2S52MF
	QAGHSYbqyiLTeeCR9lSh2BAzaZ4/OCe6hay3FDs1STxEIJ3Jl5SzHn6YKJYzpPqRBEiS1ma1XSA
	IpcsdvL4MfNemk5Er5fXTvk0u74bQ75m3e53apuFHeXupyKmsv8Q+lxdtP106Kt13xAk+AhEwpK
	/0cstE3sOZVduQDCoUYzQ6IU9ZgiSunfOWUvFjTVR3Cq8dZgJDY/Mv1XpuAZ2sbC0Q32Cy1J9o0
	8xMzX7cjexUkOnqYjvy0w1sPnYPBfy9eelFtcSb+0AAU0DsZmZCfl4grIkHChWleiZP3dGegxT4
	r/bwdnHfNrVS9ovn2Xr8ZjQ0JhNQo1BViOs/SQmLw=
X-Google-Smtp-Source: AGHT+IHh42IGnipWJP03g++e9iDVeFqh1L0/fP1w53Z7LZVenjO5qsb70T0wsEsiWCzhWLqMbCV5Qw==
X-Received: by 2002:a05:600c:3556:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47d84b3bb18mr35807725e9.22.1767800559530;
        Wed, 07 Jan 2026 07:42:39 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm10897704f8f.31.2026.01.07.07.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:42:38 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v5 1/4] HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
Date: Wed,  7 Jan 2026 17:42:18 +0200
Message-ID: <20260107154219.164514-4-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107154219.164514-2-sunlightlinux@gmail.com>
References: <20260107154219.164514-2-sunlightlinux@gmail.com>
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
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
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


