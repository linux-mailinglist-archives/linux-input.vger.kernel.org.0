Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9662D4FDC90
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 13:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354479AbiDLKcE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 06:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381280AbiDLK3E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 06:29:04 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470E75714B
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 02:31:04 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C7HFBV018804;
        Tue, 12 Apr 2022 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=rIA4pU/4Zwzlz3ENAopzq4oKddSRt8ZRIeIbOZXk7xo=;
 b=BC7Z5o3NrnVQNIOWFwIatCcOvwk8/zXGdnsHXayIuqtkHf/1cZHhPsAreStzEqP3op6f
 OhArDVUlhG5U/JqsWFNMYWzQsn36hNpKPjKHjNmhdQ1GnyB5NgdBlbj6eH13gzBuJYi6
 76ROMRKXz+pc8yJYoh5NlgXaBBvZOs7femDdnxAQrVQ2SyGfqhks8FGnYsefA4B8y9RE
 CyoXEktb265F2nE9coA2czmFf2I3zxB/tfKp+GDcmUpz1EIR/RuiNYmG9ohAsnSTQ29G
 pBjovux3PzfN6WRYeNNXKrqPz2Qd5dcvoqrY806sQqBUFk9HuKiqA3RCukLqELpulDiy jQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1e7gq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 09:31:03 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23C9FYcX027179;
        Tue, 12 Apr 2022 09:31:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fb0k2jksg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 09:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXzfBp1eLrbWqb0z7P2lhyHhxFgmU0ajfzm3LVypcYiipv2pPNL2nM70oB2XLfrWiJYuuaU3G3d98ajoufHKVCtIb8P5m2RD6YvCZsSrfDYFpd6lhARok9fXWJJGQIyfCEl71bEIQW+E2GQiv2YYh5F+aY6UXH+FHKme8y8emxZSY86t1KEGQdqVuWxI4iYLJgZE+HW2kvKa2UlyCiIuvUPLx8AtucxurDi2RGBsyAhED9EKwUWXlt/Br8MbsclWejdf1whXvNYBEMleieOQO2SHDhpT8g3bToSVtVNSn36QK1UjUhFaz0hLSZgnItdQC1mdqep3lpqDcikX2hFskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIA4pU/4Zwzlz3ENAopzq4oKddSRt8ZRIeIbOZXk7xo=;
 b=UgMWvt1Iz5ODPyflnUaadzEVCSyK6z5/ZhH20dqtTpsk7ksJA8LrqshdK2rCGt1XJXaAnBHe1k0L/sPnqtxPr0N7WlGrqWhgyOKg+shIQJ+Ka5awwWQA3W21XQtCs0R2DTe7/UIqqujD3yOjAy3DTUvNg/0DFcYjElBGhBxEsuvC6oX5GpoBVSYYhbpohjvVEbaUxzglLt7VvwnAnRE+/4xJRjL2ePmg9j89J6t9C5Cf2XXE8U8LnDfMiNOCtU3n3Qe2kS3UePe7U15lWibSfvP330BuZznDRDvPhxx45wGtm4Y8GjdESc9es7xh2ggsgQwjRZPX+fua6hgGvYpYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIA4pU/4Zwzlz3ENAopzq4oKddSRt8ZRIeIbOZXk7xo=;
 b=gDXAhxLuQfqfmEfNu9hEip9lRxi3F8kZLrlJS8zBzL77qfMiaTzlT/6yCJOc02O0zQutfrawPrD3VMCDqjqdweEEArlAvh6yUM54KEOAm4mFCNbgRqmOuIskwWrCwWmZjopJ2t/mMQA2QlEMsHaqGIRd21vV4ioPqfv8gLdVKOM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2824.namprd10.prod.outlook.com
 (2603:10b6:a03:8c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:30:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 09:30:59 +0000
Date:   Tue, 12 Apr 2022 12:30:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: add support for Azoteq IQS7222A/B/C
Message-ID: <20220412093039.GO12805@kadam>
References: <20220412075937.GA8684@kili>
 <20220412080123.GN12805@kadam>
 <20220412092251.GA10886@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412092251.GA10886@nixie71>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551a9bc9-0e2d-4943-6098-08da1c67271a
X-MS-TrafficTypeDiagnostic: BYAPR10MB2824:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2824E32280B6C3BEE61C3A6B8EED9@BYAPR10MB2824.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSMH4vf9nASt9BSAuFYOK2dwhYb/uQ8np0MU2X7xKIXmAnIlepM88Hubh20ba8AMeVHSLvKXIJMuyWOcfRce22Vqkt2uKcUiNcxxRjsGvuxXmH40t6pJxayhMRXVY6hko1XFmZJ4/kPDvAMsGJqcs4uiBOaHtl4x9FxnbsWmu6MPlDSSMoWI7ALMQ2/1XbQkEbzIy9kvU4hDwdW+44UtUJLxIfHJfK7aShdLibKBI3qh6y3VL660Ivl01856s1Oer7Dv6HDA2oFjpeK2AHQtBpjrhQhMkZ578p8co3GzOBC6OLyH295FPEnxJlnU+acDuXKSp83rDvVtD2fxH1mm7fpcCT7+MfHqMs2taJSEfdSpIH6jsuLTFLvab2Dr6+9H2cFPGzKbMsaQhZEHXyyBt2iDUaulOsK0Wr5lJrb75zNT8oTmLnlDKmpsBmdQR3cJ8WOxjLJVgLtlr/ghoxScaaKDUFFN8Bm448Rx1uZufeHc7eaT3xNwBAjiEsDVY+lDlN5LSiyKf1ucomCu0ROX36uKMb2IBoOlgGkMfX4tBFpZ26KKqCMNT78TBij8ENYybtRI+y1g6E7otn/df4q7so2EvMvJNsw/pasDDrEzN2MezNb2oHLcacBZTik09hysNtEYqFOrkq+toFV/i8zpHyMOvUPlhuAowhs6h2bnf7rYg11FKVLxKzYkGneUqwRRwzKP20h8U5Fbg+URU1Y5mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38100700002)(508600001)(6916009)(6486002)(86362001)(52116002)(8936002)(6506007)(33716001)(5660300002)(4326008)(316002)(44832011)(8676002)(66946007)(26005)(66476007)(1076003)(186003)(83380400001)(38350700002)(66556008)(6666004)(33656002)(9686003)(6512007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFQ6DhP1SdvYS9xrLUz1pDcJU68jKH2Mte1+f9oB14+iT0CT9FL/04O+puHv?=
 =?us-ascii?Q?ti8dGPQnPN/7LFxWg9pQ8gipz9Mf6XrCOVi5tMfw9C624x6MNJ2rZ/xnhVlP?=
 =?us-ascii?Q?ZXx0kCmuZfl4hM9JGMLUHMlUE/OM82Jq43cLqP5oH39XQ2RLsd3agUzXX/xH?=
 =?us-ascii?Q?EnW+0iZoVbLABbef61u3+H1TpKrMYTJuMJOzx0JFDVPFR66XYvXlqcbgkd/8?=
 =?us-ascii?Q?9095YuHUGjrJ8xMbfNzIN+BByeRN65kAOyiENjGsll86yULo2QtqO+1EzdCe?=
 =?us-ascii?Q?wrb5aTDbSyR334uU7fNajuMKTGQtbgXHZq14GFFn0OmYKiKOg4/C1zPoeb2N?=
 =?us-ascii?Q?W7U8hObhJfR90V7HzD2DGOS4yqacgwYNsyZlkSVmw4usHmAJxzAAI8EZTOYP?=
 =?us-ascii?Q?mePDmgNSTkQNJp+xJDEqDm6O7mVbG0bvJpSC+gulK1XtCzJDNRRLIY2XZWj2?=
 =?us-ascii?Q?d11SpTlIT4rs88Jwxg5lYqWuvxc4EDeXS9tIFh6N9yVRT5j0HsKDSwVFJuKV?=
 =?us-ascii?Q?dsHMHTIf/PtkYmSauWKHUFuh3tuEujG3OPhSAklWvIW7xq42d93y49xZFHp8?=
 =?us-ascii?Q?FMKlRMmjDmS+3EGyhSvhoJuYAEyCQp+E1MHxRqKZ9fpA1QiwRmYLgMbkKmUJ?=
 =?us-ascii?Q?iAehu54XVDFfaNiptbFHXKTjthm7DoYLr4+NlTrddIRtvn6f+8DKfBgKXwkk?=
 =?us-ascii?Q?e23qBfHHoTkIV6VFkmaEuY5kxT/CKdRFGcPpbT3yRbdBuWCJNUZRaGHj2ovD?=
 =?us-ascii?Q?I54qDHyZvbJO2lbznf1DViqY37tI0Wt0lOCN3UuznkUA7RYt3OX41UIzS96A?=
 =?us-ascii?Q?V6jinmalX04m1qy6IaF9lLkybKXCkXqmoixGW/g1O7SyQTagJaLwVIjM5o1P?=
 =?us-ascii?Q?Lzp50U4dUYWp2MePKYCr3fRQVsUtF5kxDtP69vwE8mguPwchDshCp5oMbOHU?=
 =?us-ascii?Q?9g+uRDTz+JiGFsKUfyrmHq6ndM7eGxuFxhRegeOifhkvZjmYXYvWIe1yxwNr?=
 =?us-ascii?Q?ubmk4T+wGCVHSSYLHQlCwnSx12ztMdRabWJhhxAHrC/z29aqsf2gU5MWkkfK?=
 =?us-ascii?Q?2bPd8x9EReZGOzNd7YNDwmblox+khDh1q3TPtlqKtpEjLb3cAEl/Z1mYRLyK?=
 =?us-ascii?Q?mIfk2Vb63riGdOwrgL9TNDtdAp+84Lwvas9WUAWHwKH/+am3boUqiGFVGjyG?=
 =?us-ascii?Q?z6PHZrM38aklfPDo17+YDuuA6JYl4g/NnO4NxcanBTLcg1nvfAKgciHc183H?=
 =?us-ascii?Q?x2mlc+Z03CCGGM+o1gKiCULzZqU7woBFTB7oMQJEq7qit/thxezSaKMQpLLv?=
 =?us-ascii?Q?7EDMC3pa0V5g+wD6K444RF1I+SPHzGsJ5L7mZIhJPCreJ+RkkmC7NaTY/D+B?=
 =?us-ascii?Q?w2QLACQrvPsV9DIyD0BSaqo+47lhaabyQ3PQoKd76JLwEhRInA3LKZTCO8wH?=
 =?us-ascii?Q?j6IWj6qHHaPThAuPUAbLNvAEZxHK5WJncipd9wGboLP8sBW5Q40LQby3wIUU?=
 =?us-ascii?Q?yR3h46jNX+GLUMFoxUCFpAL2X6pMxrFyI2ozPIhZyq2/tL60PqsgO79c0A64?=
 =?us-ascii?Q?bvJl1rFngk7bgh0lRrXUHMuxtptlOInmG5V4DmyrAEJb8YeA4pGrcKyztcXn?=
 =?us-ascii?Q?9UMGVYibT2fHUfC4j5vhrOJXVs2xkk5nVUrZJ1I8FhEzpunnzzX7L70sbROV?=
 =?us-ascii?Q?BuFy98T05q8dU7kEHUX4CrFBU+uGInBh9KYUN3BWIuwLX7RHQetE1Mq6WXU+?=
 =?us-ascii?Q?x66Y5dBtReh4uCL52kphWHDZqMzhqB8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551a9bc9-0e2d-4943-6098-08da1c67271a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:30:59.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWBgVv4MAvlVP0HXFnC1A/NfFgj/HO9Z0/YLgz4vsF73BSvM9irxBR/X4QHlKBTfss9BbzGdbHIiHuHS8KZl0B7CuvIk6ZKJhRPi3iKNpsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2824
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-12_03:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120043
X-Proofpoint-GUID: A0u6SdUweZOvuglP32h5lzHnzHitKJlo
X-Proofpoint-ORIG-GUID: A0u6SdUweZOvuglP32h5lzHnzHitKJlo
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 12, 2022 at 04:22:51AM -0500, Jeff LaBundy wrote:
> Hi Dan,
> 
> Thank you for reaching out.
> 
> On Tue, Apr 12, 2022 at 11:01:23AM +0300, Dan Carpenter wrote:
> > There are a couple other warnings as well:
> > 
> > drivers/input/misc/iqs7222.c:2214 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
> > drivers/input/misc/iqs7222.c:2234 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
> 
> All three of these code paths are tested and do not lead to a crash; I
> am suspicious that the warnings are false positives.
> 

Are we looking at the same code.  I am looking at linux-next.  To me it
looks like the checker is obviously correct.

  1530        static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
  1531                                       struct fwnode_handle **child_node,
                                                                  ^^^^^^^^^^^^
child_node is NULL

  1532                                       int child_index,
  1533                                       enum iqs7222_reg_grp_id reg_grp,
  1534                                       enum iqs7222_reg_key_id reg_key)
  1535        {
  1536                u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
  1537                struct fwnode_handle *reg_grp_node = *child_node;
                                                           ^
Boom.  Dead.  What have I missed?

  1538                struct i2c_client *client = iqs7222->client;
  1539                char reg_grp_name[16];
  1540                int i;
  1541

regards,
dan carpenter
