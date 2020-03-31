Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3C6199413
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbgCaKwK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:10 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730469AbgCaKwJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:09 -0400
IronPort-SDR: 4mGRzcEZOm8xNMwDRwxPjTAED39H71lwAeJ+6O+P92X7FfQVegyLea6r1i1aPm3hJ7fdsjCEEJ
 53UVZ3oP0dXyPQZnTcoxcG9CsZvHNUqpewQNd71NItWxCZ1fCdxcxh3zzjiaEQ6D//y862FLze
 R38qAm9LEskGhn9Lu6Uje2pYFBAxSoC1ki3eXCetf1hRBxCmuu0U0mauE2ZG21fUYdFJtKksue
 nEI5G5HskEp4nqa3odn6UulG1afTJSt15A6zLMbUnZpJovIgOk7oclgdNUcDaE/eVHMZhmPCJ5
 6cw=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330762"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:08 -0800
IronPort-SDR: GeUxREHjh+vkjVdH6iqbVKqfScfPGqbfSZNmIXkCSAwfQGuCm36cqnlhKdfquUsAAwxsxbatP9
 7Day4dmE2Lo/fhI1jorIut6LTBlF1PrJCeifiwL7oi2O+zD5fFbCNIGMu+t/vQZghfjRYgL6Wl
 wxZNdr/NIsFzp4dWC60ZC1lBLD8FCuwP+b1YF3XQMP7xa1USk2kOYppKTE+WDNFtyPT6Kzd4Q8
 TlzVnoJ2nrRWIQTYsH++GCl8wGxo4XJy6hyuXpG72gZ9IXl6ujsQB4LclNWhkZMyIzgXqfSOw3
 2qA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 19/55] Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
Date:   Tue, 31 Mar 2020 03:50:15 -0700
Message-ID: <20200331105051.58896-20-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename mxt_update_fw_store to update_fw_store, to address checkpatch
warning.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index cec823de4096..720574417219 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3366,9 +3366,9 @@ static int mxt_update_file_name(struct device *dev, char **file_name,
 	return 0;
 }
 
-static ssize_t mxt_update_fw_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t update_fw_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	int error;
@@ -3392,7 +3392,7 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(update_fw, 0200, NULL, mxt_update_fw_store);
+static DEVICE_ATTR_WO(update_fw);
 
 static struct attribute *mxt_fw_attrs[] = {
 	&dev_attr_update_fw.attr,
-- 
2.17.1

