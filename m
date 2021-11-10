Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AC744BCA5
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 09:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhKJIPO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 03:15:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63152 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229756AbhKJIPO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 03:15:14 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA8BLUC017892;
        Wed, 10 Nov 2021 08:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=jCysZuy4Ml3vIvQqAiH39i8HsTZhD6AdaYviRFAkHFM=;
 b=riN9wZUbOzmaZzl6Bz+GRAU9tYIPvhf6SQvMMhb3eMW00E71aHGQk4RDGFULUz8vK8TA
 Ap8OI1DF+QA/iY1xCAk9QLqQxdsD91ictV8yTMs15+XH8fIHROAum0z7plC9AlrdxXWK
 0/4HCbBUpH8VkZDvhGnA397BPaX48Qe3rnEPamAmgJrzus41CxYXhQOuVtZCHmcsMlXV
 EeAW2I9g6coDYjRuWOJhtQN5qb+dctq53RNklkINQC4nDAVlyvHFHtqL2hcSY6dbxzbk
 rzXNUqzhYyy/jVbR+hvmEM3h1YYQTM9twgtJpCr9cWuY1o76zhHVpsRwE+1LyaPlc7da yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c7yq7b5ug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Nov 2021 08:12:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AA8BP4l128444;
        Wed, 10 Nov 2021 08:12:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by userp3030.oracle.com with ESMTP id 3c842bw37u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Nov 2021 08:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PA8e3myzHV4Esin32mg6C/SNhRciXv/pWLtrJOE4ocA2pd/n3yN7nzXw6yhkzRYx9MlC2L8/1hof6sCIH85WJlr8R3b4oGFi6wLUWjxSbjR57dNHJS0DRBNZUgh+l4IZTaqzwcVbYDxaml9pQgOgK6k/c+GnVrSD5hTNhXfi7u6rbEl+J7RdpEj7TW0TSJt9KOJgEdXgZvna/q96BAo6i3gqVF0k/EYdCTZCn1XE9T4BWEre5nfwlfTfSykDxLb3tpVaDXLw7gnvy6zmpqA6Mxwb53oO5scKrr69IuaPuP16B5KDJqArqnOUBMa4TiMlw9zK0kM8/NW1rqaSiRUF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCysZuy4Ml3vIvQqAiH39i8HsTZhD6AdaYviRFAkHFM=;
 b=jarn73go1wx200Z7EDW/poi8v+HyJ0K6SHm5IanHePsMceQ79zHwPC2LXXbIEsTGR8wdgXW0/6y8JCwVUncErr3enn9UQ+t6XKEdmfwa5KT9ho7N94bpUsjrB1me+K8uXvwmiljw/8qiRW5YD1fBrt2sLGPT+oBPTxmYpEa5mNISMYkgApAR5UBLGv30e/+rsymx9bFbYwSL0A5ZG32om+rBPz9BWkrzumUdkow7Ws+PXYAkgX/GLwOfEbhswNstFwPOgnxjosL0D6oAS5BiTujOk9T0H1PSfie+tWo/wPmtOmMHdJwD9qG7m80fuVjWhF9+Rz32/SYfk50k8kImJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCysZuy4Ml3vIvQqAiH39i8HsTZhD6AdaYviRFAkHFM=;
 b=hZjelQY57zXR70LUABPy+bN3WeqD2AxnQdCU0P5W0J+QzFcpBT35Ma4wuUcRuXtapWA4zupUGeLDC/5sQcgwMFZOXDi5j9mEfvYDJaYCCxuUMoJ7eHQLE9HW0t2uGEoJqsTprtOw++7WC1OhIx0A8rhYgNN1uobKLaGFskrtUIc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1727.namprd10.prod.outlook.com
 (2603:10b6:301:8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 08:12:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 08:12:18 +0000
Date:   Wed, 10 Nov 2021 11:12:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: nintendo: unlock on error in joycon_leds_create()
Message-ID: <20211110081208.GH5176@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0047.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0047.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Wed, 10 Nov 2021 08:12:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08f1a9e-b712-4677-1d40-08d9a421d047
X-MS-TrafficTypeDiagnostic: MWHPR10MB1727:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1727B5D5D2C4FA7C8579C0728E939@MWHPR10MB1727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fG5swplqFMP8bJN0ekDNacIX0zMg76JTu8kKV5PXR351skrhCDRLX8gytFlxFmB+7e+jmw+TxgtR7Iei6EqSuD3pmlakfakLB0xHoSmoMZLRyoYyV3EM8hmti+MaBWSLFT6rKlLGAaVsd/w4NRWKl2jE6Vg45UDm4WERhRW7b2rJTOTpk4Gqn8OGoeoxP3ctsrduZzZGbzEoGlL0ihNX/n6ZNKgwyePi+cGGpi2iwxXjHXHAyFd0BJMs7o0BPQyz8VL9qdyoRDFfJJuqrUE7pNJrIX+xWDhqwQwwNWvd2XAfGYrxHkb/+m8X0+ur5UmR0SHkAWIp5FxcYe6s+yuOlcGmjReeI12f3T2S98/hh4SoSWTODB+sYOi01yLgUHCcuOLB7qRER/gnFYSV6qbg5lOEzcMnHeNojpAcJN6+GRKoKl5dpzXbuGioq2OxyDPv15eilgpdPa8ZrH6Exy0SJdVRdCGrQRL63om0DN1sqNGAIx+SKK4mTvXcCcRbpdWde49Td/uTOYyFWenV1Xo3wWV3rLPYf/yxIOM5ExRSgBLSyhfxFW58QoaFA8RjchGHXugYxyF8zM+MgWNxbZKgt5gYfpmZOZgte6D0jzH6tcxB6Sk8t7yDuAYdn89VW9Uqgwe+8CErH1kXUmOLBHNBm7Wzl9CJ/7SX19tjvIGXenYQZWc+SDyI6/l4qb3z0zqCLLyz8ssfmPfXrrP+ZC5XeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(8936002)(26005)(6496006)(66946007)(52116002)(5660300002)(66476007)(55016002)(8676002)(54906003)(9686003)(6666004)(1076003)(186003)(44832011)(6916009)(33656002)(316002)(86362001)(38100700002)(38350700002)(508600001)(956004)(4744005)(4326008)(33716001)(2906002)(66556008)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vHdXN09jWCGbzEZ76s5TI82VpqHrFOWW01GqCfckoRuQTiqExl3EdjedMZX+?=
 =?us-ascii?Q?JNhRdqjfz0iYpQLxpPjVsCYYyMqU/59fO45e+1HwxfUU8AC4O4eE4vwxvZAM?=
 =?us-ascii?Q?l0QzdrZICEA0MPg0OEM44mGYg5fIy/hBKIbFiRfCALUtbiv0wQaKLN+Ej6Y5?=
 =?us-ascii?Q?gSQsRMyhzFNgVzqfq9MVgQSnXN0Y238aJTA8VFi0RRzW4YBtXAeLE5wfP1lO?=
 =?us-ascii?Q?OWVF581svwB4tJO05eHqXnsGa+zL8W7TMMwuGwL2Qf+mcbtrjBG9gLo+si8C?=
 =?us-ascii?Q?Ds7x9Mk5mXghMI7rfbZqk9DxcKi3Rs3oHu/n5rnsHmD+/rIpx/hf4OxefVIs?=
 =?us-ascii?Q?aheWIueWls+yT10wct/MDugROTUKsbJesl2/Ha2eTkXIpDwp2L756iBL/We0?=
 =?us-ascii?Q?BbiPSAhs4y9BemumCvwNBVKTNJ9ElZprD1+AjfgNMstAABHvTfN/dTfO0JzV?=
 =?us-ascii?Q?0kBqE/RZjEKKVDlLkxpz8K82ofk++YDJwP8iUjDCR4cGxehhsinPx8kOOmTP?=
 =?us-ascii?Q?w+whCa/aHQchlB5xx0EK5f9iChe/CruhPiT20In2AqEyLT3EAwGNN9ehX1BG?=
 =?us-ascii?Q?QU2thPy0EyLyyMDOb8w8pSMrBmVMv4rAnZb6FlooxQgf2wXN89vltyiseh5I?=
 =?us-ascii?Q?lDZDEV3NZO18bcbVwwov2jGAuRQgPOgvFzsAfV7EVU3qKa3voCQNP41Tc4BD?=
 =?us-ascii?Q?lGlOdd66O7BkWuDhS3lBKqS9cQGrYJe4TNvXqqj1LGDf7vktdlmNzlHiGWi8?=
 =?us-ascii?Q?ApEwD2J1wvrTpXZDWni+RgxN/zTuqNLTtFp++lyyQEBYAYPSkNm9j5bGfdVP?=
 =?us-ascii?Q?MoppfjL1/SodLYvy8czXqWsdJMQaH0nPz/+lyDHgFEqTmC/WkGpIGyFwS3GX?=
 =?us-ascii?Q?RTOTZ7nrckfZ6veeI/0C1UeRe4R6bEoIutJ/kcurLKIH/RAacM7FFBAk+F8R?=
 =?us-ascii?Q?wfkB6OmwKwbxvaLLXgD0SUMlTcDASJIT99wKHaMAJ9QLTc3HkrURDnR80j/E?=
 =?us-ascii?Q?EIV8pvI/0xCJbG2Bc/Z6oIxDrnfsw7dzyZnuUuKC4xYrqICkRl8/JJb3X4Xl?=
 =?us-ascii?Q?kW7pRfc8Z5c5vT+Ek/B3rRtkUZ4oe51AYtV1/BvbzVTkioSsLNiiCYmkEfaH?=
 =?us-ascii?Q?WINqpl47ZTM7NT10zqiGWUgEL0GSWIYkkl20MxG5oLZkAlk3m7FKoQcBh3Kx?=
 =?us-ascii?Q?7iQrWoNe7vZ1SjWEIXnULUc4KJnVuNOI4NpyPrg4/TQK0e2mz/VsA6ZxUZ8R?=
 =?us-ascii?Q?MtDr4yjfk0VNjWnCbaU1rHQ++MHRz4lvT/Rjv21Ex/+FBzIvUtJMgIDaWkZr?=
 =?us-ascii?Q?yND/cAoGrYG/vZtFn8K1AADivThMdlRR+Wsc9oAJo84bYiIcRLJXL2v/wSZ7?=
 =?us-ascii?Q?r65BL/GxmLu4qyvIDO2p3Rsa1DjKjhfDAzcd0nMGPBepS+frR7GvEDK9F7Tm?=
 =?us-ascii?Q?SI/apcVzAMFNnoYbHAI2S8Df5FKUTRhe0sTLAc/4ovimMC2EqROtKj/gVjLN?=
 =?us-ascii?Q?8lPjcnmMfkNvXiTDPJW1zvbaatft5e1MPIlq4Qlmbwh/ouqjBusMlGPBNZUE?=
 =?us-ascii?Q?qN3q87LzNsOWBhE+dZRV8TPUhoKjhHyQaZoNR4gqIBc229Zm6l4RDthVOOwC?=
 =?us-ascii?Q?nvQzUqYP5Dmzr4TQ1CmZJj5TxJfyxJkaFs5yHyIBv0MoRa5KnuWS8f2bWrtq?=
 =?us-ascii?Q?dstiaczeBVo2mkwAlTW6gE1iTDg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08f1a9e-b712-4677-1d40-08d9a421d047
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 08:12:18.7331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tZ5yZPoC0i8dJY0iZe7Wcw6dthA4KGbnouofj7o19NR3F45SytWnCoy1ovTobHa3s9GR77C3DbRqDZa5XhojotezLzaTO7/RDWlm5S7VCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100044
X-Proofpoint-GUID: yD_UAwpEPhwSNY14ZBCAVzo3u5z11sgg
X-Proofpoint-ORIG-GUID: yD_UAwpEPhwSNY14ZBCAVzo3u5z11sgg
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These two error paths need to drop the lock before returning.

Fixes: c5e626769563 ("HID: nintendo: add player led support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-nintendo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index a1e0f6849875..7e1d1127493e 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1850,8 +1850,10 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 				      d_name,
 				      "green",
 				      joycon_player_led_names[i]);
-		if (!name)
+		if (!name) {
+			mutex_unlock(&joycon_input_num_mutex);
 			return -ENOMEM;
+		}
 
 		led = &ctlr->leds[i];
 		led->name = name;
@@ -1864,6 +1866,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
+			mutex_unlock(&joycon_input_num_mutex);
 			return ret;
 		}
 	}
-- 
2.20.1

