Return-Path: <linux-input+bounces-5357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A696594815C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B63286265
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8AF184543;
	Mon,  5 Aug 2024 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAynaGJP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E947E18453B;
	Mon,  5 Aug 2024 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880777; cv=none; b=CFOw1QJnYS430U5Yow4NbY3/2yLpqZptLpjPrs9rye9D1ycTR0U22A2ZCI9tyaTOKDEtL9IRtIJ1wSsc59x94yi9chI86+0OvReQgDM1sHqdliCWQuPlKkTgCqSAABUYv28v2EKswdz160OCaQzFq8dFM36C37e8z9mKPUfjW20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880777; c=relaxed/simple;
	bh=O9Iyc49rPuU+RjCe9qJiRt4yfIA/RXxWPaivUdrXFHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSd9FeKufbs30XlX6Xzt+gbkQ/pRbolPMNbTOtBykPRo5Tc1V8sqWG91eL9NNU1gNgbd4bSvDsJpnu48qnFUU0kvXMf9uUvOQYsjYHd7dbw+tmd7jhtnuKsIRLwOD96NN+fSuNqwjF9GcKfMwPVPBhcSBHFe2xOPlYGm1igNh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAynaGJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E38C32782;
	Mon,  5 Aug 2024 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880776;
	bh=O9Iyc49rPuU+RjCe9qJiRt4yfIA/RXxWPaivUdrXFHM=;
	h=From:To:Cc:Subject:Date:From;
	b=VAynaGJPHW6NR/xJWaFqqnNwulTBJOW8bkGUZx2usXR5CE8CmNiztPbnM9VsEriBJ
	 cnrBebtZF3swgtA8EyqRg7yckIWViepFO1D/YbQ7J7oLaQ+n3MjtjRm49uFIvx04hC
	 M+LoUtv7zj5Xi9xu3JKwiJ4fELkEgM3kHtxziwnRWdprc//z2u0LEqV62v2W3xm9wD
	 Cef3QFVVSkAlc7V4PMepJhbqHSXfqXSO8HLdEZWiZzZBZaJwU7Omd3OY/IUbUwMSsz
	 XoZJtEjS+GwqwTLu9qjmkDd55ej+nUYv9h6RBgqeB1ejNj/V/fnTFAVSLohArWJ4GP
	 BDFjkuig9Bu5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:59:33 -0400
Message-ID: <20240805175934.3257938-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.319
Content-Transfer-Encoding: 8bit

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit 99d3bf5f7377d42f8be60a6b9cb60fb0be34dceb ]

syzbot is reporting too large allocation at input_mt_init_slots(), for
num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).

Since nobody knows possible max slots, this patch chose 1024.

Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/input-mt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 6c7326c93721c..fd01c9306e66c 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -48,6 +48,9 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 		return 0;
 	if (mt)
 		return mt->num_slots != num_slots ? -EINVAL : 0;
+	/* Arbitrary limit for avoiding too large memory allocation. */
+	if (num_slots > 1024)
+		return -EINVAL;
 
 	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
 	if (!mt)
-- 
2.43.0


