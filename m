Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353702B0352
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgKLLCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgKLLCb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:31 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD83C061A51
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:28 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r17so5564933wrw.1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8MisLbkhVndMxAYlMMQCECnSCP8aKALlPxLYJrYPFes=;
        b=rU/IcTCBOxXpCF1frEkmqXpRoww8BjSck635mcTOuRRaR78RPkefsPcpxTaHf+nN+F
         UTE+hSY3XHGgiM0GjDai4t5IvRCseHH0zgBAl9Ot25jtjDa8iOEmwSd9yiNlPoj84y5b
         ZqU71TIbWFEmTcinsyFwIYsUaRgJKhET4hRiXqTAWiXqiJIXyDuPwR3XzMHLGeGKXrKx
         EI2bBamtj/0ppOHe6dllilPq5CY7hRD7AGrKVvZwJ+DVTgjpzZj8bRZhUPmpSQjTi2IQ
         Dm+XpK9I+5KmmtTURMXCA2Tp5bmL4jDkRulk6wHTTfXshpmoG7wYxsExQcJ0Y/eu3TAW
         bYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8MisLbkhVndMxAYlMMQCECnSCP8aKALlPxLYJrYPFes=;
        b=GPypziXVOKcMtY8gNOaMysXZFkvGTEZL/vI0oRz75sCgbbHDWUDg7EIjiy8hiH7dYD
         8Fqet2fftc6yIclGdCZkMsr6/jyLkLkj83Yy5IJ8UVuQ7cJRsdPv1thz+rkA+K8EXXbf
         HkeRVbmabo/NoPs0bHfn9NRpMKwC+sTsCJKcDj2LcRcdTvCnDkkUnjVMvo67+/o47GFP
         sDxULfypF5ixs3J9VgLFpsjH96afVnWK6o8pwaOcJPFKyrhJIqtTXv1fqpYpRiFmpvlS
         voDFGOmfaduHYnEI9jRvDimriGO013B018egDAdAqlIZgDX56el14Xu0miRNczaj75yQ
         FJwg==
X-Gm-Message-State: AOAM5307v4UiEt5qq+ljQ1l8sPUd1UOinoKUlhKGO1prxr07B3wyyfGa
        D8OV6r7fcMBzRGfBEXA4/qlOng==
X-Google-Smtp-Source: ABdhPJzr/VdtNa9Zb16JJ7e23so/+DGmq9whZymA6z78Hcm8qBaRiICDoKfj+yOLKMot9J7amF2uJQ==
X-Received: by 2002:adf:b78b:: with SMTP id s11mr27388775wre.42.1605178947411;
        Thu, 12 Nov 2020 03:02:27 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:26 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        "VMware, Inc." <pv-drivers@vmware.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 15/15] input: mouse: vmmouse: Demote obvious abuse of kernel-doc header
Date:   Thu, 12 Nov 2020 11:02:04 +0000
Message-Id: <20201112110204.2083435-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'cmd' not described in 'VMMOUSE_CMD'
 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'in1' not described in 'VMMOUSE_CMD'
 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out1' not described in 'VMMOUSE_CMD'
 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out2' not described in 'VMMOUSE_CMD'
 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out3' not described in 'VMMOUSE_CMD'
 drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out4' not described in 'VMMOUSE_CMD'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: "VMware, Inc." <pv-drivers@vmware.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/vmmouse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index 148245c69be75..42443ffba7c4d 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -76,7 +76,7 @@ struct vmmouse_data {
 	char dev_name[128];
 };
 
-/**
+/*
  * Hypervisor-specific bi-directional communication channel
  * implementing the vmmouse protocol. Should never execute on
  * bare metal hardware.
-- 
2.25.1

