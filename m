Return-Path: <linux-input+bounces-10751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1DA5EE28
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 09:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585EE16A735
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E2125F994;
	Thu, 13 Mar 2025 08:38:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8331EEA46;
	Thu, 13 Mar 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855101; cv=none; b=Rle7dY+6DDSQBM9tY5ywKQLsHzETjsasm31AMUeiFguQ3ny5OR2D4fg3H47MpZwcKcrUFc66pg/E+Kwb9SD5vO4vcaDpOLrZckpjdmDVP4Er8eJZ3ogkmXtB1H6cXUFHNch3Sy+NUPbZQ0gL6blOlQ4+uEwENrp98TqyqrgoxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855101; c=relaxed/simple;
	bh=shItUb0ID8hVaNEfs39fAcAoUpxrrDzvTA9HlZjWGNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SGQcyCCxkQC8M8R5ZpJKhUg36bt21BpCCAnSY7FowNs3nhk59w/8wl9lBXKP4PFPr9RNdXQ59dmATb+LSn98AUcRoIttluBL3K9wfKfgKUwDNIClk+YtEBs5PA177wq54VH+zhi5Nsy01mnnZw/0P3yWVuvDn4dxfHvYEziZOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAB3fNhxmdJnPaXWFA--.22502S2;
	Thu, 13 Mar 2025 16:38:11 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: dmitry.torokhov@gmail.com,
	bentiss@kernel.org,
	jeff@labundy.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] Input: fix error handling in input_register_device()
Date: Thu, 13 Mar 2025 16:38:03 +0800
Message-Id: <20250313083803.307646-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3fNhxmdJnPaXWFA--.22502S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF13GrWUGF4kuFW8CF1xZrb_yoWDJrX_W3
	4Sv3s7Xr18tw1kKFnxAFnxZrn7KFsFqrWrur43trn5Wa4rXFZru34kWr40vr1jqa17AF1D
	J3WUGr48Aw4rWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbE1v3UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Once device_add() failed, we should call put_device() to decrement
reference count for cleanup. Or it could cause memory leak.

As comment of device_add() says, 'if device_add() succeeds, you should
call device_del() when you want to get rid of it. If device_add() has
not succeeded, use only put_device() to drop the reference count'.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/input/input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index c9e3ac64bcd0..2e70f346dadc 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2424,6 +2424,7 @@ int input_register_device(struct input_dev *dev)
 err_device_del:
 	device_del(&dev->dev);
 err_devres_free:
+	put_device(&dev->dev);
 	devres_free(devres);
 	return error;
 }
-- 
2.25.1


