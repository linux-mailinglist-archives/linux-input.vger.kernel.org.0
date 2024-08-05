Return-Path: <linux-input+bounces-5351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2799480DC
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 19:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC93BB2310A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9C8165EE9;
	Mon,  5 Aug 2024 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG5V7Nlw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876C16BE1F;
	Mon,  5 Aug 2024 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880606; cv=none; b=fAoLHaw57RJhJiglx45sN6DJ8iVm9VwZwfpg3IwUD2khbEPmJn/fajhK9LshIJuP0KIuo8CDtrP59TumcYm4Yer/Q/dnn5jShUnazcMgW759/p5FCGTCWDVanMcqjQ/mRmzPwJpv4ixxJtMm9g1nqGIg9rFQyLFT7V3b2w1JgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880606; c=relaxed/simple;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTIchdKx3ddxwYNLu2lDBMAorWFmeFMBYPASYiS7JsUTjAjSWDYz+Ownb2NfMNPG1SsNBQYAjG+K9hr47pGKzBu8B5UqpCZ20Cjp2lALCEE8MmJMgNlj7G1uwusGVWClU6R1xrzuGYGYS1HRFI1Idi6wc+nm0SK1m7N6oxzGXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG5V7Nlw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53071C32782;
	Mon,  5 Aug 2024 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880606;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kG5V7NlwPTFJITs9al6H9rdBey8yNlYp10Sla6aNfxOjg0p8M0lVNJ4s7/BCX7eX4
	 u03GbFR5m77m9dq/fh1StBSsgg5J4o6m9R+0tbKURAkb0vrkiIcoDeyffRIMwqIox8
	 h9+yKXT4/CIHD5yY3jde9L0q9KNtCFh4cSjsACTIb8nWDjWHm9sapbDyzaxt2RxxyK
	 4IYo+E86IYuW8HzYUv4bBBDs4zomkBgeYApBqEgp3HeF+AC4cFxs69a0xAfi3PyZfH
	 JkeX9ZsDa7hjiLCtRvH0FHG7bDiqFSxNrqxxo9vzMhJEKxeDdOeE9xD+Z/5DJxJaiU
	 3F22hNR/njd4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 08/16] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:55:40 -0400
Message-ID: <20240805175618.3249561-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175618.3249561-1-sashal@kernel.org>
References: <20240805175618.3249561-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.3
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


