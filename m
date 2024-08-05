Return-Path: <linux-input+bounces-5354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A844948139
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429AC28CE99
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFB817C235;
	Mon,  5 Aug 2024 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZdf67Wo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154AE17C230;
	Mon,  5 Aug 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880751; cv=none; b=AUGH2ULKvulBOs3+IYWytjOiUyCXbjv8kAM8d406ZvyDNzVJ9VsZ7K9HfegTAWjuMAlZm/t17ZOKCSS8oMFwL+ZBUHnPzR6Fk+m82UnxOcv8YqolDniFbcPRUtZUSmm6GRNH3f0rLMvAzOrX9pkwilDxgFy237cWClyOXTy+3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880751; c=relaxed/simple;
	bh=xlrR3WwL+cXJc1lqxFYvNtOrzzq8EIlyhO6U+rAUZkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlRUASLGUoPSBf3fVTGWoFmi6U/zFF+gy2jyj7JOM7phR3mrwNX74FTYnNIkC0Lpjb5YCrUNNYIQg364OMJlGbTtbYbTMAW/LEQpwsaPohjEe+uedj2+bYbW4ciT8ikyQ4bYLCEkHP51oqPK5Dkujqj21jnC5CtV6vA2axoyj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZdf67Wo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CF3C4AF0B;
	Mon,  5 Aug 2024 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880750;
	bh=xlrR3WwL+cXJc1lqxFYvNtOrzzq8EIlyhO6U+rAUZkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZdf67WolOzIGqpfbckZs+dBHZPEzaxFO8IqJB3zs3CZCqVWRP0tSWzObzwHSIYP+
	 qglFo7cWjkOxhmZqMc9dOKBCTWeLFXDqlXG8+QfJsq7RMHMvweJmRlFj9zUkQx2REm
	 6+C0cgwn+yfpmBr/GjOfre7hlH1njWMTz9ZoxLx5l+2D/lZUpbTx2M1yyIG8gzMiGR
	 cRAYAmlyGAVYbyDvd8IsU37iTrq/rLr1l/9NBmNnYMpoKnGYJ/l3x4so6gH6sIGUI/
	 P+8cli1kgLxVg0EkepnVGG5j4uSWYlag7BBvZ7ftXArN+Iuus2ghpFM9tV8jSq5PCA
	 hgZPoggj10CXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 4/4] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:58:52 -0400
Message-ID: <20240805175857.3256338-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175857.3256338-1-sashal@kernel.org>
References: <20240805175857.3256338-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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


