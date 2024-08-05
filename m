Return-Path: <linux-input+bounces-5353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2ED94812E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAE441F23116
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5982D17B4FF;
	Mon,  5 Aug 2024 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIaatEwH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305DA17B4ED;
	Mon,  5 Aug 2024 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880732; cv=none; b=lyASWGvk/mESR6o8t8eyvRwCEkMu/3zuItGxL9B13PRv5QRJCBFrmXnogt45SbryO5IAP4SBT39fcJB61+nCsThFdvpW2Bygvst7QOyHJADjfdBDxBZjjNHCkHbsdNHUlfr7o5IsyqRggaR0YNuIZ32ANS6NFayqAxWNzg1TNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880732; c=relaxed/simple;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcPuQqoSP9wnL+OqQq3VVraoFgBIS7cRjWVL0qu+eA7uvkvLuqSuxeaCO4AZj3rFO5JGIhBfsCxW3UiSB3omvnjbRvKgVb7JTtag8s41Uwp2dNZp45bIHjIaD0vU7h2liZ+NHEWUTUVYQXWII292HnR2LD0qRlcuwFPZMz0i6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIaatEwH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5DFC4AF0C;
	Mon,  5 Aug 2024 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880732;
	bh=QfPQ79UfnIJTGo1nlLJ6KcIGISQvLfhthjpThhd5tJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIaatEwHTUjIo9yfpGeKFr2b3i2znTF++7fFyHSLxxrUhQfBgN5A6TG+HXSw1ZJSC
	 pU9EFkpZQPfOxbDa6D26SJl2M/MNdH6cgLrLk72DKik/6ONhnfKWj+8ICqhIevf/1o
	 mH5z+T7eyfcaO4F1kvu+eDn94i003uDyjQDef/vrGIIifUeK5eq1sm1yHgZmHKwjIT
	 OOBJbM7Fz7pDjAaPieznAK3ZLXFIJFh93bMMl+wDZKRPOFL+pi0/UuoZSlnlVGLwnI
	 mlkcmGT3WLNEkcBDkz3Tf7h/pn/mkoaBciJkq0TdRv1DdhRBUOti1cxi3UHajh2e99
	 Cdw+chMKzRcZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/5] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:58:28 -0400
Message-ID: <20240805175835.3255397-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175835.3255397-1-sashal@kernel.org>
References: <20240805175835.3255397-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.103
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


