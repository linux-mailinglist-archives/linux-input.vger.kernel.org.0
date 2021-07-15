Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498F33C98D2
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 08:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbhGOGh4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 02:37:56 -0400
Received: from mail-mw2nam12on2067.outbound.protection.outlook.com ([40.107.244.67]:30304
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231149AbhGOGhz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 02:37:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8mPzdxsUA0rJiTPJI+OnKghhtvEzBY7AwWtjRFAdPm3rVhik10+XPpDZ5X9wZKZ9WhYoW+pX95Vf7LfA1Z2B7nmav9ah+OimmnMtICAKHxlTOa4Fsz5h1UvPz3QkAfz8txigEHrosQJ2tLotMR3GyIedNBPwg/hg2G2SOmTC8+GqY+GGRS1MmfWQOZ3JTK9FkX9v4ESk1TpYyD/nu1yNbJc9B9+vkl+CthbNgDscJfVc1KeQdQvlrmlYFg83G3ov6SFSOV9izTBlIbGceBNe3PiskO8qcukcnd0TvTRhJaB5TQH1RaPNNpRxJStEKBpwh+CZwD9N2SxD5td3Vrd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bma5ynIRfsA3R9+jAr3QQw6K0+ismpsfPWvH2b70Zvc=;
 b=fvL6W3Z9MBAknsyQlGzHJ7adcpkzQC1KB8z/EQ8nelPGaNLCEwSox5tc7roGXBrtFx+QRnpsVFDL6o08Q+047RboNNxABI2yPtMzmBSkxY1BN4ZgG+Uz06y7oc1Sn1ZOu1NgJsknprGZbEZ6dTOFFqh70B5WtiL3bVmwDq5n1zlgcpkxCGMFS/j7SRwLOuhnITDJQQvjw/Q8jt9SVJxVftL2iKIee67jC8v9VMKn43W50IJqH5jLvPMh0h+0DgBIvRilOtE/fSNHF6kCC4M4XG6wm9o3iwv+n5NkgkT/poWohQdiWKAxnSM+5KD+XOJ27fpaS82oXmn4Y5FYruV7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bma5ynIRfsA3R9+jAr3QQw6K0+ismpsfPWvH2b70Zvc=;
 b=yfMJz50DYbSbQaUe6fdV4+coWn269Ur7ErHTiazmHAhG36nbfRQbpTjNJuYTb6Bf9tTpepCvSgxA7EaNMcXh+asjfjP5+fmRlpdX/DLx9GAOyjTaliXMwC6HBDzBEQdIkkkjpac7QBVEBy8cmay1Ua4aIhL/8n05w7+X42NRXiU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 06:35:02 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3%3]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 06:35:02 +0000
Subject: Re: [PATCH] HID: amd_sfh: Use correct MMIO register for DMA address
To:     Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, shyam-sundar.s-k@amd.com
References: <20210713041121.13418-1-ecstaticmorse@gmail.com>
 <20210713233106.9168-2-ecstaticmorse@gmail.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <f430c14e-aa32-7b74-eba8-1b8e52a0a723@amd.com>
Date:   Thu, 15 Jul 2021 12:04:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713233106.9168-2-ecstaticmorse@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.213] (117.213.166.145) by MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 06:34:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e35416e6-285a-4704-c42a-08d9475aac91
X-MS-TrafficTypeDiagnostic: DM4PR12MB5120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB51202FC6140F83314832565EE6129@DM4PR12MB5120.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usciaKFFXr6+i7e4piAYC4lFWIUJgR22jEeIT0seztvQfggqC6IOdZvYFc80ktXoHt/Fd3e9tlLCx+OGEYW+I+QvmRYbJwTsnACUEP5hb+vbNnN1Up68bnkBfKdaZfhMUMzt+2E70Nf3hZbhBzRilutp5zxLiXJfPtqz0CYsnzFasKRfbSLl/cySc4mCV3nMgeWHf5Sjdgh/au6qWCtBxTE0wgEFQmxol6UXSkzRHW1RDj2z+E1c9qWPy7RJ49iuu0cYqT/bUN5oaO63InGyMR5htceukMH8743YgdQ8KntaUY5rhCP2UGUWRcvj2Bc0DDXety7l0pFlPCKG1y1sN8W7PM4wXqLnYYl7Pv/Ro1aMVJvCBZuulCfcavPqUnCRFIXTY46vSS7gZZabQ0hoX1TVfD8Gvzcoii+dxp2MyUmqPQyeO31RrGc2U/p1NyjhmlcNhECq+azy0v1XdMEX3tJSjpmbufPlY9v3Vq+Ito45AYJEm7NocFRfVIaWvt+svKzfmL0zUvj0Nf1VLjdx2AKXMty1rQpkZfKvXNtUHgwoK9VHfqhC4UxtJeeW9PHr7crOYV+RWfy6TBEg+nQOUaeR5VLQSdr5XzpGUa1XJTZ/bT5iAYZ0kdtncdaJKpeIXDyQJqo+wa/KVL31D/76vYdIJOPTqrp5SI31k7zSMKXHwHOn9nnVFWaRd10+GkTnnFwETonAqoImfXPkh56zQq+QWtzD5hIu/oEA0cARv/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(5660300002)(2616005)(38100700002)(6916009)(53546011)(8676002)(956004)(66946007)(186003)(83380400001)(31686004)(36756003)(316002)(2906002)(8936002)(26005)(16576012)(31696002)(6666004)(478600001)(66476007)(4326008)(6486002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGdWRE9nQVJqNnZyamJMZ2lxNHF2aVR1Qll2d3kvOHQza2wzYXlEa3hLSmlN?=
 =?utf-8?B?N2lubUlNUE1CRHMxeW9NM1ArOGJLSXdnTHdhU0ExVzB0ZE1GWXVETzVITjlJ?=
 =?utf-8?B?dTVPSGhIY0RLV1pkd0NPK3djZEJCUGNJUWMza05XQ1NnbENNNVBuWis0SEFV?=
 =?utf-8?B?c2hndzVCOWlyYVdzaGx1bUgvckdlRFJrcFlWNzZ0MVhwZytKK3BGOXErTHpD?=
 =?utf-8?B?UlY4eCt3Mkp6R2thTHo4UDZFdU5DUHhaREsrd0xKZ2cvQ1RIMFdzMEtSZDdZ?=
 =?utf-8?B?Nlhka1ZBUnpjWWFHemtxc3lKcU5qZ3dMRFlZU0NkdmcyT1FMSXllOFlVdjFB?=
 =?utf-8?B?YjJ1VHYxb0RhOFlEa3hqRlNrVlNGS1UzK3prUTUxL1ZsTTloeWR5MTN0RVVo?=
 =?utf-8?B?dzVaMHREYnFVYUtqRStwOTd3LzJiajR2Q1VOTnE3eXJuczZQNWNrN3hZMk9o?=
 =?utf-8?B?TUJYbWRHZEFZQXAvdmVuZjBPeWVmRGFGZGRBNTcraGluY2dWNHB2bVpXM24w?=
 =?utf-8?B?OXJoaFlwUmdGcjNwMzk4WDl0M2dkUDJmY1RWM1hBUG16NnRGZzJDQThPNis3?=
 =?utf-8?B?M3BsMGJ2MitGdUpnejJaM241bUE2NUs5M21sUjBqWGR2bnh5ZkVvM3hEcFVn?=
 =?utf-8?B?cWlDWTAyZEdjbU0vZ1dWdWU5V1lVb2lSNW1paHdibUo4azA2NXhMektlRUFB?=
 =?utf-8?B?ZXZuM25ORVJoVStpTVVCNXlNQXZSRkxRZGVoRGdwblRDQklYSnNDRWVBZmgw?=
 =?utf-8?B?WDh2UTVOQU9MNXJOWXAyRTBIOEx5eHVkbzdFTUliOUk3S1IyaW5LbFRaVjdE?=
 =?utf-8?B?dzZlM2RGVEpFQWVzYTd5VnhHTUdtdjdmY04wTUcvelBCKzhsQTA5VVc5c0Q2?=
 =?utf-8?B?NEdsWEEweC83ejkyNWVJeGdvWVR2aUhiZm5LSnFKYVhCVVVlbTg5aW1VcWR4?=
 =?utf-8?B?N2R5S040T2M3WG1ZeThrejBYSG0vWkVGSU5zMldrQTdISFhWM2tsR2dWWkgv?=
 =?utf-8?B?bXZ6Y1Z5MVJWU1ZiU3F3cnBVV0lQM0R6cTgwQlltQUQvNXJpY3l5TXZUbEhU?=
 =?utf-8?B?Rm5OWjFZb2hrc3oxVnJGTnZzVy9sUnRmbWFXb2lXQlc3Z1FvdVVuM2pESmEv?=
 =?utf-8?B?MFZvak9sdW40V05VcHIwL0krT0o5bWtySUVmN1ExOHZQdURHUldQWWsySGJF?=
 =?utf-8?B?Uk82K2p4ZHpvd0NHdmxMYkZ2bERDMTcxYXRhbmxET1FxM2lXQU5jam56RnpQ?=
 =?utf-8?B?SktnMGpxcU1xTnNPTlY4alBsd20rRjFkUzFHK3lRdzlOcDF5cFQ5dUJMSXVR?=
 =?utf-8?B?TTE0S1RGVHFhamZhMWlvS0hNdG9DcE8rZXRIYlJpK09XVjcrc0pIVzBlVnFJ?=
 =?utf-8?B?QjBiVkp0aXhQTEY3eWhnMmJxNjRaUkVydWFnR1JjOXdFMlBadXZDTjB0UEZE?=
 =?utf-8?B?bUVxZXN6NktHMnhZUUwvbXE0Zy80Z0NwTkRJeEVHNm5vTUFSc2pnM2dTYlhN?=
 =?utf-8?B?RkV0UmJRdTU0NGEzODBXNDJjNEdOeTBQWlpzdUdpSmR0SG1wK01wVVpzVzRX?=
 =?utf-8?B?Q2hkZkE5NEtLN29jOTdjVW1rR1hFeXJUSkNDTzFTVTBzL0RQc0VjeWxHV0xM?=
 =?utf-8?B?UDVHQjUyNXlPVG1HSjdXZ1hoZXhRNzlRRW9FNG5XQnZmakhzMW5HQ2Y5L3BF?=
 =?utf-8?B?SjYra29kL0U5eC9LTUJPa25Sck5nbXJ4ZXVQTldrYWJvT3U2S1hhMkRuOGxV?=
 =?utf-8?Q?Z8XkFgPoMBwK9wPCTtvFlwp1k7sWfK43rtSS8JA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35416e6-285a-4704-c42a-08d9475aac91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:35:01.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2f56bK6T+ds5MoQwt1BW5hySN8kIIM9GmsKwbWkXy6ooNvOpt6zyqQjOnBmUxJii/uvRmwmYRzd0wWHaplsFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hi

On 7/14/2021 5:01 AM, Dylan MacKenzie wrote:
> [CAUTION: External Email]
>
> amd_stop_sensor_v2 accidentally used a different MMIO register than
> amd_start_sensor_v2 for the DMA address.
>
> Signed-off-by: Dylan MacKenzie <ecstaticmorse@gmail.com>

Looks good to me. Can you please add a "Fixes:" tag too?
With that addressed,

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 96e2577fa37e..8d68796aa905 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -58,7 +58,7 @@ static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
>         cmd_base.cmd_v2.sensor_id = sensor_idx;
>         cmd_base.cmd_v2.length  = 16;
>
> -       writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
> +       writeq(0x0, privdata->mmio + AMD_C2P_MSG1);
>         writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
>  }
>
> --
> 2.31.1
>
