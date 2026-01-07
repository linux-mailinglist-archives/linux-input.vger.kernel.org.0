Return-Path: <linux-input+bounces-16839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B1CFFE53
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 21:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 976D83019E2A
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 20:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8B33659E0;
	Wed,  7 Jan 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guj3/wwK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79322364EAC
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799388; cv=none; b=Zw/1+cywl9FGRLMDCHokwY1EHew2BKNKty9kp7MiQob5ZRNh8HEC1fI/J/095P3UE6BaUrxgca312EnJQAw1NkUw/dNu1ars+Mk5/01ejZ6ZUdpyvdAoj1akHK/Wn/Av856GeYES9h5hyA1ya/BBlo0gShe6QDdhukd+tEf+wbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799388; c=relaxed/simple;
	bh=kEVatJuhwcribwS5phTkXXGYCZjzzAaM4rM6+EokEf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvOqCHowOYTLUYtgO/VqQI3KjbSBkWjC1aslZOiGjOO1zwmweDxlRslGEzoRRekxvF8wV6E5/nMMvuIewB28UwMHzq8bCeZ++ALYUXLwG2LMMnzjvxLQWyu+4pP3NFS/lX8MqE+ZBjfRmd0JPf8yZp59AhivmUPS+T/OsVCAz9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guj3/wwK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso12590975e9.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799383; x=1768404183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3hredH+/A3P6nqyWdZvG4QdgvBANjzpG0Fb/Zydwu8=;
        b=guj3/wwKGRQOLYI4bThUuApGAkCNjBHMty7RIOhi7crI/EDyjkb1RXhTLXXxBHO8qy
         YpyECEuY7fo5F1od2E5R3vyZfx6JrsT+4coka3dEK4gqmqu5ZRczGC5TVEd4mmqN4PVG
         EMdCr8++UCYcSX4ePmrm8biECd1jusR6l/gNHJQ4Nvr4m+KgEBJWNf5Ac4mSLyCbDvuE
         sLj6Bupp1zhjva6BhVptNC9k+WQF4vMEbyUkxzHmGxWAJzQ/+N2+khm1zh6Q3Kd4iuRG
         HI12Q+kJpjRJpyqXpT8TiZemJey4LX7nGzyI/NI1SBYmMGksZcMjUyHgvSQENbOxfI9n
         6mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799383; x=1768404183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3hredH+/A3P6nqyWdZvG4QdgvBANjzpG0Fb/Zydwu8=;
        b=dzniIY/qF3VORUzmsryfwWUmy6UOrgllc4MKD7EquFHNaLTIchJSGYtJR6a8Yut9mM
         P7J4N4GHMgr5AHMw0SBej98ptZlH4FazgGIxeF6j6XwNrYaj2GgSb80pnFOZSPSG85Wd
         z8Y+tOSDWAvgcsQ2zBS+v1NgxHsL/NCs3SGJDAPyc5Ed3SH/tE4MYeQSQav2khwza2uK
         wNScn/nlfXUL9djMQHD2l/5a0G4lGR8D8IVrhC4LaO0Vzqf8sqRPMK+TGrFFbMjCPkFp
         LigxGSil8hTeMUawzbgu1FRZBsHtDEZ3O4Fp36IQn5mwaTRWHlqCKayDHrW0kOjKypVb
         DHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEz3zzZdyiptsVdNuiBQQgi/IqPM+PMmE721YWT1V4ZwFVUwB5a+Y2bB1wPoEHlc/PripG07mxaXdeAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmHoB4KFaDCIvzvd6UhLIpW0g2p0mIZsb1UG3pPvKeR4PoLNJ7
	lgqO77jdDliXJnZyOS6PvhkY0Jqnvc2oI4D13zCFmiRGNzVZDe9qVD6S
X-Gm-Gg: AY/fxX7b/EaCsaI6cBnKzGwoMw1ud53dXLSs+XdMiM1uOCCmlI3SE3uAlu/eipVs5kR
	FRomcVX9O3EbZ3Y7YTx8MOJ6aTtvw0Yo7fCnd+kfgPuLVWwreP+M+UWAX41M0U4EYXjzgEFkvtK
	4L2njwm5PbyzDiiJ+3bjeBmpXgQfXxJTm7H5996x8fim0vhl+TNisAzbNrDC/Usy7PvCBqvHO6Q
	VGxrGbtMYOOZ85eZXp7onnicGHoXJsIdkgATxN8tuAA1P3GN3fPIu1eQRoXJYuECO1GSNaZbyPD
	uCEdyQKmsVS5A2ku6Gknfp0HJidpW+boz51iBhtSJs2Pssi/TBQYS9CQ7fMfoihDcFu1saM+/AG
	m2r2JJGgchfCM3jX420eKPrtMNq6AhTxysDtxxJKcigGBTobQB6Kt/ZTO7xcw37krdJ2xmrkLcP
	khGGqAKOyT9XG6ID7OVgdR+edPyh41cg3HNjDHQmI=
X-Google-Smtp-Source: AGHT+IEe8VovSuB+Rs2+NhvpCXGunJPI34W+th/f89j8LhAZOES8IZy1xFqOTOzblsupIhgJ249PEg==
X-Received: by 2002:a05:600c:1d14:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d84b0a7bdmr32486395e9.1.1767799382542;
        Wed, 07 Jan 2026 07:23:02 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm112064125e9.1.2026.01.07.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:23:02 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v3 4/4] HID: asus: Implement Fn+F5 fan control key handler
Date: Wed,  7 Jan 2026 17:22:18 +0200
Message-ID: <20260107152213.143247-10-sunlightlinux@gmail.com>
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

On Asus ROG laptops, the Fn+F5 key (HID code 0xae) is used to cycle
through fan modes. This key press needs to be forwarded to the asus-wmi
driver to actually change the fan mode.

Add ASUS_FAN_CTRL_KEY_CODE define and implement the handler in
asus_raw_event() to send WMI events when this key is pressed.

When asus-wmi successfully handles the event, it is blocked from reaching
userspace. If asus-wmi is unavailable or fails, the event is passed to
userspace via evdev, allowing userspace implementations of fan control.

Tested on Asus ROG G14/G15 series laptops.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 8828a3b3054fa..d6f0050fd441b 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -65,6 +65,9 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define ASUS_SPURIOUS_CODE_0X8A 0x8a
 #define ASUS_SPURIOUS_CODE_0X9E 0x9e
 
+/* Special key codes */
+#define ASUS_FAN_CTRL_KEY_CODE 0xae
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -386,12 +389,34 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		/*
-		 * ASUS ROG laptops send these codes during normal operation
-		 * with no discernable reason. Filter them out to avoid
-		 * unmapped warning messages.
-		 */
 		if (report->id == FEATURE_KBD_REPORT_ID) {
+			/*
+			 * Fn+F5 fan control key - try to send WMI event to toggle fan mode.
+			 * If successful, block the event from reaching userspace.
+			 * If asus-wmi is unavailable or the call fails, let the event
+			 * pass to userspace so it can implement its own fan control.
+			 */
+			if (data[1] == ASUS_FAN_CTRL_KEY_CODE) {
+				int ret = asus_wmi_send_event(drvdata, ASUS_FAN_CTRL_KEY_CODE);
+
+				if (ret == 0) {
+					/* Successfully handled by asus-wmi, block event */
+					return -1;
+				}
+
+				/*
+				 * Warn if asus-wmi failed (but not if it's unavailable).
+				 * Let the event reach userspace in all failure cases.
+				 */
+				if (ret != -ENODEV)
+					hid_warn(hdev, "Failed to notify asus-wmi: %d\n", ret);
+			}
+
+			/*
+			 * ASUS ROG laptops send these codes during normal operation
+			 * with no discernable reason. Filter them out to avoid
+			 * unmapped warning messages.
+			 */
 			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
 			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
 			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
-- 
2.52.0


