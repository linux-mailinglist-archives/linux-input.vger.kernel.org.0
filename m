Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860123C6914
	for <lists+linux-input@lfdr.de>; Tue, 13 Jul 2021 06:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhGMEOU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jul 2021 00:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhGMEOU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jul 2021 00:14:20 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59643C0613DD
        for <linux-input@vger.kernel.org>; Mon, 12 Jul 2021 21:11:31 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id e14so20290417qkl.9
        for <linux-input@vger.kernel.org>; Mon, 12 Jul 2021 21:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBL6vrnWu6qcqanBvPZXK5teSLL1qQNycVv7MRHIOgw=;
        b=qyLuKxlWzSKE/66cu+dEQ7WjrMCvAbjwnlxPLW4vI0lbV/NpiLHyEvB9Nvqn2rEOBB
         lL9yHYVRIjhPUWNspGqZYUsCAfV5jS92DhjrCs0qz/mpWuoLqdTol7VA/qriC6+CYjGn
         DT/WlWDGhx5lO4rNLIgvELJg4UD9zPkZZXVnC7Q2v19e+wU5RDR6p1L3G5MXJkK0RkXF
         //hhvxTOqZmaxxfKStA2C21atlLwz12yePxSGfJgt8jsYCqdXbnuCZkiNcQ+oD31iubp
         SDVdwDbrGGSy2c26bCVLGDleE/U0HgdRExOK9x8ZdRacGM45j5vMqsGo0vj9IfFt2URn
         9sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBL6vrnWu6qcqanBvPZXK5teSLL1qQNycVv7MRHIOgw=;
        b=UnLDxDtj4cu49cons83u1Hle4cjYrpZUgQibxIWKHpWdCNsu7UYudWRe5op58pCsLE
         KMYSay/f1e4iMyNlgTFfCmVPRMtahHdS6q1gcjHxVwBQ8N6mQmVm09cVGN4736lz0GVY
         RYck+etrVztijhFAuJMc9Lo5zcpgLs7DLTQj5Bq8KZrJO9H0ZlMrXMl5ISpc2ATcRAvB
         ASDEUcUML0G8qHcV7/qWB34uiq4xJQaloSZJhR6acTA0uvCNnuJWWpe83mjKNamZXB0f
         yeSwdZ3o0xzDRD7Ozaf+gAxeVYwkDUk0dHZENtUrsC35RkyN1Cs8pbn3/YMuwbD2oAHB
         gqNg==
X-Gm-Message-State: AOAM532T3dFiE8G7Z9cD4x6L+VOBcjFMViW5gMH2iG/29j10uPOdu5Vj
        pNzjAsaKEWQ2CJ+YvGObanw=
X-Google-Smtp-Source: ABdhPJx1Xo0jIFeOr3QJyroysFru1ch5K0PzJu5k08L3uq4ICBG1gNEuFW/YG2vOXh65p6FIfJi9/w==
X-Received: by 2002:a05:620a:41d:: with SMTP id 29mr2205673qkp.18.1626149490247;
        Mon, 12 Jul 2021 21:11:30 -0700 (PDT)
Received: from envious.. (047-007-031-017.res.spectrum.com. [47.7.31.17])
        by smtp.gmail.com with ESMTPSA id j7sm7373126qkd.21.2021.07.12.21.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 21:11:29 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
To:     jikos@kernel.org
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, ecstaticmorse@gmail.com,
        linux-input@vger.kernel.org, shyam-sundar.s-k@amd.com
Subject: [PATCH] HID: amd_sfh: Use correct MMIO register for DMA address
Date:   Mon, 12 Jul 2021 21:11:21 -0700
Message-Id: <20210713041121.13418-1-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

amd_stop_sensor_v2 accidentally used a different MMIO register than
amd_start_sensor_v2 for the DMA address.
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 96e2577fa37e..8d68796aa905 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -58,7 +58,7 @@ static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
 	cmd_base.cmd_v2.sensor_id = sensor_idx;
 	cmd_base.cmd_v2.length  = 16;
 
-	writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
+	writeq(0x0, privdata->mmio + AMD_C2P_MSG1);
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-- 
2.31.1

