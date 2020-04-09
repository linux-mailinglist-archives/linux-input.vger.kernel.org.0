Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7241A31CA
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 11:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDIJeG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 05:34:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55138 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDIJeG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 05:34:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id h2so3194505wmb.4;
        Thu, 09 Apr 2020 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Q+Y8y+xM8vAvx70ujvAzR4mi6uLfRgpj02F8stEfpIA=;
        b=ofMneNF5Y0aAD9253NDdrUw9Mge6LX6y60ilTfxLFZHKQdoCjmQ2N7ZJQHoGhhyCyf
         NRTI8H1syvnJCdM0lr8dWnZXMK+1GG1pTce74JM4dqgFCelwqBeZD34gi0DD6VAhwla1
         K7LiJG+IxuChBO6y5/NwWy24mJkHXw5Z38Z2y0HimI8yTxTyFbCDPpLBuBB/n8DC1Spd
         0qAWGXtu2mSC4+1jvrrqhlHAB1+ASiSYOCG7q+YJy4h1V0vHENgr5KkmaR26Gd+8uKqg
         MOM12l0mrWytNgMI2RiOYyFbinuJjeWk66VKevVXwJ3vinfLuJqQkj/D4s/MkjZvnZMw
         Pu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q+Y8y+xM8vAvx70ujvAzR4mi6uLfRgpj02F8stEfpIA=;
        b=KdNgosNnZVLi9APjSjHvpEXz0fM2jUmUR+eA69GsjSORCFFv4NzAuqyBDg9wPK8+11
         4TqFvO60RAKJd2X5oia++zukQWV3Z7xXrhXUrOwSG9ofBb11KUkyOei8GN9vlAJcK3JK
         SwWxxYDHUfVMHBeuRrEL2dfcuhcImApEC19cMv6FTOUG1GmCUmyG7xeqAAorT6LtL+v+
         1bNTBawy5DEM/oMui8j8E9VZ6wqewJXundSzYNa6yCRdE5aA+cdnQ/1GCDfRaPKm0141
         VNvL4LU67YHGA44/GQVbWowKxY06MSWtg6DDGXUJA2Onwf05Le9Ppm3mCxivvsD8tX9u
         LOgw==
X-Gm-Message-State: AGi0PuZmVDPd9OPP1V+jf3gkF971nHPTrpX2Kn3B02eEbhujIEeovfQh
        lKGg6mExtWRGyDRExCElTCo=
X-Google-Smtp-Source: APiQypKmYqD8YLDmepZyhhgWsPaAGtq8nWuP47xQWFlkBa278hJ29MRxmwYNHkqIpqqk3tgrP67MKQ==
X-Received: by 2002:a1c:5a41:: with SMTP id o62mr2048499wmb.43.1586424844697;
        Thu, 09 Apr 2020 02:34:04 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id y7sm3150319wmb.43.2020.04.09.02.34.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:34:03 -0700 (PDT)
From:   Oliver Graute <oliver.graute@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     oliver.graute@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: edt-ft5x06 - added case for EDT EP0110M09
Date:   Thu,  9 Apr 2020 11:21:52 +0200
Message-Id: <1586424116-25739-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Oliver Graute <oliver.graute@kococonnector.com>

Add Support for EP011M09 Firmware

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d2587724c52a..13665389d28c 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -879,6 +879,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		 * the identification registers.
 		 */
 		switch (rdbuf[0]) {
+		case 0x11:   /* EDT EP0110M09 */
 		case 0x35:   /* EDT EP0350M09 */
 		case 0x43:   /* EDT EP0430M09 */
 		case 0x50:   /* EDT EP0500M09 */
-- 
2.17.1

