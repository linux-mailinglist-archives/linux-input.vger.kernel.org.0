Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5B3BA904
	for <lists+linux-input@lfdr.de>; Sat,  3 Jul 2021 16:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGCOig (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 10:38:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51584 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229671AbhGCOig (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Jul 2021 10:38:36 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 163EX3U7030668;
        Sat, 3 Jul 2021 14:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Kq4qJGZpxLz/V+t5/WRbzs2d8SLrPU0VycY018YnpsM=;
 b=TDMd3ufrZ7jxDJeEXXfnxV46UM7al5HAUds6IQX0suA68/uzhhFxVJBGKVOdW+tWuBQt
 A0ZQa+hHBvMLiHF6yqRM7vKYnqKCZfbQeeJgtjuZnyoh4bquyeQtGJBEULR9DEBaRAhR
 u7VkqVZqCJh1sxg3uCdFos+3bZn7rrQgCpm0aRRFHgnk96zOEFqNNdJeXbqYFrCyuO5D
 7yGQMnI0ebC+Xp4yB5+lvH2SDQgGztSZc7XoxoyqAGv83+Avn6oP0DjG8RhlmxY3rpCi
 WVsev9wpsawdbP6IE2ofjBDmtHXQIsLdiEWBAcKrzBhnQLBE/0nJI1eFYQz557rkT8WT CA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39jfsc8dfh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 14:35:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 163EQGn5019745;
        Sat, 3 Jul 2021 14:35:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by userp3020.oracle.com with ESMTP id 39jf7krtkd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 03 Jul 2021 14:35:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPydBu9zZ4GweRPM+BZfZVp/v2tILyraQOGFI99hsHW84Kc4fsCAxDjC/XpnEUXdn2Y8sZ986GWax/yK3BMEyuNCdn6+YOMvX4xSX+VfI73rLKeMb/pTQlY6ViBRmFnYaAAuqATytn001BDkTInQGS+tWUhIOCGp2+Euy/XlZN9s1uFkrJ+3urTQ/+AO3jAqWq/sH44Zmu8H56Zfjez0ZrWpldtsv6v7GnSFBMxbKKTckh7io+q5oU41H+ma0+IMsvDtJ/YrinjGEe5cWHktZ8kI04Y3nDsaTOFPk62Q78xjW6pehKYjwmHPqXVrl8yXk+yNP1GwmxTpm9itY+nByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq4qJGZpxLz/V+t5/WRbzs2d8SLrPU0VycY018YnpsM=;
 b=JTsSSukjCrcR5c8yjv+IR1GjwXN0P/D7JpsrzKB3yWIWMqsyHliZYtEiBJyj1QKeBR9nAuIoYKMvPV77+y+0eUFincBvQ7FH99mjh7mct+gaPH22UXj0dzio5eeyaj+4VNf70lzez7gTy5i8g3z35Z8CFko9Abh+0NBYqHcbElXl7qalCcdqjqwmDQict9cOdvZmvBcAmLST0H7fNgvTk9f/vb3T0whveYf/ws79rlGMRV6uw7AT+7sFaaMf2CCky5K7q8gBxukYuPsiHqqunFSd3feuXiBRvIvxuTQAYNylp+oTpfo6zAQMiQoGIECXPXMrS8ZPhPgpoznhhdvnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq4qJGZpxLz/V+t5/WRbzs2d8SLrPU0VycY018YnpsM=;
 b=K3TN+7Ezl0GM2mS8VVnhBL9gb5uF4hm+w3lG2Vk62YydNd5q1RSVd3SexRrMbSudleNxTiOVhI++ITCfS9QTZkIwzxUyAsMFTlGFpcq2J2kIUzaRu5P4JxT1Q1vG0Qi8vr7zWkK6NiRBA1nnvcG3M/X6JP5rHKfsooEIlbSx/Dg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4627.namprd10.prod.outlook.com (2603:10b6:303:9d::24)
 by MWHPR10MB1679.namprd10.prod.outlook.com (2603:10b6:301:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Sat, 3 Jul
 2021 14:35:47 +0000
Received: from CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42]) by CO1PR10MB4627.namprd10.prod.outlook.com
 ([fe80::cdf9:3ffc:9826:c42%8]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 14:35:47 +0000
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Alexander Larkin <avlarkin82@gmail.com>,
        Murray McAllister <murray.mcallister@gmail.com>
References: <YCyzR8WvFRw4HWw6@mwanda>
 <1c351258-65e8-8984-8ffa-64eb316e1573@oracle.com>
 <20210703124351.GA26651@kadam>
From:   Denis Efremov <denis.e.efremov@oracle.com>
Message-ID: <ea3b061a-79f6-d476-0e65-68571f8298da@oracle.com>
Date:   Sat, 3 Jul 2021 17:34:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703124351.GA26651@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [188.32.236.56]
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To CO1PR10MB4627.namprd10.prod.outlook.com
 (2603:10b6:303:9d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.68.32.40] (188.32.236.56) by FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Sat, 3 Jul 2021 14:35:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f182a93e-ae31-41d5-4bf7-08d93e2fd8cf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB167971B68B0355B3D4520EF2D31E9@MWHPR10MB1679.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xoosnvdT/8zRdeQteciR+lgJ0BpD0cnFmv3huVfpqUPD/qpTy1+kaaVl+lff1aVLRzhq9AZVyxiEEkMnx0HWVRz+Pp6ZMKc6llP9fNy8RTx/AraYtcK4KnZqiuQqDLfg+gJsseIqYBx9ZJEr7gdjsX0odIyT7VwBYh9Xri0PuARtzhjaHptMFJcqVqtKDxpR1hnU9LSBEFOGVwjKkZokGQCc++vKUH3FJtbahqTqI8JXVCPEX6LR/qawgfADnVl9jN6IMG2QL8HOx7LXJV6Mxj5oG3ls/9W+gjtxiap5Xz9fxwWsF4+Wwm+lip9jZ//mK16IoyF6iefl6lGmBUeNVZLfFzKfd4cVQKmlRqlPeAFr0ijaTC62o/Aq4bHf4JnkAC1wWKZ2Eyt0NtmDSsuyx0YcZbMnvl0vqZahh+jwfrbnVyYUxV3hjDXoD4jir1+8R4WrEd1IMIPO2BTXZtZxjE73+mNAhRJy26zH0D/kIiRKnH4MU34JXmiLBfM5XhwlUmwaN+I+IAa91kr6BkIWoAXzu4ItvV0323qx03Z46fzD2rx0FVUFRHWtpq9q+0wFV7IYBxUn27D8cMVHPQHmx1jyu/IhBw3z4tEq9FfFy8DlL5aaILgKUHpgA01MxEDK/6Ps64i07oyAZcXd46cORXJIEulVk1DsTVu5Yx4wD78fJwMmidhmbSzEi1r7lX/2fBTGqJUp/T/7ZKqkP9rIalHkozhhjJh/oWtjXdJC5sZAGrvTE490je6FF2wRM2FN3BfLvTE1y+Ef1t9lXKGMEZR0nEtphfdzZDhOkuZbARx4Gok+YVmILPk8ZCWzXWlIJdNoH11lT99QkwAi/j8wfEKwE4xbjJMn0tF8OkS+riw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4627.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39860400002)(346002)(366004)(186003)(66476007)(2616005)(66946007)(2906002)(16526019)(31696002)(31686004)(6486002)(4326008)(6862004)(26005)(53546011)(6666004)(5660300002)(66556008)(16576012)(316002)(54906003)(37006003)(36756003)(38100700002)(478600001)(966005)(6636002)(83380400001)(8936002)(956004)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWwxNVJXNGFGMXlmQjdBVkFvS3JlOExUSjRlZXZhVnVpL2gzMTlpOUZ0SDFH?=
 =?utf-8?B?Wnh2WjJOK2pGRU5JcXZac1FvMm03d3FHZ3RBZ01VT0pzcnFLLzdlaDNiU0tK?=
 =?utf-8?B?SE8xeGNuenYveVUyb09WaTFSd3lOZzJoMGtGV1MyeS94TXBoUDIzSWFid1Ba?=
 =?utf-8?B?ekp1c1FmaHBFQ05ySEs2bVFPQVI4ejBCNTV6ZUgwS0g5L1I4aWJGeDFmL3h2?=
 =?utf-8?B?anVqeE1rQjN4Y0ZwT0RWNVdQUklrbTdzUEc4QnEzUFpCdFM5SWxwOXFFelFI?=
 =?utf-8?B?S0JSTzhUNWdlMklpTXBJcDhlZVgwRy9OeVc1cHB2ZVVZQjhDSnlTblhLR3Ay?=
 =?utf-8?B?OGlBdXhVeXVPcW1Oa0ZtMmk4Y1liQ29iS0hvMGs2TmN6M3JwRFRNOS9Ga3p0?=
 =?utf-8?B?cVlPRGVNT2VDSHFabGJmcXp4QnhXVi9PeUpVL3Z1VlozUnpFWWpXbkUzc2g0?=
 =?utf-8?B?L0E2SGhnaGNaREZpdkY3Sms5UEwzbU1GMDJDWVM3S281TXdmcE92Qm0rRk9h?=
 =?utf-8?B?YzhoTCtDeGFtbGdYOVpFamkzdTN4M0NHMWVtOGdldWYrbW1UcnNlNmJRYytR?=
 =?utf-8?B?VGxlWXhZZWFtNDdDMFFHMHI3NDgvYU5BSEl3ZkErbUdFN05CMkhJaEw1SXFW?=
 =?utf-8?B?NUxmVm1rVmMzV2xGRW1aczZMSkNPRHV4bW1Pbk9ISGYwZ3V3dys2TmdWdXFq?=
 =?utf-8?B?eTlEVGVaYkVxWTBoYWt6bVVraVUvTDFIQk8yUlhrNDJIeUM2djk5amxMRWhT?=
 =?utf-8?B?VDJ6b0N2TW9TWnU1UUxnNGkzZ05hRXRDd3dqTWpRanZQTTliSFJuNFFRQ2FQ?=
 =?utf-8?B?RkJwZVJQeGJUQXhWSDROb3dETUxVemJrYXkrbUtVcUlUaDVVbE5hcXp5d21m?=
 =?utf-8?B?YlFGZ1l3T2tkQi9HMVZNNjZJUStjK1BRbGFiN2dzRjBQcWRHQlQyeTJ4Q2xu?=
 =?utf-8?B?ZUkvZWR4dUdPUXF0Qi9GNnNKNFRhcERWNWVZVVpLTWdGWm5aQnY0cUtDQW9G?=
 =?utf-8?B?dnpqVnFiMDJDcnUxZmtncTJNNGJOaUx0a1Z1QjlaN21wUUJxZEhLU0JOdXdn?=
 =?utf-8?B?TTdLK1ZHQjFqTG8rWFlLaS9jYm1sc2dTRm1wbDNmYmJjbm45N0ZYV0FNOWlZ?=
 =?utf-8?B?dVpUdWxrRWZ5RWR4dVBJNzN5bUxUaHhVdmJGdnRndEd0QXpOZnR2RmNyQVdW?=
 =?utf-8?B?eW5SOGc1aXo3cXJ4K1gvM3crM3JLdXFGUGhlMXd0UkYzcWo0b2tUa21hZm9o?=
 =?utf-8?B?V0lVcURBWTNGeUMwRzJZNnhwZVNrZDRLVlJIN2pmWVc0QjI3bXAxL2ExNkZx?=
 =?utf-8?B?aFZGTS9CNmhlemc0UTdUNEdXL2YrdHJCNWFhZCtjSHRUczIyMTU4aUkxVFhQ?=
 =?utf-8?B?bE0wTW9yN1REMU9iWGtGUW1uVksyeDVhdzMrRjJ3Zm4vVGN0cFc3WWV2bHVh?=
 =?utf-8?B?VkxiNzBTQlVVRzFxcmRHSW1iNEtNaFNucnJySjdJSDFpbHJNeEljd1Y4M2tC?=
 =?utf-8?B?ZVhWUTBlRXdkQXQ3Y1F0WHJvSmlBS0M0amxHdGd1aVdSUDdDUGMyb20vTXFU?=
 =?utf-8?B?UWN6bHVaaHExaWRaZHNvRXVTZHVKR2RweVhPcFNva2gyaEFaTHdoRENDYnR3?=
 =?utf-8?B?MnBUMDZSOW1mTER3TENIdDJ0SWJ1c2RXZGJtUXBJeERiQ3FjbnU0QVVHVXli?=
 =?utf-8?B?MTg5b1RtcmIrQXIwd0taQWI5Yys2RDRSMzdleXVHcm5DaFdBQXhySmJCOW84?=
 =?utf-8?Q?0UFAMMDPsoDEfl3Z/yIIRCnZr01uZ7CBwyCNoVR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f182a93e-ae31-41d5-4bf7-08d93e2fd8cf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4627.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 14:35:47.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJsKOGw09W0vlE3ay+roszduW48xlTAhJfWCN2EqzxhPufLyNSc7SD104FBOKU4KMaGnRh8eaxs3md+9V69pPC0Tsbxa2FytA9oCvwtwJBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1679
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10034 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030092
X-Proofpoint-GUID: t_K3GZioXgzOGBUAMuUOlCklCvjXaZ1A
X-Proofpoint-ORIG-GUID: t_K3GZioXgzOGBUAMuUOlCklCvjXaZ1A
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/3/21 3:43 PM, Dan Carpenter wrote:
> On Sat, Jul 03, 2021 at 02:20:13PM +0300, Denis Efremov wrote:
>> Hi,
>>
>> CVE-2021-3612 was assigned to this patch.

Oh, sorry CVE-2021-3612 assigned not to:
182d679b2298 Input: joydev - prevent potential read overflow in ioctl

But for not yet applied fix
https://access.redhat.com/security/cve/cve-2021-3612:
> An out-of-bounds memory write flaw was found in the Linux kernel’s
> joystick devices subsystem, in the way the user calls ioctl JSIOCSBTNMAP. 

So it appears that CVE is assigned but the fix is not in the mainline yet.
Maybe someone could explicitly list the CVE id in a commit message then.

>>
>>
>> On 2/17/21 9:10 AM, Dan Carpenter wrote:
>>> The problem here is that "len" might be less than "joydev->nabs" so the
>>> loops which verfy abspam[i] and keypam[] might read beyond the buffer.
>>
>>
>> The added check looks insufficient to me. There are second loops in these
>> functions with unpatched "i < joydev->nabs;" and "i < joydev->nkey;" checks.
>>
> 
> Thanks, Denis.
> 
> You're right.  The fix isn't complete.  We discussed this in a different
> thread but I sort of assumed it was dealt with and didn't follow up.  :/
> 
> https://lore.kernel.org/lkml/20210620120030.1513655-1-avlarkin82@gmail.com/
> 
> regards,
> dan carpenter
> 
>>>
>>> Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>  drivers/input/joydev.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
>>> index a2b5fbba2d3b..750f4513fe20 100644
>>> --- a/drivers/input/joydev.c
>>> +++ b/drivers/input/joydev.c
>>> @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
>>>  	if (IS_ERR(abspam))
>>>  		return PTR_ERR(abspam);
>>>  
>>> -	for (i = 0; i < joydev->nabs; i++) {
>>> +	for (i = 0; i < len && i < joydev->nabs; i++) {
>>>  		if (abspam[i] > ABS_MAX) {
>>>  			retval = -EINVAL;
>>>  			goto out;
>>
>>         memcpy(joydev->abspam, abspam, len);
>>
>>         for (i = 0; i < joydev->nabs; i++) // <== HERE
>>                 joydev->absmap[joydev->abspam[i]] = i;
>>
>>
>>> @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
>>>  	if (IS_ERR(keypam))
>>>  		return PTR_ERR(keypam);
>>>  
>>> -	for (i = 0; i < joydev->nkey; i++) {
>>> +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
>>>  		if (keypam[i] > KEY_MAX || keypam[i] < BTN_MISC) {
>>>  			retval = -EINVAL;
>>>  			goto out;
>>>
>>
>>         memcpy(joydev->keypam, keypam, len);
>>
>>         for (i = 0; i < joydev->nkey; i++) // <== HERE
>>                 joydev->keymap[keypam[i] - BTN_MISC] = i;
>>
>>
>> Also at the beginning of joydev_handle_JSIOCSAXMAP() there is a
>> 	len = min(len, sizeof(joydev->abspam));
>> 	abspam = memdup_user(argp, len);
>>
>> Maybe we can call min(len, joydev->nabs) instead or even min3() and
>> use only len in the for loops then? Same for joydev_handle_JSIOCSBTNMAP.
>>
>> Thanks,
>> Denis
