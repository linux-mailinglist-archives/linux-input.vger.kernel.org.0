Return-Path: <linux-input+bounces-3714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BB8C6347
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 11:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214171C2258B
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 09:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620E25B5D3;
	Wed, 15 May 2024 08:59:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05225A4CD
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715763563; cv=none; b=unVjLh2yy8nWP0SiHtg1Fqjzyt9g2BdHTiIPZdMHvtKl1Hv/3XStj/KKPyaXS0dIwrDGnFzrRN5R7+/YBH0Y352IPfzIV6CFuC+b3fY1q4MlOMFMktrs43PlTrDPzzwVpRyVpW1rwBlKgAeLp8pooF2SRb/kSCFIQGn5NtyPKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715763563; c=relaxed/simple;
	bh=JbfLvn1uIOr3adTFWgtUXfVQ4hlJMmXOQNJ2l3urvV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bz8Uo2BD8NV4Zu8m6oFqYJe+oux2/vQABGg1LiDd6UTGYDKDd9BHTP2q0s56Ag9wnyqz3PmUdU3eUCcieCG0fl8sDKfktB/EbiwB8C0pjMpuv8PKDywphlvXs5/Gqbdp3xb6x6rdaB758JyDqHajURdTLxLgYYgU4jPI1LK/mjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.247])
	by gateway (Coremail) with SMTP id _____8AxqelgeURm8AANAA--.19294S3;
	Wed, 15 May 2024 16:59:12 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.247])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx67pceURmwn0gAA--.0S3;
	Wed, 15 May 2024 16:59:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 1/2] Input: psmouse - Expanding the psmouse packet array
Date: Wed, 15 May 2024 16:58:56 +0800
Message-ID: <714216496603cd23c18d9d3e1cc52d8ba21e386d.1715224143.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715224143.git.zhoubinbin@loongson.cn>
References: <cover.1715224143.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx67pceURmwn0gAA--.0S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw1fXryfXw18Wr48Jr45twc_yoWftwb_ua
	4Sqrn7Ww1vvr1qqw1UC34fZry0van0gryvkan0qws8K34kZr9xury8Crn7Zr15WrWrArnF
	k347XrWUC3yj9osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1LiSJUUUUU==

According to the current design of PixArt touchpad hardware and FW, our
single packet data width needs 11 bytes/15 bytes to receive the complete
three-finger/four-finger data in absolute coordinate mode.
Obviously, it exceeds the design of the native driver, and we try to
extend the length of a single data packet to 16.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/input/mouse/psmouse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.h
index 4d8acfe0d82a..b05c6fbae7e3 100644
--- a/drivers/input/mouse/psmouse.h
+++ b/drivers/input/mouse/psmouse.h
@@ -94,7 +94,7 @@ struct psmouse {
 	const char *vendor;
 	const char *name;
 	const struct psmouse_protocol *protocol;
-	unsigned char packet[8];
+	unsigned char packet[16];
 	unsigned char badbyte;
 	unsigned char pktcnt;
 	unsigned char pktsize;
-- 
2.43.0


