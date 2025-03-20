Return-Path: <linux-input+bounces-11035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22FA6B05A
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 23:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DC877B3ECE
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4656022ACF7;
	Thu, 20 Mar 2025 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="M+0yvVb1"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739822A4F8;
	Thu, 20 Mar 2025 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508580; cv=none; b=mgCcI2hO3jx2+3YF2yqNWdaoBwsdMg7rc2qCAe/N2FMI/2R/AFmVeIyn+fmBokseNif+UkOphWWuIduDlUG3IoLkIJXEd0pUmGOs+Y6MZaoPhZJC+WXx/IYeIuHNaU2DGP3hy92EiA2KlUMeS8amOQtZYsolDgtjz6f2DLrT5YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508580; c=relaxed/simple;
	bh=4BQqHd1OOzRRb86dXKkjwItFzahLzsdLCvnUCWj+G7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MP2sMFgqMAILKxCso+cab1ur50L22bnvQRZ8C1dJ+BvVchkRgkD5Bij50h1W3ck2+h8gRqwBt9eWZne6h90xeA4sxl53GnexwlmPHGozKngNpYIe/eYMzH8TfhEDc3WIlkNwo9gi2mI9jC16aeMt5ZXYYG78En4hNAgKWzUZxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=M+0yvVb1; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 03E442E09620;
	Fri, 21 Mar 2025 00:09:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742508576;
	bh=1z//ighBUYV8w5qWrHZs4G2UEl4ZT4RtnUoBACna1r8=; h=From:To:Subject;
	b=M+0yvVb1VtJKVApZMU59Vr1DRv3Oe880K005Xs83ULoJI/JkDONI2hrmHu4WlSCEw
	 qHBDMU8T7AAgjQPWmisux5N3viZc6/DeRIHUgireCuDAwS/BqNNwwOuGhPj8kJRq0w
	 uKt+QpqlaGGsz33sWQfFbb+F49yg2j16qLUx9HQA=
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
Subject: [PATCH 03/11] HID: asus: add Asus Z13 2025 Fan key
Date: Thu, 20 Mar 2025 23:09:16 +0100
Message-ID: <20250320220924.5023-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320220924.5023-1-lkml@antheas.dev>
References: <20250320220924.5023-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174250857605.25698.10018814384596502507@linux1587.grserver.gr>
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
index 5eb70716702ef..b61b53d5ef240 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -898,6 +898,7 @@ static int asus_input_mapping(struct hid_device *hdev,
 		case 0x5c: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Space Power4Gear */
 		case 0x99: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol */
 		case 0xae: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol */
+		case 0xec: asus_map_key_clear(KEY_PROG4);	break; /* Fn+F5 "fan" symbol (Z13 2025) */
 		case 0x92: asus_map_key_clear(KEY_CALC);	break; /* Fn+Ret "Calc" symbol */
 		case 0xb2: asus_map_key_clear(KEY_PROG2);	break; /* Fn+Left previous aura */
 		case 0xb3: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Left next aura */
-- 
2.48.1


