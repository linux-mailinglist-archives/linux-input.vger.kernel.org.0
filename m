Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480D1380AE5
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 15:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhENOBE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 10:01:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232103AbhENOBD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 10:01:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 793C3613E9;
        Fri, 14 May 2021 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621000792;
        bh=Ow2qpjN+bkVwWRQxi7G/HA/bPZRg73EV0cI+Qppnl1g=;
        h=From:To:Cc:Subject:Date:From;
        b=uVSWX0VdAgwE8oNHi7N4hUyTxIxHIEBmiX409MwQtsBRhSynnvCSa7SS9yc663Pin
         gvRpy2Pl1l9/1FETAhVWQqHuBsn4ksqPz4qAy73tc769g2FOmmSiVgFVRLCsDGImXM
         xMAvl1qUfYv1TdIzRX5z/+XBvwzUfjDLBeq/g1NbYbpsiO6g26Yo7te61I4O2IuD/n
         UYvjTaWGm+Empwkz2bGBBQ4twSebbk7ESa+71Ks0CmU60YhcS/PBLPj98m4Ww/BuHt
         QXNBbRM1GZh9TcFQ9NCanHVp3iJKrl398meP1DkEMJ2V8zh+0CREOGdJ+cnBi9Uq9S
         QPwP1q3MMxgVQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Julian Sax <jsbc@gmx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Coiby Xu <coiby.xu@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] HID: i2c-hid: fix format string mismatch
Date:   Fri, 14 May 2021 15:58:50 +0200
Message-Id: <20210514135901.2924982-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang doesn't like printing a 32-bit integer using %hX format string:

drivers/hid/i2c-hid/i2c-hid-core.c:994:18: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
                 client->name, hid->vendor, hid->product);
                               ^~~~~~~~~~~
drivers/hid/i2c-hid/i2c-hid-core.c:994:31: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
                 client->name, hid->vendor, hid->product);
                                            ^~~~~~~~~~~~

Use an explicit cast to truncate it to the low 16 bits instead.

Fixes: 9ee3e06610fd ("HID: i2c-hid: override HID descriptors for certain devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133989a5..f9d28ad17d9c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -990,8 +990,8 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
 	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
 
-	snprintf(hid->name, sizeof(hid->name), "%s %04hX:%04hX",
-		 client->name, hid->vendor, hid->product);
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
+		 client->name, (u16)hid->vendor, (u16)hid->product);
 	strlcpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
 
 	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
-- 
2.29.2

