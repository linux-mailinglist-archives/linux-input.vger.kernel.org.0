Return-Path: <linux-input+bounces-16607-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A50FCC5D99
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 04:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F68F3010EDA
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 03:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7912D2690D1;
	Wed, 17 Dec 2025 03:01:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E8A8003D;
	Wed, 17 Dec 2025 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940472; cv=none; b=LpJ2iaWYW1jMYfb+N3r6o6zwUSDgueVusjbZ8hHJg9cybso7w77svlkm+m9rRMxDGUtyCW4P8ye3jMr7/kmbZY84369HLaA5k7hEF8XcdqXEp+6Egq3l8BzRLnxG1LIz/75W+9zE6a0pTMvG2VtrakFNOg4ePD0EGI2BjwywL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940472; c=relaxed/simple;
	bh=UJyf2c9itj+3wTVrRyyU4Rrap69UeR2cIkNhyd3t/yc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eXbhbi3V6fNQT8aETuICKiYLnlBliX+ipQgjXn+AMG2+nDH7mtbGbDwaf5f4f48LAEdqzlqnZ95Qyfn57DZ4Q6D7EFYiSsIapPelZ7GY6/6tRgXDLrNkLLRBYtO2CwSzmvkHbzEhTCxJOpm9tTxL31Kjsjk1Lf5WF/N/edPdFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.21.67])
	by mtasvr (Coremail) with SMTP id _____wAnJyDRHEJpwHQHAQ--.3310S3;
	Wed, 17 Dec 2025 11:00:34 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.21.67])
	by mail-app4 (Coremail) with SMTP id zi_KCgCHP4bGHEJpUXHrAw--.24750S2;
	Wed, 17 Dec 2025 11:00:32 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	pali@kernel.org,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	akpm@linux-foundation.org,
	johannes.berg@intel.com,
	pkshih@realtek.com,
	hverkuil+cisco@kernel.org,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v2 RESEND 0/2] Input: alps/psmouse: Fix UAF bugs and improve workqueue synchronization
Date: Wed, 17 Dec 2025 11:00:16 +0800
Message-Id: <cover.1765939397.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgCHP4bGHEJpUXHrAw--.24750S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYDAWlBtgMDGAAEsF
X-CM-DELIVERINFO: =?B?qP9tqwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19liJKAbPaJfkC4v6aoY6E7EVeQ8LvjYvlyV0XnN+1jiWJ1kp7Ppt0T8SF6MPZEMOiaS
	ajFlaRq8wltEG5NMzRf9MdJA4wCe9S0FGnNB4aKU5j4T/5YQXMIDJNJw4CLBpg==
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


