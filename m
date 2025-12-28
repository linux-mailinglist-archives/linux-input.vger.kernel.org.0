Return-Path: <linux-input+bounces-16708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5DCE4B94
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 13:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEC52300769B
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 12:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B152C326F;
	Sun, 28 Dec 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrR1fPHC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73587265CA4
	for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924441; cv=none; b=EcmlXRd9qzLDJt+9Zlyg8hU/tukMF62HkzSWvYkp08SH9L57dMBay7p8X98w8H3GhIsRl+Ze5ezTg5N4lQklKYn5Aju3hBgeYya8f5FcLH9csjnhSF0AAnej80XCJjyxy+PayPWCjFqWYzSNV/jLTA14NVDgAZ9ZDitm0EA/JFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924441; c=relaxed/simple;
	bh=G4hkui2frOo0G/r9Uz0v4AWWhohtaM7V20BKdV6se6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjkNut3RMHeTq0tgEPayGMyEJmgIVvp33E9EHOOxgf9n92USG5/8hbF0lbon2EO0CgVrLg4wC+kfsMF5+gTqyGzSZA7FcdO16QAdXiIRxx4WNpFN9uZaNNkhAkUB+suniyFEZ1PnAgKcYwVLW5lgGmlZ7gB/sBpOe3/PswcHBD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrR1fPHC; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee0ce50b95so88374401cf.0
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 04:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766924437; x=1767529237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJByTbifGyBY6Vqv1f83yZO8v3AvpdnFvxtb7bJ0Bn4=;
        b=PrR1fPHCyN9uzEa0tFAeYl4JnFHR+lNvgpqF9fRyhPKgpctHfSikVM//bOHev3i01v
         pqc13DV8AiyExUV1tqY1JhFY1Rsrq2Kf9/c+tn2iriRtNuaD8P+z9BEnAQdQZTJ8d35I
         Ta3SybSc02cjjwYNevvRycqDupJcvqqX+jXDN+OV8gprkvYwiZmimQcrVgwRgzjwxY6j
         FLD76+yZQ96iYAQ2wcYeg3t8DhJ5NqalpF/GSepFXZv8TRPddaeVjOTCVDa71gPpnLpQ
         WAjPTxTOPztgb+QAMMx7FMpC0dUNPPEH8jI44JZHD9/rTpJska0zX74puvozrnN6vzoa
         RxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766924437; x=1767529237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJByTbifGyBY6Vqv1f83yZO8v3AvpdnFvxtb7bJ0Bn4=;
        b=WFlqVtkx0oOQqdyWFPXdRExtm4ExWJGdobxyqRm87Wjkt41OiP8Ild4Bwe+VmpEsV7
         gRVszVQxB++AB0lqlG7+pYNDhR6rWGSk+EZwTlDfeLfxp5fePVD2exDWfuuDr8et9qRT
         CDh4k1Vm872vDC5LSFiPYd51hC+42d310XJ5mM2KMMgkCB2AsVj6p2aXh/GlDJMWPCCd
         V1BTvRYiLGWEVKEMImh9wQbPNNi1fQJNW5iCBjWY5Y7uVwR0DFbWNcTYRtJEXXGNBnNE
         EMXs2dxi6D5VF6Kwd/5o9fQzXNcGg9tnZ9kBPOGdC8TW39ZpVI4veLd8rNkMj7p0Us2u
         Pybw==
X-Forwarded-Encrypted: i=1; AJvYcCWGzL5znO+GNQbRGXyKKS1qGoia0SGTDRWx9USyEq/IVO5LsPNlKvkZw22ww0M7yn3jG0soIxNb9nFgow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3RYnvYsFn4O4T9ZBW/t9ieXv5w7MR9p/mlf33W2gmHu7Zver
	g3D7Q42zuStrDkaffmQtCC/eT+AAZwvBIOgI6GDq6WCgZh35599JKdDc
X-Gm-Gg: AY/fxX7Cl6sH6+tppkEV/dJUzcMDWCgR2+1T7LhRUAtkGerjw09Ubps+bfxeo/M2ZGl
	+iUjjb5zwtw07EDAYGxBBJ3Kgp/AQutwhoNGGl/ZcFktovf01gSLSvOS//VO+XCaSFyyGDn6921
	Lpvzhz0owmYpY6eU834GctVnwWtXtN81eL11kE4AeD5XyfDteHw/HjQixb4G0pTNW7Fiw5njiUx
	3tGgrPBz+WuIsXuba0g043p8bNxmI+ZlqFKEs9QaFHEUfigD3qlEpKiKt1kJwhJ5/cOGhGT/MdX
	ZG9bsjPPw8immJ6/XCnQ18Y9Dro8FzX/93KaRN9SizGMzVo2xyrhNjMnsu8/Jr0YBFtyqatvg3V
	VeD+UJUu7hgZ+PvPo0E1eTRgLUMpdOSylIPT31s50RsALw9s1snOTCdki8oyZg9xi7Wig++YC7H
	U2tnO/xfllq58+mU4PlJtwf6wWBbIUmMPakDZ/zFb18Mktt3k=
X-Google-Smtp-Source: AGHT+IGd6qxwVDuKNPoUR0BWPH1AUlPOtzZdMTxp6aaupwDczFckXXdG2WOtE79bGWdPRNcMURC/1g==
X-Received: by 2002:a05:622a:181a:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4f35f43b6c9mr464005311cf.27.1766924437283;
        Sun, 28 Dec 2025 04:20:37 -0800 (PST)
Received: from achantapc.mynetworksettings.com ([2600:4040:1233:de00:c673:8e0d:7a28:6166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm208744456d6.43.2025.12.28.04.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:20:36 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH 2/4] HID: quirks: Add INPUT_CONFIGURED quirk for SteelSeries Arctis headsets
Date: Sun, 28 Dec 2025 07:20:23 -0500
Message-ID: <20251228122025.154682-3-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228122025.154682-1-srimanachanta@gmail.com>
References: <20251228122025.154682-1-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HID_QUIRK_INPUT_CONFIGURED for all SteelSeries Arctis headsets that
require the hid-steelseries driver. This quirk ensures proper device
initialization and prevents conflicts with generic HID drivers.

The quirk is necessary because these devices expose multiple HID
interfaces, and the hid-steelseries driver needs to bind to specific
interfaces based on the device capabilities. Without this quirk, the
generic HID driver may interfere with device-specific functionality like
battery monitoring and feature controls.

Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
---
 drivers/hid/hid-quirks.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..8a7c3f433040 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -699,7 +699,32 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_STEELSERIES)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_SRWS1) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_9) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SUNPLUS)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SUNPLUS, USB_DEVICE_ID_SUNPLUS_WDESKTOP) },
-- 
2.52.0


