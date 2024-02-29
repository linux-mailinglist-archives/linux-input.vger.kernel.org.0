Return-Path: <linux-input+bounces-2122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628F86CE27
	for <lists+linux-input@lfdr.de>; Thu, 29 Feb 2024 17:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D5C1F239B0
	for <lists+linux-input@lfdr.de>; Thu, 29 Feb 2024 16:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289014A4F7;
	Thu, 29 Feb 2024 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTcVZOik"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A952415175C;
	Thu, 29 Feb 2024 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709221850; cv=none; b=V/W6nuJ2LIN0pC6/tawsLuL8NBUCxSkE6ZCa0QmZrVtxA6nhNDXZsrdRDaPRkpRiTRPENNlOR5xZv7p2JHdSiOzWB9Zy6zrbIHtb3/EkL77ewI1LnCKiE6IWT5WRuJyKyIGSxX7uktfhgxibCajrgYo2FPnzdVesYDs+AS+U/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709221850; c=relaxed/simple;
	bh=h7vZhE/3zNxbW/raux5GMr5zWcoQY2up1hIwKwdJiis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLse+H+2bUY3++eb1mn3Xmq7Eb6FlaXLubLWeR/zDKP7zUcdE6dSoeGiS7XHiJKehcq/CnOU8vkhbMqwVvWwOSKkzXuPdMTy6P+dLkqZN6TsS2018iDd59wkn8rbr51fTJjGkcZFKuxSSQRnoYzAPbt9oSbwwpD49oPJnm1JgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTcVZOik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F62FC43390;
	Thu, 29 Feb 2024 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709221850;
	bh=h7vZhE/3zNxbW/raux5GMr5zWcoQY2up1hIwKwdJiis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTcVZOikPoDv/0Fek7EzxGO0v1rw2DyKx9LIUYGq3qn00RjOk2+hfBPfXuUD+ae+H
	 1UI4HtBEc4fD4tFP9JaYyzTCZakjPN0u9JS57PKUgzLTu8+lYDqyRl5xGJ/ENo/nsk
	 3Ozw0e0gx6rsngvUmDvHG40Loct2cssILha5EugghmriQ9Oo/mlBg3CDm54csv0UG+
	 lN1WtNtann50dcVLUu+K/JbYCE2qK4w66uvdSMZjjnRu6YC2VaxmvWFmuqnAVZxgtP
	 R7gvw/E+mr4bvC9j/azjpBFmg5syC4JSbGBvmjVqZVOfwTgdeyw6MXonjpryeT6hPZ
	 wyHz9ImjWKs0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manuel Fombuena <fombuena@outlook.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/12] HID: multitouch: Add required quirk for Synaptics 0xcddc device
Date: Thu, 29 Feb 2024 10:50:27 -0500
Message-ID: <20240229155032.2850566-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229155032.2850566-1-sashal@kernel.org>
References: <20240229155032.2850566-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.79
Content-Transfer-Encoding: 8bit

From: Manuel Fombuena <fombuena@outlook.com>

[ Upstream commit 1741a8269e1c51fa08d4bfdf34667387a6eb10ec ]

Add support for the pointing stick (Accupoint) and 2 mouse buttons.

Present on some Toshiba/dynabook Portege X30 and X40 laptops.

It should close https://bugzilla.kernel.org/show_bug.cgi?id=205817

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 5ec1f174127a3..3816fd06bc953 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2153,6 +2153,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_SYNAPTICS, 0xcd7e) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_SYNAPTICS, 0xcddc) },
+
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_SYNAPTICS, 0xce08) },
-- 
2.43.0


