Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316743BA976
	for <lists+linux-input@lfdr.de>; Sat,  3 Jul 2021 18:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGCQZu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 12:25:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35768 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229492AbhGCQZt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Jul 2021 12:25:49 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 163GBbTo019601;
        Sat, 3 Jul 2021 16:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BG1FbOd1mqavfhohh1lhNcCMdlJXSrusr45R6zkpPi4=;
 b=JhRKrI+9B1t6AAqUYOC8ZLgCti4dfkz0Axh32KHKNgku+PoQYv42eiMHyOs7xrnLZLRx
 VnZxchVdNRD5mz71tLpeJQzxk4UuVQ8byG7+2ncva/u232AyjL/Jub2J7xx+nlTrXO+g
 NqQ4aHcgYOoT0uPalti55FlEy7PBZEC8DsbrXaKk7a6KpjSpTE7ZzM+kPCE/vM8BgZ7i
 K0+GCTSmAGZyxeVH5OWPcDBUo7Dsi/a1EYCqbRYvcvu9o73s99PBZDwMGmqBJvDLxPMv
 Yh/SWcr8GzBZCmQtzc+ve/kc/3qqXlHSSCmER9x6Cf54HunbNkhn7S7Iy65QFeWthN1K vA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39jges8f41-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 16:23:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 163GAJ19123044;
        Sat, 3 Jul 2021 16:23:13 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
        by aserp3030.oracle.com with ESMTP id 39jdxbwkyn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 16:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+VIklKMK89Ng7Oo/hCIn6KmuyTJLVLjqmFUj5Vq91vL6loHszjxQO8HrJpR7l7ij30REpLakeRD4O1WrJuxz/3IbIM1mlstRtUIhK2Hy5rgR2dO+2yHl8+UJ+f/h3uzD9LCIiGpcxXvL6Prhv6TYqW4oFd6GT2rJdB/bI/vMLNdgSmQmdrtwN+IjhRyOSZdXPfu4X69tT4YmAJ+0uc4ubls23U9Z8Py1TIPfIQfIeXFi3rHvLzWyasQbdW02Y8hbl8Ho3dhdAm5gCCyL63ehPfrTBU02Dajn3UB8KNtjLWPG6EeGCFb+T9cS6rWnv4aCRaoR1mIpOGrXfu44LMRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG1FbOd1mqavfhohh1lhNcCMdlJXSrusr45R6zkpPi4=;
 b=CisyG+LD5+40jD7szQBW4SwUiXuN3BK6l6BZxJpnJLbRStdKxvpefvsHXegJtK+Yk3XGUUJov1cnXdZAnawCX/oxRRu1wsmFj15I6DS2kmITTMVzBZS0y5FAQK6Gks3CdaaNX7cUr/IxoAZdop5y8AhkNmWqkUL0iJf8skwr4dCcYCquA+5pt6IcA8H7twp+lXCVWnvmdPvgtb43MWV6rJxdUBGYlu/PiaRvLH89teaeTvIKq9T3EFFW+ZuZqyZ/ure6eGKv7IMRn9wye4QKzCTfCnT31Blt5au2QFtXNpz0RXCF2K22WEpjPPItKlu9YgZVgqvEcr9A3hmVnR0MnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG1FbOd1mqavfhohh1lhNcCMdlJXSrusr45R6zkpPi4=;
 b=Drji2w7DP+WSi8L1BA2q2dF3A+kNtVu8ajbWieqZKuiLat4baaPu3AQzPWh0dWXgzpWTSgx2xyQg7Sy/hDMlXIEa1d/Z2pJdVUMAK55RxmniG3Ene32Dh8MKRT/fWu7dnuQ5rJ5yZhc+5AxFscMBuDfZxxS75tiyTd4QwUhLJN0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4627.namprd10.prod.outlook.com (2603:10b6:303:9d::24)
 by CO1PR10MB4753.namprd10.prod.outlook.com (2603:10b6:303:6f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Sat, 3 Jul
 2021 16:23:10 +0000
Received: from CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42]) by CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42%8]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 16:23:09 +0000
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in
 ioctl
To:     Alexander Larkin <avlarkin82@gmail.com>, dmitry.torokhov@gmail.com,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org
Cc:     Murray McAllister <murray.mcallister@gmail.com>
References: <20210620120030.1513655-1-avlarkin82@gmail.com>
From:   Denis Efremov <denis.e.efremov@oracle.com>
Message-ID: <87e7ac83-4188-662b-d5ea-60957cc754e0@oracle.com>
Date:   Sat, 3 Jul 2021 19:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210620120030.1513655-1-avlarkin82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [188.32.236.56]
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To CO1PR10MB4627.namprd10.prod.outlook.com
 (2603:10b6:303:9d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.68.32.40] (188.32.236.56) by FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Sat, 3 Jul 2021 16:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1841d116-b678-43ba-76ce-08d93e3ed8b0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4753:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB475371365BE4CD28C7D5018FD31E9@CO1PR10MB4753.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IbizaLHR91NLKiez4GQVngNjtHDQozo5V9yQNvFB+TcrfMpO0G1f5Wkga1YL4QsXB/xE0ZoKUYSawDF/D4/wN1XMvtuW/tjBzqQ22afcKhlAzdR4nFzr6RC+KC0lr7AqcMKMIbRFdL6J0nf47LSBTs4Wj0F/PFtyTdW7tRAKCZg+HCfDtKrQr/spR3P27QULweuOlXd6HcWTOFcxuoq70V1FBHyAAINa5bGCB5jnWbqbA2CbD03qPwJg3tQ1EpnSm/iL5LeXSZl++vp1i/Y7RmMIQThIJ6l2hAcjAMXIGJvWSaAtD8psGV9cdkU6EpqIfWW/VwmCbwvO4Pxgx2CY2GyYQQTMxps5cbcWP9AP6h+M7F3iL/W7IomyFBw/fgQ41+arQ5+JbZiROQiEAQ/S1ztLMiQ6L4X283YC97LvxK/bWfBcBH8NRycvrm13yHjGWfrH441RCGPIsKZIwkezugnmi91XBFXqLvjFfwJzbkXfi2nPZcJ7HBdNPxY+ENER55y+84DDPgkbyy/GGmFNPSPqDQ38wR3oSi438NyCn9lzmSmIUzaWeqJcIERUL1vZ5fuhAtBl2qQFUmX4GmSQGlHBBojsxw2FxBsf4Y3AzDyagnwGxHRVdOH682Vjk20MxSU5vei5R5/APb+DC/XgAdE8Rsg7Kigk/FtYoprCOICujwmcLcjHqiEetU2FBoXTYslkfuUtUslTtIc7uS6OZUjZ0vYme4QBuhN3cd9c26A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4627.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(53546011)(2616005)(2906002)(956004)(6486002)(38100700002)(36756003)(186003)(4326008)(83380400001)(26005)(16526019)(31686004)(86362001)(16576012)(8676002)(66476007)(66556008)(478600001)(5660300002)(316002)(31696002)(66946007)(6666004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9Nckc3M3BLbE1tZGNYSnczcldFNDFrbGdiVVhHWDc2OExYLzlvblliSzJt?=
 =?utf-8?B?OE5wMDRjWjZDd2tuODhxWE5yalJVNURVUWIzVkx3Z3NxdVZqTjljaHVkQ1Aw?=
 =?utf-8?B?cnlXMlhreDVGNkZGUDlBYytxaFVNbGRLQThJZGhMdVliWVJIQnMwQjRZSVMx?=
 =?utf-8?B?bER2dzlaR3E2SFdjYjJBbG5rMUtXcEdsT3M0K2srRi8xbEZZZldwZnhPNDZq?=
 =?utf-8?B?Sm9teXQ0REtkSXNXTGs2VW5xVmcvblQ1WG5FWTR4bjNCR0s0QUswNzdtNlVO?=
 =?utf-8?B?RTdIMEU2MFl1SDVnckJ6eHlEbzBGbTNmYkZ2VHJRRGxTZkVCOXNxdklaQ1Rr?=
 =?utf-8?B?dFFBejVuRjZJMlcwSWtzemgwdEQzUXEzQVdqeERCdEY3c2krVGVuRVlrMllx?=
 =?utf-8?B?YldIeXZpNUMzNXg5RTVPL0pYSXBVM2h6emQ5YVVZTmRhVW93NXNlV2tnUUt0?=
 =?utf-8?B?ZmZaZ201Rjk2R0lHeTFKMVA0QXJmMnRSZ2NidlFOTUZHYi9MelJQMDJ1Yi9I?=
 =?utf-8?B?RTNmUmd3dXNZTUVPWDNpaGVCVHNCMUVZNlExR1E4YW0yU1pFbHhQem9LVTBs?=
 =?utf-8?B?WGNEbVQyNm9FTkdBbzdjS0JJT1JzbWduM0h3RjdKcFVDSmZNRFoycUlWUm9Q?=
 =?utf-8?B?SDI1aXhwdThiQS9saHAwOUNsNHgwRUZSWUxWelRMZ3FmMlRrcjRJNnMrR1VE?=
 =?utf-8?B?M0NQWWdZeVdsYVdjN3NxQVJWa3FXNGN3TDIzTmsxZFV3VWVDS250MGFOZGNL?=
 =?utf-8?B?UWw4RzM4UFQrMzVjS1dkd1FkVVZXTmtJek8wZUZzZjB5U0tlbVl4TGtjczd6?=
 =?utf-8?B?ZWJEZk15RWZGUGltM1hYdFFnMVFSaTJrMVpPMEtjTE44UjRobzZSL3h6MTlB?=
 =?utf-8?B?eXVHOEdER3RoVWJ3cy9DeXdqdnY4eU1UMkxvOU5GWjloMmEvbnRZTkFJdFFy?=
 =?utf-8?B?Tk5LNUJYTEdFOUZmUzdhdkRBUy8xQVBmSklQeEtvWDVGbG5rMXcxN0RZNSti?=
 =?utf-8?B?RjdJVHUzaHNCZFVySlNxcFpKejgxMnRwenFKaktiLzJuYXVXbHR4Sk5lY3BR?=
 =?utf-8?B?NENMVzd2enU5RHZLUUxvUlpuYVVuNWlZSXQwYjA3WC96SytFVml3OGZsbWl6?=
 =?utf-8?B?NEMxekNPNUtlRENkeWQydjBwSys5NU1OTjN4MmV0b0pKRVVIMi9kZHpBMmw3?=
 =?utf-8?B?bk5KK0o3aEIyWWRhMzJacWNWTkdkZDRkNlUvOEhoaEFsVk1mM3R4dGVxTW5i?=
 =?utf-8?B?eHV1YkMxZEV4QzluOGhRKzdUaFBxVWNKbFVNeUdhYnRzNm1CdGFyVTdRK3Rz?=
 =?utf-8?B?NWwwYXRGZmRJdkpwazVwVHE5eHpnSldERE5TSDZaNWRpZThvS2ZoeFJlaHhE?=
 =?utf-8?B?V3dhK2tNdi9xbmxmckg5SDQwaFRWcVJ1Z2R6b0NmYUo3djJlbHZRTFpEcWxU?=
 =?utf-8?B?OUxCVzNNUEVaN2dscklMOTNjNjNYeHprdittSzZaaStoeStYdWNNbjRHNFF5?=
 =?utf-8?B?S2taMzdNbnBoQ0VIaHV6ZGx1cWt5RVF3MmQ3WGVRbWlxaHFVWU95RnREcXNS?=
 =?utf-8?B?V3hqeWRvV0ZsY1REd3piNi94VmdFUi82RjFNZXVlR0thdzc5NCtSVGR0WDVB?=
 =?utf-8?B?c3pMdDNRZno1ck5hOHhqRE9HUlYxV0J0YlFhVUVXZEZFZTF3VzZ4d1paYnM0?=
 =?utf-8?B?bFFMUjc3YkU5UUJMOTNwU3VuKzBwQ3V5dWpmT2Jaa3U0bHNVUXJMeC9ZYjd1?=
 =?utf-8?Q?6Tz+H85I3B8wJ5RohLlnn/p3Das74TT5hL85y+B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1841d116-b678-43ba-76ce-08d93e3ed8b0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4627.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 16:23:09.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smcF7hnYGw3BAU9UMbtCJiGZQQ8S9U/RghknmvTBexLdtzfR8zGu8W6Q6KO3/rMjGdOvevAXolgFrBMVHIowdjtqOZeCCOrvTWIPtVXUi7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4753
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10034 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030103
X-Proofpoint-ORIG-GUID: JWAyMdXqYSnWO_9ATFgXSt4nSmT94QyH
X-Proofpoint-GUID: JWAyMdXqYSnWO_9ATFgXSt4nSmT94QyH
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/20/21 3:00 PM, Alexander Larkin wrote:
>     The problem is that the check of user input values that is just
>     before the fixed line of code is for the part of first values
>     (before len or before len/2), but then the usage of all the values
>     including i >= len (or i >= len/2) could be.
>     Since the resulted array of values inited by default with some
>     good values, the fix is to ignore out of bounds values and
>     just to use only correct input values by user.
>     Originally detected by Murray with this simple poc
>     (If you run the following as an unprivileged user on a default install
>      it will instantly panic the system:
> 
> int main(void) {
> 	int fd, ret;
> 	unsigned int buffer[10000];
> 
> 	fd = open("/dev/input/js0", O_RDONLY);
> 	if (fd == -1)
> 		printf("Error opening file\n");
> 
> 	ret = ioctl(fd, JSIOCSBTNMAP & ~IOCSIZE_MASK, &buffer);
> 	printf("%d\n", ret);
> }
> 
> Fixes: 182d679b2298 ("Input: joydev - prevent potential read overflow in ioctl")


I'm not sure that this is a proper fixes tag. Seems like the bug is in the
code since the first commit (1da177e4c3f4). Maybe it's possible to add 2 fixes
tags just to notify developers that this bug is older than a 182d679b2298
partial fix.

> Reported-by: Murray McAllister <murray.mcallister@gmail.com>
> Signed-off-by: Alexander Larkin <avlarkin82@gmail.com>
> ---
>  drivers/input/joydev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index da8963a9f044..1aa067d4a3e8 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -464,7 +464,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
>  
>  	memcpy(joydev->abspam, abspam, len);
>  
> -	for (i = 0; i < joydev->nabs; i++)
> +	for (i = 0; i < len && i < joydev->nabs; i++)
>  		joydev->absmap[joydev->abspam[i]] = i;
>  
>   out:
> @@ -498,7 +498,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
>  
>  	memcpy(joydev->keypam, keypam, len);
>  
> -	for (i = 0; i < joydev->nkey; i++)
> +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++)
>  		joydev->keymap[keypam[i] - BTN_MISC] = i;
>  
>   out:
> 
