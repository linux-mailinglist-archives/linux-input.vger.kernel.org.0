Return-Path: <linux-input+bounces-2043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971F85FB37
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346E4281DDC
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C9C1339B1;
	Thu, 22 Feb 2024 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="qndECMbC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEB3F9EF
	for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708612025; cv=none; b=eT1SlWugM0Qp+pcJ5BYNZJSXkxn871odexZE9H6XRJn+wsdIonheuqYzBpCYPFkvj5lDn9DkcgPgK3PArubKDvnHhT7KfsC9HYQg3gFpniALpvcXV4ZWuO4c6s8uAbkVDOFw6pNJ/oCWjmFI3V0fNfxz7JNku5Z9PbnawkdJWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708612025; c=relaxed/simple;
	bh=pnB1WntP8Gv1YFEo/aQKUWzFx6FkdUowbH2Vi8gU1tM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ixl+W7W44lcOaW0byFd/oiFEKHFVTFcA4Zr91aKnwmns7+L6vpIahbRf4Tu3368r8GF/sJEChNeo//4fRg1tzJ+5rh/sbXdG3oi7eyqHKEMG3qinMGQulMYKD5R9S3pUxvX5f2n0a09YN1GEuxnBkuyz3v8kfj7hF7muufUyEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=qndECMbC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41276a43dc3so12771915e9.0
        for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 06:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1708612022; x=1709216822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TaJdrvK3hwGXTlliZOo/iLP2nid8OIwhuTfcu0ARwIs=;
        b=qndECMbC4lRP/qAdiRzX8cGgMAPoFUzORncgrURK7aUZHDnfVOm0BHi/0njjzCR8vW
         tfYJGktPe7FqLAeNixREj5uDXiMnjB3iWaMp2sl/6aK4olsvWC2e3muxe1xpKxgrpMWK
         vxtNB8Gu0Y1/s1YL3pbwZE9kc9LsNDlkWi3n3w0baFEEmNIzV84krPLsJ9W351m70U+7
         qG0ulJ/klWTrLKxu4wlhWpP9QdK2R1I0OvQfw5yOigu4AmWzNo8sddfMFwymKBaVg+A/
         p5n0KQuQEOw0Z2SJyLmol7SW3eeA63C5W3B3s2u4YPqSl5xuMlvDqZB8TkHIONLDOoED
         y7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612022; x=1709216822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaJdrvK3hwGXTlliZOo/iLP2nid8OIwhuTfcu0ARwIs=;
        b=E2d9ivKgCmKYcoYab7Gg5q9j3TcXVVA64tGv03cnCI9ruPjcFku67gM1gMhI0kzrOB
         XbSvYLmU/0eS0VexSEjcad2CZT7d6ltLmJXu3be5g5y20vdhZdsZ1zXgEMIu+tNDBoxi
         gEilvdDqxWkuf3iQwdli0T6DyKey5fBeRKdBJQvArDJ3svXghBJlukvtXMzp/ykT5NTE
         Xygaqp0goo9ngrSO0fQxp6drhIRfcdQAdYMYQpUGR/PKeEsgoPzXsg6yby18Hi1BNjeU
         U8eQy6iio3VUylr3SGv5Epk91M0emqOZB8dwLX38GXbdVQiOGmKZi+YqYqHWhaCeAVC2
         Dw3A==
X-Forwarded-Encrypted: i=1; AJvYcCWah2T1MuVaZed3UjeGUb+jg8LA8xx4TkKSHjA97izgfuFj7kc70WHdE0xnWSS3TAIZm93yq7urgZvCnp1CXCMfXyOSrLxMMO+Dtr0=
X-Gm-Message-State: AOJu0Yz5FG90A7F8RCzbhBRorOpdGG6ajP6IfYJ67tY6JnfwIbcU43bG
	4QYviUgLNAgebnB80BAAPxF04BV/UoH46JweNI06BF7rmXDKi5NvjikasbebtHIOad3ThdYLpbV
	uAjU=
X-Google-Smtp-Source: AGHT+IHKOBZVzHbJOfZyzZmyamercWbjonP0JEztuzdcHC6Uh8OuigGbTZ8CeuOR3g6hnYdepp+IDw==
X-Received: by 2002:a05:600c:511f:b0:40e:b313:b8db with SMTP id o31-20020a05600c511f00b0040eb313b8dbmr18990068wms.28.1708612021753;
        Thu, 22 Feb 2024 06:27:01 -0800 (PST)
Received: from bell.fritz.box (p200300f6af115800c74ac0a438dbc23e.dip0.t-ipconnect.de. [2003:f6:af11:5800:c74a:c0a4:38db:c23e])
        by smtp.gmail.com with ESMTPSA id ay25-20020a05600c1e1900b00411d3a414c6sm262913wmb.47.2024.02.22.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:27:01 -0800 (PST)
From: Mathias Krause <minipli@grsecurity.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Nick Dyer <nick@shmanahar.org>,
	Brad Spengler <spender@grsecurity.net>,
	Sasha Levin <sashal@kernel.org>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH] Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
Date: Thu, 22 Feb 2024 15:26:54 +0100
Message-Id: <20240222142654.856566-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling irq_domain_remove() will lead to freeing the IRQ domain
prematurely. The domain is still referenced and will be attempted to get
used via rmi_free_function_list() -> rmi_unregister_function() ->
irq_dispose_mapping() -> irq_get_irq_data()'s ->domain pointer.

With PaX's MEMORY_SANITIZE this will lead to an access fault when
attempting to dereference embedded pointers, as in Torsten's report that
was faulting on the 'domain->ops->unmap' test.

Fix this by releasing the IRQ domain only after all related IRQs have
been deactivated.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Reported-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
Torsten, could you please confirm (again) that this patch, instead of
[1], fixes the bug for you?

[1] https://lore.kernel.org/lkml/e77756aa-c0f1-44a8-bcd6-a46fe954b195@moroto.mountain/

 drivers/input/rmi4/rmi_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 258d5fe3d395..42eaebb3bf5c 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -978,12 +978,12 @@ static int rmi_driver_remove(struct device *dev)
 
 	rmi_disable_irq(rmi_dev, false);
 
+	rmi_f34_remove_sysfs(rmi_dev);
+	rmi_free_function_list(rmi_dev);
+
 	irq_domain_remove(data->irqdomain);
 	data->irqdomain = NULL;
 
-	rmi_f34_remove_sysfs(rmi_dev);
-	rmi_free_function_list(rmi_dev);
-
 	return 0;
 }
 
-- 
2.30.2


