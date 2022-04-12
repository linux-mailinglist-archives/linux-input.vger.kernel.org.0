Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E445A4FD894
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 12:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344544AbiDLJwY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 05:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383350AbiDLIgp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 04:36:45 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01155DA0F
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 01:01:48 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C5ZIkH028126;
        Tue, 12 Apr 2022 08:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=M8UVKnCVYJ+mObnLwOpF10eohqM5o+FtSbC5z5Xx0/g=;
 b=LVPrUz95Z+UFV1pY4pnRfYyuVnXpkBKz3T9h8e6WtajPnXsns6Z8V1wv+TohtAzVJMrL
 3n4IR7C2gCb7IkGE5+BZ0g+EcMqonP/X/NygMpSpALFMgam+d/M+7fhPDzSdAKPVJDL0
 y64Luz3j47x5dFzIv4+Fs1fDXe3XWDyyypg7Grtx7CzD1AU3jMdNfQog3HBJvcAnOshJ
 8rxLZN7Sldjj2W8F2m87yRAUQwh2WlN4YCCGfMZ48y9TyjnTAAZIrKOr5Fyh9LsfCeVY
 p2C5xPliZ43Fpjpwmn2vpyQ0kNcbF3iSoWx81auwO0pZX0aApC3448j4c+7/K3TVLtXi uQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb219wr0v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 08:01:46 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23C81iSf003466;
        Tue, 12 Apr 2022 08:01:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fb0k2mt4x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 08:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyGCQ/fd9wo3ehzPcKHKaVaCVpS5Ih3tvIlrh8Th7UEUHrEvrODJB3sZYaEuDWsBsyz+YT0gW2OYIFvBdN+EdbDVTYaarIhuLktDL+RfAMmJTAmyXSmVUS8hde+eKyPaQMyUgow85DiYcDojQLiqBJURzscK3GjGvxMXzIBG0z4lJN2/Xq4wcpPxFagz0oHOHxenDzRxwP+LAOuDAIB6GRSLjkgZhJBfDGLNpX9zDVftoJ8qpzKhqNSK7wu1fjhDKi0KS7tr3RkPVBlOJih775G1xQO7nXSrkusZCsCzr1sbG7jGqVXJWX4CUy9rVyvv/CQnKdDjeSvDsvuXAoFwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8UVKnCVYJ+mObnLwOpF10eohqM5o+FtSbC5z5Xx0/g=;
 b=bA6LmqsCzalCC0vFBILedweleOxU4SZVfomGLqMTmEXY5rGpL//LsFbVj/3WWD+xCKgfRleFbWa+TUitKb5OgVvZgh09NbCIMv1L2SPtKUuS8v3qkt3kHA9SjIPK1tdhk1syqzBrNqDY+IypjgzdMjsZTx7+Ws4y20wqQ68gPDYUwfmmTjKq8/H0mXKyPIkpT4DraIacf2d0tfoxtBi5pboDLOO9alHAcZtqEmF0YuV0LyRojsBXfKzkA+zcJT4RrYJfcdSXmoHXivM5DIx1Lk3w2ihcvsqpBPrZhTrmZYhb+Q72o4nGpdx/EbWK2kmf88NWgPmzW2PmsUfTO9mPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8UVKnCVYJ+mObnLwOpF10eohqM5o+FtSbC5z5Xx0/g=;
 b=kC7ChAhQX/C2OaGsaz124grVymc9hZz4/y75UQVrjChZ5jUWIOtYkloddjep0j1dyCoiO3P1OLC4S8wdu2S6rOLgd7xS1WilT4Mw4Nk7IwN2VPrl7dSzAQH+0dWTOQ9RMfXLNhrEUtiM2qA8QbKKON3cX7JNzXgvy0Ozjf2S1y0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4701.namprd10.prod.outlook.com
 (2603:10b6:a03:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 08:01:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 08:01:44 +0000
Date:   Tue, 12 Apr 2022 11:01:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jeff@labundy.com
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: add support for Azoteq IQS7222A/B/C
Message-ID: <20220412080123.GN12805@kadam>
References: <20220412075937.GA8684@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412075937.GA8684@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0015.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0726a5d-0302-40c2-23c7-08da1c5aaf3b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4701:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47012B130A01ED487E024F468EED9@SJ0PR10MB4701.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lxGb9Knq+SxNtN+I05k03oxAERNJ/LWSD1hvOvcTp8KqUgxm7psCxAq0grlXqvB4YWjS2N6foA0VyoG0f+6ETuvH6BsbIRI59zDPBoGzbAvUS/Zkp4903BugUFQRAPDKespL06SkfYSU4MvNP8zXck4pJvSIM9x+S8y/Jz4YpuKsz1d8vWNKbkCwPTiw0WLZp7jXdKyQ7CuAAvO2V7gsWiS1tbjRAqcWdKWY9hD/JXzdZh9kFhEGGY+thIfjKl4N1pUAWMaHEBYdZWmkGRfDMG/l8zdmycG2dWV/RpEvYc+Ho2IuflxglF93rGrDb6tbbnpsdl3eJo1c2PAoQuKVeeSQS2yJDcvf43LtRENPN9DOQdxZd8pK380PT2H0qnP6PSk/qYShwhmoFmQ6u4kQhZtFO253SYpGbskym0PNfooqfZO8UX0ROZgZa9vv5sXTyMJ9rPM0ENusN6xWQ79QeoiFFFAPKR0rQgTI4gdy1FP8FT3tWVBj6NdPHR2lQFQRRF2x6Wgrfx6j8B5bikWOArVEnEfL7K5dq/3mEDpE6oi2qAyTggU4Urgd8W8Ma/TGTbEoNMdpZwKHdsx3hQqvKe1NoPC+QCjFo5r+Hdm3qkJCjbpgx3MHGT8mUA6MxzUYrW9+jtZG9gmzAMeLp39uPiRl8AxbZtGS2Pka5HWQgpPeBND4iAGBf75E+NBWhIBBWKnI6t559zwkUShuNSB/cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8936002)(66556008)(38350700002)(86362001)(33716001)(38100700002)(508600001)(6486002)(52116002)(6506007)(5660300002)(66946007)(316002)(44832011)(8676002)(4326008)(66476007)(26005)(1076003)(186003)(83380400001)(6916009)(6666004)(6512007)(9686003)(33656002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qscPaWcIg223XJ9e63nauX59RjqCSmhzhNAhoTK8KuVKENP6j6Yd/kH7o/Pg?=
 =?us-ascii?Q?CQJWFnF1/6PkJZHrSbMSqlIQ5ac1YeByDchba4GII4KNlwY/HH7aW4hIbwRE?=
 =?us-ascii?Q?yW2JYlniThlqeVNo4GDOVfYv88Tln5RL6dyPux6C7ya7dkjs+J+XJBMkNlhE?=
 =?us-ascii?Q?l9SUqAyrqO3vUZzqwot40a4mNB/35zTk8JVZz+ql4W9vrL77FRLdDd1xQjiJ?=
 =?us-ascii?Q?ZNswqphnqX7W77PsboZnoDHra0mSlSZYa3obOmTjCTDDwaYICmY2dyvNJr5l?=
 =?us-ascii?Q?EPsDRPLOBQvMTCFFvTw3bLsrlM/MfZKXAwOif2bjinI8wwPzd3lpB03HFj1L?=
 =?us-ascii?Q?lExb2/xc2VF5Munr5JdCyhKrNGE/Kp2hIwLQZSaskiZk9fa0oz4KIPQBzXYF?=
 =?us-ascii?Q?vYioYyb0vHeGYxNh/TVvN2sSi2o3dz46pOKWv4kOyLZG35EiPLlfAKe/U9jE?=
 =?us-ascii?Q?2eIYeDOtQHaLGo6vQbAdP2/u3U8uxShqqTw5g4GTDFPREcNrZeLk4Zp5TK0x?=
 =?us-ascii?Q?wLYIKyYVAWVrJp/vypltsuBmm9YypksfuU8az/UYnKNY9JeJT9AzyabZhmBW?=
 =?us-ascii?Q?F29ETNUDo6W1YDwb+2pMfIX7PBcJvxfLrkxZvNNOFw3ZQnUKtaAOlFfELSvB?=
 =?us-ascii?Q?P5z88+oQ8tMb9IIMiNLxNVfbLF5O0jthTWVzffaRkf0hvk/UojmmJkUE7spF?=
 =?us-ascii?Q?U6okGTeefHzX8pOMtFtBgmVrj8JHSzZoO8wSQRO6xTVlLr1w2UuEHvp+2TWy?=
 =?us-ascii?Q?kvB6xJ6l6nBRIfoLs7oIxygPzDc4VYDWNYxNYiCT3gUVCEuLwjnNj/Ec8Sdu?=
 =?us-ascii?Q?VD1LKEJza28n9wczvTxSx1xK1Z2X6Y9MrmMmCP0qTDJVICFAFn4tfKEw1dba?=
 =?us-ascii?Q?Xo2Eti5axY79ybAkYR/5ujoDpPpZZlfDXMdm0r1orEMYQa+Z44HLPG2vmhcY?=
 =?us-ascii?Q?o4WVmDmpxWiCxJHHIm3BkGCS06oVd1cu5IHb9J+JsYA/5mvU6ldh8dn4+tdx?=
 =?us-ascii?Q?Y8V0EWDmGH7RBte7T3S7P3AEORLxYfWlJQISg+pwR/wJJwVEjl/kvzLkC0rr?=
 =?us-ascii?Q?K/+KKCdHa8Cf9S1gKaFrHcPLmihG+MCnIcapaMeApiRceJjextxV7r1o38Dk?=
 =?us-ascii?Q?fyETcJp06c8J9yQ9lrALQ4oGtRJJo98Cnr3DAI5jPzcsDXPaEtkEV3OcpcAA?=
 =?us-ascii?Q?jNUDwVCNIbHbpxVSfzgPOb+8PI+lDGOX93cHtW2HW2g4HXK3dvD/iVWtEjKY?=
 =?us-ascii?Q?Nx6l0xpuDqMCSW1EYWfW2VE4cDgIy9LVDYGyPcREIBLllUQ0JrjOIGWDqEeq?=
 =?us-ascii?Q?dYpPHdwxTqBbh5Yp4ymXHJ8Me8xyW3cT/78UOc0hjMJIAbP05GbIjLdgXi70?=
 =?us-ascii?Q?EkSFFEGSrrQhcviihmrj/r82LN0e7zOrBisgczH+lBNUsG8ZZsImHmliuduN?=
 =?us-ascii?Q?gKdkRcKFxz7jaCmkxG2Na3/EPZcTSe/7CtImplwyaW4eSMLXu4JXk0WwMn7W?=
 =?us-ascii?Q?1jo6sXprNtQRM5YJeZkAhGctbEyt2DUr/rlxW2YoblCUkQErl0R83uoATC+B?=
 =?us-ascii?Q?yEjRHZ5PFR7Bt1ZRhVV1C9rvQFldrbh34wniIgrnTkOBoqMau/oCvrbYnUcB?=
 =?us-ascii?Q?+QGptdN0j5yOd9f2H/ZLEoNUt3gyHAEVaEVo7s85E5f5+4WlvBkYO63dYIgD?=
 =?us-ascii?Q?WV+dLsKEBK5mlM3d1w3iEektVMEQqdm7EE53/RkzjlFQzJAAx4aXGJ46xMEK?=
 =?us-ascii?Q?4jC4HbEGzPjJ/MlVlaOvKV+yxA8xRqA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0726a5d-0302-40c2-23c7-08da1c5aaf3b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 08:01:43.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTekyCRu1gYw8GZjoHyF34T8KnRQwXDYqG8mlDxrlYFOskJQTGwoYpzMpx5bJoVREkKhBCOgVoWeal93kxlYcEM/PvnVjTrSJQlr5fPFIgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4701
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-12_02:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120037
X-Proofpoint-GUID: YqKEUN12k2Xskuu28vyub4Q4oEIRuLGH
X-Proofpoint-ORIG-GUID: YqKEUN12k2Xskuu28vyub4Q4oEIRuLGH
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are a couple other warnings as well:

drivers/input/misc/iqs7222.c:2214 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
drivers/input/misc/iqs7222.c:2234 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()

regards,
dan carpenter

On Tue, Apr 12, 2022 at 10:59:37AM +0300, Dan Carpenter wrote:
> Hello Jeff LaBundy,
> 
> The patch e505edaedcb9: "Input: add support for Azoteq IQS7222A/B/C"
> from Apr 8, 2022, leads to the following Smatch static checker
> warning:
> 
> 	drivers/input/misc/iqs7222.c:2166 iqs7222_parse_all()
> 	error: NULL dereference inside function 'iqs7222_parse_props()'
> 
> drivers/input/misc/iqs7222.c
>     2150 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
>     2151 {
>     2152         const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
>     2153         const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
>     2154         u16 *sys_setup = iqs7222->sys_setup;
>     2155         int error, i;
>     2156 
>     2157         if (dev_desc->event_offset)
>     2158                 sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
>     2159 
>     2160         for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
>     2161                 error = iqs7222_parse_cycle(iqs7222, i);
>     2162                 if (error)
>     2163                         return error;
>     2164         }
>     2165 
> --> 2166         error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
>                                                       ^^^^
> This NULL is dereferenced inside iqs7222_parse_props() so this will
> crash.
> 
>     2167                                     IQS7222_REG_KEY_NONE);
>     2168         if (error)
>     2169                 return error;
>     2170 
>     2171         for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
>     2172                 struct fwnode_handle *gpio_node = NULL;
> 
> regards,
> dan carpenter
