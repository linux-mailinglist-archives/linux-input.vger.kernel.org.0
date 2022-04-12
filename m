Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7554FD38E
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 11:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244699AbiDLJwS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 05:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382670AbiDLI1V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 04:27:21 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE15BD1A
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 00:59:52 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C5EbnJ032238;
        Tue, 12 Apr 2022 07:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=THWnZ6gJAsVbDoQR95gBs1b5SFdY3v3lN/rXIFgHQfo=;
 b=SZkpBhGayEChzecHrnwa+wfDsG3hvZJKQ/Hv2uwQkU89Hvpqsiw64My/YNyul+xeJzzL
 oeZlnsEA+qp+Z/3pxsEwIJonmfO/ueeS949r0V+2piRp3n2MAi1mIbnEgEQi9gounFIo
 60jzZCMwtlFgkVoQtnEv5rlqQW77j/YdXa5lb9Nt5uNsv12eYI5SarsODFXgBBdjx8uq
 RHBebVlMyHgC7src4rukmhaBvtciSfC6C+XoPkflDpsFy8sFJxDJQGPyFSfCpEid5tGR
 gWEQ8ooRS1LwV9GNPx3TuXTzkF565B7fzEbE4OLWyCmWtdQ2LIUaQ1LoXNFDHfKw6UoC JA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jd5tjn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 07:59:49 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23C7pNfa021220;
        Tue, 12 Apr 2022 07:59:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fb0k2gdrx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 07:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2DxKa31lyXW68A1NEtNhLOT/aU+bELj7oCyEsbVHVo9DCTYGBOgteZyuszs+Xno2UaCRslxdKhztevTbMArFdhn0NRo4VnKRPbxTvIsnlHlHM726pYVt6M+uWnZGO+YDgD9d9n6godlKPHh/NXEjxaCZaheSPHJx8Vw4jjJuutqQoRGK43mAEzKkQ0k8jtMDXDA72K2waWy8orxYgIG2YtYs5XcM9n76zxOZgjCt4piwjxZF5Ynj3xQX1P7Qziek2qmD1lXsRPZLwqJu4DxnhLvU6fQxnPgRbiVYg/ntLkFyRsCTiksli/1V+iz2nHovhgKytaS1kEtoTxHUhAsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THWnZ6gJAsVbDoQR95gBs1b5SFdY3v3lN/rXIFgHQfo=;
 b=NZFpZi56Ki/hMA+gtUHnpaAskYhlqa8T1qBCG22wvutc2D7F79ZD8w66HUMyYOgV3wfQO0zVywo5a1Qkr+tOJAcidSQ9m4ia4RwViH7uqQtI0EhnHd45NyFb7VI51I7dOPUMCZ4NhjmmvkNuAr1xEjZ6G6G9nDoKSkt78lnkcWsK840/sT26ZGfTAXZ/ecICBTcjGAM/3jYFM6dT5WNoHKcY/d/XRN9/Xj3/aNhi+DX92MKOJf9CBPg7PFSab2Eem/bttrIksCSjnG6RPYz3GKw4ImRS86wo3OCgTQbq8TOsbImPkR9sq1NJ/HvQycfrHRgMuc/A8KKLJNFfilZTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THWnZ6gJAsVbDoQR95gBs1b5SFdY3v3lN/rXIFgHQfo=;
 b=StN2Y7tAUuNJM4hhfzqMmeYhBV5QgvZ1DLVpb5cykyFlCF9uWh3GiP0ljukr886p2izED/Qb0iScBYivN7cv5pHcO1vOEaF27P5rnbem3FjAdKhKoSv/K59pfPVcyoonqCiDf/3mAZNRleHkHAJGLWwGQbcTMLwRMubTo1N1hu4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4701.namprd10.prod.outlook.com
 (2603:10b6:a03:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:59:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 07:59:47 +0000
Date:   Tue, 12 Apr 2022 10:59:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jeff@labundy.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] Input: add support for Azoteq IQS7222A/B/C
Message-ID: <20220412075937.GA8684@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0195.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4988cd58-cc27-4edb-2cea-08da1c5a69b4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4701:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4701344B7C2486F773C8CD388EED9@SJ0PR10MB4701.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HeJasLynbehgXldN7EFUchduI2u/kdQKWeAExD7ZNbxdKNBySTRkSLuqZcXwU2q3wQgMSOL0mu7qgr3iGhXND845iPF7aAvAEfBPBPt38Lqex64tsMbbYddiSLPhdBHQ8ai7La++USuU2TI27Cdume5W5H/ZUbaf07JaY178sZfcfpcI3tEdGkDvVc1lza9lawfm0IJeGt66xHCMeXtY78YZiuCV7/vI0GMcDIjzZl33Jl7n9jXOqM+woap10P6TOQcLikGkj8GdLIvuT/TvShPY7Psnb841MqLVvfJ1Yq8BGuKo1mhj83RbGFCDG7o8DWKDNrZDFfs9NtJx4oR122MmnYHm5DdKhfzNZxWD5CtMdBrC7winKfSqniTUGICh7f1FGGwecAQ41EFteZOYZRLdXTR3QYm9IB7pvcdCexCBtpJCa6Z9vI65/dkZUPET5Qm+wdM7Rz8TokW6aKqedUY8eyFwXZpMIv08ejSd4So/72khR3rYrOmpPT2yZjKR7XAN8DOHW6aZuUjto0ar1pjZ1H+BDUcFjoXzrHF1aTRuNgZVDxGCPZJg8ezak+rCogs7IWyxvNO7ZmguT7MqNeLwjPXBqRYNbffb8Jx8YkQAa++O/qXuscJckofjTLDImPasaP8x7I6LUWlxLpikr2zCmEebvwSx//3QN74Spqfuw+keoLuhD1Si9FVvty4ItQjhN36I5P+yGeRLP6Fffw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8936002)(66556008)(38350700002)(86362001)(33716001)(38100700002)(508600001)(6486002)(52116002)(6506007)(5660300002)(66946007)(316002)(44832011)(8676002)(4326008)(66476007)(26005)(1076003)(186003)(83380400001)(6916009)(6666004)(6512007)(9686003)(33656002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTdrqIJwKwXXvV4zM2XmHLy3XH6+Iea7t2Kdv5v046yXByP/iOs5N8mvUoFJ?=
 =?us-ascii?Q?qYLVwZteBozJP7wV9ms6JzcMZ7mZb8Y/u0kK+pEMVh7Jgr+b+FqBLiOTKQIF?=
 =?us-ascii?Q?pUlhTnkVHB1Tj6TIpn7hJstGPw5kRZMhUug4sT1ea2aheVs4+Rnsd1NH/Jp8?=
 =?us-ascii?Q?a36WyeOaVV49CWO08foBrBdsyXJeLWFj1oQ5KWyrQR7ZxQPHI9+pQC4GqEvf?=
 =?us-ascii?Q?VmljerZMO22TVGruNHtlBw/NNcufKQemBzsHJmdQWup5IqIE2N6P8Q2wEjpB?=
 =?us-ascii?Q?3SNhgqNTpyguRuD1ZtxUNhMKbnr9oCOU+qMb4fCJhpGfSbnmR9EOQ7tH90yB?=
 =?us-ascii?Q?lCKToK5Tl4Nub4QKxjvuLXLhaxHj8HWHqtg2BT9Feo/fVCAFqZs40BM/Ku8u?=
 =?us-ascii?Q?H9ez/gs6d7SVoAXz+xuSu1H8gQ0kqQeef5RVwwh5Dgvr2kIbw4I7DApp46tL?=
 =?us-ascii?Q?uNHWuux5W1NCyHutMFcU2SwDWYu/gj/dYOa2JLr7+1i81g8+2d2OHgT6SEuR?=
 =?us-ascii?Q?ryLfOS7yDS3MwyJJKlk4YbYN/nR73Rw4aTfXQlIcn0Fphknp7/iVBO4y3/k3?=
 =?us-ascii?Q?3hEk+Yrqa14s4IcV56l3Q58jTwMr//4ubXwm+HCmvGAsdA15Jz/KLEuWA5sB?=
 =?us-ascii?Q?iIFMOFE+vM1epXXSpAY8P/RdNSG6crJ5OSKtICFWOtAGisHVJLSsUbsuQqeh?=
 =?us-ascii?Q?u03Accu0Sl6y+fkC0Tja63CRNAJBDb2XtXXwM3m7+kt0gyyVL4x24OAPd3OT?=
 =?us-ascii?Q?sQ1uoPvLH8sqpS7dKZnCpLYYx8WojlsCffT+g4kN68TpRkyWKt7ltaTx8hLC?=
 =?us-ascii?Q?xoeLowPcF6KAhS+ysVVMgWwPNOxYL8TOA9AFqXNZ7L1hF9r3+h/JbD3KvUnO?=
 =?us-ascii?Q?fZve074vDDAtEgFO1vNzXJxM2KKMkFkKf1X6p6P92C2F6S8rEY2+m9LByxZS?=
 =?us-ascii?Q?uICihr5m8Tjwpa+Xr0wZu6KsF7w4hmlsa0c/ZnPiXF0kpRFo8QwaypmmvFf3?=
 =?us-ascii?Q?Y0d7tzo+CkrMU6TZvRRCWZhj2kgJ20UACO4oBmdw4IdrnfSYaWvt/x6vVvTx?=
 =?us-ascii?Q?USyLW/etrw0vJRVO0aMImiILytTz4OiCRhkDiDvlOuRs2vUVRqOYlR7Bi9Oc?=
 =?us-ascii?Q?GN0Hd6kD0PmsFa9sO2D7u6xr76gxbeapPkv0Z2QoKk/utt57whXuqh+OlQ5o?=
 =?us-ascii?Q?QetSUpOWRjEP/VWPt9iV8d1J6ibl1Kfjz0v6jEGCbPfLyFjCJJ765FaSTYbp?=
 =?us-ascii?Q?4sWncLQgAaEHiY2tZzw8OnB3j7P7fCGhcZeRv4uDFJkIpcLUTWt0vOwswyWU?=
 =?us-ascii?Q?Y2WPrwmzduLlVj2bkIHiYM7qq5cBDZm3EIPEKSX6sFB+f8iF6+bFM9xacc4e?=
 =?us-ascii?Q?3JMc8HNn/1XgUclmIQ9sB1Czp+RPKeObYcUtmf3Z83Lehqn8TSmTTqWz7o6K?=
 =?us-ascii?Q?oagwRzjYFaSudqNQUiD8aJb8g57fXgQPDMy83UoOfMMGdWho7Im7Y7iWTOuP?=
 =?us-ascii?Q?atfyy+sIHfGxFkVKCNC9zAx0gBTKvEv/K3JJhr1xm0fFeyThf1mItg6EEJl4?=
 =?us-ascii?Q?v9bL/Z0ifivQBCqB5BYqp3+/5cPwV1HkBWbTczfRc7mE4dIH78a6+G/Nf/kV?=
 =?us-ascii?Q?UgrACywpbS7K9Xp6pu12G5oIoqlUNeDVwS+7RZiaUPQPDdf0Upnq5Tzs9TUS?=
 =?us-ascii?Q?C7P+f+RqFKy46XLODuobmWKFxMOD5mG16v8SJCLrzx+d+pE0N7mBcOFkIDLZ?=
 =?us-ascii?Q?so6OFzQ+fV7jXZ8zX0UYbLi6iG3OeNo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4988cd58-cc27-4edb-2cea-08da1c5a69b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:59:47.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu8cyCEujxv513H2CS1hYtmh80+MTpf34r4p6r13a2OrW/sOOrK5gziuE1GfVi9v85ZHjJ8CibEgRpaV/kpVgW1mgbo/rSHdq4qbd0Fux0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4701
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-12_02:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120036
X-Proofpoint-ORIG-GUID: TVz_XqstBWAsFst1WuqDDzjg-ZR3E0yx
X-Proofpoint-GUID: TVz_XqstBWAsFst1WuqDDzjg-ZR3E0yx
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Jeff LaBundy,

The patch e505edaedcb9: "Input: add support for Azoteq IQS7222A/B/C"
from Apr 8, 2022, leads to the following Smatch static checker
warning:

	drivers/input/misc/iqs7222.c:2166 iqs7222_parse_all()
	error: NULL dereference inside function 'iqs7222_parse_props()'

drivers/input/misc/iqs7222.c
    2150 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
    2151 {
    2152         const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
    2153         const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
    2154         u16 *sys_setup = iqs7222->sys_setup;
    2155         int error, i;
    2156 
    2157         if (dev_desc->event_offset)
    2158                 sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
    2159 
    2160         for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
    2161                 error = iqs7222_parse_cycle(iqs7222, i);
    2162                 if (error)
    2163                         return error;
    2164         }
    2165 
--> 2166         error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
                                                      ^^^^
This NULL is dereferenced inside iqs7222_parse_props() so this will
crash.

    2167                                     IQS7222_REG_KEY_NONE);
    2168         if (error)
    2169                 return error;
    2170 
    2171         for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
    2172                 struct fwnode_handle *gpio_node = NULL;

regards,
dan carpenter
