Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FF94D8656
	for <lists+linux-input@lfdr.de>; Mon, 14 Mar 2022 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbiCNOCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Mar 2022 10:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbiCNOCf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Mar 2022 10:02:35 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780DC201B9;
        Mon, 14 Mar 2022 07:01:25 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ECkW8r017671;
        Mon, 14 Mar 2022 14:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1pXLfT/q8NmMVKtSQxGgtr+ThAxh5WEvygv0ROrDltw=;
 b=JmRtImxOZjmTEtnuGl31H44J8cLRKxqVGNZ6oqJxYtr9qoGss2OcaCUoplZlP/mAkD3X
 Kowjzz/TrMWWpkJDTklo3LNCLkHh+T7SdVmW6aLO+nn0WBFLM/I97U/U2Z7Sha4SU32/
 brvokK8V2EB5qV0aNRtPr9HSwVqqHuWmEFj92ORXIeHsVBAO+7hHhkRYtf1eCuWrH/40
 CiuvLqi4KFAY4MZRsuPHpd3KEKZz8SJJfOCC5nlTVLpfcDqp/lOfbPmYbOyIDjXyXG+n
 TDqKp822FbbJ/djTMY180tPbAKy7gdIsLwkeQvHBX7zaVTMwRZP5zLPjzcOO7ic8DfRz Cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3et60rg8ks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Mar 2022 14:01:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EE0gIN105713;
        Mon, 14 Mar 2022 14:01:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        by userp3030.oracle.com with ESMTP id 3et65nsxgc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Mar 2022 14:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEH8BONLHzgfgn+FvrPP00dm50Gwlf5CkgJsWqbPUJRh/0fyUyUYGuza69dfqzro7KPbS4kPp/Bhqp0aQfS+FUiT5xXM3TZSKkuic0GPVblErHsRS+O4Z12pq2jE6F6Ypw12AL+54ndQ5fOTZIWKuT6XOTEdUzOgkPspJKyXL2ezfVhRmxPxUAYoaDsd3I7gI6fqE8fS4/jbTSS5DrKJUkIktdeJYvyWeMgiPlJCsvWKLTMXN4yD7dF4hpfdD6e/wo4NrgV0wUZ08UgzLP0H54rSJqUtulAl8ksRxBmb6kj4PYudh7Sa3s/OCSBx7yeb925Mg+hS2vxmQVL7yR/F4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pXLfT/q8NmMVKtSQxGgtr+ThAxh5WEvygv0ROrDltw=;
 b=Fk8DSYH+mtl5cLv1OoN6eO3SA7eNLvLWThdgKmnr0pSCRP1lAj4Ki/+lafxmevQFs+SlDciviseVJYU877QK8FX+h19d/yIyiBJbt5R49FXIHA4n6dP9GjdG9stztLSw/lb0UE/p6OqKTQgScNOM07JN+636XO1Gs/tBpg4TE0ItUJDZgbIBnBaqGybpZAL4CqXfLKqwTDLOiW0/mBdK6h8KVQDnQMncVSdPHyq1HicQ/7jss3Y+S2DXvFP5v2PxGYAMyDeQKMcZegWrw5tRD8s4FD6YY4B0LDuOtU5gZNOOjWKEK/ZpOAFH/LhsTHPZUr2Z3jVcmcPqZnN64Mu6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pXLfT/q8NmMVKtSQxGgtr+ThAxh5WEvygv0ROrDltw=;
 b=ttC3+t/442kU1xKte1DUwiUTydD0I9mizZnLsfxYXV4s+Xe+1TGS1TBJ7wif6YSQpBNv9D4XOYg++cJM6hK1qvnNQ2y4F1Z3ni95a6nXrq1nsHpyYcar2cBWNiZWq/uCA0Mh57/s1IYEiqRS6x0sj3tRSzMy/nbihrSgO1fhwOU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2234.namprd10.prod.outlook.com
 (2603:10b6:4:2c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 14:00:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5061.022; Mon, 14 Mar 2022
 14:00:49 +0000
Date:   Mon, 14 Mar 2022 17:00:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "fengping.yu" <fengping.yu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: mt6779-keypad - fix signedness bug in probe
Message-ID: <20220314140038.GA30883@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0094.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328396a3-3272-4df9-da75-08da05c30b64
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB22341177E93D2E5685CE70338E0F9@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZP06zTsWMdYBX5rnjURlv/eIHa8ZNvyy+FYtRsSlQlEcVY+c5oOOolpx34EhpcSqKLslI/xWqit3ICrgZmcs/im5+x4oUJJ994/slL3hCteFFu3zLWqPW3o1CanizqtnZoLvYySWXHiRDWDuc2lbBPoADsfnsiENdfBkX1vnfqjoAJRn9p7Tm9z7f36KrmRptXB456UNjLK/N98Y/IcqELib9WuFDvMVdgKg/W3zTNRJxmdoQ0YE00WXq40Ti2Zrh1NFCk1NLkCfXJE4q4SHjtxN4ULRTXAwnY9M8sjvnjzJ99li6lgyTl4b7MQ+u70AerAq5mQjRlAgW2MUP6ylSwlF6v2+YthkYBlJCJD18jd2N+wDQ1FNlRZXLc1zxuPXxLkQ37ZM2b+ihFiOg0heH5kLWnlQPcdAvS7Of44T3zZcx5DoR5osK7MokrpSM7zwChjcdZVDbrYvvOODLR+HLDuDycNKn6J8fgN8noJl9BmqC3NLsctGmJjNx2HvEq3ZxYZ491Eoh7hYa4cJDrpJN3E6t89BAGFGYw53JUZUGMdSrh+gbbbazK2LKQ2uh1X37ruq7YDkemNy7cslYErWp4bDmU/CsKjF70V3Zz5iLy7dnyXVoPF/n/7jxs3B96HEXp0ZU5GES03XSUGjRs0gPB18/atEs3nt55EpWsbDKaxkopOryvZwVmsObH7jlGyjGJ2UxHYe2i9Gy6Kv+dCGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(316002)(4326008)(83380400001)(66476007)(8676002)(66556008)(9686003)(6512007)(6506007)(6666004)(52116002)(110136005)(86362001)(54906003)(2906002)(38350700002)(38100700002)(6486002)(66946007)(33716001)(508600001)(186003)(26005)(1076003)(8936002)(5660300002)(44832011)(4744005)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P1YdDlLovO04Vb7Mgs8Es3f+ZhmLAh2h1BeGTGPfFpy1heT69Rr599RclCUT?=
 =?us-ascii?Q?DBVtuzrs+92u1KeG2kvamVROENyxxHgNPS11jkDYw3UX+q7grm3ula8gCzPn?=
 =?us-ascii?Q?gqGTmbRumD1S9b9LdYtY0zT+Qghv9aUL9SAlqi6OAmjsJZCMJPVYKoKbRai0?=
 =?us-ascii?Q?Hpi2O1RrR4oOwkgkIoBmzhIwFahagp1H6u9UyQgh5ezKFbayS0irIcvtYE5d?=
 =?us-ascii?Q?aJVtPvP/prLj9fhUmRALFh9UZp4nZnpCJKC1dGX2PDzkBx9rKSnouuiM9AfJ?=
 =?us-ascii?Q?9OYFgIKO1rOQV6/I3n1zPp5QBa9/IAc5U1JYxOp4sZ8oSGRdCtlf9RfUR+Gk?=
 =?us-ascii?Q?JQFXeqBLt7ex7w30NANfPLr7HturS6OFuuRp3oPt5HLGqshLlpdNedKn3hMG?=
 =?us-ascii?Q?hRIDd6ytcHEJCGwkWrYHIJhKTkYKGc+odrisrCRs32CGVbMXC943ohqhGnSH?=
 =?us-ascii?Q?NpxUhsbq/mCw1u5Gc14yhdrST5kmwBE2xvL0AWAhfPK+sPiBJFWK8SjUgzah?=
 =?us-ascii?Q?FUww/t7XoAWuXQyOozhCoC66ha+tjOdlsgkwhO12M10UqdFtsNAqhCahO8Cv?=
 =?us-ascii?Q?g3qAuqC+G+bPb8ucmH70kMvrEQmp9c+X9ZQJ5icSAIrriVUqHiw/H5xg/8+u?=
 =?us-ascii?Q?azNJXPwpblO2WFQGp1YAVpafM3SHDhpRu54jnnSMxXKft8/oAiJ7D8zv3BIr?=
 =?us-ascii?Q?FHIdxun+3EaS0xwVHoLPVyBbjqOOR2V151TnHNht6RY6guyMNc5cHJ1l408J?=
 =?us-ascii?Q?+Hzcc7jp75iNaupHFaBK2FI4IXc3yxULRY7PbVPJpNKviGUlbBwHqIeY+7Qh?=
 =?us-ascii?Q?J3DgWMDzzrDDCQLaQqt9lM5espxNLVSCgLditccfdX5nMIzE9wwNY7O1YZIT?=
 =?us-ascii?Q?8J+yLI4XsNFQzdlyC7gTAyn6PvPI9TIWc9f9NaYKpircYu+KPRCQFmgMZGqe?=
 =?us-ascii?Q?8bM/zHFnz8qV8VL/QZQMdc74Qun38aQB8pIL8gxCSGO8HumkoyhphLSTGJCw?=
 =?us-ascii?Q?dXPzsQq3eJyayaprmJQT/QqX1xzY3G7H0v40gFEczXMwi1ug/BnGDR+tdmJf?=
 =?us-ascii?Q?ek+ckVVSDCOVfggEdpbqWTMf4evl/YAKbpm9io07TgSQMrsaxpMD01YwexTG?=
 =?us-ascii?Q?U3TbLZtTbpLXU7+MyOOpu+u2f8bidfJYxQqw1E+ouH+p8syhSZJ49as9hRnz?=
 =?us-ascii?Q?OCwvLlt8HdU6Mj4KpmCbZ0KjXSXtBNQk8tvv0Y1GtFUIEwjogdV0q/BEMGxk?=
 =?us-ascii?Q?qqHPdiBOhKC3FJCpXmUpks/4H8WUp13KAn6zNsQb9Il5VfZcgnOr7+TMf1y6?=
 =?us-ascii?Q?0erzzIS/SfuzXqeyKj5OPdtyUFJDEeqAEAfbuCpIpLnTa2MOR46zbKG4Vdcv?=
 =?us-ascii?Q?/xti15M/QcNZpKqhYdPnaFz2F2tn9DRI8r9e4+hiRH7stCA+LZMVlYx/pP7k?=
 =?us-ascii?Q?8DPlMV37YC5BIonAMoqO6PqHNG9RhAUnNVwN5pMe5gidrine6jrPDQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328396a3-3272-4df9-da75-08da05c30b64
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 14:00:49.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3uiiaAC3u1/5fnC6g8pLnVL3vhoJ5rBN9b2lgyDecARrYl2jU7wJuWUkPxiaS5TjcBixXg26HlODgiNr4B3Z7jMsgM0fr4H18tq891UKkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10285 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140089
X-Proofpoint-ORIG-GUID: b-8J1XkAt6sPh7aWBs8RIH0et6Tkyrza
X-Proofpoint-GUID: b-8J1XkAt6sPh7aWBs8RIH0et6Tkyrza
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The "irq" variable needs to be signed for the error handling to work.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 5ff23250ed37..abd7e346203d 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -91,10 +91,10 @@ static void mt6779_keypad_clk_disable(void *data)
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
-	unsigned int irq;
 	u32 debounce;
 	bool wakeup;
 	int error;
+	int irq;
 
 	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad)
-- 
2.20.1

