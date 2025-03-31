Return-Path: <linux-input+bounces-11395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B0A76933
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A547A54F2
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7830A226D0D;
	Mon, 31 Mar 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGudHGib"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA4226D0C;
	Mon, 31 Mar 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432823; cv=none; b=pJqrHllGfKsEcpoob0HnD2Y0gwiwICbh3fXh9cYcgkROLMu1quSmGtQDA7HV09pZcsT/3Vn/ZtQdUEnivL/8z7uO920cPCwI5dfPBDfa4AiZ+vR8jdPqGcSuoyDe9qvyd1Dejx2R4pAhaNXo2NSmYS/px/y9kM2Pu0pJrG5nUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432823; c=relaxed/simple;
	bh=rezlBpCcK5CkyuC1s7VsbRM49dmcOIeJc5mqRAqahCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OFp/rUE4sRBLs7Ref6w7Su+4i6sJp0zPDQdslIaz5dVYd17nC1vT82578B/R8xc/Df8+KxiW97290li1hzmaW9/z4MhO+qlysmCHcfVCwlr0WHxhlvW/RXeSfKuSbrSVDxuz0X4K82YOFTpWMaRibZjqtlOacUtDEmoFlqaBsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGudHGib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F700C4CEE4;
	Mon, 31 Mar 2025 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432823;
	bh=rezlBpCcK5CkyuC1s7VsbRM49dmcOIeJc5mqRAqahCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pGudHGibP+QQCBlqFP7+HUJ4iCpWY0q9rmNi7LrgkjNgFhJdXZ+vCpA/4/OMhqzU4
	 kXWfLo1DDBuTyV58VRI9KlxGYr/1SItDIuRNnb32ZddiGS2RRPVVLQ3VyvQzQs+lTq
	 w/dujMg0QXc0FjV1Wfpo0ETlz9SbyxjENY6tdPegaDt677sTaivYNxzwpbeBct459G
	 zOJVyhduxgWjmVVDAHjOOBoAjKnbvELmnEW8PRr3+oXFY7fcgnpjjwsrKaYeiUb/sC
	 U8ZiyguYNaiuUNJ5zBT7a7PinJZtaL0MLSkt8BA2RxHgt2DYV0WllHSh4zvV2bKT9A
	 qbwXEaCOpKOdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>,
	kernel test robot <lkp@intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 19/27] HID: lenovo: Fix to ensure the data as __le32 instead of u32
Date: Mon, 31 Mar 2025 10:52:37 -0400
Message-Id: <20250331145245.1704714-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145245.1704714-1-sashal@kernel.org>
References: <20250331145245.1704714-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Vishnu Sankar <vishnuocv@gmail.com>

[ Upstream commit d6ea85f8371b99c1d3a90ee4e2fb1a648f8d71d3 ]

Ensure that data is treated as __le32 instead of u32 before
applying le32_to_cpu.
This patch fixes the sparse warning "sparse: cast to restricted __le32".

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501101635.qJrwAOwf-lkp@intel.com/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index a7d9ca02779ea..04508c36bdc82 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -778,7 +778,7 @@ static int lenovo_raw_event(struct hid_device *hdev,
 	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
 			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
 			&& size >= 3 && report->id == 0x03))
-		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(u32 *)data));
+		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(__le32 *)data));
 
 	return 0;
 }
-- 
2.39.5


