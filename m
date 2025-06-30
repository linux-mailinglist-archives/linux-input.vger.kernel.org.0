Return-Path: <linux-input+bounces-13231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B9AEE016
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 16:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B2F3BE3C0
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AC528B3E8;
	Mon, 30 Jun 2025 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y5fPjOco"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7927F001;
	Mon, 30 Jun 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292286; cv=none; b=m51fWBqrGRcxV4+hd8NkaMA9O6AZs8THTKVPP14xMZtukQ+hFmyOYhvv2SbuS3aMS+AnfM2ARRVAR4aJ/6o53eqxhW4qJTgEg96kVSFSUn3A7dFxrfZAsCKKuBE2qs7Hi984c5mma4xHAiqZ/HTnbXNUVkjRkN+nBA7CjkMOyd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292286; c=relaxed/simple;
	bh=lJo4k2xVeiDebpwc+lYdH4ZwZHtPsq3pOUWr892pgog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uo8TCJ2ekZPVmry29oVjzlCysqC76BJXN9z6BzULQ7pTzBP4a996J8G0Fq6RsSh+zdOBRchQvBPWi0lxDQwHPpvuATwBT2+Uns+0JTgWtZp0Yiuyx7MD7SLH1ernNFycg4jT8lhqeGTZabAuLxrkbqV4oEfzDIYIfx/v/CAZ1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y5fPjOco; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751292282;
	bh=lJo4k2xVeiDebpwc+lYdH4ZwZHtPsq3pOUWr892pgog=;
	h=From:Date:Subject:To:Cc:From;
	b=Y5fPjOcofU4G1ItuixmiIZQ7ZR3mTg9aTWlF2wqf9c25xRK4agkwggxNZ+s3uqH2Q
	 Ee+0qRSB1BSSP1dH/gZWfNEzDfc35PKIN5UnBJCIlCvHR0VsPKOXrMbAT9J2g5auXL
	 K+PRPbF9CzNQ03ZgDfmPHsleV6/tZlT8Xy1LCWG4Y/hcQqBGV9bUXsf8Rt0wLRspMN
	 r+aEJi37BW8SNko2suUgtG6jliHSzqFMqnfdfsEzHXEjbT+EhVrLhIUMKduQoH81oe
	 eenEeyGGs3R99mZXgL7cwGDOarDA1OVad4yKD+eL83vt2WkIzKY+J3d/PpSOgiLEpc
	 JzaTTg3OhiA5Q==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA1B417E07F2;
	Mon, 30 Jun 2025 16:04:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 30 Jun 2025 16:03:44 +0200
Subject: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when no
 compatible data
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
X-B4-Tracking: v=1; b=H4sIAD+ZYmgC/zWNwQrCMBBEfyXs2YUYjUh/RXpI48YuJWnNRqmU/
 ntDi8c3w8xbQCgzCTRqgUxfFh5ThfNJge9dehHyszIYbay+XTTGMuAU2eNAP8HAM/rspMer6ax
 1wdw1BajrKVMt9+dHe3Cm96cKyhFC54TQjzFyaVSiueBfAu26bnCUhzmaAAAA
X-Change-ID: 20250630-mtk-pmic-keys-fix-crash-42b55af280ef
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751292281; l=3806;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=lJo4k2xVeiDebpwc+lYdH4ZwZHtPsq3pOUWr892pgog=;
 b=4hOq21N8D5aFlEKW2DcSULezu6veN9g5798DGmTfklmb5u7sWpNRKE7KpYYGunYkHmoo6aZQW
 qz9saAYUu5mCtAHnUIH7z8d/6nfLeardHGP1xhvfpOSAjUxiCQIHQbz
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In mtk_pmic_keys_probe function, the of_match_device function is
called to retrieve the compatible platform device info but its return
data pointer is not checked. It can lead to a null pointer deference
later when accessing the data field, if of_match_device returned a null
pointer. So, add a pointer check after calling of_match_device function
and return an EINVAL error in null case.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch fixes a NULL pointer dereference that occurs during the
mtk_pmic_keys driver probe and observed at least on Mediatek Genio
1200-EVK board with a kernel based on linux-next (tag: 20250630),
when it is configured to have mtk_pmic_keys driver as builtin
(CONFIG_KEYBOARD_MTK_PMIC=y):
```
Unable to handle kernel NULL pointer dereference at virtual address
  00000000000000c0
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[00000000000000c0] user address but active_mm is swapper
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
  6.16.0-rc4-next-20250630-00001-gea99c662a089 #145 PREEMPT 
Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mtk_pmic_keys_probe+0x94/0x500
lr : mtk_pmic_keys_probe+0x78/0x500
sp : ffff80008275bb30
x29: ffff80008275bb70 x28: ffff80008202bbb0 x27: ffff800081df00b0
x26: ffff800081ef9060 x25: ffff0000c6fcf400 x24: 0000000000000000
x23: 0000000000000000 x22: ffff0000c6fcf410 x21: ffff0000c09f8480
x20: ffff0000c09f4b80 x19: 0000000000000000 x18: 00000000ffffffff
x17: ffff8000824cb228 x16: 00000000d7fcbc9e x15: ffff0000c0a2b274
x14: ffff80008275bad0 x13: ffff0000c0a2ba1c x12: 786d692d696d6373
x11: 0000000000000040 x10: 0000000000000001 x9 : 0000000000000000
x8 : ffff0000c09f8500 x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : ffff0000c6fcf410 x3 : ffff0000c6fcf6c0
x2 : ffff0000c09f8400 x1 : ffff0000c36da000 x0 : ffff0000c6fcf410
Call trace:
 mtk_pmic_keys_probe+0x94/0x500 (P)
 platform_probe+0x68/0xdc
 really_probe+0xbc/0x2c0
 __driver_probe_device+0x78/0x120
 driver_probe_device+0x3c/0x154
 __driver_attach+0x90/0x1a0
 bus_for_each_dev+0x7c/0xdc
 driver_attach+0x24/0x30
 bus_add_driver+0xe4/0x208
 driver_register+0x68/0x130
 __platform_driver_register+0x24/0x30
 pmic_keys_pdrv_init+0x1c/0x28
 do_one_initcall+0x60/0x1d4
 kernel_init_freeable+0x24c/0x2b4
 kernel_init+0x20/0x140
 ret_from_fork+0x10/0x20
Code: aa1603e0 f90006b6 f9400681 f9000aa1 (f9406261) 
---[ end trace 0000000000000000 ]---
```
---
 drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 061d48350df661dd26832b307e1460ee8b8fd535..42fb93086db308ad87a276be4b53e9725a3a701b 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
+	if (!of_id)
+		return -EINVAL;
+
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;

---
base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
change-id: 20250630-mtk-pmic-keys-fix-crash-42b55af280ef

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


