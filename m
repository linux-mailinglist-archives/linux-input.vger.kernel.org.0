Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38BF56659
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 12:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfFZKMY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 06:12:24 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42878 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZKMY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 06:12:24 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QA8fib178790;
        Wed, 26 Jun 2019 10:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Z0zCG0SMZmwKMXv+ACtzLqdeYvRM/SfClPkGSJ8PA8s=;
 b=X9pLfqj9VC75vmOc5mWBekP9VDo93nVKSUlAgt7fhcYSVzXGFp3jUG7GErQ/1qwgYkNS
 Gm1fN51sWKwivKmimFkSC3Qm34zuK+lvWEAyCUIfWdLyAyJfuumsh/4fBretd9HagaRT
 v85whqDH5eMtlF/XLwWaHojXyd8VPzSXPBHirceMBzyZm9ZNkWDHDM/ew1/IfPEMLWHI
 zSO271mvt+TypT3He2h3v7AI5acge3CwLZPOeoboa0Hw9KgZvNs7VjmAZoA9IORWUm+G
 rmIH5FiHw71jZq0lpepymfH1Vy+mhS8gH6xCsLRJCX7NpPaFysP7FouPLTXYk85kESP+ eA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2t9c9pscvj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Jun 2019 10:10:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QAAlm6045874;
        Wed, 26 Jun 2019 10:10:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2t9p6upt55-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Jun 2019 10:10:48 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5QAAmgU005403;
        Wed, 26 Jun 2019 10:10:48 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 26 Jun 2019 03:10:47 -0700
Date:   Wed, 26 Jun 2019 13:10:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] intel-ish-hid: Fix a use after free in load_fw_from_host()
Message-ID: <20190626101041.GE3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906260122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260122
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have to print the filename first before we can kfree it.

Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 22ba21457035..aa2dbed30fc3 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -816,9 +816,9 @@ static int load_fw_from_host(struct ishtp_cl_data *client_data)
 		goto end_err_fw_release;
 
 	release_firmware(fw);
-	kfree(filename);
 	dev_info(cl_data_to_dev(client_data), "ISH firmware %s loaded\n",
 		 filename);
+	kfree(filename);
 	return 0;
 
 end_err_fw_release:
-- 
2.20.1

