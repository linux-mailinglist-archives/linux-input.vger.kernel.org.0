Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143D543D0B4
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243552AbhJ0S2E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:28:04 -0400
Received: from box.trvn.ru ([194.87.146.52]:58023 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243550AbhJ0S2D (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:28:03 -0400
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id CBB124150F;
        Wed, 27 Oct 2021 23:15:28 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635358529; bh=rUAe9+YBz4twayA7MsH/h9YlgfxtOEUtH7zYEx82scY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a1GJuXDncIPJ7q+at/DyvVxi0U8djYZMetdcAycIpZV5NWwUwfjAJWotIFlAhGuI1
         yalsgpYRSK5m+Q2cZpjrYCZhkyup/lnIjk646EpceuOSlRfpwwycX/NA+zrDe9KNcu
         yDFE96az3m4r4/1CYKQkkthtWfKaMW9b7KxqR2GNCu4HcaLFKg5G+7e3+/wUTlj5Q7
         HVm3jYiZrTLqwRyrIb81DZrxnfq5g8zcDxvhhmYD8jzp7ZCov5dsgGwPLqgCIaWYAY
         Zkb4bb1QeTnXfzSj2Kr0dDG9qhioL2A7+luJ8gXhj2JPu9blpphShGyQ+xSNSLlxLh
         eQeZwIHry27NA==
From:   Nikita Travkin <nikita@trvn.ru>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 4/6] input: touchscreen: zinitix: Add compatible for bt532
Date:   Wed, 27 Oct 2021 23:13:48 +0500
Message-Id: <20211027181350.91630-5-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Zinitix BT532 is another touch controller that seem to implement the
same interface as an already supported BT541. Add it to the driver.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/input/touchscreen/zinitix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index d4e06a88a883..c67ff8be0df1 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -571,6 +571,7 @@ static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix,bt532" },
 	{ .compatible = "zinitix,bt541" },
 	{ }
 };
-- 
2.30.2

