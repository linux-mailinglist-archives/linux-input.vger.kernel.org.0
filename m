Return-Path: <linux-input+bounces-3712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D08C6345
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 11:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4BA1C225D6
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 09:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3525A788;
	Wed, 15 May 2024 08:59:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B325A4D5
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715763562; cv=none; b=BX+SgSSB8JwxDhAYqrWy7CCl/5evbmTAnovSYQ4pe4/YGdIZ6Op65mKNYd9R9PqeexcYi3+/yrzN8VFWjNZEtwZVj9ZnD1I7pS6V8PENbdprvypqeNcwvnkaf9JQMHClrxsNiKZeuqV1Sr9Ndi195uHLVFnRT2T98EqvNfWGl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715763562; c=relaxed/simple;
	bh=terh4aeXf2nLAev2reqg1r3QrjvYnrLBS581eb+dWGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=garhLH7aEVPhd3c5IGJDyPYnAJVomAK85bBREHUL2rwJwKCIPmgx7PbBSf40m6qA+Z3gMnrISdvAs+i6zhjmupCeiZbL5dRlbrYOR5k+pGqjJ0E81E+74CuRRZxYlWOo0W2Oy9SD/qzbten0mCOgvHP0VUGZfs92DX5HF52pnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.247])
	by gateway (Coremail) with SMTP id _____8Dx1OpeeURm6wANAA--.19284S3;
	Wed, 15 May 2024 16:59:11 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.247])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx67pceURmwn0gAA--.0S2;
	Wed, 15 May 2024 16:59:10 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/2] Input: psmouse: Introduce PixArt driver
Date: Wed, 15 May 2024 16:58:55 +0800
Message-ID: <cover.1715224143.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx67pceURmwn0gAA--.0S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1fZr47urWxtFWUWFyfuFX_yoWkCrb_ur
	yIqF97Xw1jgF1DtayDAwn7ZrZaya1YgrykZan8t345Kry8ZrZxCw1DZFs7Zr4DXryUJrn0
	kwn7Wry8Aw429osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07je0PfUUUUU=

Hi all:

This patchset try to introduce the PixArt touchpad driver.

Unfortunately, due to the current design of the PixArt touchpad hardware
and FW, our single packet data width needs 11 bytes/15 bytes to receive
three-finger/four-finger data in absolute coordinate mode.

Obviously, it exceeds the design of the native driver, and we try to
extend the length of a single data packet to 16 bytes in patch(1/2).

I apologize that this radical change may not be the best way to go, and
I will try to rewrite this section if there are better suggestions.

Thanks.

Binbin Zhou (2):
  Input: psmouse - Expanding the psmouse packet array
  Input: Add driver for PixArt PS/2 touchpad

 drivers/input/mouse/Kconfig        |  12 ++
 drivers/input/mouse/Makefile       |   1 +
 drivers/input/mouse/pixart_ps2.c   | 294 +++++++++++++++++++++++++++++
 drivers/input/mouse/pixart_ps2.h   |  31 +++
 drivers/input/mouse/psmouse-base.c |  17 ++
 drivers/input/mouse/psmouse.h      |   3 +-
 6 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/mouse/pixart_ps2.c
 create mode 100644 drivers/input/mouse/pixart_ps2.h

-- 
2.43.0


