Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C185D0FC
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 15:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfGBNux (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 09:50:53 -0400
Received: from mx0a-00176a03.pphosted.com ([67.231.149.52]:19054 "EHLO
        mx0a-00176a03.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbfGBNux (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Jul 2019 09:50:53 -0400
X-Greylist: delayed 7640 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Jul 2019 09:50:53 EDT
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
        by m0048274.ppops.net-00176a03. (8.16.0.27/8.16.0.27) with SMTP id x62BdQ40017898
        for <linux-input@vger.kernel.org>; Tue, 2 Jul 2019 07:43:32 -0400
From:   Ian Ray <ian.ray@ge.com>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org
Cc:     ian.ray@ge.com
Subject: [PATCH 1/1] Input: atmel_mxt_ts - fix leak in mxt_update_cfg()
Date:   Tue,  2 Jul 2019 14:43:12 +0300
Message-Id: <20190702114312.97197-1-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020135
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix leak (whose magnitude is the configuration file size) when the CRCs
match in mxt_update_cfg().

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 19378f2..89908fd 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1521,7 +1521,8 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 		} else if (config_crc == data->config_crc) {
 			dev_dbg(dev, "Config CRC 0x%06X: OK\n",
 				 data->config_crc);
-			return 0;
+			ret = 0;
+			goto release_raw;
 		} else {
 			dev_info(dev, "Config CRC 0x%06X: does not match file 0x%06X\n",
 				 data->config_crc, config_crc);
-- 
2.10.1

