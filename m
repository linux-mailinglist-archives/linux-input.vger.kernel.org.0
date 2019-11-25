Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1941094F8
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 22:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfKYVOL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 16:14:11 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42057 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfKYVOL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 16:14:11 -0500
Received: by mail-pg1-f194.google.com with SMTP id q17so7796903pgt.9;
        Mon, 25 Nov 2019 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=LEl152YUeXSTS4b+16Y4exuVJ06qJed/Vqhtfk5q/pI=;
        b=LODZkgxBx/zYJwnllCZgzc8WFXAMiPnYRKMa1ei2W4bB2oAayE+Vi0W25iOdVVIWW1
         Hq/z2mINS/PXCRg7vYcAZp3Qwkw2KLMpYyXRtCyWVqqPdWiqEkCEsJdZnRvX6MLT1I+L
         zxEGqStuPqEme964Dx8Z7VBaozqwreRjcMvEpedTWLZORtKiqZjomkf+/Ci4HJlf1oaD
         A1BoHJulPrhEUErebnHQgesj0TLX+zAxIpouIyfuezt42WvW6kclAvY0lcEgJHxiXuPH
         NOyHPSk9i+6vcAIj00sJ2q++VtvB4VndYiyZFleUAXjHb/pCdN3OrbS7CbhUbZkxbI/4
         6utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=LEl152YUeXSTS4b+16Y4exuVJ06qJed/Vqhtfk5q/pI=;
        b=CADzLCLpEFotaCReZmGINqxk0wrPVicUnguX7tPxdrrLavs7B07OvIPKvlObUKe8ws
         r3btdbtUuHNjrvdIkv0eeFHLb4twoAmtSOr42XZeSGppOrg7jKcCRM9ctV1JP1EbMGjt
         skgkXpkgO53KBoVuw1JYDbDkK35WAH3h+uLRSaPNuqWDFzniovGjctov8tboU0ZfTKvb
         YDJQBQgMNITbDCTQK7TV2wAq1KHp6CQYnb95lPe16UsfHxwH6Xk/YprsmW5zUiuDFaYw
         2NJ/oBMNq+FTpkEziKUoLvDO61Pio4VHxnbVz4Ihty3pHeXZNBgKWi/fCQrQoTrBObbO
         fZwg==
X-Gm-Message-State: APjAAAX6uOFF2HqunAIyGxXnpUT5qif89887C2C0TyLnu2CpKwdF4i/9
        5loModW0NYU7VtHKWAzk0vE6UFd3
X-Google-Smtp-Source: APXvYqxPCo31jaqCw9XSVd08hOdPqvxupLT5nbAWfcwa24jkbgV5WE3JWjoWAwZ7R7Z2A4eUk4exLQ==
X-Received: by 2002:a63:e90f:: with SMTP id i15mr35235521pgh.9.1574716450271;
        Mon, 25 Nov 2019 13:14:10 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x15sm9539925pgj.94.2019.11.25.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:14:09 -0800 (PST)
Date:   Mon, 25 Nov 2019 13:14:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Anson Huang <anson.huang@nxp.com>,
        Robin van der Gracht <robin@protonic.nl>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: snvs_pwrkey - remove gratuitous NULL initializers
Message-ID: <20191125211407.GA97812@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Gratuitous NULL initializers rarely help and often prevent compiler
from warning about using uninitialized variable. Let's remove them.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index fd6f244f403d..2f5e3ab5ed63 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -108,8 +108,8 @@ static void imx_snvs_pwrkey_act(void *pdata)
 
 static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 {
-	struct pwrkey_drv_data *pdata = NULL;
-	struct input_dev *input = NULL;
+	struct pwrkey_drv_data *pdata;
+	struct input_dev *input;
 	struct device_node *np;
 	int error;
 	u32 vid;
-- 
2.24.0.432.g9d3f5f5b63-goog


-- 
Dmitry
