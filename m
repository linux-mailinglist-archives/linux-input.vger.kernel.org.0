Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82541BCEAE
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 23:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgD1Vap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 17:30:45 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38239 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgD1Vap (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 17:30:45 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1McHM2-1it7ey3lam-00ciSB; Tue, 28 Apr 2020 23:30:37 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rishi Gupta <gupt21@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jkosina@suse.cz>,
        Bastien Nocera <bnocera@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: mcp2221: add gpiolib dependency
Date:   Tue, 28 Apr 2020 23:30:17 +0200
Message-Id: <20200428213035.3108649-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7r62qOoVCPk7gtPEoS7ZCMnWkY3NDUcoFia+LnBLDsJhyS0znYT
 8l0MoyYXUWSQ1KXGyDmM+4QXQ2jKT9uDUl4JyDjT1lUR5yWRobTJ30NqcPt8rrtM5Getybt
 c/gYzc7hs54mFqvfbvGu2tjOMKuQS4EisdokSjBu1B8GGk9zuO7tDOpyXQAgQK1ht/9gybx
 KwAA2oetBf7QpSDnxHGvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZuNYRQiWMEE=:mhP4d/Qfn7PrwxWDgFNNAz
 aupxDknp6gt1/Ru2AyMiOnsN11+IMPN5JUz0sE5uDFuc0T7P2MgW+eaRjaUuEukRoni9WcvFz
 IS6a6CBMZ+FPIxClGfY5linu4XdOwhkg4DRV4mf66gX2fDOCDlPXQsxq+/aSH2uWei1TtDpre
 NgwOCUtN7qL0nAafixszMd/UnJo+v3vL+FwpoiM13ZvGqkuRdC0UgALgip7Kwz3A+crFwXWQy
 P/cEkHwD0y3/Bu20rala7TfH3o5anT8HYWv60pP5B+nzapyRfCjNpgPJr0lVWWOyNsoDJssm2
 7eP2clJDq1FG8RbvYZlrep9zBZrWG+EQmnt2JZALtFPc04GBHhY6dCnK7yBHSYAUWh1NN3Hex
 jBVyLeBOMa4SAl/ALuhSrXDRxcDc9EOOxmQlk2r9zNoOVTlEWDlGoW6397U9qkNYNGh4TYOqj
 wheDojTdiWNZxRhxh3An+a+3Kf0za5hAYIbxdSLnpdHqxzM+Bkk8T0R4Q6bl1deMlb/VGSzM3
 rwGR2VfHaOxd3GJEkKiOXpBQvv3+lLuCIA3y4Nc5KlDp9XkiGwZdjGZ7dScA/7FwmiS1ajnSY
 /MLWXsxC013uM0T87xvxV/gW7ToDIvwapRnpebPyYvdVopqhoDp7RJpH9+s5O7SEDXO57Y/Ht
 jJ6LsED0LT9ijiHXQa5wOOkcXENsxnkc37i2wlpQdDS7rbl6jkPN4IgKp4X22+Le+k38yxcny
 0j0+Bn+ZSud5bMbzaLy+Bb8y3YVqFrj60ogGG5jOXJhCLIZnQJjcZWgpD9RFA5xRM2GyKd5rf
 lf17fCNghFntPypm++wYaW1bkrt0YgiIp8xcDvj1eSy6gDJ7wo=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Without gpiolib, this driver fails to link:

arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp2221_probe':
hid-mcp2221.c:(.text+0x1b0): undefined reference to `devm_gpiochip_add_data'
arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp_gpio_get':
hid-mcp2221.c:(.text+0x30c): undefined reference to `gpiochip_get_data'

Fixes: 328de1c519c5 ("HID: mcp2221: add GPIO functionality support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 008bf44bc2c3..d54e7ae80de5 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1155,6 +1155,7 @@ config HID_ALPS
 config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
+	depends on GPIOLIB
 	---help---
 	Provides I2C and SMBUS host adapter functionality over USB-HID
 	through MCP2221 device.
-- 
2.26.0

