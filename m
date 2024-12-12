Return-Path: <linux-input+bounces-8508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B089EE246
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 10:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3983A18831C8
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 09:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD37120B808;
	Thu, 12 Dec 2024 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TIp9xgJG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C42413E40F;
	Thu, 12 Dec 2024 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994598; cv=none; b=caDLtUK9rPEiy/xRMvZVPRuoZRXMiz4aIzUhl9Zs47XyysuwX6Sr1RCJjzW4hI8AEu49yhEzvuI/PvyEf8/LmmMCygefbxzx/CS+y0TVEYdz7iiuFmaUSQ3xl4mhL6qSYqFDYPgXv8EamRlXXEatMKuvBDWKMcGXbMchaCa2wLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994598; c=relaxed/simple;
	bh=25cnFJ36lnTfx1vldu3/7BTYkYLtPPVJprGmfJ++pAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRx0Srw2KCOGtslyyWcb3MyU6RuMRA2wPzucvwqAD3fDaWGiWa9LAU4I7nUpvSbGfccoeG9J+fP9zc4oy7pe31dvFElBZ6HN9lplZ19dnA2U0aNkRak4WiCRW9w5he/pVs1QbNZjgiK+zYI65T19InTW8icxtN5icegkH449p50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TIp9xgJG; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1733994535;
	bh=N9G5TKRnk2yNU1t1lquTfvemiMjKCmOKWgxWjv7lYUM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TIp9xgJGbM8UkRzAoDC9jYJKNidAFbgu1KzTS3l8HUg+3iKAckDE5k5C+xaoJEmCS
	 t4+fCMtVqxZd/c8t2imP/68/fy+MskOV0WRcKs2sSQhjsv/b1CblCMHBCEjhIDppMO
	 79ur9EGbzGWozQpcvPstFkSPIMV9/X3MJqv4LXME=
X-QQ-mid: bizesmtp77t1733994503tx62ddb3
X-QQ-Originating-IP: kxQeeN7DEj3DS2AJKN11Dkwglrakg6FxyTRrC5ccxe0=
Received: from avenger-aosc-laptop.localdomain ( [223.104.122.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Dec 2024 17:08:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10610029049463473772
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.tissoires@enac.fr,
	chatty@enac.fr,
	jkosina@suse.cz,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com
Cc: WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] HID: multitouch: Remove useless comment
Date: Thu, 12 Dec 2024 17:08:08 +0800
Message-ID: <AC49086C675C6E0F+20241212090808.18988-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MxDmZisZxeG6BBbCMT3XaaywJBY24bi/cVoYgX1cOS8ynQhL1eCWyQDJ
	sGAsTmxXN4uI9mPwfknzKpDZgoJTJmlBQ0qDSgJmk3YJwwhEi5Nfh6Lz0dMEElEdxggiXMk
	Hhb27VrHri6/fONEw0gwhxm3DjNMv0Cyk3BCJToPzQvg+PGLfrKI0zi8N1FpGsMLrjjnfXP
	OGgAQ8qlxT2BzYOEp00cfS91gDyZ6/ZRMmaeVOWYtX5U3WZ3AbvKw59dTSv/Ehs27XK11Ui
	mFX9U/Yr1cyVNJyMyrdpJlkjXM2Iof5FzxN6QV9BuLHNheYVKrtdgdDm2bZxLLpoP0T0hgx
	m8vitv3V4wBgh18mnSrUk8lzrPMbf1PvhxHqHH7pIRP0huBg4dAfWdaomEyduJJbiMxdXWo
	0RqYLEbSGoV6xqdhQVrUmjkQozbuPPs9fehCSpCXrMJO1Js1ES7DvQ+Ar631U+lpmcvfa4C
	V7wmgoP1P87kbAfU7TaoDZhNdaC3U2Anmgza7QF5a+dma0V84tqE/+5lpFCAFWXJPD0/1lg
	o8gzNa2hLJ2uT2PGcKWMW1mmDqwFubG3xcvZ+PKbToDsC+QPwb4pV56IFSeYnbPlqvlKeaT
	M3emlVcI3kGRAYK7Btz6TDQDvRJb0vOVdq1lRmEQ32RPlFmijDFC0KBVCI1M/CFvCxKcqrg
	ygdUlXWXYz2Jb2dNY56I01DSwFzqhAzVc4NNKx4srM0qGn/3MIuycmRvGOKBAas4WYc+YkB
	s+e51Nc97ltqcYoAeQbSbYs+2AuxUEGTZ2Wc5yJgX3vSVna4uYOylehJcPG0Ld0uO2K1ZAU
	mQMGcjQkNQzPllPOD3KTZGZOoMxEemrSGRGzpgeC2NI6qHweGVZPHWT0M15A3fGDKnU2dfr
	y5uQwRuETJBGon+lAUMurd6A5fYDgSIsPvT6sWk15Dlj96H7t0mv30zW0p12110Aphhr7y5
	Ng7Axa1yihCLaxH5aoqA59UU06JZ9j9QCC3o9UPYrRMC6p024087y3x03uC2OsNvk0+Ctqg
	kz4jtXOrCixQM9mtQx1CkuHF5pHsiBOJ/S7gBzZk6hWAUhBjJd8odWloukxJk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

There's an empty comment at the beginning of hid-multitoch.c.
Just discard it.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/hid-multitouch.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 785743036647..5985ea843194 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -20,9 +20,6 @@
  *  Copyright (c) 2010      Canonical, Ltd.
  */
 
-/*
- */
-
 /*
  * This driver is regularly tested thanks to the test suite in hid-tools[1].
  * Please run these regression tests before patching this module so that
-- 
2.47.1


