Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C683B6CC3
	for <lists+linux-input@lfdr.de>; Tue, 29 Jun 2021 05:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhF2DHn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Jun 2021 23:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhF2DHm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Jun 2021 23:07:42 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096FDC061574
        for <linux-input@vger.kernel.org>; Mon, 28 Jun 2021 20:05:16 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l11so11493896pji.5
        for <linux-input@vger.kernel.org>; Mon, 28 Jun 2021 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=EFPrS5/IJmf67dyAm4KZznFpmXEsnAa2yEGDVtpNxOLdO65IWgWwfwgGT+RNfTijOV
         pT9AHojI9B4wdqFrbbuDK9Iyq1NtRAkonZuR3EgTCLL9+XLZvvSPTJExSdHhPpX3rfgR
         jISwbhxauiV+PhGAeb3h1AThAj6H/JbNvO++U0QOfpkm6nXW0dTLu2uKXd1yVImMa164
         G1PitWSzoNldBkGugs/r+oiQrgbveIvdCtzfFtR1deZpP147mtbS0RxJnUIBk/pw7jfE
         M+6wVVfBjuhE8xit8VPLe7uy72BYfMR+bNpy/SDf9islfRADLhXMBwHoDrjVaxeKg2ZV
         bkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=H8EVZJehhV4YX12VV8qIp0ChyQOE016zt9ZCr6FXHcyoVMRc9eEoq9lulKE8e3K5C/
         KNTxbhEXU1Tm2NlurReIqeUCTNrWIUEz5xZ6QeQ/tHYT2WdAC+JcI7SjiON50/vAhHQU
         HbsbQr7zSOYDa061D4Y1EgTmziMVqXUBILzThYD97shC8kif3qk325BvuwEtW+vaRw82
         oZmVFkR0O786rXh+IpJwRgdHmSu2ZdTib9XozcMOJATThuRnqCpRFP5fe/zZpEiQGE64
         imMQZNFD9CReXTNFVTYzKr14rkfuUz3InQmrAzA4PB69ZnJu6DlBIzaE+Jvk03PLds/d
         41Tw==
X-Gm-Message-State: AOAM531IzrYfTFbt1rloRDZUBPrNG2dk01Ot1VXgYSMHZJSmiSigHtbr
        AXiyt0gpZFG4nhLK/Wd50RF38w==
X-Google-Smtp-Source: ABdhPJzhSix3YEGvTst44Nwpe6Pm7XYTmpfnwFY/JEmitw9IOcyIOb19UeWrQWTdx2IMDixv6stgnQ==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr41885724pja.181.1624935915630;
        Mon, 28 Jun 2021 20:05:15 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i20sm15617163pfo.130.2021.06.28.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 20:05:15 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] Input: pm8941-pwrkey - respect reboot_mode for warm reset
Date:   Tue, 29 Jun 2021 11:05:09 +0800
Message-Id: <20210629030509.2893-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
device into bootloader and recovery mode.  Instead of always doing hard
reset, add a check on reboot_mode for possible warm reset.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index cf8104454e74..9b14d6eb1918 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -27,6 +27,7 @@
 #define PON_PS_HOLD_RST_CTL2		0x5b
 #define  PON_PS_HOLD_ENABLE		BIT(7)
 #define  PON_PS_HOLD_TYPE_MASK		0x0f
+#define  PON_PS_HOLD_TYPE_WARM_RESET	1
 #define  PON_PS_HOLD_TYPE_SHUTDOWN	4
 #define  PON_PS_HOLD_TYPE_HARD_RESET	7
 
@@ -93,7 +94,10 @@ static int pm8941_reboot_notify(struct notifier_block *nb,
 		break;
 	case SYS_RESTART:
 	default:
-		reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
+		if (reboot_mode == REBOOT_WARM)
+			reset_type = PON_PS_HOLD_TYPE_WARM_RESET;
+		else
+			reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
 		break;
 	}
 
-- 
2.17.1

