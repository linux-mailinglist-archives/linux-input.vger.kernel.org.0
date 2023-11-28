Return-Path: <linux-input+bounces-292-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80D7FC6EB
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74302B2448A
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C34D42AA2;
	Tue, 28 Nov 2023 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgy07eK5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF2544367;
	Tue, 28 Nov 2023 21:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E4CC433C9;
	Tue, 28 Nov 2023 21:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205637;
	bh=ob+HZVAARe+Rhv/4hXZU6NwzWHjA4yQyjh2YxsKF1kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tgy07eK5Al6xocrq85J7/hISaJm5A3JQ7Qxeqeo7JHMyce2zi/ExJNSmAx84vWbao
	 Ocg2OXC9tLXGVU1+cNTugR/9Wn+hQzET+ftZFRFD71fR+IkBxVdE/+dlC2y4rrb2dY
	 EZjm00AEXjgM+dCdqUwwpjhrGpAwCqyJzisQkb/eUhTbp2n1wsEPT5tAeOoxeczvuQ
	 hHT+979Pp8/TpyD/CfQgBtX5XtZalxAYRBaDg2i+3OZPgkEZVLfQeiifIq7k0WgIv3
	 S8wZCl1m/GK5ynVLTzosdteC//w4ns6xOyTkZy0ta61y3MMi/ALcbD/+2DexPTpR/F
	 qqiZAF1B1xgOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yihong Cao <caoyihong4@outlook.com>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 26/40] HID: apple: add Jamesdonkey and A3R to non-apple keyboards list
Date: Tue, 28 Nov 2023 16:05:32 -0500
Message-ID: <20231128210615.875085-26-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit

From: Yihong Cao <caoyihong4@outlook.com>

[ Upstream commit 113f736655e4f20633e107d731dd5bd097d5938c ]

Jamesdonkey A3R keyboard is identified as "Jamesdonkey A3R" in wired
mode, "A3R-U" in wireless mode and "A3R" in bluetooth mode. Adding them
to non-apple keyboards fixes function key.

Signed-off-by: Yihong Cao <caoyihong4@outlook.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3ca45975c686e..d9e9829b22001 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -345,6 +345,8 @@ static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
 	{ "AONE" },
 	{ "GANSS" },
 	{ "Hailuck" },
+	{ "Jamesdonkey" },
+	{ "A3R" },
 };
 
 static bool apple_is_non_apple_keyboard(struct hid_device *hdev)
-- 
2.42.0


