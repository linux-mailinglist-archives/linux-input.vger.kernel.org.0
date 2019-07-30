Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDE17A9C1
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 15:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfG3NgZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 09:36:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3224 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726358AbfG3NgZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 09:36:25 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B571A76C86F14882582D;
        Tue, 30 Jul 2019 21:36:21 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 30 Jul 2019
 21:36:13 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <ronald@innovation.ch>, <dmitry.torokhov@gmail.com>,
        <nikolas@gnu.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2] Input: applespi - Fix build error
Date:   Tue, 30 Jul 2019 21:34:14 +0800
Message-ID: <20190730133414.49008-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190729031455.59400-1-yuehaibing@huawei.com>
References: <20190729031455.59400-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If CONFIG_KEYBOARD_APPLESPI=y but CONFIG_LEDS_CLASS=m
building fails:

drivers/input/keyboard/applespi.o: In function `applespi_probe':
applespi.c:(.text+0x1fcd): undefined reference to `devm_led_classdev_register_ext'

Add "depends on LEDS_CLASS" to the Konfig

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: use 'depends on LEDS_CLASS'
---
 drivers/input/keyboard/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index ebb19e2..90e8a7f 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -76,6 +76,7 @@ config KEYBOARD_APPLESPI
 	depends on ACPI && EFI
 	depends on SPI
 	depends on X86 || COMPILE_TEST
+	depends on LEDS_CLASS
 	select CRC16
 	help
 	  Say Y here if you are running Linux on any Apple MacBook8,1 or later,
-- 
2.7.4


