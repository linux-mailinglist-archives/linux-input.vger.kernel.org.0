Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5474B9A2F
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 08:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiBQHzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 02:55:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiBQHzh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 02:55:37 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8965E23E5D7;
        Wed, 16 Feb 2022 23:55:23 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H7rquH002490;
        Thu, 17 Feb 2022 07:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=hyhDdS2v+XlYc8c8CVWOXNriSx8K2m8nD2WWpyc/n90=;
 b=pXWTw2LOKe4Agxtl9yDdv6cjiwiBE77p0pHB/fBKE5nNrmOzcg8aW3JiHlwbm5TTcTVz
 wxzPLBdULaUiKAjS/sTtdeC13ido3FVWDOmn5Jvv+KHW39/++/XTj7lZoh+zMtfn8nu4
 pHVs028X3fnfhM1L16k0ZjRVvRRqdmZooFh/4H8gBEu2swM0kCh0MZ7AuClIZz6eZ+Gq
 wCWjD3pFDw+0PdmavdaAtzMNhl99m7rccNw6lL7WPzAG1b++tlnzhdzvEW5lWuQjA8e9
 L4nuAMGHFC5g4JOHUGX7C9ctr61OsKfgg98qt72XqEAIQDde5Q41lP1OKbXOCzBUoX1v uw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e8n3dvvqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 07:54:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7pQjQ160759;
        Thu, 17 Feb 2022 07:54:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        by userp3030.oracle.com with ESMTP id 3e8nkyquc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 07:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceT5yGWQVAygZ9ElXj5AYm3qW5z5jR7IHbYrjJAakAivIXFnAouURWYGxtI6UhWr0DLkcc3Ifeh63HWZrF/WLzW6gvYyHXWL8qoITr4R0eDSCHvc7ykkSKYGup3LWPJiG59bM/Tt2yQDZOfVUSzDSgve8hZTEQft2495cTAS6wY9ucoJVTdrM9QQIDnGq2jnqr8Dqr7+025UbPZfGENUOFnEheQA9YTI7OC0ngKG/bjwvsDYBMEFFY/jsXwKftQ4DsTx/+oT28nKdWxJmQdki2UhzrYfAWgSwYV4VZDIWez3Y5fvUeOwKuPJSfDeclb/h8N3+lcsAT3USYgvSBcltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyhDdS2v+XlYc8c8CVWOXNriSx8K2m8nD2WWpyc/n90=;
 b=azJnQQOsNsgJv0dOZtdqbTcGjcbOU2DNJZi1XpCxSKP0f9WXkHYvDg2wmJwHn3jhmDTAcb64A4AUQaoTlPeDWm5dsmt5sapHNAffB+Csa/y8k8JYl16kLZd7nfw6AbyIcJWoFhB+QZF41u19Yg6GjNSWWb3ZM1L+N6DPLiNRqrvEaNwzDwltK+N7KnvlOO7FRm/BcAyaS8yEWVi6MAs26pe324HwxvUXEFYk/HnI4mZc1QglzjkSLipUSSSfc/54pIgKnsOERPR8gtFomBygoMdAah8Kq6HQplIO7VNBAKIneJRctSPenBjrmvAOTBn83zG3mairGCmgt3lnvSo6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyhDdS2v+XlYc8c8CVWOXNriSx8K2m8nD2WWpyc/n90=;
 b=DRxnmMN0abKnckxILMpK/qLamaUB7jAWwdXb/6jEZdXzxMe7pbuCiKm/si2OsjJDH0nYPG+jFUGZ67773tebqZv2twrwkBwKNY174rhVzJJz+knGx8y9vw2ZjZoymvZmoUDMZh/UXtabuEQvlbZxtOx76jJ3pc6EL5tsfyddZZ8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3260.namprd10.prod.outlook.com
 (2603:10b6:5:1ab::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:54:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%3]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 07:54:55 +0000
Date:   Thu, 17 Feb 2022 10:54:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <20220217075436.GA2407@kadam>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgcSbUwiALbmoTvL@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95c86976-a253-4d56-c816-08d9f1eac94e
X-MS-TrafficTypeDiagnostic: DM6PR10MB3260:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB326099C0B10C0F5ED7F7527D8E369@DM6PR10MB3260.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sDehbdX6jpw0FkKcGCkLJYOsAs2XwF/XWJV0y8hteTVe+j71xmcxSJxNOZly8k5KULq9t8fR9aTcaI14rGDGfqkgnXMsipAMVUcd7A6wGzfjPsHFqIQkkvmtX3SSxeUk8B0XRX7NcqcGujGdISpnO7RUyT0KBDEcwTNc6dCoRqjyO1X9jl7XWAfSJUF+V4x3gTkzX9Ukn2jwubGiMRbMb3LkjWeos+d4e6yiaj1A8kU5u/cIqSR3yN9iTUMK2RHtsLUNC0uuBDNxWuGhLlyAhI4RVYLI0/RfK3RCTqGxkRE1x7NHLkf7t2smMpgvpZKg0CGznO2aywyLQzb4BR/fw7E8PjuwZmyh9VZSLbioWHa4AIUP8SBubVRgbD+PTk6UkjxMlq5Cr3FLtwsiqKFGCbTxSjDP43bEt0Qi58kf/cuX7tR/Bmzpzj8PkNruqrZOus/vkSFmBrHBovppG4ogknu5k9LPHHwP24i0hYWDvgCDmQDZ8mjb7KkGJfOaZD65SJ2t+essIOH9KkYXw/KbNdZbXa8XB5yPSk4gPkEfzNZM6IcZ6pXZctS5g7R3dkyXmd4safoX6/XiCiH55dMwUsm4A1wK0UrSuDWjfEJ/j7iJ8aQR43AsdkZ2Vt53Fee3MaCv1BYhQOgD34vXcWga4wu0dBXS4DAI0Zz5+Lzp/MeRAMkfPeHu46JFJ5DSsGoVBkMu933/pC06BzV45gUfQescvcsvShumRKV5DVj0i1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(52116002)(33716001)(26005)(186003)(6512007)(5660300002)(44832011)(6506007)(38350700002)(83380400001)(2906002)(4326008)(9686003)(8936002)(86362001)(38100700002)(8676002)(508600001)(6486002)(316002)(66556008)(66476007)(66946007)(33656002)(1076003)(6666004)(6916009)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9PnKD0HQLr//eqFIbnI6WhkufC/hasheMSQf7xqwgeHxkes66PtL+RL6EKz?=
 =?us-ascii?Q?V9xhWaaRMFaxtGsOJeenTg0Z91wlA0MepuhMZ+Wm63bnd552fdr4Q9b7dI2k?=
 =?us-ascii?Q?k1ajItM0Zf21ekoN6iQgIDWOLRCZ3Ni+I/naazU2/oO2rQBJsiGZu76fInsU?=
 =?us-ascii?Q?NRTyhN+RjKBRRXt+1UpHyoFbSikXORAFnDKoYIXsXfYzvytzdex3E8X2vKwx?=
 =?us-ascii?Q?8gIZzxNJWA0ThC6NXusr4JzZRf47D0xiPitBJSsZ0Eu40c7bw/5WvPqb6K0u?=
 =?us-ascii?Q?0KZ4OiG+h+34jPz2+YpYzYBsHPhZ8feDEq5goUV8B1yeHhKR9wu/5CFJVgr1?=
 =?us-ascii?Q?EBjaOIJxlJP4Ja08XHSImEZ82IQEgo5kM6bCuCsbQzCKsltgYXRGoHPoGsrR?=
 =?us-ascii?Q?eS7x+nZvPqiaNViC7DWgzQ3/8CbyGl+345ylDxWrT5/w7SqbL5FfdeGVi8wJ?=
 =?us-ascii?Q?YpGkWR62kYqALcL0v1YO2+nvyn0EscvD5RHjJByd6EnvKO5HRmVs6gArpZfR?=
 =?us-ascii?Q?TIwodpHsJk2clj9l2ZXn2Adh4iX5pOCO708TIrfedBQqrm30Q2zN21QWpvKP?=
 =?us-ascii?Q?3Bzyi8CxkjVERcV1NvTXguUKsIJSMUNKXNvLanDX5wGG5YQFDbrJ0TY+074N?=
 =?us-ascii?Q?VDTuYfZZK5vzSrpVKq0XFO3Cglh3E/No0x+TBeCr++a2v56+hK/yBTtzDt2x?=
 =?us-ascii?Q?4ueqIcFdKrp2dBCmP4cPDjpKffd9od0lR/bQUq4HqYAki6ExqZ99t0JMJj2C?=
 =?us-ascii?Q?ndJKyi7SlscayrdxQyOS39t1VAEkTLYSBczxzpEG2NFtIoBoB+hepEP6G4Yh?=
 =?us-ascii?Q?JuaN3+/RkooYLdL/+awoFxDSt+8kZfF4zNIQC/n5Swg3nS3MVtZCCfvOVvt0?=
 =?us-ascii?Q?IGKmDYgRGEiMjUBixHdL3zEDHSwXaqdwTs6QXIC88yL0yksT32iwgralM/nv?=
 =?us-ascii?Q?2147eXVpc7QFcDw5Em0waJJpTb/nURjPSI0899i40RrQ5rcK8pVfDQtIePcr?=
 =?us-ascii?Q?6q3kl89Z6CyupSqr1FiMfUtylPwZGT70Hr6F504pk4z0eRU9vkK63SL2jXDM?=
 =?us-ascii?Q?WksjwvTXo/SEfklH/C5OW6z9Ac3mkM9S77Q2j3eXc1zkkVGfPsKtuwqFGy7W?=
 =?us-ascii?Q?+sT0Fk/CpcRt/GlYXAIld60VbfB5mkdVZFanos8wSNsu14pVlfGwGRGdirwm?=
 =?us-ascii?Q?U7DqLJ2/ByS13X1YatTgEsscI8991PJ+GR9TVKmTuJKJbORPMuK+xD6pimhq?=
 =?us-ascii?Q?1BKjrb9rbjxdGEuNa5teQw7v+aa9ckUx9LEORfUs88UwARkhKvXcaipy2ZnV?=
 =?us-ascii?Q?mIGIllHypXCIaitLWGQa0PL2F9r49pCe66fHTwDEt1J7n3dP2aMIKyCWWjkp?=
 =?us-ascii?Q?ckgEnjIVj64iQkMrq10mb8/PWhVfiixNM+4/QrZP6hJFFT3kxBwwiY0k3ZG9?=
 =?us-ascii?Q?yvPAKdlLVP94n8PfQ+kk3ynUBFhZBCW6gLll6+zXXEfITlEf1Sh3dpvve/gY?=
 =?us-ascii?Q?tkka2b+TONf3hDYivO02jUHAEkb+zvFEp5PkwHCaVOopaS+IH6FHCBhU92+6?=
 =?us-ascii?Q?kr6BAcalkgvJ+zlD/YzoFe8aE49f3o/w5BYBs1ISRSAmpwF0hsOQG39SmLWI?=
 =?us-ascii?Q?RFE3RpfRvXzhkt0v6PbkxbIzVj5pyITHp0NPC2ioRmWAQmKydlgPP/XNVaQN?=
 =?us-ascii?Q?FFKMLA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c86976-a253-4d56-c816-08d9f1eac94e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:54:55.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXoKK9ZB3WVuO3/2vnGhm97HBCbNCK44M8L2ZYatKEysxYlrZwXPSiRzsFyZ7t/Mrnf+CFQHVUjMz4dG7QtvkSd0sD0FNIeAgxvg3JYBup4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3260
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170035
X-Proofpoint-ORIG-GUID: Sl3GOFp6_BC4V5nEjcfj5sJdg1gz0IhH
X-Proofpoint-GUID: Sl3GOFp6_BC4V5nEjcfj5sJdg1gz0IhH
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 11, 2022 at 08:50:37PM -0500, Alan Stern wrote:
> Syzbot identified a refcount leak in the hid-elo driver:
> 
> BUG: memory leak
> unreferenced object 0xffff88810d49e800 (size 2048):
>   comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
>   hex dump (first 32 bytes):
>     ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
>     00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
>   backtrace:
>     [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
>     [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
>     [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
>     [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
>     [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
>     [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
>     [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
>     [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
>     [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
>     [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
>     [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> 
> Not shown in the bug report but present in the console log:
> 
> [  182.014764][ T3257] elo 0003:04E7:0030.0006: item fetching failed at offset 0/1
> [  182.022255][ T3257] elo 0003:04E7:0030.0006: parse failed
> [  182.027904][ T3257] elo: probe of 0003:04E7:0030.0006 failed with error -22
> [  182.214767][ T3257] usb 1-1: USB disconnect, device number 7
> [  188.090199][ T3604] kmemleak: 3 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> BUG: memory leak
> 
> which points to hid-elo as the buggy driver.
> 
> The leak is caused by elo_probe() failing to release the reference it
> holds to the struct usb_device in its failure pathway.  In the end the
> driver doesn't need to take this reference at all, because the
> elo_priv structure is always deallocated synchronously when the driver
> unbinds from the interface.
> 
> Therefore this patch fixes the reference leak by not taking the
> reference in the first place.
> 
> Reported-and-tested-by: syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>
> 

Alan, this bug was fixed a different way in 817b8b9c5396 ("HID: elo: fix
memory leak in elo_probe") so now the two fixes lead to a use after
free.  Your patch is more elegant so we should revert 817b8b9c5396.

regards,
dan carpenter

