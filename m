Return-Path: <linux-input+bounces-15856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744DC27C27
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06494047F7
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF762D8771;
	Sat,  1 Nov 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Sn9uNVYl"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B872D6E48;
	Sat,  1 Nov 2025 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994047; cv=none; b=aBJY1Pz2BGx6u5M5tgmSEUaaWqbU5iD6zy+zx62Nu+YtIjnQED9BG4PX+7VcFa98p1yMJ+eeBLnRw6NOoreAP0HtogkEFRWCJuAEpA6fIn3Uzb1kWRXpJhL+/BQqjy4RV0MntZhWtzr4E+5tobBC30rojCUdmBiR8Lbgt/HZNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994047; c=relaxed/simple;
	bh=9Xz6LJlI5B/MJaRlqpCBUZcDhtrp83uHo95KBxa6T8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbebaZFodZXYlCZ0r+pRdCh0B2NS1GgrI0mq+DoKsJUhvffzyk6LvUjIUCN2id4HQiscvAyz8vyc90k+leyyFtZkpXQfo4OLd0GCMGYDm2QnfZ8uHapB4X3L14OhTv4AIcnJ8YoH6W7uKbniE4Mf7xnW62T6orSycNxlvBHlpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Sn9uNVYl; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 0E4013F2BC;
	Sat,  1 Nov 2025 12:47:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 86C6E3F2AF;
	Sat,  1 Nov 2025 12:47:22 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 6DEF81FF536;
	Sat,  1 Nov 2025 12:47:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994042;
	bh=7IfXul8dh5zsFR8IiMqz8MnXce3Ha9T49jE1rlnj3fk=; h=From:To:Subject;
	b=Sn9uNVYlc+TMxV/MG8+IXcwTqtbXMjvlhAi59ek60YBTGLt44HdoOqNqVdo1gGh73
	 VpZLDYfwisq/zX+F70EV4ynoEhjBs0f5zgZzbnAbrQgJ0Zl+yqfCSbTe9JZL3iPvhE
	 3GlxiUyIJH/tsy3UHUSDjH4Cp1m1GamRbzrK3YEuZW13zrHgEncgY6QrZsUnvsvOhO
	 67v4L5pcM53YVu+VsBOF6NkOFK8FENigVMCzVkWPkY11EQHBr0apAbkyveqp6DEOyG
	 4nZfurvcVW1prFniOVP0Z5SsdslTYO4COBZvxSVbTrCtrqGqdRf1DT1t+PbzgzJD6Q
	 H/FcPBHX8h2JQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v8 08/10] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Sat,  1 Nov 2025 11:47:10 +0100
Message-ID: <20251101104712.8011-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176199404201.3745851.17459440846174576120@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
 1 file changed, 40 deletions(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 1165039013b1..d8c5269854b0 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -203,44 +203,4 @@ static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
 }
 #endif
 
-/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
-		},
-	},
-	{ },
-};
-
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.51.2



