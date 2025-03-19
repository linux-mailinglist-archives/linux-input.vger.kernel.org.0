Return-Path: <linux-input+bounces-10984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A47A698D5
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471621B632E3
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A905D215773;
	Wed, 19 Mar 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="WmnHHAcc"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11994211A24;
	Wed, 19 Mar 2025 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411615; cv=none; b=XqGz78Ips/IlcVE6t2YDHrwYTeSrLwsbIeZ0EDzKUXqrCXCLcgLqZk37gVf6SePS3tTvno34WHRvVSOit72YW1ZXjN14jUJXhO0Mwb7GGTveSYt/k1oCflp3+ESRIW7/iXhvg0h2I5i+uVY5cXlqxiS/WHRPJxsd+T57jpCXZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411615; c=relaxed/simple;
	bh=wAhH0wCyLMYN5siRxm3cdhd9sDXfVTdnZj90NLYy+Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwKTzJ6ELW27XFxXvNgVCBmCwfo2A76mOfJ/hNyA4sJXhKC4S5+4Y0VOJIJ/cOa+LveXbyzZCehF2IFZYoUdLagpj3H4OK6IB5b0anmqkK74wuSAFBE5RQA2qT+cGIHpDAQQRmGo+TUAFSmOeBcJE9cUXhHhYhQMbxsgpf5BYvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=WmnHHAcc; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 7BEAF2E095C5;
	Wed, 19 Mar 2025 21:13:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411611;
	bh=dyuxnbEjcCrtzEd+4OBqfcYOiyJ+75xQVkyMc6sKd7Q=; h=From:To:Subject;
	b=WmnHHAccp3DOLoI+/kFKSE53ZeknXQoqpFalDvKehOEDLV/jazQDby1MSOyu3rtTJ
	 2g61KAMYB/a4weT5q3247l0SwwovoevuVo2dfdJM+/PsewELC5OWD2Tid3LLSn2tlF
	 tUaAniTPPo1/0SZRCGGiDHe5zB+mWrNKx5aS531o=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 05/11] HID: asus: add Asus Z13 2025 Fan key
Date: Wed, 19 Mar 2025 20:13:13 +0100
Message-ID: <20250319191320.10092-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241161162.8006.15779185311527245548@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The ASUS Z13 2025 uses the vendor code 0xec for
its Fn+F5 fan key. Add a quirk for it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index cdd9d9c4fc95f..85ae75478b796 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -897,6 +897,7 @@ static int asus_input_mapping(struct hid_device *hdev,
 		case 0x5c: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Space Power4Gear */
 		case 0x99: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol */
 		case 0xae: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol */
+		case 0xec: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol (Z13 2025) */
 		case 0x92: asus_map_key_clear(KEY_CALC);	break; /* Fn+Ret "Calc" symbol */
 		case 0xb2: asus_map_key_clear(KEY_PROG2);	break; /* Fn+Left previous aura */
 		case 0xb3: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Left next aura */
-- 
2.48.1


