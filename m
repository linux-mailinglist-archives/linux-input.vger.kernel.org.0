Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFEA4F9246
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 11:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbiDHJxX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 05:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiDHJxV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 05:53:21 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1782179AE
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 02:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE8Ts/bpeyUlaLlRjBKnOHzqTWLMYPsdiAAhxDwKnioQByRe+4QAGPrKXT05i1WQp/W/oWnKhVCclDmDkIYYl6LEF/T7gWHd7NmeWGn/nlVI+qHm0AWQN6ao9bUMFMS6uR0fYDlqwEfWlFaZTg+zUBUJ3UXkyD07KeWrOtViymiOHvHn+2JRpsU1WETcT57FIpX+f9g+wR5ZhkX83PbDY+zaklXqcIitNka/JwSoMQohJey7jT98O0bSAg/fIwNgYML6ipsyyB5ASVmG7+SG8UAH0B89TnRttu6fGydKqbTAMIotjMvm/Hqy42zCjKVP4JgT2RBgDXXg3W505TZgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INcdl7djJrNkhI0F7lVvGIlT4Y0E4ytLypwlC/nM1+Q=;
 b=AN1kvQYvigkNqrqEtFKb66y7YgA0sH+b0eAjwDIwzwIAOIJqdh8hE98ERFP9DmdOqbEuqi8ASarSiDl+bcztWBAVxE9+eI1qWRfs7kibq5R8XOrGHlewNqHc/SLJWHsX85yDaNGWleqoGgH+Q5+9vmgOYDlT1mAhxCftjWNjYhu+fcV9GaNsLbLg2AYzrC4zIC4RwhPnnyPRm6cz0/J/a50fh+y/azsBjGx2UwGYMEGR3HDm6lohEhrhZ5moyR/BsjdLXkOyZqhTXgI8bO7q3a1e9nF/MUYLdEzTBs7X7TF9pfhEOqfyFvWJnXM/CT9fl8dYZpYCAdk9YeMGX0N93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INcdl7djJrNkhI0F7lVvGIlT4Y0E4ytLypwlC/nM1+Q=;
 b=1hBtdNiTNjv99hCpHqs60Qlpo73h+pnoRHVqHQw/JEaaijaZrLIVEKcrcQjPfrMbsPngklSB5O6rqcr2N0n2Ds1b02Ixa1ubWYbL1YxYIfopszia9dM0lLboGH021XBUbwZ7P3JRmqWr4FV53VKnsuYnb8I27Pb4UOyVP1tPaDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:51:17 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::313b:8981:d79a:52d0]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::313b:8981:d79a:52d0%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 09:51:17 +0000
Message-ID: <9f5795da-7dde-012a-6a31-5ee7993ba8ba@amd.com>
Date:   Fri, 8 Apr 2022 15:21:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] amd_sfh: Remove name from maintainers list
Content-Language: en-US
To:     Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Basavaraj.Natikar@amd.com
Cc:     Shyam-sundar.S-k@amd.com, linux-input@vger.kernel.org
References: <20220408094717.847209-1-Nehal-bakulchandra.Shah@amd.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20220408094717.847209-1-Nehal-bakulchandra.Shah@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189bdf31-0f50-433d-5e41-08da194553a8
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB59333A892E1B98BB53B55233E6E99@DS7PR12MB5933.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5IPUIvD2F1YPTy8VVQJ0PpREwMySK6mwQHqYkdbQYlNoS5HHoiugBMupj2x78KVC6u8KnyrUach+f9FFpBy9VUaDD7coIXUXBYNjQ7XCF0ecpSLOZh4EXti/a4U1xB1KyUyFgc3XUEl4b5XUYjo5snjUH697Ya3W+cGGPmogFJbQLg1+gIB+kv9ReVf9+rAHzKryyBmfGFTkI1MOazfJ6Fsc6M08DtEK1rcRRYHI41IfiSE4hiEpD5kwUKWPfWelwG1GJYKdL/CIHAzY1TfMB84d8wb2h1QvEKigoZEr16wEGZp0q97fBWR8sxoPvr9BfhOssjzodEYonj9EFbHFfNl7IylnwaVGCt6LuNTemH8fENQb3MtzbjiccbMgNTrwjZxRNTGJsOTJYD860ZWwfTTmU71YhxlV6S2yf88h5cx1eB1UAbpeMdwoXtwgKBDwkGfi2u6CTyJ+ufnvvbR/aeiPM8erVZm1stS0DfMc4OVEt0HY2ybS9SNYn0c+LWoSellqCmokcEPc/THkmdgG0JcqcSIFzc1E8SPuOcyTeJSCbZACi8voIwCEG10wGLYcb6hK8m0JeCtAIhjx9XtMrUYMHR0JpfPvDPJxw0ITWoe253lLsTI+h8BPfj2teDMZwk/O0ZRorOk68XOp2UnkpJ9D761GxEaG920GCD7+sMFKw4yRctuxTfCM8c4li3Thsn63YkFAeuyhzwyTdgGGqrZAFnXmGcvzL2GaRJxqOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(66476007)(66556008)(66946007)(38100700002)(316002)(31686004)(6636002)(6486002)(6512007)(83380400001)(4326008)(2906002)(8676002)(53546011)(4744005)(5660300002)(186003)(26005)(31696002)(6506007)(508600001)(2616005)(6666004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JMVklTNGQyVFFQZWtQYXdYWUhMS1JmODliZEpwL1hIb0hoSHJibEFDTktq?=
 =?utf-8?B?Ylg5ZXZER0lIeXNMcHNWN2JiQjZHQWtQTXdRSTZYWGtqaC9FTzhSMWxUQjFu?=
 =?utf-8?B?MWJYTTNPcWVKdHRJZURaMW0xTDR6UU5FNE8rZkd1SzBNcFhYYWtmNTJwdHRR?=
 =?utf-8?B?K1o0YUZleDI2M3FNd25RVFhHUUQ5UWd6ZWthSDJpbllIWlpHdjZDd2pURGx2?=
 =?utf-8?B?WTRPQlhKcXhobXh1RzdKaFNJbGYxNWk4V0R1dEZ5RW55VW5DZlpDTnhZendK?=
 =?utf-8?B?MUkrTHFST3FHc25uZVdjMUsrKys0TmY3RThGY0pwWDFPOWRUallmV1l0dDE3?=
 =?utf-8?B?VFpxTHRreGYzS2ozdnlSekhNWTZSZkxHUk55WnlRMDNyeVRPbFhEV3FNUFBt?=
 =?utf-8?B?dnlsamw0RGs5Y25YaVpmbkZPR1ZoZzQrYmJ6RmhyV3BacnNuQWVYWGJaVDRt?=
 =?utf-8?B?UG1MbGhCc0FVVHJGaDluUDFrVzBRdzN1VWk5Q2Jvc0lkbjFqV1ZHeUpKcVU1?=
 =?utf-8?B?NEIxV1lyR2wwdDdLRGF0YWEwb2lnMzZiajJ3ak9WNTNVQ0xBelpvZERYMWpD?=
 =?utf-8?B?ZmlJS3lOekJNcVVtRzZPbUFsSmxrcVlJUUVicmhhbm15TW4vTVdhQU9NOWJI?=
 =?utf-8?B?VFJHN0w3OWN6N2kvelN3dktISFNXVG5zcDh3S0lqd2RwNmpsd0toVGIxVDdo?=
 =?utf-8?B?TlZyM0wwVTFxSUp0UHFPSm0zUi9BSXVrNU5OdmZ2Q2dOWUdRa0FPYlFKMkxP?=
 =?utf-8?B?VGlCdkdRdUFZQ2I5M09BQVEyeldxeUk3R1J0R3JSVVI3bEQycC94Q2xXcVNX?=
 =?utf-8?B?QnhCUjg3emh4aUg3a2prb3dHZUt1eElhL2liQ3puaU02eXo3bmptVzFZTFl5?=
 =?utf-8?B?QytPRkdlQmc5RSsvUk5QMjQ1Zkh2Qitpbzdub0tIcE1qQllYK0VFTHZoY1I2?=
 =?utf-8?B?eU5McStyYUlneUZFOU5mc0o3VFJXQ2dQbXBXQk1xN3ZZMElaVVorUmRUZk1v?=
 =?utf-8?B?bFdFMHRpazdJRDFrNzcyUjYzR2ZEQzA2WjNvRERsZjNUeG5xZ21hRjlPVVpz?=
 =?utf-8?B?d3dsRHBicFhzSUxPRGhzblZOaURpL3gvMldPa3dMV28rMGlwVVk4eWpoRVJ5?=
 =?utf-8?B?WkNhTGJkRzJ0QlZBRVZ2Uys1cXN5V2RYVDFyWjFBclZuWXF4RHJDK1liWStG?=
 =?utf-8?B?Tjk4VHVQbVFtNmoxclFFRERwZGZBMklHZkgrVmM0enFMb0crd01tb1Z2Z2o3?=
 =?utf-8?B?RFFFbk5rZVllWU5rMk03dGl3eXlrTGFPcG5kZjJQSE9QcmoycE1sVzlzaGNE?=
 =?utf-8?B?YjlkRzFibW84WkRRNTRyUmljYThWSDkxQldSOENxQ1FKdnA2YlJmNkJ6ZThj?=
 =?utf-8?B?MGg2TzBXQ2kxeFlJS3hIcUxVTlYrM0x4TG5HOTBsa1BqNUx2YUQ1cStPeGpM?=
 =?utf-8?B?d0hBTVpaSXR3Q3lLbDl3ZlowZ3VmMStENFVPQUFJYWFzbHNDUWpBOFVWQU9I?=
 =?utf-8?B?QTE2ckptWFZLa0I0UzZMb0wwSk5DNjFCZ3JmNXBkTGtDNW1yMFN1R1dZNGJP?=
 =?utf-8?B?RGV6dVI1S1ZEL1JJQTBDQ2dMNU9OMUFqTkJ0YTBVd2kyYXNYMElkQXNjODhX?=
 =?utf-8?B?Q21QN21xbWZKbFVBQmsvV05LLzJHYVdkOXJSSGd5a0g5NUk5M3JCYnNXU1Zs?=
 =?utf-8?B?MytyZ2Z6VUFWR293SmxBb3BTaDhkalh0QTliOWlRVitMbjVTdXNkcVpJWUgv?=
 =?utf-8?B?SC9QdlBEM2dSblFrQXJNZnNxZlQ0ckxCbDZBR2VWRU5DZU85Q2gxbmEzdERq?=
 =?utf-8?B?aGdTMGlydGpjSkFycE9hblNBZkZDZ2s3TnJBRlZMOHVOcENJTUNXcEI5aDYr?=
 =?utf-8?B?U1JXc214c3FieWpXWkk5ZVQwRzBmeWgxT251UEhXMktFeWd0VWpZaUNzOUF6?=
 =?utf-8?B?aFR2N2E3VTY0Qk1WMWk0dXdCR1VtMFMxaE5WSW85cHRTZVFkZmI3Q3ZaWmpK?=
 =?utf-8?B?ckk2WDdjTTM2U0I1S2VTRE4wZlVlcmd0eHYrTytGRmVlM0tKbm1FSjdkUmRE?=
 =?utf-8?B?KzZOcDhwcTlPVHdCV20xNjljYmE5T21lNkRFRnRtbXJpait0a1JlcURiWk1E?=
 =?utf-8?B?SllhZi9tQ0MrVWp1STRQMHNMaGlNNE1kVzcwN1FFTy9lOXF3anpvRFNQVGJn?=
 =?utf-8?B?c0FyMUZha0pBbjBubEtIZ2p2a1ZXL1QyajhRQklIWnJ3MTQwRHh6Z2NHa1VF?=
 =?utf-8?B?aFdYbzNBUnVJVG9BN1NtbUNhWDhYUG5JbFp3NGVLbW5Eb0NhWlMyM1V6WTlQ?=
 =?utf-8?B?Ri9mRjNDVk9xNzZtVXZnQUY2Z1VFSFVhaEdOSmJ3alEzdURHQlI5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189bdf31-0f50-433d-5e41-08da194553a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:51:17.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1kc7NjxYb0mU75X9IZeru9B6A8zUKFtRwjNaauaPYBnAjtnRjnOo/O24fnFhXXmJntozCMep+MYtqgpUmzOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 4/8/2022 3:17 PM, Nehal-bakulchandra Shah wrote:
> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>
> Remove my name from maintainer-ship of AMD SENSOR FUSION HUB DRIVER
>
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..864d26404711 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1043,7 +1043,6 @@ F:	arch/arm64/boot/dts/amd/amd-seattle-xgbe*.dtsi
>  F:	drivers/net/ethernet/amd/xgbe/
>  
>  AMD SENSOR FUSION HUB DRIVER
> -M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
>  M:	Basavaraj Natikar <basavaraj.natikar@amd.com>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

