Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7724363A60
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2019 20:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfGISAd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 14:00:33 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44418 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbfGISAc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jul 2019 14:00:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so7394611plr.11
        for <linux-input@vger.kernel.org>; Tue, 09 Jul 2019 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIm1hPdGKhQmW9ErbwFuKhHNbmgcrYySHT3l4GVOH6c=;
        b=vSYNGu27hbFUbPkKzkmaX8CVuWVjLxzg3Or8kFkrstXu4gbnhVmH3N371zBH5lRaj7
         HXJupA9bVnLjJXu/9teZuuFJuDzrq7UC8SOENweH+4XSMMzTvdsKapJeUXUsPHTYrT+y
         F5gWpkYp8FixFjs0ZrK+kTJxpEfwLvq8VTkojG/9z8j+BJhBOjpycgVdd3WGyTICiUQi
         p3Qj/7BrV8fMlJw/iPRjnFVVBkPyhFbPW9IL6hWjvWk+1Zxcpsbb06mWGxeXVG5dptnu
         cUjsQ0Q5/c4/bK9xjUUd0htzo6sHX/ab4iOFumViqJr0kDQ4FzcQA77Tr0ghmOH7MxYQ
         /2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIm1hPdGKhQmW9ErbwFuKhHNbmgcrYySHT3l4GVOH6c=;
        b=mwpWLEguTOOmN/ZvEGUGq2GmUnVtoF/WdY4zDScm6RWJg2IEls4BGOxytKxYKTPlqr
         Tbdwg5Z53EKZ+ZB6cv693cICQYnd1kx4MiZHlrGiYmDC3OwPQ/exf6XPM89uu9h1N6NM
         WYx7EKlO074bf2VjSkaNYxFTPy+XJGem9URm2UzOYsV+9tJStaiwl76LoZEuGkvu0/Oj
         03LLY+o/zfg4bGckyJM17tHlVW/+Ib43uw0Z5Sm8QBqMHeTct38LEG5E/vbuljEiMXGH
         4nwYMgU+z8ywMYc5LfIsyouj9Si2Pm+yM9MUZtAkRhV1By6HpmBLclfMRQso44oSrrzB
         gsyw==
X-Gm-Message-State: APjAAAVre8ZwOibkxxQj3hdayrkOmtFdQ2YgHirCQPgwEyv2b9tF/xyK
        lu644cAdwT2HXyVox1VCsBM=
X-Google-Smtp-Source: APXvYqxXpHfvlVzg5Zzf4I3fBMs0VkzZWs3fA4YyAdnXSG0FgM7Vq+GaeeCH2ulBoLKAG2o4wXvdLA==
X-Received: by 2002:a17:902:bc83:: with SMTP id bb3mr34405078plb.56.1562695232327;
        Tue, 09 Jul 2019 11:00:32 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id x8sm19094651pfa.46.2019.07.09.11.00.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:00:31 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     matthias.bgg@gmail.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] input: keyboard: mtk-pmic-keys: Add of_node_put() before return
Date:   Tue,  9 Jul 2019 23:30:19 +0530
Message-Id: <20190709180019.14339-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 746ff06eaf8d..62391d6c7da6 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -277,8 +277,10 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
 		keys->keys[index].irq = platform_get_irq(pdev, index);
-		if (keys->keys[index].irq < 0)
+		if (keys->keys[index].irq < 0) {
+			of_node_put(child);
 			return keys->keys[index].irq;
+		}
 
 		error = of_property_read_u32(child,
 			"linux,keycodes", &keys->keys[index].keycode);
@@ -286,6 +288,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			dev_err(keys->dev,
 				"failed to read key:%d linux,keycode property: %d\n",
 				index, error);
+			of_node_put(child);
 			return error;
 		}
 
@@ -293,8 +296,10 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			keys->keys[index].wakeup = true;
 
 		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
-		if (error)
+		if (error) {
+			of_node_put(child);
 			return error;
+		}
 
 		index++;
 	}
-- 
2.19.1

