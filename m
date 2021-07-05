Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4968F3BBB98
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 12:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhGEK5V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 06:57:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3818 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhGEK5U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Jul 2021 06:57:20 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 165Aoism029967;
        Mon, 5 Jul 2021 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Y9EHETFA5HI8GtIzXM6TJaKtot31MBWUD2V8slHIEyQ=;
 b=iCL+VYvonL6TVjv6v8Yan3y1WxVPuNHeaHIQEmyHwvI47pbwWEu87swH4WusaNLfSAcm
 /FqD10UX+ieOnFDLKmF/lvCMjr8dQ/AbQ8e5RcguYcSRA5bD+pv7DYUyi1ONNk3eLESs
 6F5IiwAt6EXzS2VRopzVTziZ0nL6WlP2MferQodx0KtzXhOT6U6aTvSC9Sypfd3jIeCT
 hHYrhWxPiKNNNz7tHNbZJLJSNZFKgUCrRL+W8rCYx/bfOXXLf1LwWmgiwbedQ8vwxT6K
 9h0sWTHWRhP25RTPCqTAEyVjbXuZZNFiD2KVGh/q3zyGuwxmw5xJjzTIcesXKI+/3HKn xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39jep1jdh1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Jul 2021 10:54:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 165AkCe5098939;
        Mon, 5 Jul 2021 10:54:40 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
        by aserp3020.oracle.com with ESMTP id 39jfq6k4ew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Jul 2021 10:54:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5AIDDGZC3pGPzyzyROkPEkXg53JZAo388I5QQ0JEWxQK7sbPy4ljYQ106A4rMvdT3Qk6/EuqWhKISxMOJbde7EbI+fa4Dpn2xKp+SFTQUjOxhRzz5tDQL6xuYEPEsPq2RW1hu8KappN4E/nt5xqcSl6PnHXux9DfCg4F5UvI50L8IxiCoBycxGXqMrTG6SIUkAH1f/eafaOsZ0QckZml10jQ4ZwuafiSsisYmaSOf9k+E7tYTmCVi0jfNKpCNCTbG1jATCM1L4Poz8j8YPt/I4GdvNNJNyBzKh/PmzGtzTGk7jhQznp/v7VzJ0HQthDKR7RVXkjAVCHZ7oLE14ZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9EHETFA5HI8GtIzXM6TJaKtot31MBWUD2V8slHIEyQ=;
 b=UxOe21k8A8SY9XjICQRUht5UHNejsKf8lGO3Ac43sy0vTiAslgPMnpmLz/4yNjQ0j8E7JpdvGg4gg9Q/afi5FIKoX8+v+O0/uxo5AiOAJ0c90devhzBdpRsSkImxKVvn22bcOhBRz5AFqwtOfn9fBo4AKVcOKBiR/JnH5LU9bi8sf1OiWsKYjsND7Xie6bE9Un5ptLgTDQrB/6m5Uhdtcb6n/zbSPL2KQfIBYWgqUNARxSTyi6R8HUvTXqMjmNNyO6URWE+dPW3KlUqFUXsejjT6nlRkIO23BwXYWlaXcNCmX7FaokNc33qXuPWU/SSE7x19HLSXjoCLjsCM/Ud35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9EHETFA5HI8GtIzXM6TJaKtot31MBWUD2V8slHIEyQ=;
 b=HR/8yICoDfzo4p/dhKSYh3Zdsohknl83JQ/1KelgySHgHKvuY+TrD0oST2tb8OFp1uFPwOZCmhaiqW/EpI+5R0j1lkh3oJzk9A6QR4GGlV+J7bNzE2V1WPpfuInyjoqcCAYzJW9SkKVvKqo1MNPSddZj0xS1pwX9UaZEFll3F5M=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2366.namprd10.prod.outlook.com
 (2603:10b6:301:33::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 5 Jul
 2021 10:54:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 10:54:34 +0000
Date:   Mon, 5 Jul 2021 13:54:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Denis Efremov <denis.e.efremov@oracle.com>
Cc:     Alexander Larkin <avlarkin82@gmail.com>, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org,
        Murray McAllister <murray.mcallister@gmail.com>
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in
 ioctl
Message-ID: <20210705105414.GG26672@kadam>
References: <20210620120030.1513655-1-avlarkin82@gmail.com>
 <87e7ac83-4188-662b-d5ea-60957cc754e0@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e7ac83-4188-662b-d5ea-60957cc754e0@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JNXP275CA0036.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::24)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0036.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 10:54:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f37a06-61ac-4a65-251f-08d93fa34648
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23660D2C05E07BF57AD80C6E8E1C9@MWHPR1001MB2366.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Y/jyR+EfuodVi6u9hQenuG6XvjIKn19q3uvW2i5RmwH/FNJJ+jdi78zvxym8ATNv/EbB7BVAmsrB8203pIntpPgfjvoxXcP42rMihpj3QtK1M57Ibl02hr35jZuHW+kKFZi2cPeGDsIOZdPwReNPU8PIDE+ZrLphATFxUAE5GfHC7XBma5kUYYIDCGeP5XoiRaUZzorOKNpD0J4O2NhcXYMvqw+iVAiiEqTAlQyqN2tqf8CY6Qdr37qWHKiX+eczKnJ6ZdC6tNS5OqXS2iA40lOKukZoN1F1F1Oh2f2WR0/9URcwVxzVtsaxvGVR6nNNCmmo3CraYbAhVd1fq8WJibGH2541xLSOpU7H24dU4zdf45o+/Tw0Vbd5EvLPd2i5CDaml2TRgkl0yhK7QiPxSv3xCbhMngws6/dyzO8omIhxztXycoOjGx99X0mcRYUAWGvmOyj+ekiI/gfdxWS1YpCeE7Ws1bi6JQk12a/HQTYusdZNYovudWtDPYhK+vxIrVobgDO9nMo9MKn7hmW2gMKJmjlcyOep2EsoM3JjQlCrCvTe2S3TmPx4Us0c7sQxTWBQUcTptIaykuIXF6wIdiMnsz21EiEMiF+FbOegyvfDQeeOtZIIy9U7A2BnFiosJP6qyD2JicoJqIH18m/jcuBH5iZmDzJycjC0MSBzLLYDsNw51OceqEBIKPTsV4UE3jNa0sxgLBqRVf7BLmdHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(346002)(396003)(376002)(26005)(44832011)(8936002)(38100700002)(66476007)(9686003)(38350700002)(53546011)(478600001)(33716001)(6666004)(55016002)(186003)(956004)(9576002)(16526019)(66946007)(54906003)(8676002)(83380400001)(52116002)(86362001)(33656002)(6636002)(6862004)(1076003)(316002)(5660300002)(66556008)(4326008)(6496006)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vHtlPIBLn0K9vXO4W6/67VfPbLcrfsKO/E977Wn+/lrEgHhLKlhQEXBy6Zbm?=
 =?us-ascii?Q?oMFH39aaAj9y+1Ky0Nbt8rKVHaCAYyweFxzDrAOQoXpEkixckO6Q+F4/LLwa?=
 =?us-ascii?Q?M3X3SAtUXrZ0XmdxQ3wfKnxzi3bsrYtYQCcTqRBnW8Zl+a9wXJXQ9gK/4QTn?=
 =?us-ascii?Q?jx050cIRZHw/VOuR3I/l2itghA9lYlLs0Bri5ApCjlFyUHfLO9EZZIe708Yf?=
 =?us-ascii?Q?LPfFtf69bAMHe54ffpacySIH8Yv3D55ORI7FwQzQfpwZ4cdo5oKW2kHjxtmF?=
 =?us-ascii?Q?JMDD3R1ENqAIjqar+qGbb/lVPK+FCaO9w6tJQ7Ink6CosD3VnTrOJ2ZXnj92?=
 =?us-ascii?Q?bECbGou11igC71v3t5PJUTiM2fjLnXLvkTvNT3jqO7PxuD+n8kKRKsEC6+jx?=
 =?us-ascii?Q?fhyXCg8R/lSnvp2jgF/U0pfrvyXMQtYwgShRPyZEJpCz6Njfu3qAlLaWGFkb?=
 =?us-ascii?Q?E3RsUi7BadeyhwDOn5Dp50QrW41PvXjNv0ab1t/3VLtren9rvO0i5zKNeRfY?=
 =?us-ascii?Q?MseL29ZMrXw7GFCQcympLmrOHc8/8oHGnHAjW85BmdRR58yULXovo4bzkzMw?=
 =?us-ascii?Q?m+Kfr45uzVWhF/QRQvfu5PYsCWHYogpsspCijPcVYlhP3iOBWVfP853CQhaj?=
 =?us-ascii?Q?BUr9IHFGcCfx9b7AW5Hw8CUE4d5nYBKPPP38UfRMs3CR1A6XyolrqlZddS4a?=
 =?us-ascii?Q?jYar7fkoTTeDiSoni0M1tBTLYMZ/odPOMICuj8NTnr2zo6dSNxRUU84Hdb2C?=
 =?us-ascii?Q?ynUBB6I6yyreQN7tMVEMf1UEksSIvyIGSOqcacmsexAX3J3OJpDrJp4HZjIc?=
 =?us-ascii?Q?q4K0fVnTxGbHgcvmNyTavU2toUmrq3HQZQLAz0TyWDz4QnVP2DO1IrTLd9oF?=
 =?us-ascii?Q?036fVXX7dbBV0EmO4VG7qIUNqZE5Sme/gUmdoVBioXxS2OROc3Ese4+bdaby?=
 =?us-ascii?Q?2zYbQZDYO8OYh5iyY8rPp0GVBjQhyvFuOz6qhyisvq6Xiw4sCeaQg5wvCw1E?=
 =?us-ascii?Q?Q6BLhYjwR2krV4vzWlJ09pug/diEgun7E4IFXGwgMHR1nZyJFOWY+/1w0aMl?=
 =?us-ascii?Q?nI3zvsjR0t7fOb2dBsOr5qT1xSgi/csVpOLE3p/CfJu/+aTYbX6G9zSisFdg?=
 =?us-ascii?Q?zIW6k4qv/gEyPILqSegNC+rm64AN8gyW7Bh0l/LyFIJRWYwZlyptmUU0hs73?=
 =?us-ascii?Q?mvtBpjKvG43ebBvT9Ve6YukaoJvHYXCFX5kl8vLhxmG8lNedh0w5XleFYSIx?=
 =?us-ascii?Q?CCJdwUYPm3WRDx5A+4xKB1PP3ewPv2mtHY4AGM0YM7XUc7fSfbf+ZlcR/mQu?=
 =?us-ascii?Q?r1lyRa16Ug2NGkqOOxg5mR5y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f37a06-61ac-4a65-251f-08d93fa34648
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:54:34.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGENDI/DZQPS1SzRGoIi2G8CbN6kTWFuhJ7Nu07atOVbyguCDOO8pNmPbolC0dep6bKHjN9G/EEOHBsC4mGxAplOAwgXqw4mnhOD3FMYqZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2366
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10035 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107050057
X-Proofpoint-GUID: mToUNsDWubXcH4hRiePO2bn4VhLUFao7
X-Proofpoint-ORIG-GUID: mToUNsDWubXcH4hRiePO2bn4VhLUFao7
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 03, 2021 at 07:21:58PM +0300, Denis Efremov wrote:
> Hi,
> 
> On 6/20/21 3:00 PM, Alexander Larkin wrote:
> >     The problem is that the check of user input values that is just
> >     before the fixed line of code is for the part of first values
> >     (before len or before len/2), but then the usage of all the values
> >     including i >= len (or i >= len/2) could be.
> >     Since the resulted array of values inited by default with some
> >     good values, the fix is to ignore out of bounds values and
> >     just to use only correct input values by user.
> >     Originally detected by Murray with this simple poc
> >     (If you run the following as an unprivileged user on a default install
> >      it will instantly panic the system:
> > 
> > int main(void) {
> > 	int fd, ret;
> > 	unsigned int buffer[10000];
> > 
> > 	fd = open("/dev/input/js0", O_RDONLY);
> > 	if (fd == -1)
> > 		printf("Error opening file\n");
> > 
> > 	ret = ioctl(fd, JSIOCSBTNMAP & ~IOCSIZE_MASK, &buffer);
> > 	printf("%d\n", ret);
> > }
> > 
> > Fixes: 182d679b2298 ("Input: joydev - prevent potential read overflow in ioctl")
> 
> 
> I'm not sure that this is a proper fixes tag. Seems like the bug is in the
> code since the first commit (1da177e4c3f4). Maybe it's possible to add 2 fixes
> tags just to notify developers that this bug is older than a 182d679b2298
> partial fix.

Normally just setting the fixes tag to my patch would be the correct
thing to do.  But in this case, I didn't get a CVE for my patch so
scripts which determine if a patch is required automatically might get
confused?  It's not unusual to use two fixes tags so it might be a good
idea in this case just to avoid any confusion.

regards,
dan carpenter

