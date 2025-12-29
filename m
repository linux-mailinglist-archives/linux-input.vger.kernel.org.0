Return-Path: <linux-input+bounces-16722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB6CE5D6D
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 209BE302AF9B
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66327FD49;
	Mon, 29 Dec 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC0hM66p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DF279DC3
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978290; cv=none; b=bBujmlwqUXkYG70lIC9CG6OIaRYkTc8uW8+c7vDpNieCNaT6u6oepYyHN392+x00q8w1EIZQSh9oOhrzk+64JjvQcW3x56YqD8hftjvcdK3n9RQakUO8qeC91IDtb9Ybz0kHogVQNk68zFuUO/jMPXNgn9MBNCqFZc7LZE2c64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978290; c=relaxed/simple;
	bh=9+pJd3NBP++1JTk1sqOowLELYEPW5+pC2QloAQLjOjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZQHX+3ICJQMkvefsJsbcCzcs1Ha2pzUQL/kHrVk9IpXUtRu/lNmjlrmV1D3+ovVVcpr3KYoxXDHAtbIRpGVPau1DRmAi41Y5k3fn/F7D66dbD4SCuKz56g1oKSgJx38jFr79uG4wLpr9MjiSGWghGZvmze8IdQPT/QetgaZ9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC0hM66p; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso7720928a91.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978285; x=1767583085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5fLauwF03o87S7cIGBwSfbxsvXnHNtEz/FCDWnd8ng=;
        b=iC0hM66pQzv/0cNJ5dAl8AcF8iVP/J7Sf0QmZxmmg0mK4EiqEWkVpziuEBKWKxotmH
         69wnxE6KX+bwc1vAJZ4gSboRmGQE7n7pq1XnB7ACy6ehOAd/rfdipBu1dp1JpmumQ52l
         pteyhl6eUVBfC4XYFOrpc05p654ffF7EXj6tSf8WDs6unIsDi3TJN0czoVEnmY+naV04
         YGnt66g9tzCaGISXoDvVMNGa3Wp/TLiEZosXhN2tcFntuXi/imHkK0X3rqFtWYYyXoyc
         Xzv6dSp4NG091bVz9CoMc1jQWjO0ouHuaHKb5hNjgPEbbhGVv+BUPkikSkqaThXbko6E
         uT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978285; x=1767583085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5fLauwF03o87S7cIGBwSfbxsvXnHNtEz/FCDWnd8ng=;
        b=vIZ05o4/oNjVV/Piqy4THUJxFieGYDNmuV+tIa1CuMKTrGmanqzRQo6e52XmO3cxtS
         N64ulPHCgADP+y9KtLTrHd++2fD7aVtTC6WGlaoOtTgSxYqEwqTxvAZZu9l9RUVvBMjH
         Z7IrjXo6ulOdNFZlKsbZgLw7QKkIkiEYrn+yNfv6xflIwt0kPGLEfyK8qVqkWrLt9Yuw
         q39CerasPpwNTy/h1WEwBmxdG+lqWUngJxBBZCBpixUmEv6o7AbJdfTWKuGRu/2RmgZF
         oETzufH3yT+gfLvP8+73pNGr1ILhdAOjJQKPKOQaClNn+jelFqdTYZxgEpa57D+kGYXR
         LItA==
X-Forwarded-Encrypted: i=1; AJvYcCV/2Eud46pi28pTKfAAHUvQzwIJVqLI1FNr6PpiYBl5lB2Il60BxjzDwi3TkhZPtZkEC+dVPHPjCf3IHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPBA9jRoBUx0XgEz2j8ZYxb9urVf2axqpAGf8sdG5HN4Dq1tn
	jtIEypad+34vpbmyA1+YWIl0xadG6levcVuANdm+fmIczgY+0kxqEleZ
X-Gm-Gg: AY/fxX7QlAjO0ElxUq7i67aaIsM/rME5kANfnsz9ITyrbX6+r5veWuU2vjQu2XWQo0r
	VsRsQNP66t+SdPAPp00tXu7mxE1y+3aD7eJ3u10FPUk4Ylknl9DMfGd09PJ7kF7tndg0js2DAV1
	u+63M4qm7MGFYGw3y8hbr7KIIjL2xxy2qql26D5tlQ3/wtnxEdegyO+n+EPQkXPttHS90NGrVAT
	lEYIoolBYeFDboiKTivv3nY24XJvtOwbfhQqgvTcJLBaT38uMgEnMqvQ8k9DgkpnhZkVN25OVmJ
	L0AN/rhwQl0gZ9bPKiZ4ZKPYYLrXZ2VNj9rws0Ua84aUhUXURPgkScCAjMB7+xSoPUt3WIBS46v
	idjlt3dnzqfyofBYws6rlBiOdujKUdBkQPsvaibRfNaFFRr2/u5SnNqcfPsIgnU754epIB5tUyI
	Vm9julogUXU8BjPy7iPOTgB4TAc5NSvJnTldIZuD0feuNcICIEOOiM5Kf0STY4MIA=
X-Google-Smtp-Source: AGHT+IHxlvbsjIIiGCdaZR2kNkfJhhczYREzl56thhmxe0C7ocWaa7i+0Rinex+uCUd+z7fHP0XHDg==
X-Received: by 2002:a05:7022:7e8e:b0:11b:bf3f:5208 with SMTP id a92af1059eb24-121722ac21bmr29615714c88.1.1766978285028;
        Sun, 28 Dec 2025 19:18:05 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:04 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Hughes <hughsient@gmail.com>
Subject: [PATCH v2 09/16] HID: Include firmware version in the uevent
Date: Mon, 29 Dec 2025 03:17:46 +0000
Message-ID: <20251229031753.581664-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Userspace software fwupd probes some HID devices when the daemon starts
up to determine the current firmware version in order to be able to offer
updated firmware if the manufacturer has made it available.

In order to do this fwupd will detach the existing kernel driver if one
is present, send a HID command and then reattach the kernel driver.

This can be problematic if the user is using the HID device at the time
that fwupd probes the hardware and can cause a few frames of input to be
dropped.  In some cases HID drivers already have a command to look up the
firmware version, and so if that is exported to userspace fwupd can discover
it and avoid needing to detach the kernel driver until it's time to update
the device.

Introduce a new member in the struct hid_device for the version and export
a new uevent variable HID_FIRMWARE_VERSION that will display the version
that HID drivers obtained.

Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 5 +++++
 include/linux/hid.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcb..524f2b9ed512 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2887,6 +2887,11 @@ static int hid_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODALIAS=hid:b%04Xg%04Xv%08Xp%08X",
 			   hdev->bus, hdev->group, hdev->vendor, hdev->product))
 		return -ENOMEM;
+	if (hdev->firmware_version) {
+		if (add_uevent_var(env, "HID_FIRMWARE_VERSION=0x%04llX",
+				   hdev->firmware_version))
+			return -ENOMEM;
+	}
 
 	return 0;
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index a4ddb94e3ee5..8249da55c9ba 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -698,6 +698,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.51.2


