Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA731CA376
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgEHGAa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:30 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgEHGA3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:29 -0400
IronPort-SDR: I9emyzfXPy7l4IFiaDjwNNCJKZ9l9uX2Vr7sh9TziL2OYY4Cef9+chBqelS3oVl0SuO/hWNT+m
 59ieNsYrztuE6WPB2kBsssYedYaw7ym6Oe5cKK7TFEmlnsxgegypw5QERdLBmJM50Tyump1LAO
 kCHkxTw4leD0oHxVYb5TTQ5ZeDx81Jp9cU4+GVDjkC0DH8F4ytguCpoLHGBKJbbQg9paVO0gcv
 Y+N9i7XHqLVTKp69tEIaMCtGd+fV1FK60V45jrTchnB12VuZju4m5Lu89jnhV6/gBb83tViYwo
 UKk=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670190"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:27 -0800
IronPort-SDR: +yaNTrnZLMEk0EKHupJzgNyBN8O8vrAQCH2LeoUEj/NhFFbYFuPGqWcUXfvWz047zp48nNGOcd
 ZtkRXtT5/eEH8Tc1HbqG4g6NQxblzlUVeqDfFL24W3d/48O5qedFZIWUu58pmd3NbqXmVPu6gO
 l/RU+Bdw1wyiVqk8KMTliJ7VDWcBCUhWIODN8ITXuM/O/t1qFHtjw/wb1MeR8QHHNLWhGr+Q5x
 1vwMo/ublQYaOjXEz6DrjV1abGlfpwJQbNmWi9lNCfFk6TX25J0q9c/zRTch4ZqMzAb1VukRoK
 5Mw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 55/56] input: atmel_mxt_ts: don't disable IRQ before remove of mxt_fw_attr_group
Date:   Thu, 7 May 2020 22:56:55 -0700
Message-ID: <20200508055656.96389-56-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is issue when firmware is being updated, but mxt_remove()
is called to remove driver, because at very beginning IRQ is disabled
so that firmware can't proceed, thus cause driver to hang.

This patch by move disable_irq() after remove of mxt_fw_attr_group in
mxt_remove() to address this issue.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index e75a7e5b0c59..b518c316757d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4514,8 +4514,8 @@ static int mxt_remove(struct i2c_client *client)
 {
 	struct mxt_data *data = i2c_get_clientdata(client);
 
-	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	disable_irq(data->irq);
 	if (data->reset_gpio) {
 		sysfs_remove_link(&client->dev.kobj, "reset");
 		gpiod_unexport(data->reset_gpio);
-- 
2.17.1

