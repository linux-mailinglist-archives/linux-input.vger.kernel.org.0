Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2943A87D2
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 19:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbhFORgJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 13:36:09 -0400
Received: from mx5.ucr.edu ([138.23.62.67]:2383 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231657AbhFORfb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 13:35:31 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Jun 2021 13:35:31 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1623778407; x=1655314407;
  h=mime-version:from:date:message-id:subject:to;
  bh=W/Agxa+mpwusp9Cgi9SCSo4oM2dq2tyEp2RYhM5gf80=;
  b=NlOHpCj1hVUSYNnXoOMUJFVeePxLGjOoqnMMhMbyD2gKIK6moWxPRM/Q
   uFLF9SS1uVwLQE9sm2Gd3zkKCongZKGe0ThymKVxLYkbAjqaEAhY7j9gM
   6llQ4jfnDxQmIC8xUkXO3Ui/BwXxio8Im0/CsFig8dgba50wZFTZ/vZpE
   IOHOSOvOKVMYoU1M90fTObIb7Dhv2YvxgDqRLZH24wVGIqH7i3bwk7sHJ
   GW1rNSAcZ4ZdIcRv7RRu8FbPkoGL6IzfqEA7co7KFH2zMtvTylJ4WEj6y
   eqx90FAdiLjLhPr7Nk9EXAP+LeBUqBXEO20VBQ7smSNM4Cp6vJ44HJG+X
   A==;
IronPort-SDR: Xd7b68y5L1gqn+t5XKDXjTnRnUzU4ziwzMTJXzemM/LIjtSLMXogxoQpUspauoIlIFX/v9Y1gW
 XSoGkEMJlAEHdRJYtkvq2mG4R+Qn8D4QzYvy0bJ7K53eDSKgLfesHG/9UzZjdiX5f97whXaxHK
 kPaQjeiW+Sb9UNNHs14+OdLwfHbmgiVQ6gkBz/LahcDwbKOUxNmGJyF79/AQAFn9i5RCmHQwYq
 mlgUZPgG77QGktkLiDVUR7VXGhnrsAUL/OuJIWYqXLwINkcbg9JVfN/y+qjYnYRk7jf2WNP+bb
 L6Q=
X-IPAS-Result: =?us-ascii?q?A2HRAgBp4chgh8XSVdFaHgEBCxIMQIFMC4N4bIRIlSgBk?=
 =?us-ascii?q?maFP4F8AgkBAQEPQQQBAYc7AiU0CQ4CBAEBAQEDAgMBAQEBBQEBBgEBAQEBA?=
 =?us-ascii?q?QUEAQECEAEBAQFshS9GgjgihA0RfA8CJgIkEgEFASMSIoJPgwgFnHKBBD2LM?=
 =?us-ascii?q?oEygQGIJwEJDYFiEn4qhwmCZ4QhgimBS4I3dIQLg1CCZASDGHsTg3YBAQGeM?=
 =?us-ascii?q?5xgAQYCgwMbnXgrpWUBLYYzjnSkTRAjgTGCFTMaJX8GZ4FLUBkOjisNCY5MJ?=
 =?us-ascii?q?C84AgYKAQEDCYcVgkcBAQ?=
IronPort-PHdr: A9a23:WrmfmBVEEAGc81V1M/GwfddniS7V8KzvVTF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBNSdsKgbwLWN+4nbGkU4qa6bt34DdJEeHzQksu4x2zIaPcieFEfgJ+TrZSFpV
 O5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1Ov71GonPhMiryuy+4ZLebxhMiTanb75+M
 he7oQrTu8QYnIBvNrs/xhzVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3Q
 rJEAjsmNXs15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRTiv6
 bpgRRn1gykFKjE56nnahcNwgqxVoxyvugJxzJLPbYGJKPZzZL/Rcc8GSWdDWMtaSixPApm7b
 4sKF+cOP+dYroj9p1sTqhu1GAqjBOP1xT9Jm3T72q070uUhEQ7c3QwsA84CvXrPodXoKKgSS
 /q5w7fVwjXedv5b3yr254fUfB47u/6MQa5wftTLyUkpDw7Ij1GdpJH7Mj2b2OoArnWW4ep+W
 e6ylWIqrxx9rzmgyMouhYTFmIMYxk7A+Cllzos5Od+1RkBmbdOqDJZdsy+XOo1rSc0hW2Flo
 Dg2xqECtJKhfyUHyI4rywDCZ/CbaYSE/xbuWeSXLDxlnnxqYqi/iAy38UW4z+38UdS730hSo
 ypel9nMqmgN1xvO6sibUvd9/lmu2TKI1w3L7+FLO0E0la7CJ545zL48i4MfsUreEiLymkj6l
 qCWdkIj+uin7+TofK/qqYObN49xkg3+M6IuldKjAekgLAQCQ2yW9f6/2bDj50H1XqhGguEsn
 qXEtJ3XJ9wXpqujDA9U1oYj5Qy/DzCj0NkAnXgGLVJFdwiGj4T1J13DLuv1DeqjjFS2ijtk2
 e3JPqD5DpXXMnfDiKvhfap660NEzAozzNZf549bC70YIfLzXFfxtMHEDhIiLQy0zPjoCM9n2
 oMdR22PGKmZP73WsVOS4eIvOeaMN8cpv2PxLvk5/e+okXgjnlwdereB0p4eaXT+FfNjZw2dY
 HzxkpIAF38XoiIgQ+Hwzl6PSzheYzC1Ra14rjU6Dp+2SITOXIaghJSf0yqhWJ5bfGZLDhaLC
 3i7WZ+DXqI9aTCSP8gpoDwNVPD1Wp0h3BD27FTS1rF9aOfY53tL5trYyNFp6riLxlkJ/jtuA
 pHFu1w=
IronPort-HdrOrdr: A9a23:vOetM61zZusZL+4uWWLuHgqjBLskLtp133Aq2lEZdPU1SL3+qy
 nApoV56faZslYssRIb+OxoWpPwI080nKQdieIs1NyZLWzbUQWTXeVfBEjZrgEI2ReVygeQ78
 hdmmFFZLPNMWQ=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="220159647"
Received: from mail-pf1-f197.google.com ([209.85.210.197])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2021 10:26:20 -0700
Received: by mail-pf1-f197.google.com with SMTP id s5-20020aa78d450000b02902ace63a7e93so10704238pfe.8
        for <linux-input@vger.kernel.org>; Tue, 15 Jun 2021 10:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OYK6lzODuclGPxJjXdB4mgKjdrNpwT3xXkrS1G/arSg=;
        b=azrC/EufM5BarFCpD14t8ZNUWL7RAElcW8A8UinvBxnTiBUKas5bSMjwJTERafV2YX
         vvWDAUIjU9AJIAvxJvli6qXlbFyMvwEPT1K6fu867mzOBcv2HjYAdl5s7//DrM9dXuPk
         JvXBsHLjhKMGj7gkcgbDVZJs806yx1tMOe29nYFe9nHVhgM53n9kgokt07EL3BCwEv0j
         R0SMMpN37ebzW9aqnyiesme4JlP5WdrCqwJa3Ky86W6/Z4jfwpe4/u1uShcdzqifP10M
         1lGUFef1mar4M16LqgKHEJ67ZpPUQ3a5+/xLl0WK8ZD3wdLcRo4c/Dh8+tg4y76n2YfI
         4OGQ==
X-Gm-Message-State: AOAM5300kvogr1Q1fiQJDFbMK1SLmChM+d7+LCyuLUw0ShAfqch41LEC
        9/wVZ634uUHKqBPk0Pnvk2YZofhlo7okHkbh+Pi+MK2CWLkFi6aPFxzOyEuRNAnbfjgZJNyKR9G
        +8I5N6rdt+FcVch2IBkRbHvPWRImy9eqRKXX4H9Md
X-Received: by 2002:a63:805:: with SMTP id 5mr543992pgi.353.1623777980105;
        Tue, 15 Jun 2021 10:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCZQDekeP9cckWRs4Qg7Emd8mJjO8LA9Ll72Yzdgd0bVHJTbot+A9NY9vUzYbgiuUR37w81ZzzBWssd47GWmI=
X-Received: by 2002:a63:805:: with SMTP id 5mr543973pgi.353.1623777979808;
 Tue, 15 Jun 2021 10:26:19 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Tue, 15 Jun 2021 10:26:09 -0700
Message-ID: <CABvMjLRuGPgEJ3Ef7=sBk3m3oa+3HuyV9mVY0ZCYuHK=rJRA4w@mail.gmail.com>
Subject: [PATCH] Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Inside function hideep_nvm_unlock(), variable "unmask_code" could
be uninitialized if hideep_pgm_r_reg() returns error, however, it
is used in the later if statement after an "and" operation, which
is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/input/touchscreen/hideep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hideep.c
b/drivers/input/touchscreen/hideep.c
index ddad4a82a5e5..49b713ad4384 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -363,7 +363,7 @@ static int hideep_enter_pgm(struct hideep_ts *ts)

 static void hideep_nvm_unlock(struct hideep_ts *ts)
 {
-       u32 unmask_code;
+       u32 unmask_code = 0;

        hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_SFR_RPAGE);
        hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
-- 
2.17.1
