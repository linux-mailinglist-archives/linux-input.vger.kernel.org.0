Return-Path: <linux-input+bounces-2033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C285F380
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 09:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C30E1C21325
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 08:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0862C683;
	Thu, 22 Feb 2024 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDm6difF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440518030
	for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592012; cv=none; b=Kj9PDsBik3slT+vzGZgwXDNwPSjFo6OyoX44QBUr4q65Dc7DJHQpPGvqGZpPie9rbo063M3I+cOrcNaSIDZiCkpRS1/xigyGVSJ4hHsvO0fTjfPhz8EdsKWEaS6Z/+QcsoiIAK/tV1BdWP3BTx6taXjhBK+JC3B5804m+82JUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592012; c=relaxed/simple;
	bh=ZaCt5bs1UxqZ+qs7mRxsARXzEk6hn2SLa2V4crMdhUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVGgqh+AZOrtM3r3P2BJkLT0rC7WcS2JdrRvjq1ED4PvSlSCJAU4ctJX4BWleqpL2sfa0jupLaFxavl8lq3wDKqNEXLWLDAX7RyVJH432SB4y+N3IfXzhR5QAVIK3prjikK1qoRqXxkwOo3d90eO1soy+/P6adS8vZHgzWZnqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDm6difF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4128cfb6c1aso517145e9.0
        for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 00:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592008; x=1709196808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8UwvKUddBcDJ30OeDmpxIggbUMABYM5HCkJJ/iLXS0=;
        b=xDm6difFBcWSEyuvXXoDsoqiFLZdL3NzdU/UuBsGndv2Mmg/uPH4rLS8x0aqFC9+k+
         5eUXBb3QE5PChvwEGTgZFkJH1Yj+bOEGfIJ95uXpF4wlNDai6v9yyiofhVr6/HzJ4+Rn
         peBXmmxvH2+vUD73jqEfMun9DxWnjQxKxXDMZgXo18kDL6QseVutB+YziB322xXrzP3o
         5sGpXOxoDsb4EHfVSoTkoQASwDdXAODUqRoJ7hn3BKYxHvyyqU8KTnaETkYTNpwyl6nw
         mlfFQs+HQqD37jpQo6H37DiGxHm5UGXw+G2UonN87FCtzuJI98z+OUGVjoHvr3Nnhe+z
         9IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592008; x=1709196808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8UwvKUddBcDJ30OeDmpxIggbUMABYM5HCkJJ/iLXS0=;
        b=iov/HQC8us8Tpq2gsgyXxWAJV864Shk2huZtPInph4NlaT099RM5ArhfQOcilj8PpF
         15lhDRDGkt9X0PIFBgeKi3GEFOqK0begdG8YlKwYK+IjkpKnZsUspIHjUuc4qx/Bkbfq
         jP8SMMhdEWn5fKT1Z4nsS6Fcb8Y5drZofxcA1Orh3XoYhmYwIu172cD085GZUfwpYgXP
         01qWh9BOR+gS/JT+qbRP8xMUBdRlG7wndb0cpt5aJvDaUIQDZxPRmvhl/plaGGM0llPn
         +9A2DmwPfeN7JcwQS9nKyoZoVUxGK/BD7wG6KPMK4a0v+K36BX2BFI2HrINsvaoTu0s7
         5sYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhx5C1zvv2lbFwwqgcyvluhvY19c5QqCF3CnFwzDjLFrksrKdWYjUAm6a+wf/SIMvo+hoyWQtXgenZ+k9+XcVtjoyqmKHE4rwpme8=
X-Gm-Message-State: AOJu0YyHwK0Ek86l8GbNfnW+62QukJ7uaetFPxKQd4WJbO9IGvjxPjqQ
	+nJMpBm4lFeA0tLqL5Ngx1mITvRT9zEnEAN0wvoKET4GGH5jY6iowZDlAUwpyh0=
X-Google-Smtp-Source: AGHT+IHnOo2I7r2WPEzhWOsfF+Ao1GprZINhZylx6l+TcqIjYU4pOyVZTVFPvaORJc+oMQDaGku7AQ==
X-Received: by 2002:a05:600c:4fd0:b0:411:d929:6e12 with SMTP id o16-20020a05600c4fd000b00411d9296e12mr1464873wmq.17.1708592008662;
        Thu, 22 Feb 2024 00:53:28 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c4fd400b00412590eee7csm18262233wmq.10.2024.02.22.00.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:53:28 -0800 (PST)
Date: Thu, 22 Feb 2024 11:53:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Torsten Hilbrich <torsten.hilbrich@secunet.com>,
	Nick Dyer <nick@shmanahar.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brad Spengler <spender@grsecurity.net>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] Input: synaptics-rmi4 - fix use after free (more completely)
Message-ID: <e77756aa-c0f1-44a8-bcd6-a46fe954b195@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

From: Brad Spengler <spender@grsecurity.net>

Grsecurity uses memory poisoning and detected a use after free in
rmi_unregister_function().   A fix for this was merged into the
grsecurity patchset.  I detected the user after free later using static
analysis and sent a partial fix as commit eb988e46da2e ("Input:
synaptics-rmi4 - fix use after free in rmi_unregister_function()").
However, my patch meant that the grsecurity patchset didn't apply cleanly
and forced everyone to re-visit this issue.

The bug is that we must not call device_del() until after calling
irq_dispose_mapping().

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Reported-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Closes: https://lore.kernel.org/all/1932038e-2776-04ac-5fcd-b15bb3cd088d@secunet.com/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215604
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/rmi4/rmi_bus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 1b45b1d3077d..02acc81b9d3e 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -275,12 +275,11 @@ void rmi_unregister_function(struct rmi_function *fn)
 	rmi_dbg(RMI_DEBUG_CORE, &fn->dev, "Unregistering F%02X.\n",
 			fn->fd.function_number);
 
-	device_del(&fn->dev);
-	of_node_put(fn->dev.of_node);
-
 	for (i = 0; i < fn->num_of_irqs; i++)
 		irq_dispose_mapping(fn->irq[i]);
 
+	device_del(&fn->dev);
+	of_node_put(fn->dev.of_node);
 	put_device(&fn->dev);
 }
 
-- 
2.43.0


