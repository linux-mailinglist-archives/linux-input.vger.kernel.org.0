Return-Path: <linux-input+bounces-5352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51F94810A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A98D8B243C0
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68271176AA6;
	Mon,  5 Aug 2024 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sO8AkVm6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D7176AA3;
	Mon,  5 Aug 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880684; cv=none; b=DwOGdBiYVCIvP5Sc3uvQLjjNsbFaR9Ji10+6Rarc4C3IiMmtn8fbXqgxgTu0/zhoTHMn3TkUWaF/N7MAi/azf4Ss68+TUZfZCY5t4tHRDVIHt671JtVba6JPJGFEDQcyiIWls2z5kLJGgrrp5Y+lEiWuFMsOH5pDmhsDIxpSpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880684; c=relaxed/simple;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mm9tZdgDQxQERtWQufxNL+O+fxWZkPkDYX+bpEYUvMscBusiXH73HuxJxNN+0JnIJ7obbaVyow0hd1HHBlSJur7yunYwM7YL4+AYqBP15ZXwm2QgzSd6vCBJJuEgoOqMrTbRqJMLgoLCwSoCHCQBD+nzE3NE6B6F57pPky9FX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sO8AkVm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C85C4AF0C;
	Mon,  5 Aug 2024 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880683;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sO8AkVm6aLoena6EIdzAnkdgMhy2Hi1G3xXDXvp6tmkxYBb0OgryeIEvEolctgE6k
	 XaSnKemeO8cshvE2idz7p0qoTA3BdYhXU9K6TjM2u5LtTX7TZ3Vz7G1zxG13Rizi2l
	 a8nAhG4ef6JGDmu5hZBi+qcjtN8v7Whc8StHBYB7jKBl+Wcv3NwSkQwPG+XQ08+J0i
	 0R4GAmzf8x6dLl2CCh9nzLJ6crNE7nh0pkIS7wopiIZrI/bzarBi+EQI4e373Rs3JR
	 6H3OEKEV9dHqYh5/SSnwDvKFze2sGUqRdAjM7/K1UE8qbjYgMyQdIUTLUhWZf8IwQA
	 WHrFQHkbrCsJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 08/15] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:57:05 -0400
Message-ID: <20240805175736.3252615-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175736.3252615-1-sashal@kernel.org>
References: <20240805175736.3252615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.44
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
index 14b53dac1253b..6b04a674f832a 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -46,6 +46,9 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
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


