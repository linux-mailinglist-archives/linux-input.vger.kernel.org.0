Return-Path: <linux-input+bounces-14778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C905FB7C617
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 13:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E443188A63F
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 01:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6492D21B9DA;
	Wed, 17 Sep 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="dG7oez9N"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9AE2192E1
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072007; cv=none; b=RVwP2q7wfczstMhvDSEAdQcx9F1NlC9XOLN9FJpgol1MdNToJf+V4Rxvu/H74R4DyhaVnNftKj0B7au+OHnWr48bHJTRZBoAekINZRjhoFl+DdS61+gBJA6DAsvVHMcyBGZsl4G5RbMXOmx7IxdjUgCkhOAJ/hHn3bELGCCsCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072007; c=relaxed/simple;
	bh=kPhmwCgvG+e8lF4m+Nye4fWDREkAGKYqZqKljtKvfr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRdI6910CnC0BjjDuur++HiBemHIUEypl9oMhUvmTWBjLOKy3A+VOHKoP81FL0VUEW0yR694e77SQ+YD0ErLcKSF8zxx4yibXbvcJnmzKv3GjhnRCh4bNDwqLQzqFPpJOuXeDXoD3GFvHtGpnbalo16VQyzvgzZmWauqwHHN8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=dG7oez9N; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1758071999; bh=kPhmwCgvG+e8lF4m+Nye4fWDREkAGKYqZqKljtKvfr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dG7oez9NoSupUXlu1QBQZrSQ5aFbtwa56RagN9kk1lpu52tEWrpPvZ/J/XrkBawRE
	 u8F2DYV2/Wq2/QbkXp7b6BYcLDIRRmonpMgb8TbT9526Wu6o1vlbgcZ24k2+47W5/w
	 0YwF3hz7/jrozzzA/Lo9/hSTWWvB57JXWSJBvu8P7q+DR8xCVxz+0z0crXVJIsy0bl
	 3EOUKuKuLjYjQWMwDC1vNa8qfOz1moU/Xl27gvGwncIGlq7t99cvDv5jRGWCk/jz9B
	 pTnmou0FBFO0SvKqWwbYHjGsYrp6Z2eszm0QN2Mz82mf3SIKtR7Crm77ksNYA1AvHB
	 0L0yQzioZmSBg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 3BDC2A195;
	Tue, 16 Sep 2025 18:19:59 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v2 4/5] HID: Map more automobile simulation inputs
Date: Tue, 16 Sep 2025 18:19:33 -0700
Message-ID: <20250917011937.1649481-5-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917011937.1649481-1-vi@endrift.com>
References: <20250917011937.1649481-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HID usage tables section 5.3 specify clutch and shifter values that had
previously been ignored. As the ABS_CLUTCH and ABS_SHIFTER bits now exist,
we should use them appropriately.

Signed-off-by: Vicki Pfau <vi@endrift.com>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a47..adcffbcb30834 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -782,6 +782,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0xbb: map_abs(ABS_THROTTLE); break;
 		case 0xc4: map_abs(ABS_GAS);      break;
 		case 0xc5: map_abs(ABS_BRAKE);    break;
+		case 0xc6: map_abs(ABS_CLUTCH);   break;
+		case 0xc7: map_abs(ABS_SHIFTER);  break;
 		case 0xc8: map_abs(ABS_WHEEL);    break;
 		default:   goto ignore;
 		}
-- 
2.51.0


