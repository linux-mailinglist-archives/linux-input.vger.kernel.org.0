Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044F44FE4F4
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 17:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344711AbiDLPnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 11:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357160AbiDLPm2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 11:42:28 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71F15C843;
        Tue, 12 Apr 2022 08:40:10 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CDb38O018415;
        Tue, 12 Apr 2022 15:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Z30QAp+7fp5X+NHQXpCS5AvmEEHClZ4fbtGuECc5aSg=;
 b=i3U8UoACH9VMaTumzfGUxevCoJNctWWKE7a1YePdiIJ/Q6KTq07WuL7gfruFXzfJXiJa
 qCxrr5jOslpHVRtZQQx7F7JMj4JpA01dCemP5gFO8BUdwWmhzh0GZChB0RKsVrbSRjg3
 izByiWPWMqPSgz4q2GsY22dZr5bv1jaI/WFCRwdgju7lof2nEXbt1uDmWM2GSm5Lu9AC
 /12DbH8uB5to35jO8Dctpj3C6yV1P+RJEcNaErwKFJpcGa6aSTQAIvoPOdUobM5Kr75T
 yKuEzj2QiblcgxOROq3WTtYK31ZdJeRpvF93rshqSdi56yNZwErWg/a0NKXNgHkTm3AW 6w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1f883-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 15:40:07 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23CFPYdv005102;
        Tue, 12 Apr 2022 15:40:06 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fb0k3deud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 15:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSsVg6FWLSZakxJV/CIx6TjQoYkvbM0GxuXsiIXSaIAMQZQUW988Bz/q8OJrs5vg9yK2LmE6HUM51KFichzVdUR+GXKE63u7b2kA+3U19vP2ppNC6g5EaKHgd3H1Ru6G7FYUVYsxQyucJAPoFY7Tfjtb0l3dHCNaqM1eLjxgb+QSzH6/cDLx8U3naVRactO5U8hTxFfRVWYOR7V1iMvWB86iFNglY/XWewJ+tbFKr/se1XFT/tIpuLI7dXPrH50cu7ZPfBN82/F2goltugi4Y+aItrJMmYHg6O3GGzizu112Gb7p63jCq+xpl204RQQlYWWx26EY/nzCnqcg94OHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z30QAp+7fp5X+NHQXpCS5AvmEEHClZ4fbtGuECc5aSg=;
 b=l/9K/j1zrMMSEHWUwEMbgNHZS8JvefKJZ/6xHt+ukEjcy3qovF+NaTy7uwhvF4fCkYbkFD5GTrCzkj1X6PrP/khtBVGzyi1AbsjiPWIKsbSXHY1fAdQOn4eHc69ni0Uo5VdEyYb4DcNM22DSEODgadvLxknbknx4x5SMoNlDitPSQ1UbjayCDQ5MqKw1wpzclm3VxNviBWdT0/rEOfaPzczbc+31s/5IletLdbtbVjmgcFd6oQu4P20VoiFU5Iinh/KHK3FP7KzhaaoVdT9tUdcrMy8pPFaPLoVrPVXQ6kriEEDL7FSkaGk0aXCqICSLYumDrKnGIAbOIOKoj7yU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z30QAp+7fp5X+NHQXpCS5AvmEEHClZ4fbtGuECc5aSg=;
 b=DQmWDoWPMjf/gF6YxgvRrjv53SxwV1l6imHxxTFRdnoZmS4PsxfUwGf77dYMfK7hODO4fDekp5G0gY+HEh5Gd4o/ggEpx7aOXypyqAKIXlJRwKCr/7Uj675fR8x3h19lpJNZUN3oeyikCOiFG3f/nrMZBaRCuJBouDYTJgqhjp0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3602.namprd10.prod.outlook.com
 (2603:10b6:408:b0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:40:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 15:40:04 +0000
Date:   Tue, 12 Apr 2022 18:39:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: iqs7222 - propagate some error codes correctly
Message-ID: <20220412153954.GA15406@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c001eb8-5a08-4e1b-f016-08da1c9ab6a0
X-MS-TrafficTypeDiagnostic: BN8PR10MB3602:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB360253453B0157498365227A8EED9@BN8PR10MB3602.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MYd7v7HqRBERqgtzelLszFLWJI6vyGCQYUt87bKHt1glqTiM+4C3sCobMjMSZMO343GPUzRHUj+K7ap+LhdUOd9Farr+gGTNJPqrh8LTJzAhHctIjpBX0MOuo9RXGmBXiv2b2ZCopSZCgNce1M8v7Lgbbjy/NxU83VObz6uS5L0XNR4uMSTZdrxJOz0A0GUlo2FEzZDOP5cU+D5u0upIT5Xio7J+6G5sqkxkFBUDcSKfpCFMJ8lF+JAhCJvt9MoCbPip0QYq8Yi91wxETaeZGqI5r5HHCF0PI/K9hDD9BOsVh/CMp5xepdk2NbiCPByjdwz7eEi3jldJjWC7eKZVawZuIXtXVUlrv8iCDmdCoYArugHr8Zbub6Rtu1qKG9CWGvdmWKfYzkykmMDatQA7O1avQ34vFS8MT2VwbWingtZEqsq+4//DLyfTdA0PZn3tCNcQo7he/LKhB3BrEo3r7gbUUVlPXYCtzGCp04866ppkz6Nx4awium6V1FpY506+cn9oAJsLhLZKch1fChmx1KoHFqMJ1Sd+cu8FIsPYLNvXsU8PI+WijXHp4MT7KchJU/XY4ni64JQmp8ZjvjiZL/CyexJeHhAbN/aK+Qot7its4cUgp0vIog70vDY/y6bBRWcZqdSOVxMh7TRK0A5AOJLFGixm59qvROlsWdKB3NvxenKvu8TEizOOk20DBl8m2uOfb3IfG17Eybp5ubo+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8936002)(26005)(186003)(44832011)(2906002)(5660300002)(508600001)(6506007)(9686003)(6512007)(66946007)(8676002)(4326008)(6486002)(1076003)(6916009)(316002)(52116002)(66556008)(86362001)(33656002)(66476007)(33716001)(38350700002)(83380400001)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OyQ2AjzSZENsV6t9+lhh9Tdrz5I6+7qpUzK93yrwDzRibF4CH7Y9+gTkf1ty?=
 =?us-ascii?Q?FUL73h5WaTEpG/ZEbKEtOju9oScUxwp5Fr7KuQarYFjb7UO9v/oAyLN29+8u?=
 =?us-ascii?Q?8TsFDyTq45M0tTBkKFeiS18abMXjBI/GIwVW1GAoXtULYppFf4thm/EXyx8k?=
 =?us-ascii?Q?b6p/uZ29jlG0b8l+rDnlDIduHjB6GKtVI9lZIKmvsvw3bhD5aRIeJmqoL3AR?=
 =?us-ascii?Q?VJ3JRSFGLR2Javj/BX81+1aeba6FYpYYThJW0sdBLRLspJfFeX8pPEDJ0M//?=
 =?us-ascii?Q?ugsWbKD+yerth8GQ29IJojpdFIxHcCG0R03Is1DvsqjM6cEubAdNuVDBcXIk?=
 =?us-ascii?Q?8DuCc06yROiJhkDdoBypqNuhaYK7CFkgzt909lpUbOhKTmUg+j/hmipEyI08?=
 =?us-ascii?Q?KamlgGJqDNwLv/MNwN3+SAL0fI/ghtCWDqErF8C5YQQWM76DwVrc4G8eK7OT?=
 =?us-ascii?Q?4zMF1e/ekUeNUbho+rwjVWDZVccetOsvhbHG3NAgChIp51E7oopkxW/x78bg?=
 =?us-ascii?Q?chTJu2F5macsbAxzgEhfGbtvWJ9maL3b6INd0MTBxOO/zcqN8UZTYsomLCW4?=
 =?us-ascii?Q?NC+Acu47cSM8XAmiZjg2jYW+2nuGqNDUY7oTYqT46HNHXNHcB94jB1R8SB33?=
 =?us-ascii?Q?mre3gEnPBQl5g2E4VtKuYfRcmnjtsf37nvAfr/n0Zs+lHebWnc06OAIYURs4?=
 =?us-ascii?Q?IDvINTB4CaunWEBMdZ9803d9dc0G+4BldUTMzM85iAJbSwtxOPAoyPUkq9q+?=
 =?us-ascii?Q?J4reatAFGe0gmEVWHg4akbJ6WFY+tdMjBgKa2rJO6yDyf3tsF3acmT1Y+YBc?=
 =?us-ascii?Q?DWSvziAaZ1NmCB/iFNhA0Sn6M/dSVIAWJAHgX2Kh2WNqYulZ/lLTc42Ua1g+?=
 =?us-ascii?Q?Dkugc7+bDpEylvZk/HT2zgoOkm7P2oRb2CRy9e3bXjcmgX87iB9ASrKJa5W9?=
 =?us-ascii?Q?NTWMNW8qUP9DwJq6BdxIhUZ4/d/M2IltQF6izw7vmIMeQITXjqy2EZL6aSnb?=
 =?us-ascii?Q?bilkx/AIbqjfLNnxSfUSogqqFnecgcb0/Al+aqkiUpxtJE5oAhMzLn/Ir70u?=
 =?us-ascii?Q?iEl8JT6zOZLqRdf8fXU51ejo5wSwuyaFNgbxARVH4C5oFAQ/kztB0b0Punwn?=
 =?us-ascii?Q?HreiYt930ehdPV3Tblt1l75ebCWQ5D8ioYaQMtp/GZmZlCtoJjfTLap2cPiZ?=
 =?us-ascii?Q?zYsDhzZU83XKEaGA2mLKOLMXBjkbDU71Nnhvdnr5gOMJt3qAvYBNZqE1FCsh?=
 =?us-ascii?Q?JR1yQxB32laLJB3iNl/yHfyvKyVSOERhPCRWcRvdVy4xOuvWTlPu4CgNq16p?=
 =?us-ascii?Q?tJsPSCfZcTah5vM5zqs04G8MZTFuWbK8TvUyEOIZqTHFLSv9IfB4mSPyrexj?=
 =?us-ascii?Q?lHNVuwIeMBxzuVOOhFZtLrtwgXpYfgvYjE6DOttj7WjBlNdq9koQyRv+fcrs?=
 =?us-ascii?Q?ugVNhigGeFrCiPxJjwXT7UusTsA/6AxwOtu6p+hBOcaAVwWeD+DZH0uGNLV/?=
 =?us-ascii?Q?qIJXvStRe/5iNUGXjZW4z6IRozxOR1fRFQNIuCkiRofodVHHL5eP6Z34HXy+?=
 =?us-ascii?Q?VAN8enKZLp9Am7qMg5QNlY5LFMwhBVGHnQFFOZ4cVxIrhsDYM8jnERnl9Z86?=
 =?us-ascii?Q?tGw8hMP5XhRy7thX4/7zGfIF9e1S3QPndVmwt8+GGVIKrZX7h84SLp2EMzMR?=
 =?us-ascii?Q?mLa6CVlhBRw9mdzcFCKnbuNF95CXNi9M3Sv44kdzYj9YlH30h5snxFTU9+o+?=
 =?us-ascii?Q?o7R6P4hWEjBReb/XhhTh4Nd930nnVOY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c001eb8-5a08-4e1b-f016-08da1c9ab6a0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:40:04.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi6WQahmFpBb6zOs7O1TPaP07kRndpegL2+hfgS1ToWFtYdZkIbaJm8qr4ISn9FzXYDzp29WhdxwIL2q4OSb3bNhmIhPqPGAPeRA+ctSD4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3602
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-12_06:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120074
X-Proofpoint-GUID: IcHTwTRiXjCJP6EhMpORVaizOJ5IoK4t
X-Proofpoint-ORIG-GUID: IcHTwTRiXjCJP6EhMpORVaizOJ5IoK4t
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If fwnode_property_count_u32() returns a negative error code then,
because of type promotion, the "count > ARRAY_SIZE(pins)" condition
will be true.  The negative "count" is type promoted to a high unsigned
size_t value.

That means the "else if (count < 0)" condition will always be false and
we don't print that error message or propagate the error code from
fwnode_property_count_u32() as intended.

Fix this by re-ordering the checks so that we check for negative first.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/misc/iqs7222.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index d800f71043a5..c0b273222092 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1677,14 +1677,14 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 		return 0;
 
 	count = fwnode_property_count_u32(cycle_node, "azoteq,tx-enable");
-	if (count > ARRAY_SIZE(pins)) {
-		dev_err(&client->dev, "Invalid number of %s CTx pins\n",
-			fwnode_get_name(cycle_node));
-		return -EINVAL;
-	} else if (count < 0) {
+	if (count < 0) {
 		dev_err(&client->dev, "Failed to count %s CTx pins: %d\n",
 			fwnode_get_name(cycle_node), count);
 		return count;
+	} else if (count > ARRAY_SIZE(pins)) {
+		dev_err(&client->dev, "Invalid number of %s CTx pins\n",
+			fwnode_get_name(cycle_node));
+		return -EINVAL;
 	}
 
 	error = fwnode_property_read_u32_array(cycle_node, "azoteq,tx-enable",
@@ -1807,16 +1807,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 
 		count = fwnode_property_count_u32(chan_node,
 						  "azoteq,rx-enable");
-		if (count > ARRAY_SIZE(pins)) {
-			dev_err(&client->dev,
-				"Invalid number of %s CRx pins\n",
-				fwnode_get_name(chan_node));
-			return -EINVAL;
-		} else if (count < 0) {
+		if (count < 0) {
 			dev_err(&client->dev,
 				"Failed to count %s CRx pins: %d\n",
 				fwnode_get_name(chan_node), count);
 			return count;
+		} else if (count > ARRAY_SIZE(pins)) {
+			dev_err(&client->dev,
+				"Invalid number of %s CRx pins\n",
+				fwnode_get_name(chan_node));
+			return -EINVAL;
 		}
 
 		error = fwnode_property_read_u32_array(chan_node,
@@ -1975,14 +1975,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	 * the specified resolution.
 	 */
 	count = fwnode_property_count_u32(sldr_node, "azoteq,channel-select");
-	if (count < 3 || count > ARRAY_SIZE(chan_sel)) {
-		dev_err(&client->dev, "Invalid number of %s channels\n",
-			fwnode_get_name(sldr_node));
-		return -EINVAL;
-	} else if (count < 0) {
+	if (count < 0) {
 		dev_err(&client->dev, "Failed to count %s channels: %d\n",
 			fwnode_get_name(sldr_node), count);
 		return count;
+	} else if (count < 3 || count > ARRAY_SIZE(chan_sel)) {
+		dev_err(&client->dev, "Invalid number of %s channels\n",
+			fwnode_get_name(sldr_node));
+		return -EINVAL;
 	}
 
 	error = fwnode_property_read_u32_array(sldr_node,
-- 
2.20.1

