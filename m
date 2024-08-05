Return-Path: <linux-input+bounces-5356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688F948154
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5291F235CF
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F49D17F4F1;
	Mon,  5 Aug 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIMbU6Ok"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7B17F391;
	Mon,  5 Aug 2024 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880773; cv=none; b=eaagK5TMdD0sYgsEKSNz+7k/f6VPARt1oQwzTP/MCTHpxfusVmHSmKaoRk0ugnVE87MRtOxkQ5UzKwNBCT2piuO5H49woglfS1/WqGt3XnEqUKc38hVOsqr3CtgMS6sV+j9X1E6OeYofBnvsRR9+xsE054FlW/eKe3P0tWopnqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880773; c=relaxed/simple;
	bh=qxMkwj0LA/Ob+ps90+hcO/vZt3FuGMuZ12+fIXihcO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3t2tqfsiYjUZPezfQL+XHEhGtohJqtnNxfKuRlv17Br0OBUN57fxJGrDW05Fco4+FeoPf+oFt/7MxLHQxf5ASvDRaXBwmfbaeLzyf5c+dT8ly8pxLhug/hpZY3IU+fMU7ooTTLn6Ntp3qimZimH/1j2GHdiwRXjjM9Vyk6a5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIMbU6Ok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C8EC4AF0C;
	Mon,  5 Aug 2024 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880773;
	bh=qxMkwj0LA/Ob+ps90+hcO/vZt3FuGMuZ12+fIXihcO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FIMbU6OkUureyj3ekTF4F0gEb/wlGCOqxyA2dSvdYBOQyEJf7Juxbuq1YbfDpllcn
	 0RZVM4suKpOmDn0JO1xBMY6qJcGa3wRLzQNT5F3zYPrJ42m+9WwvPkGh0nQ3EpaQX3
	 Hp6w/RcVLy6V+8dQ98XR3MMk27mf2vcl272BhZQKsCx5nwsfYsShxVuKD7IHZvM3w3
	 9o4I3SdEt5cTauM0k2QuYik03l60iyDhcn++jYylSNtdfcGr1GOPyT45LW9iDOk942
	 4qs6mdqhd1SIa/EE7iUULur6lMFfpuIkuDfIzzY2ZgRw3S/CZGjLtHLYeyLQMvmJKc
	 w46Nub4IONFNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/2] Input: MT - limit max slots
Date: Mon,  5 Aug 2024 13:59:27 -0400
Message-ID: <20240805175928.3257720-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175928.3257720-1-sashal@kernel.org>
References: <20240805175928.3257720-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.281
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
index a81e141484077..dd457403a1a03 100644
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


