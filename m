Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6412B034A
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgKLLCP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgKLLCN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:13 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F34C061A47
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:13 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so5503285wrw.10
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knWXj4Bg/0Bo5izs2YIZY2Umz4PY59EXUTTl8Cf1P4k=;
        b=Lc1AYuZ+Lt5588xyeZsCG++rT/I7ubH93uSjAHwJnPjdMQnzpRLxajJM9Xr2AaGqzA
         C37QdDmT4ivjUZfUqD8/MjbALgf6jVX+pBW1g3WaSoQRRi0ppqakLKAyo7aquZEWTL7j
         qncBK+yduN/EnLr9iWXnxKX9vy/3ywYlnp507pI3/QQwjyYaoJVKSkTJtvgYhsyG/G0W
         0PAUMPfyeMhGXla5NHn9GHMAKKi4XhKOIWIU03Dgag94jCSeVXciOKDpdz4EXkT7LEZ2
         QvXH09NxbKb+QnX6u1GBLFGs+8u9Iz11523salzrvZvIgay9khf16XSQCe6KjKSxRoab
         1P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knWXj4Bg/0Bo5izs2YIZY2Umz4PY59EXUTTl8Cf1P4k=;
        b=tFuYgdHpYL980f9XExPtJ1DzbOmUZI7mVFqkdfeiHseE9ng9VLHECrsiqFKtH3pQ6q
         Wj9wdKTixbZpSddmIkCHWn6Se2dxeBrpeCIByk2lJ1IMsJvWLOKSuK4pLjjChZzVLD2z
         hqEuZ90qFqnR2QTm+81YljFYw8zLzJnFMFNI0DZquQlnBz41HMfNGTp/NL3qIXlkqDhP
         ukm6NpeJTISzvdvWpgpCy/LIOS/1vd56QeUw4J4M/Z8i5VQORjegA8nqB4L5j6mLPSdy
         lrVb4vfDfZkUQB86UETmU6YvlMvJmmnuKbVCUHJvjSSgry6YDd4DYNXwJYYQnEu7CKrM
         obBw==
X-Gm-Message-State: AOAM5326JtA3CrbFcCCnv3XBSZiuEtJoDN6QylVUrU6K141H+GgoXoZZ
        aAwN/hwF0qlBhOYyE+rhi1QhAw==
X-Google-Smtp-Source: ABdhPJyqyjes+BCgN06bC6HN+6GqsK+QWE28xLMVhslNDqpJesu8OVJHftKabKrCdKMpivjUocb94A==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr3726618wrv.350.1605178932058;
        Thu, 12 Nov 2020 03:02:12 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:11 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        De Schrijver <peter.de-schrijver@nokia.com>,
        Felipe Balbi <felipe.balbi@nokia.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 03/15] input: misc: mc13783-pwrbutton: File headers are not good candidates for kernel-doc
Date:   Thu, 12 Nov 2020 11:01:52 +0000
Message-Id: <20201112110204.2083435-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/misc/mc13783-pwrbutton.c:32: warning: cannot understand function prototype: 'struct mc13783_pwrb '

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: De Schrijver <peter.de-schrijver@nokia.com>
Cc: Felipe Balbi <felipe.balbi@nokia.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/misc/mc13783-pwrbutton.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index afdf8ef25ee86..0636eee4bb6ce 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (C) 2011 Philippe Rétornaz
  *
  * Based on twl4030-pwrbutton driver by:
-- 
2.25.1

