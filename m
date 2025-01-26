Return-Path: <linux-input+bounces-9574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14DA1CC5A
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 17:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224E11885D75
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366C8246356;
	Sun, 26 Jan 2025 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+sYTcRu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C918DF6E;
	Sun, 26 Jan 2025 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904161; cv=none; b=pk/RquZPIu32LTE/NQ3AmH2fxRtnQKHdwV1bhtc0JG2+c6L4aMo4qE0jVecECGu6vzu5FqlodZWPLtHC1CjCyKPZbdlESXT9RviLjRCDJRnQT8P/kzzR5O2bWhH8fg1hgMi8DekFZuudVFRW6MHox4z2C+0ZBhhedBFXTCP0BUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904161; c=relaxed/simple;
	bh=UuMvvUB36yewr3C2C5PkpkcaXSwiaZW3w3GNAUmlG8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKZ9izAEVd0mh8vX+XpIy9pTUHFi+XMp7DCx4vDlku1rNPSxEhWgfQIFBCiagIuv1Jq8WXi5yH9YLDE8hd05s8O2VkXNdMV63I9z0QTB16pwaPFnVxsSmtC6MJxNC3ZqrWaj2UJ5cjUBOrVP2AmXNhLzl+DtQ+td/iaA9EzgfZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+sYTcRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABF4C4CED3;
	Sun, 26 Jan 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904160;
	bh=UuMvvUB36yewr3C2C5PkpkcaXSwiaZW3w3GNAUmlG8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+sYTcRuTbgr93rosshi1ISiJWl45HsbS+PLoTnRFonJNnTSo/thVnxRbuQTLiDtJ
	 Decvc3fMwt/4JS9L7QL789zj6VsDq1xvIlVEA2hgk5/bV/Y0TnJLjSyzJnIlKUCate
	 Pa2c2kfQgOJjhOfIuh40APCm35BcsjoO6VoTN7I/DGPnjgeSrbrHSUtj6aqys+z73U
	 wjrXe2Po6BX3G9GNWYspsBP6Msm6Yhz66PPVw+4N1whCW3nh2P6oVMu1vuP586+m51
	 UIA4utW+pz/KDfNHBwH0+8AJXlfoAxQBPJKbYaSCBT5TWqGL312BfVwlZJTd4K6uft
	 O5S/PilZwtT1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Illia Ostapyshyn <illia@yshyn.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 7/8] Input: allocate keycode for phone linking
Date: Sun, 26 Jan 2025 10:08:59 -0500
Message-Id: <20250126150902.962837-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150902.962837-1-sashal@kernel.org>
References: <20250126150902.962837-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
Content-Transfer-Encoding: 8bit

From: Illia Ostapyshyn <illia@yshyn.com>

[ Upstream commit 1bebc7869c99d466f819dd2cffaef0edf7d7a035 ]

The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
Gen 5 laptops includes a symbol showing a smartphone and a laptop
chained together.  According to the user manual, it starts the Microsoft
Phone Link software used to connect to Android/iOS devices and relay
messages/calls or sync data.

As there are no suitable keycodes for this action, introduce a new one.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20241114173930.44983-2-illia@yshyn.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 1ce8a91349e9f..f410c22e080d3 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -519,6 +519,7 @@
 #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
 #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
 #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
+#define KEY_LINK_PHONE		0x1bf   /* AL Phone Syncing */
 
 #define KEY_DEL_EOL		0x1c0
 #define KEY_DEL_EOS		0x1c1
-- 
2.39.5


