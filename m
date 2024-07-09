Return-Path: <linux-input+bounces-4915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2F92AF9E
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 07:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C27A2827F7
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 05:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E09537FF;
	Tue,  9 Jul 2024 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVEoAabZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7F139F
	for <linux-input@vger.kernel.org>; Tue,  9 Jul 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720504661; cv=none; b=ktfTsPBltAHmaPU4pxrduAJCg2hHDsqbWzPgncc4VUsc9Qnv+F4izM7Ojd+PTWMnX7FNayQNfhnLGZkNNXuhElPkeSxsnFM3GM4Shd8oK8vD51/WefpYIJpdwqMTgDJlBfLV+3mTVxuLE/4ICJU+Sft7cgy5i6YiF7L33U/dOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720504661; c=relaxed/simple;
	bh=vGtkgiUjwQbXTU/E9aYqC+1C4MNViT/BeZA62dQvEHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YjnREPqMJIV6ocCPq1dyTNYObLS60gs5N0AWe8nKRxFvI92gsMnBh3UgWdj3MrylH6LvQJp74stL6vDPb3X99CKykqxdbTT9OTi+amvZJyRrOdEfLNpcqktEXabnhtPEnFFSuxD45ywnr6irod4CB7lcIOqXUcMno9N62nBsLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVEoAabZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70b16d92332so109479b3a.3
        for <linux-input@vger.kernel.org>; Mon, 08 Jul 2024 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720504659; x=1721109459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fP5LUl3mFgfc/dFo2Gqy68QygEeg/CXaE3TeBH72yBg=;
        b=SVEoAabZhfPBjVgDCQvcxp2ut5mbFJ8DKVbUMisADBSD6LAoctP+6d1h0vcjIE7oZy
         LZANBhoXxIZYbU8+u0CBw+0YrfjqBo2p85WeZQFWYrdRpMdnY17rtf7WUAVPyy75DOLI
         n0bvOg3P+TIoSXd8HrOSnHlZpcJzXbkfUUKBtzy1hUN0D6pqsIjSKUYgAQjSrrZ2zUYr
         6EU+7IZa1aaauQ1ZvuERhOtP/9TXl/pwXs9XUQkjCyZLgJNoXpB1Cq+byQDwxrc8Hw4I
         /Sxz/cCgGWr+oKjvoTvzlsUzdQfiHdmISL0N5djZCoREGhrOSpkx+K+XlvriLpHejz8v
         wkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720504659; x=1721109459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP5LUl3mFgfc/dFo2Gqy68QygEeg/CXaE3TeBH72yBg=;
        b=rb80AqxGajMhrZQXEBvnfDb/3qFX1rL2PrS40vhtjFPKii7FJqedFz05krjkXerNEG
         G+yOSejxCeeHbx3uN6lNRCzddAc9EJpGatXSx0aMlgIjQ8h23M2QPWL4Kx4vEfe9kfJs
         OBB7MozUZgZraX53aiXfw+AMTaET6G5K4Wsw1keJcpzljVB9mgJOHvofHE/gqkmUkzBn
         pKYtVUelwUlYX+MTF40nY8mAEE7Axc3+fZW8WJIqXpm1BM0EpsrSFMgvOl/mUhrgfDOt
         8s92yRajksw7GfA/oh5a83HD24cbEMJ7zm4nTd0GXBzzteLZqv11U0QBzHVawp+OT+5i
         Mtrw==
X-Gm-Message-State: AOJu0YyhaemH9mDIB8UguZOqilC7bjgcjkXhuxfYsHiotSHlH2MJCy6/
	G2BlDeS3F0tUX5URg2mLOpLP205VZztQFUZ0GR/2r5gC3yIkeHsro/JSmA==
X-Google-Smtp-Source: AGHT+IEj0jjrXE0GNK1TuIE5R+TGGXM4WtzJN+bN+bKjsQka2d6DHXvh3X886H9NfaUWwmRw+XHBfQ==
X-Received: by 2002:a05:6a21:6d9c:b0:1c0:e367:70e3 with SMTP id adf61e73a8af0-1c297d38a30mr1564486637.0.1720504658743;
        Mon, 08 Jul 2024 22:57:38 -0700 (PDT)
Received: from Holt.corp.onewacom.com (softbank126139002022.biz.bbtec.net. [126.139.2.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439bdb6csm895344b3a.196.2024.07.08.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 22:57:38 -0700 (PDT)
From: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Erin Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>,
	stable@kernel.org
Subject: [PATCH 1/2] HID:wacom: Modify pen IDs
Date: Tue,  9 Jul 2024 14:57:28 +0900
Message-Id: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

The pen ID, 0x80842, was not the correct ID for wacom driver to
treat. The ID was corrected to 0x8842.
Also, 0x4200 was not the expected ID used on any Wacom device.
Therefore, 0x4200 was removed.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
Fixes: bfdc750c4cb2 ("HID: wacom: add three styli to wacom_intuos_get_tool_type")
Cc: stable@kernel.org #6.2
---
 drivers/hid/wacom_wac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index a44367aef621..20de97ce0f5e 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -714,13 +714,12 @@ static int wacom_intuos_get_tool_type(int tool_id)
 	case 0x8e2: /* IntuosHT2 pen */
 	case 0x022:
 	case 0x200: /* Pro Pen 3 */
-	case 0x04200: /* Pro Pen 3 */
 	case 0x10842: /* MobileStudio Pro Pro Pen slim */
 	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
 	case 0x16802: /* Cintiq 13HD Pro Pen */
 	case 0x18802: /* DTH2242 Pen */
 	case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
-	case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
+	case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
 		tool_type = BTN_TOOL_PEN;
 		break;
 
-- 
2.34.1


