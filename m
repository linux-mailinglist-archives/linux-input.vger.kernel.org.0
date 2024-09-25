Return-Path: <linux-input+bounces-6708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A5985F82
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94EA01C2134D
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 13:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD621D356B;
	Wed, 25 Sep 2024 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODXtqwG+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B71D3566;
	Wed, 25 Sep 2024 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266585; cv=none; b=HZQTPTkwyVliOGir7Ny3Ov98sSc8lPf/ovpAnRCgatJ4JYbo/cYeYOqogiLLl3adaFwPqaZPhRuDS7YPOWLnSXClUtus2texBnd7WjiviojNm/9zCpS6YKl25XPFdJxzoZWNiI6tOVI8n80jhzbNxOwARejcFXm2M/48ZHynKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266585; c=relaxed/simple;
	bh=AHPXr8YKzjWBvpnPv9rXURtZuaHbB76qeYlqku5w/5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DM3YDyfmDcaZajw9x/TCGs/TR8sXXkUP6BvAhmfb1R0hq0iMD+2flw77T9QEhQL4vInnfBa71VuocZwqVNbGaGlxCrRvMqGFb3XKpe3+O+WwB0zQRnSX/Fg0oT4vqA4R/+nizw2GO9Di1VZwKK90rUchFGfpgWO8pgsRiHX0gQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODXtqwG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BA2C4CEC7;
	Wed, 25 Sep 2024 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266585;
	bh=AHPXr8YKzjWBvpnPv9rXURtZuaHbB76qeYlqku5w/5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ODXtqwG+S6Qpe4eFSLJeCoVOTcu3QjggfFIsX/8FzF670T3HWLa4049xxi8e7YrdV
	 87XBn+xTTauvDN7WSONYg282+DfpRS6yrppPmDOXQIml8Gg9O30uZrU3xeXdHORDNI
	 7uhIVELeEXiaGH4ZhAxQ2bm/CpU33bOdUX8NDnWGm9S/pELGRlA+/vbCOd/c3+O21/
	 48ku/Z8injkSW0aC8b4U1y3UDlRrubjk6HMucRhPzhCG5B0SsZu2S6j0DIlaFf9Oag
	 m1gbmp+Rvs3+7fkyN5BU+rT+F1weRpHkKm7PeE3LJ39gIX3zMZh6rohlOTE5OS2ePP
	 doSF651HsJ/JA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 104/139] HID: multitouch: Add support for Thinkpad X12 Gen 2 Kbd Portfolio
Date: Wed, 25 Sep 2024 08:08:44 -0400
Message-ID: <20240925121137.1307574-104-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit

From: Vishnu Sankar <vishnuocv@gmail.com>

[ Upstream commit 65b72ea91a257a5f0cb5a26b01194d3dd4b85298 ]

This applies similar quirks used by previous generation device, so that
Trackpoint and buttons on the touchpad works.  New USB KBD PID 0x61AE for
Thinkpad X12 Tab is added.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index ad4e5c5a38ad2..62e879fc2390b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -786,6 +786,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
+#define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
 #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 17efe6e2a1a44..8ddfa4548f7c5 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2084,6 +2084,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Lenovo X12 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X12_TAB2) },
+
 	/* Logitech devices */
 	{ .driver_data = MT_CLS_NSMU,
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.43.0


