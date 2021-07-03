Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CBD3BA86B
	for <lists+linux-input@lfdr.de>; Sat,  3 Jul 2021 13:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhGCLYJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 07:24:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17748 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229829AbhGCLYJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Jul 2021 07:24:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 163BHLMY011826;
        Sat, 3 Jul 2021 11:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kw6dwwdRgq0r57p9SYUgW3Nl3MFwg09yqa1FC0sHDsk=;
 b=KJTMLKbuhaeVl687eqau/cl2MEN1iw5taKfzfi4mznbIVST2yJRaRjrSF0cP1Aqj5F8Z
 sGq9oxyzw8kAHaIwPazjotx3/o8oAZ9Dkn+A8f7IKdTdoyJSqPMsrG7/ZGW2D4HAGUxb
 eBbiMa6YKNyAfONRnC+f2t1G2ODEmxGPGrTjtXAY4GpO/iFWV6trMzxqz8yztBSbVkXR
 rQpBHGn0JzWteknXOMU7yRsUfRsHbtDqOuZwlCfZpumLvRpHJMoBrYkxQOGpArw327NB
 b6GTDIa35BDEfPC7IgLnDMaiZCcXOf+033xJBokgsN10mn9pt6T7/rYTAWbM1JKr7/El 4w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39jges89a3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 11:21:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 163BGGpH164068;
        Sat, 3 Jul 2021 11:21:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by aserp3030.oracle.com with ESMTP id 39jdxbkbr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 11:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emchK6j1vUT+fk1d/FNg++aniXvodfw+alF5kQgnH9lNBFVpU1uE5X9cOlrCJCe4ZvDMYG65JOvCFoe84/2j7cbu/5xkzXcW1oA9uHUV+zoK7+vqn2vG+EX3hpax0VLOIJhh8fY4/1iH1Fl+r6TYvE5OWNdY3KzpCgmLW0hnvWm9+t3FPyqzz3iKY0aBU0tG/ocHWSiMzuBrekU/HeZ169zVuQvX1xh6MSoi3AMWu+JH4IWl4iWw7zB8/gqEpUXswx0Dc2uCLD1Zu4wJTpfH0WGGDJSIykbRLwZiyptJige2yQNdFUV3FyBxJ448MWtIMLaRCN4WrdkZgmWEQD45Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw6dwwdRgq0r57p9SYUgW3Nl3MFwg09yqa1FC0sHDsk=;
 b=Zdetmneq2Lu0SWsiTbT0XnxEPuaywVsks2buVW38M5s4Qu26lIDIbxiRfQIokVGS3mR4qzoWrUxtAzqOYZqxG3dt8k2efO2a6bc5Uvhm2ad29bcJbv6eR6M6UAiKxEsFhyrgS7O6k5/uTwY23bDvct+ZWNWY97I83iLDqEXlYAYxCxsZxAUIXBFf0qmGYjtLD8ZH0IuxDwSXd99w+GOUHt2i+OHdexq5ElSP2B1N5Wrix3VFQxMTMGU19O3o+W4DqcGNsOa3IaFke1Rj+XPqhCKXcDMA4u8xQmlPZ36WGf5kFpCmppjDGFxwGisb2BEJJTQROm9NwslVdAGeG5/Qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw6dwwdRgq0r57p9SYUgW3Nl3MFwg09yqa1FC0sHDsk=;
 b=P0nYGFPmUgYMDHNgvumLKftAfKy+mBK0br09l67QquGO8nS7jm/aa6NGHr1cOtNklOH/UaMvkjJgYeRi0HhdQaHRlqQK8Qsm6vn7bq47tqYH/cNsNPI8NkhA0UJGtVgYflRRN+e6uRZEtP2ckrz21XOMYRiYZAX6eecUQ3HVpg4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4627.namprd10.prod.outlook.com (2603:10b6:303:9d::24)
 by MWHPR10MB1406.namprd10.prod.outlook.com (2603:10b6:300:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sat, 3 Jul
 2021 11:21:22 +0000
Received: from CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42]) by CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42%8]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 11:21:22 +0000
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Kitt <steve@sk2.org>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YCyzR8WvFRw4HWw6@mwanda>
From:   Denis Efremov <denis.e.efremov@oracle.com>
Message-ID: <1c351258-65e8-8984-8ffa-64eb316e1573@oracle.com>
Date:   Sat, 3 Jul 2021 14:20:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YCyzR8WvFRw4HWw6@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [188.32.236.56]
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To CO1PR10MB4627.namprd10.prod.outlook.com
 (2603:10b6:303:9d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.68.32.40] (188.32.236.56) by SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Sat, 3 Jul 2021 11:21:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f535ff-4356-4423-4955-08d93e14afcc
X-MS-TrafficTypeDiagnostic: MWHPR10MB1406:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB140627256B791ED615051DCDD31E9@MWHPR10MB1406.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SmFYBB3WHUHo7+tf5PhtBE8LEfrsLSL6RqYsisf5K7yFFfcV57Q6SNP1PRwibXRvTp1SqqmzFzFatQbtLx3+Ov0A648zU6Q/CLqWuY7dXncCzj3YeAgK2RL+0cHtG5bp6L2AsrVqQ62VIu/+oqMsWAa+PYCWTAXfjq66zsNXf0jNcrNI/vpp/5wsduPcXgC0Qkydohc7RUzE9JKPG9f+f9BGNr5azkdAPcvd25iWPXvumprGcK0bfjjYThofzUOvIc11vfWSABgupQRQ354NBARbudqVpsfGgsE0qxZhxql9m9XDROpU/FuDLOEuqpD7BWxrIvUHHf23gZ3Iq0gB9msauBeCioSqDD+ILUuQwnDify0rDYE6ri2scn9IM4VnSjOsPKgHZcujj0p9p+PW7xEZn3RCLhR46FvytiBaXBKswUhYOLKWl5/STD3Fdmo4BGeu9vVtAXrCuN/VBlm2xROp49t9r6TliUbQZgIOQyXKfGsA3Mz8Xjgr84hJwvrrezpe7l6XuEsrKP25KWMdY1aZlaD5xChuA7+5CKQWbwadr3Enmph/uu9zp0Aq8sxGa+0kogn5+KAeh3s6bUdl9wQU9XW4J0ulM3HwG1bsppNhYsgyix5mkVa8bwTFpWbGBAwpfM0QjZxqwSY/eGfprAMHWnqCqF0Dvvc/jDxMlFg6cGy3x71iCVX0gETMw1hkyDUNtMBluL/DsLh/TuT1wjqfwPBZMYUKdIg+R3d+kw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4627.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(376002)(346002)(396003)(136003)(38100700002)(31686004)(36756003)(31696002)(16526019)(26005)(2906002)(66946007)(66556008)(6666004)(16576012)(66476007)(186003)(110136005)(316002)(4326008)(956004)(8936002)(2616005)(86362001)(478600001)(83380400001)(8676002)(6486002)(5660300002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FCTk9NMFoyZjcrRmlvQ3JDMkFIS0JhQ3gzUXFiUEdwRGxMRVZGU3dPTk5m?=
 =?utf-8?B?Z0I4cXdsdFR6Vy9tbHNseE1ndGgycmRnOVgzdmxnSDhyOUw0V0lIY1JUMkw2?=
 =?utf-8?B?QzZCT1dVUEFTWVdPZHR0SUVzeW12WStZV1NFQWVYQ05XMzZERWpLcVNnbXNv?=
 =?utf-8?B?YXFzTHNpTFQ4Q0NQREVhSDVvRVVrb0pBWXZOVUJJdHo5VFcrWCswSVdwajY5?=
 =?utf-8?B?MkhFV1lDUlkwdUl2d1ZKSjVVeDlsNldBWkFDRWxLYnVzdUk0eERtbHRhRXZm?=
 =?utf-8?B?bGNHUjFXOGNTV2x6RmpJc3Q5TGhUalVwYWxuVCtOc2lldzdEbGg1TVZybk8v?=
 =?utf-8?B?b3Z2aW92ZkozQXRLR2NCZWJmeEg3QW1OaTVKMVVQS1lzOGpCRXRnQnJsUnp6?=
 =?utf-8?B?a1h0OUNRUTZRbmJtM01hUGo3Y1Z0bjVsWkVUcVNzeW1tU1BvR01mK3RZZSt5?=
 =?utf-8?B?bHB5elZLZElYeG5uUmdONUVHT1BUc0oxZXBody9ZdmZZNGZyZ3JpYWJQN2x0?=
 =?utf-8?B?RS83TFdPaW5QWUJCckxmOTNlNGVnbHdIN0puVWFLMWRFR2x3YnZJY3R2WUFy?=
 =?utf-8?B?czB0THg4bDdtTHlYTkUwdnZMZlpGRitKYXFEaWZLK2pnSGVrQW5TSW13b0Rx?=
 =?utf-8?B?WTA2ZE1jOEZEYVBJN2ZwUGtmSjBiMXhOVVNTMVp0ZVBnT1M4b0xIdC9WbnFl?=
 =?utf-8?B?Z3h6VVJPdzJFQWlVWDZlTGtTY0ozbzVhR0RkUUZjMk9iZlo2ZVd0OVdHVlo3?=
 =?utf-8?B?L25Bc3JRdzBkN2Z2M3RFZld3eVE2MjhDSW9BN3UybTlIb1B1Y042UVJBOWx1?=
 =?utf-8?B?YUYzRWJ1Nk9CMFpoNGlnRHNmS0o5a0NnRDl4TWdpTjFWUmtyUEtFbE1oN0Ny?=
 =?utf-8?B?MkwvT3E3VjBPTkRYQTFnaE1vNlR1bTZXVmNVYWhWUzhWZnkwMVM2K09USkRI?=
 =?utf-8?B?SEtIVVRmVWhPMkVGVWRCaTEzZThIdjFKd2JkTlM2VVRuWnBvUkg0YUdFUklq?=
 =?utf-8?B?TW16TmdKQlhlaHIyV3E4NVM1ZVNlV1pteTUwTy9RVmlFYjBZMGI5NGhBSlJu?=
 =?utf-8?B?bE5KZGozcG41bHdPTTBsZ2lUM2FVc2Q4N3V6Ti8yc01pbjdPUHVvVjlNaVVR?=
 =?utf-8?B?U1BNVmk4ZDB6aENabU8vUnlhT3gxd3VjTkZmS3hNY3o4ckN0dnhkT1dHY3ZG?=
 =?utf-8?B?VWd3YytyVjArNm40ZlpLa2tuNVFDcm5DSWorNWthVmk4TERlRTBIN3ZObTlo?=
 =?utf-8?B?V0RCZlFKZWFjMEhXdDdYVUs4ZTRGZVRkd0VzR05hSVJVYTdCMWFpTGkrblNz?=
 =?utf-8?B?WXgvaVIwemkvS0FIeXdsRGNlSDc4VlRCQXRZdm1GejFSQXN5WFl4czA4VTRI?=
 =?utf-8?B?emc0OGFla1NLVkN0OWZadFBTQmxrTXZ4RkxEdXFkS3VDUXJvMzFOeWFsaEpK?=
 =?utf-8?B?MTBUSGNMR0tDeEltSVU0S0hnY1Mxa2lxS3Y3VVBBVzE3ZGlDSEFybjVyRXln?=
 =?utf-8?B?UmpBUEJVUFBkdFZGS3N0T3hDKzBoK0MxVWFoelEzWTdGeDdzeURxTDBqQ3ZE?=
 =?utf-8?B?WUV0L2pJL3ZrSktaSEUwUXNWNmdqMVRCcUJvdVZkR2RuOVJ5UXJMUkpMRTZs?=
 =?utf-8?B?OHdhZkhUc1JTQXNJajErK2I5NHVNSWlESXNXRlZFVnBkRnlyNkFSMnpwekJ1?=
 =?utf-8?B?OEZSWEVSV1hRc0dpZSt0L1dVUFlpajMrc1RVNFRtY1RIY2wvbXpMdTdDclA2?=
 =?utf-8?Q?bY6XJqWWjebfh/43zxc/X69voncrCSiKXO0wAU1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f535ff-4356-4423-4955-08d93e14afcc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4627.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 11:21:22.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR1soWg22atktRGxDkbSvKju+XDEch+JUoQ0eHWWZy0zYCRaO2iivoJeNO3AfiZKddn4EN+CL77CPu03UI17DNsyFS6IX1VEszNZMAJ2+BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1406
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030071
X-Proofpoint-ORIG-GUID: StXmSVJQIjsY_fTtrbOj8sznbouUXUM6
X-Proofpoint-GUID: StXmSVJQIjsY_fTtrbOj8sznbouUXUM6
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

CVE-2021-3612 was assigned to this patch.


On 2/17/21 9:10 AM, Dan Carpenter wrote:
> The problem here is that "len" might be less than "joydev->nabs" so the
> loops which verfy abspam[i] and keypam[] might read beyond the buffer.


The added check looks insufficient to me. There are second loops in these
functions with unpatched "i < joydev->nabs;" and "i < joydev->nkey;" checks.

> 
> Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/input/joydev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index a2b5fbba2d3b..750f4513fe20 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
>  	if (IS_ERR(abspam))
>  		return PTR_ERR(abspam);
>  
> -	for (i = 0; i < joydev->nabs; i++) {
> +	for (i = 0; i < len && i < joydev->nabs; i++) {
>  		if (abspam[i] > ABS_MAX) {
>  			retval = -EINVAL;
>  			goto out;

        memcpy(joydev->abspam, abspam, len);

        for (i = 0; i < joydev->nabs; i++) // <== HERE
                joydev->absmap[joydev->abspam[i]] = i;


> @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
>  	if (IS_ERR(keypam))
>  		return PTR_ERR(keypam);
>  
> -	for (i = 0; i < joydev->nkey; i++) {
> +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
>  		if (keypam[i] > KEY_MAX || keypam[i] < BTN_MISC) {
>  			retval = -EINVAL;
>  			goto out;
> 

        memcpy(joydev->keypam, keypam, len);

        for (i = 0; i < joydev->nkey; i++) // <== HERE
                joydev->keymap[keypam[i] - BTN_MISC] = i;


Also at the beginning of joydev_handle_JSIOCSAXMAP() there is a
	len = min(len, sizeof(joydev->abspam));
	abspam = memdup_user(argp, len);

Maybe we can call min(len, joydev->nabs) instead or even min3() and
use only len in the for loops then? Same for joydev_handle_JSIOCSBTNMAP.

Thanks,
Denis
