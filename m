Return-Path: <linux-input+bounces-6153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A323F96B399
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 09:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD651F219CB
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 07:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397B9146D59;
	Wed,  4 Sep 2024 07:54:38 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ABD148FF9;
	Wed,  4 Sep 2024 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436478; cv=none; b=M17NinZMhtTklxrdbYgS/uWk+Xdh4LEAcGnn6iyl0sHSSNAlt8TgyGL3ruD24zrH9nBlpPvpK+rPLtfWYJF6EsLnZePwIK/A3Xo8mwUZsgU8llGiLwAQQJnac2Uqi18/ZqkApr2lZ2Q9ctbe8pERw0GME7V/LYfcyO59JwuWhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436478; c=relaxed/simple;
	bh=fO+n7WztlT7FqdN1vQBTmKbssiMN2Uu7d6Y9lrafP6k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IXsnjGldS4N3uZNjSxosWRq77WIhh/xGl1wctUTtYnMb1JYcFXljeWZJH/m1EJnQocxjVA7RG36Qc853STVH4wnbi+grWoiD6Ds5B1IIEVFg6h1YM0jpNwrngG0l93BWRgqPNP5ZHCAgbTF763gzPIA7My5DEY3JyGXIR3r+hA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee466d8122fd62-b4656;
	Wed, 04 Sep 2024 15:54:32 +0800 (CST)
X-RM-TRANSID:2ee466d8122fd62-b4656
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.99])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee266d812375c0-20e7c;
	Wed, 04 Sep 2024 15:54:32 +0800 (CST)
X-RM-TRANSID:2ee266d812375c0-20e7c
From: Liu Jing <liujing@cmss.chinamobile.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] HID: samples: Delete some unuseful comments
Date: Wed,  4 Sep 2024 05:43:34 +0800
Message-Id: <20240903214334.10207-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

diff --git a/samples/hid/hid_surface_dial.bpf.c b/samples/hid/hid_surface_dial.bpf.c
index 527d584812ab..dfb0383eb281 100644
--- a/samples/hid/hid_surface_dial.bpf.c
+++ b/samples/hid/hid_surface_dial.bpf.c
@@ -78,13 +78,7 @@ int set_haptic(struct haptic_syscall_args *args)
 	/* whenever resolution multiplier is not 3600, we have the fixed report descriptor */
 	res = (u16 *)&haptic_data[1];
 	if (*res != 3600) {
-//		haptic_data[1] = 72; /* resolution multiplier */
-//		haptic_data[2] = 0;  /* resolution multiplier */
-//		haptic_data[3] = 0;  /* Repeat Count */
 		haptic_data[4] = 3;  /* haptic Auto Trigger */
-//		haptic_data[5] = 5;  /* Waveform Cutoff Time */
-//		haptic_data[6] = 80; /* Retrigger Period */
-//		haptic_data[7] = 0;  /* Retrigger Period */
 	} else {
 		haptic_data[4] = 0;
 	}
-- 
2.33.0




