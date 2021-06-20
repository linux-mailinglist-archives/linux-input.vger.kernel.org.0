Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50A03ADE3F
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 14:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhFTMDZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 08:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhFTMDY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 08:03:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD30AC061574;
        Sun, 20 Jun 2021 05:01:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m18so16275930wrv.2;
        Sun, 20 Jun 2021 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RUYewpS29ETOvUxb+NczxmZJGUDZdUQNsR1o2uZhLQ=;
        b=a4P03FHp/G5xoH/Qz+baVm74UVa5M2x393f/xxz/Aeji9liEJZnnCG39pO0nPjrNQ1
         HL3TmGiPA7XDoH0uoVV/DUgDy7U0nWt491sUtZ0hsx9qgVmINZoB1+D+vFicZhrYrt3G
         ExMC927QkRbueiCv0xGLzMejZN1TuQAYsTfM3OghISZ1Cu4pF0CNVGbcuSUSVLSuTy8T
         A8RG+xhbcC1LfC3GAH1Vydmryz5MJv33dhN05yu2vB5e+IvCDibqO/z5EuhDP+HUTzC1
         tCVx6rZ4PtH0DQyDYHhOKtmBK6ek4sthmHWdnlSijDtqLFXyDk7eHqq1NPSXLQiHl5Yw
         fBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RUYewpS29ETOvUxb+NczxmZJGUDZdUQNsR1o2uZhLQ=;
        b=HQyPzblhG4y8+EH1RwCfDH5FpNk3nnpBoDIRItuh6/PkQcRIidy7eHVfGlFfOf/xq0
         cEBv7c5f4FdZC5Y2U9slyHTzDU9M4nPh14YEFKFhmZ/J3fpVMCYHRz+D8Mxic1eRQ4NQ
         wklDud7Pc1VmBxulqJRYtfZO8LUC94KAPP139v41JHbfpfLDsP3/ttDwY1ooke3t3j1y
         dhu/K2Teu4GOyFJZcP4d5xbRs42H3afb6d+vceOiJVpEjnPYl3RW1ITzjEtTIYsJrs4U
         Ai+t8mKZODadBevSobDYn/boWqtuaFW7c6n1uJI04tRNCldwvyESHE7pE2BjskwsdLCB
         Pzbw==
X-Gm-Message-State: AOAM533b7RqFHtIA9KKtJbl8nnVwTiS3KeR5s9g13x48AHLWhlXawV3o
        jN6yfOHtsQy1omeCfwq+UZ0=
X-Google-Smtp-Source: ABdhPJxn24sxYO+VPoCxfseNeeXud7waSRMknBi4iozf/4cYOfphYDXBrvmRU+m/a5xEXz7qB/LnpA==
X-Received: by 2002:a5d:538c:: with SMTP id d12mr22500253wrv.116.1624190465604;
        Sun, 20 Jun 2021 05:01:05 -0700 (PDT)
Received: from allarkin.tlv.csb ([176.230.197.133])
        by smtp.googlemail.com with ESMTPSA id j34sm12640807wms.7.2021.06.20.05.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 05:01:05 -0700 (PDT)
From:   Alexander Larkin <avlarkin82@gmail.com>
To:     dmitry.torokhov@gmail.com, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org
Cc:     Alexander Larkin <avlarkin82@gmail.com>,
        Murray McAllister <murray.mcallister@gmail.com>
Subject: [PATCH]     Input: joydev - prevent potential write out of bounds in ioctl
Date:   Sun, 20 Jun 2021 15:00:30 +0300
Message-Id: <20210620120030.1513655-1-avlarkin82@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

    The problem is that the check of user input values that is just
    before the fixed line of code is for the part of first values
    (before len or before len/2), but then the usage of all the values
    including i >= len (or i >= len/2) could be.
    Since the resulted array of values inited by default with some
    good values, the fix is to ignore out of bounds values and
    just to use only correct input values by user.
    Originally detected by Murray with this simple poc
    (If you run the following as an unprivileged user on a default install
     it will instantly panic the system:

int main(void) {
	int fd, ret;
	unsigned int buffer[10000];

	fd = open("/dev/input/js0", O_RDONLY);
	if (fd == -1)
		printf("Error opening file\n");

	ret = ioctl(fd, JSIOCSBTNMAP & ~IOCSIZE_MASK, &buffer);
	printf("%d\n", ret);
}

Fixes: 182d679b2298 ("Input: joydev - prevent potential read overflow in ioctl")
Reported-by: Murray McAllister <murray.mcallister@gmail.com>
Signed-off-by: Alexander Larkin <avlarkin82@gmail.com>
---
 drivers/input/joydev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
index da8963a9f044..1aa067d4a3e8 100644
--- a/drivers/input/joydev.c
+++ b/drivers/input/joydev.c
@@ -464,7 +464,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
 
 	memcpy(joydev->abspam, abspam, len);
 
-	for (i = 0; i < joydev->nabs; i++)
+	for (i = 0; i < len && i < joydev->nabs; i++)
 		joydev->absmap[joydev->abspam[i]] = i;
 
  out:
@@ -498,7 +498,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
 
 	memcpy(joydev->keypam, keypam, len);
 
-	for (i = 0; i < joydev->nkey; i++)
+	for (i = 0; i < (len / 2) && i < joydev->nkey; i++)
 		joydev->keymap[keypam[i] - BTN_MISC] = i;
 
  out:
-- 
2.27.0

