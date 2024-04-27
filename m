Return-Path: <linux-input+bounces-3287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF28B45CC
	for <lists+linux-input@lfdr.de>; Sat, 27 Apr 2024 13:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A54328219E
	for <lists+linux-input@lfdr.de>; Sat, 27 Apr 2024 11:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA424A9B0;
	Sat, 27 Apr 2024 11:15:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B164A990
	for <linux-input@vger.kernel.org>; Sat, 27 Apr 2024 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216534; cv=none; b=rnxNkT0TazmX4oiKFv/SmwkjCLwUXC7a6kP14VWkO/wCDbBLGEu8vY4Ve57lSa2LjxgYQ643zVz88miPIWIViwAUSbxiqLQQUH3tfIThrXZsLP4XGZY8o3jwMDVLmDCg9CEVPalfhLk3Y5Vsob6gpwkQWfNNeEY9PrpChazLb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216534; c=relaxed/simple;
	bh=GB8u12djRIME1B6PDT7eW1YyY3V8yemgIyYdDJiwli4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OscMSqlfPt3kcMUJOHY2Ynkwltg+k8vtiSV0BzJfhOeoVCLzWovCG6DQVSUefWdp55D9lwcfr7zjTDIx1Fa2VvC3CPsu2OZJfJEBCKwetuUePC9mr2DO0y5Sd5CLCZtoTFJddZ2Ckbwo64/pk2mtoz0/t2MD/VOPpRyiPVHmRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 43RBFCWg051833;
	Sat, 27 Apr 2024 20:15:12 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Sat, 27 Apr 2024 20:15:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 43RBFCDI051830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 20:15:12 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <da964ce1-3e4b-40d0-bc31-81de01f99715@I-love.SAKURA.ne.jp>
Date: Sat, 27 Apr 2024 20:15:12 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] Input: MT - limit max slots
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc: syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <000000000000de2f4f05b8942be9@google.com>
 <6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp>
 <Y31Z29bSaH38WuAt@google.com>
 <03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

syzbot is reporting too large allocation at input_mt_init_slots(), for
num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).

Since nobody knows possible max slots, this patch chose 1024.

Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v2:
  Limit max slots instead of using __GFP_NOWARN.

 drivers/input/input-mt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 14b53dac1253..6b04a674f832 100644
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
2.18.4


