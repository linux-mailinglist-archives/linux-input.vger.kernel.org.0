Return-Path: <linux-input+bounces-5145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319393B926
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 00:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4169F1C20A37
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 22:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232D613A40F;
	Wed, 24 Jul 2024 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="xk6rIfEy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XoKKxXmS"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71996200B7;
	Wed, 24 Jul 2024 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721860297; cv=none; b=gdjuqa6YCuguAUOCodPNyQNFzYUgirD8ILOt18seNljsqz2TGLZ7TbXve9NyQ9yTDXrVDb0RY2CUp/lxi8sofUuaLq4t/yzQ5SRhiy6ZF+hOxavxFs0TI+2g9h2+5O3NceW9oMi6SqWjGO/LVyLOs16wu0RTeMWdELTxvPPM5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721860297; c=relaxed/simple;
	bh=0fXHmz8/c0NsRZuJ+mrd6IqRw2sk3DKwjfCk3NPezG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RGmXoBHaYNkB+CHJYZ+A0CU/E2sXwfvUOyjmKvwj5gHlGRFMrXNl7QZKmmayz06QrCENn06FVMIH/st4GQUf7OIPiiyds8EXMSZRun/Rb5bGvSE/ug8OYp/B1WeLeDEf7LDKVdC95hS83ghHQvl/zMNUOKVa1RqnSezzVHZ4qtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=xk6rIfEy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XoKKxXmS; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CA58E114012B;
	Wed, 24 Jul 2024 18:31:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 24 Jul 2024 18:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1721860293; x=1721946693; bh=ZP4v30d2S/if6hlUWb9st
	dr3+Zco+B0J5lIRTI1Iu2Y=; b=xk6rIfEysAJzGWZWAQnaxbu+1lPUFycoOSHdg
	w4wIFs2I0S+7utoiwzToYubwYAH77pdiXEJg4Qo4ieMWbYJnK81/pv9Ewef/EfVy
	MQ8ctH7iUg66P7IW0cetf6VUYoazUSZmMpgYKaBgjPDZ/ZvydrSNRAvV2IpEr6sy
	qmooC1D3Z3e0yhOxNFElZiyCcrJIdGxFrvmjERIdbiIsWQ8T2RAm6J/XONtXj1wk
	eLouud6oL7+XOYo85yD1pwWL8Kq4nUPJh1QflTNdoLG2jphUT2Hi4N+zumULYt0X
	Q3aa01xbjtVcY/z+Ypm7iRHhiQm3T8yqUQrVWT/Bcb5lF23xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721860293; x=1721946693; bh=ZP4v30d2S/if6hlUWb9stdr3+Zco
	+B0J5lIRTI1Iu2Y=; b=XoKKxXmSz5Na6DQfmJxeOlTu4bA0TRPXt9bFmURENQ0q
	8oZcqzavVTw1X8ByCBg/oWhsLLiXp0uebuyKtyfYcu/d0egP8BI+mm8M6S8+t6ba
	0VVg0uIpr1ut0iMnMbPb7qbLUbtnmLYRxfXe4xGkbCUi0l1GVgQ+9hznUJDocX/t
	SghnoVDDY/cpDKSD/wlhd8+Jjk/blGrOPmEjdMYFbWUUeUjRdX7AHr1NSXshJzKh
	uSzPps2DrNcMpjfdW92CRgrNrj9F7tRt678QbRFABaYbjKz1uo3IW8ALO2ZCO4WW
	pAUTEjMPgxDju+VgFOFxEpLTNgYw/ibEDoHNNa07Rg==
X-ME-Sender: <xms:xYChZm22H3h23CTwuOB-4e9efWMtKGaMXhMoZU3HRTWwr21leboZyA>
    <xme:xYChZpG22J0xIVcyWKFs6_iXp5zd9_SA5Uh6CdkfLFbjOhzsMmvF1QMj-AluBrFgj
    u5DRbMUkMqxXAdR0BA>
X-ME-Received: <xmr:xYChZu5ZWOzd7u10FO98CmrZQXhuasXXbILxR8xy0xfa3ER7Qg7zeQEHoefK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddriedvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhn
    vghsrdguvghvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftddtvd
    fhgeduudeuffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtph
    htthhopedt
X-ME-Proxy: <xmx:xYChZn2KtZLEG0OAZ3UQhZCBHYd_PAqQLcn2jfaLHbVG3lu5M3bvcw>
    <xmx:xYChZpEJON9IQngS4FGptrdRLM8Q3NuAV31-CkxnD4_xW88rFJQhSg>
    <xmx:xYChZg_1BnTCxfRlvIP6CbzyGzuz9LMkUIH1ese3tHt1fe5SXotklA>
    <xmx:xYChZulikwUWSOQmcb8aVT7N3I5juOpc5iSW9Vne3EElSr0XDJyrLg>
    <xmx:xYChZtgFDZo0QjA9dlBHBPWnQT6grq8ko5cdggdnjyjRNS_084Gs5le1>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jul 2024 18:31:30 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] hid-asus: add ROG Ally X prod ID to quirk list
Date: Thu, 25 Jul 2024 10:31:25 +1200
Message-ID: <20240724223125.44914-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new ASUS ROG Ally X functions almost exactly the same as the previous
model, so we can use the same quirks.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 3 +++
 drivers/hid/hid-ids.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 9010f12a221e..e5f6664bac0f 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1255,6 +1255,9 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index fdf2d480533b..57f1f1bc5eb6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -212,6 +212,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_RAIKIRI_PAD		0x1abb
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
 #define USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD	0x1a83
+#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c
 #define USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD	0x196b
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
 
-- 
2.45.2


