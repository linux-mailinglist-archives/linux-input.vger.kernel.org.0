Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292CC3BA8C0
	for <lists+linux-input@lfdr.de>; Sat,  3 Jul 2021 14:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhGCMq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 08:46:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19828 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230196AbhGCMq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Jul 2021 08:46:57 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 163ChUoD018817;
        Sat, 3 Jul 2021 12:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=IAX6PwYW+nmfpa4h14cEFFUFcKqwZnB5EtEWZWI5Ox8=;
 b=YnH0EhssIfvj7fhL33YkYS7md5zlf/skr3mUiyp/JdKRPIFV+BxUyyrZw0kNwG/5l9C6
 MYT+9o00JwUrMOgVTybA8rAgwY+EGbC8Axe0c2Y2qN+DKmIp4gQFEIYyFo3o16XXu96M
 hWItarLkJiTslLIDFKCGbtOO+d2I3AKKsMtMeiDOujPjwQ2AH1FnP5UTrPuPimZwmW00
 26+VWdd6x0K1RXtmtGJw0J5qRHZIA7j87H11+KA6ZFIZOiUtSnLiWstX8eLns61mlct2
 ttzoQ86ofgJ6aM0/6eQ+iNkhtuQQUQqwcDs8Y069jq7iXKyPAhslE4oJu57JBuDm27s+ EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39jeg1gcpf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 12:44:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 163CeG4v044039;
        Sat, 3 Jul 2021 12:44:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by userp3020.oracle.com with ESMTP id 39jf7knc62-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 12:44:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn6TpVcga2S6uLwWdkYNgvluG+DS0WTkzwHiZU82pzPj4TPIV+uPBzDcLR6lEBz9hrteyPz4+yqCMWBYUhaIQRSVeuhuYiT6EqQh/z5hrapwHLF76KMhQR5gqaJ66HkA24bIhKUckKfniSzc754Et8cX7SQZyAM/yLCYYgbF7BsqSmSUgdd2Siz9v6v3SF84YB85IzOgia8JUh4fedjeaZeNzHMArgJLjMCtfsy6SeZQQGZja0iOz8L3ggMlLvrJA51DZUprYdFApvlH8Sdt1jQrt1BFjWoBcBoEtYv746aduQmDAcVrFdNVdkW+dXAp2B6W//YvW5EyIBuj9e/t6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAX6PwYW+nmfpa4h14cEFFUFcKqwZnB5EtEWZWI5Ox8=;
 b=auztGvQmndoMAhNnacwD4gEjn+2mMxdmT34XMgOO9d6gbBxX2h1Cw1+x6WVOjtiYr02ICCveVCsb8AMW8vvNpdOToPLkkyvcrOOroCFGpD+nir0uvy5EfJ00gBi9Loq3q/dQ6uy+cCKKzSMZfehB9Wm0n2WHz6cy7x9u/K3uQFh8/FG47AL5C9MaqIaIPBnTtlH68/QdtuxNG+cDHJfL6Peo5Wx+fZnh+XfPJUMgEWcqYY1tKiITjcuLx7A6YyLdLWfHJyzOXBjm0CojCScIUXnabzd7wqXQKG5Fv5eO2lRzuNB1dovJWmLRAbZmR+C+YbbcR3CncH20J0bL02vSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAX6PwYW+nmfpa4h14cEFFUFcKqwZnB5EtEWZWI5Ox8=;
 b=jWtS5aW9Uhd4hJVfd/dyEz+ElFWpAmNEe1HCWqgDn3Jspl4uVU8wqjkPatKs9xRZuXnYVju+DNdUWVfOzdB/ZdsbaY1gQVP4UHNSCFKtCSyBebjColquDnFnPzkPLJTr0s4ksaJw4t+7t2KLEBeok5RbIOziL2l50QX1jrBKae8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4706.namprd10.prod.outlook.com
 (2603:10b6:303:9d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Sat, 3 Jul
 2021 12:44:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.030; Sat, 3 Jul 2021
 12:44:09 +0000
Date:   Sat, 3 Jul 2021 15:43:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Denis Efremov <denis.e.efremov@oracle.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Alexander Larkin <avlarkin82@gmail.com>
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
Message-ID: <20210703124351.GA26651@kadam>
References: <YCyzR8WvFRw4HWw6@mwanda>
 <1c351258-65e8-8984-8ffa-64eb316e1573@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c351258-65e8-8984-8ffa-64eb316e1573@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JNXP275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Sat, 3 Jul 2021 12:44:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd150769-e5dd-495a-2b9c-08d93e204029
X-MS-TrafficTypeDiagnostic: CO1PR10MB4706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB47063BE4AF6E02088A75DDCA8E1E9@CO1PR10MB4706.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fvski5ROw130dd3ezXhomsCMtL0gKiFwIFqdAfvSepy8HiZMeLpC9hYTdWHBwssJE0tkvbJIuKm2XB84q4zQILowbw62mzKsBJBvoeHiGr0HbKU5rjSQu4YzNxgI62VYQOStAUET/w7lziSjwBmvskxvmavnuwLaSvwX+OiK4plSwxNtxFLHaXr7+UYQoGkQM4FnD1tcYB2NHBd3nwWijudHJHUOdwQr/oKdgTbr4EuKc2h/my2ZEsHhYwsoYYQkSVdCQgHri4AB8gRadm0snXNZ6RCA+GCu11FBmp6IdxllRUDRWbQ3oODHzQJJMMiLLx5o79CE6HmQA2V50+7pq6auAvgXQgEFBNVkv9di9X+UD1g/WAj6m7TjmwlFmBbSheScD3ugU2EuV0zWxWSMNNbhqcYkaiXKLiwOm0lCOUqs4ylVoadFpAqGxfkzhsrXaGMl74JGbmwAClXO6TK//qP0fNw4q/bWs7tuukKUeaWfwb3H8DVdN2ByiG8+1vrVTtdPYgG5Yu42jJWn8faJOwkxALl92Sr37sXWqiiH+xKxre4AAl7U5PoX7I3EDcD6t+8gcbwK+qgx3USm5XIHlO5JQc1afYLw0TOHDAId9r9KlP6iDWYDLd74bWwQ0wluSkjvzP9BHYvjnA8Btd9t3JM3AFr9AM9lChE9NK249JehlYmv+xUDAJijExVfbKJHhJeKam/8z9YqE57KZ2lDdsjvse0xpztK8ckM3zBlxLaNSDQ7xdy4FZljkaLxog1fwTYVSSZkn/AtFjd7LGf+EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(478600001)(2906002)(9576002)(86362001)(316002)(83380400001)(53546011)(16526019)(38100700002)(38350700002)(5660300002)(66946007)(6496006)(66476007)(1076003)(52116002)(54906003)(186003)(9686003)(55016002)(8676002)(66556008)(8936002)(956004)(33716001)(6666004)(966005)(44832011)(6636002)(26005)(6862004)(33656002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9AKvk8c34aD6RVdDo+lXjTUrTfiCaxDXf3leH2/lwC6o0hQvvF2sLYsFDJGV?=
 =?us-ascii?Q?0gyPkFq51ItdzYCvXtY3fdIZ8RlRo+HsfoQo4Wd0J5vTCQb7AYFtbKsqS8iS?=
 =?us-ascii?Q?CN2VA2uKZGDLwYHVqtd49uTdyaQ1E8HhD6+EsrZ2Odc3AbfFHTxZqo5ZW4Ig?=
 =?us-ascii?Q?zFR87xiclYszU2tQO0SxNFQu5qDgPjeGG+r6nQ9gxVkMpmzUJ7DBRtAVxrTV?=
 =?us-ascii?Q?v172womwxlzanLZE/Jl3CqOl+FC8KXRCgOvDCabemkQHwyGSnDeh3XXmL++L?=
 =?us-ascii?Q?qMKVTF/MFmYIhVp6SHh94kyuPiV0Bl3iQtPv3EjZLnq7X/qweS/PAAuaP5SK?=
 =?us-ascii?Q?h976yce75BO47VEPcrg6R99W5of6dsxYeoMNaCfn4JTVzcDC/I0ZotWxdiPD?=
 =?us-ascii?Q?CoFcQNfp6jdPmtgSLUaqf1HbyYMJElkInKGMOwdtwVdCWR7uh+isaaI8H9wh?=
 =?us-ascii?Q?a0p4aPmddKBS1ijxOcJsXalssvExFLOPMsRCCYjYgb36K5FPP6MbWFrBsM8c?=
 =?us-ascii?Q?OPWweTtddocgwk0GrY8ln0uhHrNJXlh7varKVFE/a5CSFW+UeuV/jRhkVkOR?=
 =?us-ascii?Q?GUR1xdC7SxTQXx/LcWdJWDOQZDmYclgXkQjnoiz2xNfRSCOkhoKX2hcbdQ/M?=
 =?us-ascii?Q?wkJYltLqsGqFjuwRnt4DzXB4ejbEgoPE/p4ZYAo64YERkEn+GuXgyh9Yc/XX?=
 =?us-ascii?Q?7oZaFiSU6uds9yXQy1AGGj6UqcbJ6mzYbnar/KPmMJfQ3aqj2H1fyOZw68PW?=
 =?us-ascii?Q?uC/c0fXhxACJUhMo+nyUg4R9nODlvfKcs9pqkiJpJjtrT5O0oHh9FMGsrq3o?=
 =?us-ascii?Q?4Deo9ngzw3germbJ9Xz6dc6Dkm8zBfguhpGQxVK133bo4lrCG7bLN0qp0tPb?=
 =?us-ascii?Q?5dbYfIRWeFmX3GV6fZ/rd7zNzlaI6aYcdiSosPhc+VL7jPgClzSKtSQaYcSM?=
 =?us-ascii?Q?CoZb1NTnBhaW3WZY2xHF4Jhsu2GLwSGggB4KFYnxtdQ5UomQsuA/dfA3Gp2n?=
 =?us-ascii?Q?bP63uQcJSQy8TJmoDfyjalGJaLDZEvh5sZx4aLdWyV8nKjQdIp8jQ6/eppju?=
 =?us-ascii?Q?x3IXdu3R91qh/KzAs6Ylnqir7ZGE2WIf8wbCr3q88QkVXsdUnEgi9f7BTMwx?=
 =?us-ascii?Q?xLbp18h3wKlDlqsYRZ+40Xw/ngEdkQ5flM0la43+poOFU+1YSVwScuUpK4Ba?=
 =?us-ascii?Q?DtR3gTWJ2uF4ZZ7JNMGEErMISQvQtJPv5LiEbcBjXOkhyuhlM00dgQ4V7X5Z?=
 =?us-ascii?Q?tZcCZAqtpjIFESSlhrJWbMsKUCrBRNerCMfGIdlLV/lR3nYqLOdqGGugn/jd?=
 =?us-ascii?Q?0cH0wx6/slErGG6dEHI66Rfy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd150769-e5dd-495a-2b9c-08d93e204029
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 12:44:09.1028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTk48RE/+xV+e0kXEOf9tlaepyiZMI7AaNMdhSQGd35mCBIWKaNSGZdsx03MUCX0uTnwTNunAX/bFlDG78t1O0K97C+FNZthBJOk2IewRwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4706
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030081
X-Proofpoint-GUID: R73Yk69eNVPZbdjzrHnWNTfCd-r3vta0
X-Proofpoint-ORIG-GUID: R73Yk69eNVPZbdjzrHnWNTfCd-r3vta0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 03, 2021 at 02:20:13PM +0300, Denis Efremov wrote:
> Hi,
> 
> CVE-2021-3612 was assigned to this patch.
> 
> 
> On 2/17/21 9:10 AM, Dan Carpenter wrote:
> > The problem here is that "len" might be less than "joydev->nabs" so the
> > loops which verfy abspam[i] and keypam[] might read beyond the buffer.
> 
> 
> The added check looks insufficient to me. There are second loops in these
> functions with unpatched "i < joydev->nabs;" and "i < joydev->nkey;" checks.
> 

Thanks, Denis.

You're right.  The fix isn't complete.  We discussed this in a different
thread but I sort of assumed it was dealt with and didn't follow up.  :/

https://lore.kernel.org/lkml/20210620120030.1513655-1-avlarkin82@gmail.com/

regards,
dan carpenter

> > 
> > Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/input/joydev.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> > index a2b5fbba2d3b..750f4513fe20 100644
> > --- a/drivers/input/joydev.c
> > +++ b/drivers/input/joydev.c
> > @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
> >  	if (IS_ERR(abspam))
> >  		return PTR_ERR(abspam);
> >  
> > -	for (i = 0; i < joydev->nabs; i++) {
> > +	for (i = 0; i < len && i < joydev->nabs; i++) {
> >  		if (abspam[i] > ABS_MAX) {
> >  			retval = -EINVAL;
> >  			goto out;
> 
>         memcpy(joydev->abspam, abspam, len);
> 
>         for (i = 0; i < joydev->nabs; i++) // <== HERE
>                 joydev->absmap[joydev->abspam[i]] = i;
> 
> 
> > @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
> >  	if (IS_ERR(keypam))
> >  		return PTR_ERR(keypam);
> >  
> > -	for (i = 0; i < joydev->nkey; i++) {
> > +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
> >  		if (keypam[i] > KEY_MAX || keypam[i] < BTN_MISC) {
> >  			retval = -EINVAL;
> >  			goto out;
> > 
> 
>         memcpy(joydev->keypam, keypam, len);
> 
>         for (i = 0; i < joydev->nkey; i++) // <== HERE
>                 joydev->keymap[keypam[i] - BTN_MISC] = i;
> 
> 
> Also at the beginning of joydev_handle_JSIOCSAXMAP() there is a
> 	len = min(len, sizeof(joydev->abspam));
> 	abspam = memdup_user(argp, len);
> 
> Maybe we can call min(len, joydev->nabs) instead or even min3() and
> use only len in the for loops then? Same for joydev_handle_JSIOCSBTNMAP.
> 
> Thanks,
> Denis
