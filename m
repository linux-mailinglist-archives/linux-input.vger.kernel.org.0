Return-Path: <linux-input+bounces-9962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A5A30E72
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D77188A15D
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A0C250BE1;
	Tue, 11 Feb 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVF1mtES"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0382505B9;
	Tue, 11 Feb 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284528; cv=none; b=lRQU90Ig3lVPoxbOZBqQM6R5nLpqWwRiSDZdSHolkIA+d4H+0KSi0NSqgMM9URTVggWm6ieor03njeLwGt0nJxfSmvtSBNc8FD1saxepCA/7p9pecsu9EVouEuAKH/pUL+EqQiUcgHbwLZeRspoEnqrUIYdXCC65ik08TNwknQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284528; c=relaxed/simple;
	bh=WiU2yqu46XQLx8UhQf+E8j+pvd7+tZjLoi4sx8jhKrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T05Lt9wc37pNKkUz0eNpSOobl0oxrrtKCKlroTdAnJbH2g8cyEceBXyUvRCcau2ruuDUI8kNYoc8/dxKul01doOJsvPWWXT0ftII9E+Ru6iMGtFratK4KgTY0l7l3iaIbvM3DYDc0NrkOobQonKHdGOkA2KpiCUDMBY3W8nnzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVF1mtES; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307de92bce2so4452361fa.3;
        Tue, 11 Feb 2025 06:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284525; x=1739889325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJIT5gm5Fkeir9qgPIT3wEjMUvphUfF3iLU1bg6b6Vk=;
        b=TVF1mtESAGs/gaEyUScHGpAl6irHFhIlsN/u4EZDQjYLDzOreAxL8l6hqxwnmOFSVJ
         94PledUkNk6DPl1hqCUUHAaOag8ns76nU5pKj0ED+DqIWTP25uG0Fn4s2uyEBRi6T/RT
         tAsWHY/KtsTR/4u6qBHIn5Urnu+D0o4UNuCRbxuIZ1C6Ccdn2bU6eUKspC6YnRgZo0sZ
         gqxlMyo3us1N8C/DTpA7oZovtyeDjIWagj8HfbkuiCIi0ZcNes+zHRGtWNrCfO4UYI4L
         Fmsa3FrZYWfQnKEzGIMaF3T1rzoX/5qPs0EzD+z6LCAHiSt7cSVSkLlUEVZjjkCKBNsl
         gqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284525; x=1739889325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJIT5gm5Fkeir9qgPIT3wEjMUvphUfF3iLU1bg6b6Vk=;
        b=ln8PvX1F5GC/A2oZoWD9DYbwsATJn+bljGit5PwciZKrGh7fz9/TmQcYzfzk69cSm0
         INth66uSRLR2m3uvr09qOxZPAu3DcEcvP4MDzWgWHdOv4XzEs8T1femiRwioRtKu0npI
         6NXsnuqhTAaTfBthOG1MkfIJzE6Ywe5hs6IDibkZHBEfViJsVHCflSlRKVwkMV2YGOQ0
         TV/QgslADZUdHZ/GrRU98MO7YxSi4xNM0OmsvUe8cvJDsT4KFWLCJafGTOlLmxnvxbRT
         9d0pjPUZqwyd8j5oF854AIfBHyWXc8Yo5LzA5nY6IsrUOXC70YU9aU8jw/NbuNap26Rg
         SMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9SFMO7nBr3kgRBTXpP6LrOcnc4vM7I2x6PNehZbm3IcmiZ56Xd5HV6niNqlb+aguutQRmE9vmbj2W7w==@vger.kernel.org, AJvYcCXAh1a1ML51wAc4V80pWdrGh/DnmEEITscF08YVKEYamVr5Uq1G6kH+J2frN1PrQPWRNved3pgVfziY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8saox0zl1yeZ1uEboGQyHF1eozbs1M+NtPo3nsidlfTJsi8TV
	/yWtIRT4xMZOCUcVHxxVXwvUvoMVkS91Ia0tEMlW/zlH+peLAyH8ofdKL3tA
X-Gm-Gg: ASbGncvGaFpn6o13dcbocU3pU4jJNvk7pWY7iK4oxcGkNIadILau2AAeMQHAMZYrA5Z
	6a63VXCPOtOsggFKt9nA79HnmVrgQaFK3qgYQUvc+u/4DODPbvKfMPjahjTbo0FEe6L55afkpqp
	AHlzMODUXgjkjyGwKGl1WCeQQ+1s6PFyBPBnxtAFk1j+IASsH55LsHFO+Fsfp8bjY8n7Jaek8/T
	MQmndb2q+pldRi4XZTkwVXB2kxET6DeniRPTBdaVOlBqEccd1OXqJ56WYvqxqcp6OVUCc6zUF9W
	wIWkrOfJYXimpvEwWkRhidfupPByPAo+5p9gfpJthg3YrYiJ5H23xzY51Inghg==
X-Google-Smtp-Source: AGHT+IFrSBEY1ri0yQOEvjtjV4z1ZTwp8pKMzLc86Umz+MpMi+zKCcIl8U+px1w6OyVqrq1h0QtfdA==
X-Received: by 2002:a2e:b888:0:b0:308:e956:689 with SMTP id 38308e7fff4ca-308fbe46cb8mr3688291fa.5.1739284524916;
        Tue, 11 Feb 2025 06:35:24 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:24 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 6/6] HID: pidff: Remove redundant call to pidff_find_special_keys
Date: Tue, 11 Feb 2025 15:35:12 +0100
Message-ID: <20250211143512.720818-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Probably left out as a mistake after Anssi created the helper macro

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index d5734cbf745d..6f6c47bd57ea 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1159,10 +1159,6 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 		return -1;
 	}
 
-	pidff_find_special_keys(pidff->control_id, pidff->device_control,
-				pidff_device_control,
-				sizeof(pidff_device_control));
-
 	PIDFF_FIND_SPECIAL_KEYS(control_id, device_control, device_control);
 
 	if (!PIDFF_FIND_SPECIAL_KEYS(type_id, create_new_effect_type,
-- 
2.48.1


