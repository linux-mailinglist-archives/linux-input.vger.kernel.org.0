Return-Path: <linux-input+bounces-15946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C64C42D04
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 13:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E15188DBBE
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 12:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209E821D3F4;
	Sat,  8 Nov 2025 12:40:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03AA17BA6;
	Sat,  8 Nov 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.227.155.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605641; cv=none; b=nX2AYpiE4AUZJombWDVSd5fTlFjEq2B0GCJS/i9wVcwzmdoGI1hZGZhC0NeV2thW3UOq1Yacb3fqfpfMIRvLEo7pwkSMrv3orGpkRO67P6OJq6SwHALdk1unYpQCpSjbFPrEFXjV8133qnU/mAT8ng8bgonGFn8kPndPZuCA7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605641; c=relaxed/simple;
	bh=UJyf2c9itj+3wTVrRyyU4Rrap69UeR2cIkNhyd3t/yc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=glSfHeGK6ir0cwC/+P4M9RDdcwI/is1rkiqfHRGV5Up4IE5LgWZLK7c0Fq4JZe3uCIZU+9rPlufLhskXpqVTe9KGi7qVfHOt0xqj9/RAdVUJ4qZ44fhBQyp3091+A7TZDI9cRbZEhv2juaGtHzkkVosxNKiAl+928vRiHjbEPeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=165.227.155.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.144])
	by mtasvr (Coremail) with SMTP id _____wA3h7AuOg9puF92Aw--.36516S3;
	Sat, 08 Nov 2025 20:40:15 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.19.144])
	by mail-app3 (Coremail) with SMTP id zS_KCgCXmm0oOg9pT2gFBA--.8637S2;
	Sat, 08 Nov 2025 20:40:13 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	pali@kernel.org,
	hverkuil+cisco@kernel.org,
	akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Jonathan.Cameron@huawei.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH 0/2] Input: alps/psmouse: Fix UAF bugs and improve workqueue synchronization
Date: Sat,  8 Nov 2025 20:40:03 +0800
Message-Id: <cover.1762604516.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgCXmm0oOg9pT2gFBA--.8637S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwEEAWkOS38IiQAcsJ
X-CM-DELIVERINFO: =?B?WvS4LAXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19gUWg51OTK/19Jr+UF/FUxf8szjJzbpdnFV7SDfFD2jLqDRoAX6i8wAOm9LApB0Tvsr
	LzoIPSHD6BgCJK/90564eUQdYk7E7xu/5wSiWafEbsQogZ6gd+oVb3CMSZzrqw==
X-Coremail-Antispam: 1Uk129KBj9xXoWrZw4xJw1DZw4DXF4kKFykJFc_yoWDGFg_ua
	y8uryvgw40vwnI934UCr43urWxt3Z8XFWkCr4rKa4qqryUJr9rXFWku392vr18Xr48tFnr
	G3ZIg34fArnIgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbTAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7xwIDUUUU

This patch series addresses use-after-free bugs in the ALPS
touchpad driver and enhances workqueue handling efficiency
in the psmouse subsystem.

The first patch fixes a critical use-after-free race condition
in the ALPS driver where dev3_register_work could be scheduled
after the alps_data structure was already freed. This was caused
by insufficient synchronization during device disconnection,
where flush_workqueue() couldn't prevent subsequent work item
submissions.

The second patch optimizes the psmouse disconnect path by replacing
flush_workqueue() with disable_delayed_work_sync() for better
efficiency and robustness.

Duoming Zhou (2):
  Input: alps - fix use-after-free bugs caused by dev3_register_work
  Input: psmouse - Replace flush_workqueue() with
    disable_delayed_work_sync()

 drivers/input/mouse/alps.c         | 1 +
 drivers/input/mouse/psmouse-base.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1


