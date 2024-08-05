Return-Path: <linux-input+bounces-5355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D9948149
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ACBA1C21EE4
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9728C17D896;
	Mon,  5 Aug 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqQZycz/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCD17CA0B;
	Mon,  5 Aug 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880767; cv=none; b=CdLZBjXUOOernUWRAoWY62h30bsWkh4sQVpQQTmIGYiZIDTRsCYtpjJ3XrsRaCHWDyyJraenD1j06A0c6oRWa+Y40UmFb7RMc36EufSmJAzxiAHrHzPrAewo6HH5uUY51ttojS3zlGzYKfWEFa8D0QJ96ZyC+x/yWNPKlI2KheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880767; c=relaxed/simple;
	bh=xlrR3WwL+cXJc1lqxFYvNtOrzzq8EIlyhO6U+rAUZkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZAxSOJ0YyVl2dK4LoYQOTa/D3BHJaYsGFY22Q3kVW0v4hSwQq5oZ4aTsQrpFqHO0RojbSMczhB0prsO1LRjdtq6NxGbgiBPWFFLcSqi4F0wi3dCGUPJcclno/1JW02F2g1VnzMUcd7NwhRTAiOCBAWkRbAZ0qvBogw8FOuCFwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqQZycz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40942C4AF0B;
	Mon,  5 Aug 2024 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880767;
	bh=xlrR3WwL+cXJc1lqxFYvNtOrzzq8EIlyhO6U+rAUZkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqQZycz/2tHit3J1Opk3yxb2ikqkpydpbS2hH6d5Cs29J7PPaEM9aseLOdrvQDZhp
	 DuUZALdKpTMUlc+qpgKw1jFkvVqLc/JXyEXomz6090ACSEnWhbBW1QRwxNjtVO6cwN
	 mgAxqzqXQtUSliwVRd3VS9nLn52h7k1ENGBBv+oujMbHACdO1kHSDDlT+ex+a6dV8E
	 quA03aJUijAjZQxTdKPSQXR7C7Og8RwwOraNyw++PIg9t8DqQU8ghO84DiqFayDfr8
	 UX7BHecTOkt2QMwC74zngYNiwpSoa/a9WeTgXqGEi4SFqQee3oJJg9ql7/VtQJDJjG
	 YGulKHQKcN+Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/4] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:59:11 -0400
Message-ID: <20240805175916.3257027-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175916.3257027-1-sashal@kernel.org>
References: <20240805175916.3257027-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
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
index 44fe6f2f063ce..d0f8c31d7cc04 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -45,6 +45,9 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
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


