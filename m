Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A91B568223
	for <lists+linux-input@lfdr.de>; Wed,  6 Jul 2022 10:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbiGFIy7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jul 2022 04:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiGFIy5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jul 2022 04:54:57 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B532494A;
        Wed,  6 Jul 2022 01:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqrpKoHCaRgGhWaUD45E1INOu9T0n+h078v6G54lHyKSWRnrWPHLwy9TlBNO8+neCBKPw4XQe4whDSUGsB5Hmy7gGusKCVst8Z1ibfYf99xcuD4PoeHrX8ZPTeTAt740p1nsXeGwH6o2eSP8T4uLXHQKdDIYjr74dtSNm5Qse5aYZwtx28hC8WJMsUfnmwP4CSBroJd/7KQDnsP0V9ScDsP4tRgoP+k+gtFnouS6kAox9MZQcQHOgaFE2/RlbcaH44oR4Eyz4nyggi66tUYrBgyVLDq8xpbQ3RknttQLXfBdj7y9xzqZ3pJtv04e9JAjqH9ZzHUKecypp7RTwGsh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP11vzXT8S1LV5SdbuI056SSgUDX3rYpaNL5Llr1bhA=;
 b=EOEr+5DD1krGZDZugRUuHL6ctDE9YkcxMFjRVU3G+q78fB1Poj2CMi5kMj5pShXljGP2N01il0gmG6QfKKq5DDnfxQrEmzbdEMKu2d2T+90STYN0OL4tqhUFRznSdrvaXdQnoFO47LiguYQPZVszlmkoVJQuTRmQhZiXnwQcmF24pg6E5cVo6+y9zrv2gRg81gi3OK2UsQfhr1rdwe+bdiodDY1FErhSzXBKQidkPDE9sjB6FxxuoHz1lHavU2JvPc45Ep7uA0zu9LflW8vAd0TJykpdkmDLttv+pOQxHSECehNeuR9IweGfawPqymtdcW88XhDK2JgFr4ThVx7wIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP11vzXT8S1LV5SdbuI056SSgUDX3rYpaNL5Llr1bhA=;
 b=zupxLZDuawm1IGD+vnJL1narZtGIK+m467eQBBxVPNVBt6szgjX0De1WHPy/gdn5+c89wuFXSatlg+xsUCI3+VtaiaMvY1OYWZ14o4WSyqIB/58IW+oAcHvyEmIt0FLKWwwVqO3mMNavNtRyDT/IZyLkYXIEn5QqfaW+cleABfQbp53hNZfUTbXJGtW6XQGZI8QK+zmCkR7P3OzeAliHxmptP1SIjberen6hfNIeUb2FuCAYHqZjd0K9NK/0tZRRlqUMN255GplMCb8P4kdPGe+8pdDOVGNuX9YKfaiKR9O8TOSPYLaIPoVgIrGQndmxhuV1OZX2CtKjfp5v2hgUaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR04MB5710.eurprd04.prod.outlook.com
 (2603:10a6:803:df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 08:54:52 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 08:54:52 +0000
Message-ID: <e3d32866-06fe-4fbb-4b81-d7b2f9f7a78c@suse.com>
Date:   Wed, 6 Jul 2022 10:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: doubts concerning locking and signals in input_register_device()
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     jkosina@suse.com, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>
References: <d7f6c510-d367-718c-64b2-e368ef5486fc@suse.com>
 <YrUJagnenN9Zv88n@google.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YrUJagnenN9Zv88n@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0016.eurprd04.prod.outlook.com
 (2603:10a6:206:1::29) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab9c96b-1cbb-4cf3-a69f-08da5f2d30b2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhzfYj2ZOF/8SgsoLFsPWwWbWkOebOm7SVXUc7lm8pRJH5JS36IPXtFkzkELd4nOwdWQE0RkQ9DJ1divK5wkS1uaqJDOPJjD+TKpEmtw/ul9nXSNrQy5Eer82QFetqhrIkZ7us+cAaV1Gf7nRaCxv95DOunULM0P2XuUa+OPzt1Pt5xWVBS2nCdPJjLhKDfaLnYVBqzF/77WKBBipKvxUittS7GV5tgRYZ7bcCABcRhPzqvLhxyOVfSgVtoTUL50zR9wJoW5UWUFs25XF6us7UgA7AdczzWrEvoR/mPiDMHugCILAPTtg0yV97IM2UR3cED3JmYmr9QTR26sRx3voYEbbbVIvH5SDdpOy6Gj/kgp4aKgP16KTBFDU0gb2YpW84EMc3khD0cWuDBnFHlSSjIxNHwW6/xXDfZv1JruZxFk/Uea3s7yP7gzqo6Y9g+lxO6j78x1FgsCLD2yPnCHtiwdpThxIbG0K+28NbhTGWlwu7idzArVRKChACxCsKTl/WjGNs7pDq8JWYrPw4PhAuJUfgGvK9OcDlr1XG9sW2mAJ3JBTGF4OHzi5ZQW0+//Fhokhoh6YeaJMA3LnbZuJ44Ju1MYSQDXjaDIi3obUgKq79JxVzzup051y73s44BS5YTcLWTAdV+f5Rwd4Jdox/jABWSTkjE/wbJ9++ct19WmfFtaTXSvzK0D99br2+lqNen3+nHxOuvk8Uzt2HAdM/NvWwHQM9ulvjCTNr7VEMg/QUi6vsGnUR6ztFupJFEm9wps9Ft6zBfSG5R5W5EoVEDYnl0blddwlo9vZQm9YxGqult+m09fPX42BYGseHVu1E8L41MP5QiKR4dO8ZPvzlzV2mm9VOwsXtspcWYFoOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39860400002)(366004)(396003)(136003)(6512007)(2616005)(66946007)(66556008)(66476007)(8936002)(4326008)(8676002)(5660300002)(31696002)(36756003)(41300700001)(6666004)(86362001)(31686004)(6506007)(2906002)(6486002)(186003)(53546011)(478600001)(83380400001)(316002)(54906003)(110136005)(4744005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJrOUQvQXNBcURsNFREMzJnQzNWLzN2VWQyc0hUWUFwRDZ1N1o1Uk9LLzVF?=
 =?utf-8?B?VDEyS3FqOERNODFUczRXbW1PelhSZVRWaFF0TzBKTUVnK2ZhRHhsdmM2Ni80?=
 =?utf-8?B?SzRnTVprbWFRYk0xVVlCU2ZpcFo5Njd4MkVIclVSaXBxME95ekVRYTB3NWxo?=
 =?utf-8?B?NDlLTmtYSGt3Rjl2RElCRDFhbnVsRkVhRC9iWnYyVks0ellUcHJjbXpTWVRN?=
 =?utf-8?B?enhEeVJEWFY5eExPV20wMTRyT1lYUkw4bEkzN3V4MFFHR04vQUhVSS9QVlN1?=
 =?utf-8?B?YmV0U0w1QmQrcWl3TUhIZlpCSVVUaTRjV3VmQXVvYzJqOW5RdG9FTFcrNHR5?=
 =?utf-8?B?dkU1a1pzT3g0R0lpYjJqcGx0VlV3bmxVVVZPQ041dVoweUFaQVNMWGx5eXFC?=
 =?utf-8?B?aDVKZ1loUlVENnJTdGZObWhxdU9pb3RFNEhPSFRHTlQ5RHgrZEYwd1Z5SzA2?=
 =?utf-8?B?NTJ1cVIvNXpvSXEzaUg2SGlrR3ZWQ3FEQS9qTm5RWndtZk92OFRrMVhlVDJN?=
 =?utf-8?B?Qklud2pvNDhIY0gxODcvUHR6YXh1VjZkclRPUGlMWVNtOHRjU2RSTGZRT29o?=
 =?utf-8?B?WDRiRW1DUVIyNDRwT2g2UWxuRUduci9QVE9ITXJwOGc0cSs3S0lsbmwwSklr?=
 =?utf-8?B?OG5HeWhyZVpqZU1nUmJHUTZ1V2N5VTJ4NUJwYWtPUWFOOXgzRi9SMVg0dEpj?=
 =?utf-8?B?TmJhbjdFclA1eTZUMThkRDQ3NTl0VGVoZHdIblVkMk5jQmVleVVHTDlYTmJl?=
 =?utf-8?B?d2FkeFdoQjE1M09lb0l0SHNlb054MWZFc0xrWlJ2dkdpZzEyd0dsTVVjODFm?=
 =?utf-8?B?aE5iL1NlTytyR3BoZHNwaXhYdjA1Q3o5WE9LSCtPaHVGampuTGZSaTVDTU9q?=
 =?utf-8?B?VFVpbEpVMURJVyswV1czYVdxeDYyKy9tSjJSZHUzR3ZFMDBraGpiaHBzRDly?=
 =?utf-8?B?bWk4QUY3RkRFdnUvd01ibkFPRy9uQTJRTFVFU016aDlnUGlJV2twU2s0STZI?=
 =?utf-8?B?NFJUaVNjY00rWWgzSHlXM0pGaHJNN2dHUDl6UnBIb0VzUVJsZy9EbDU0cTdi?=
 =?utf-8?B?Mk9QRHBIRDFROXVPbzcrZlpNRjhQeFlXeGE0bVVmL3VVYVozQXVFc0wzVjFL?=
 =?utf-8?B?QjJVSGNLMGU4eXFTQUJReW9EZG4rMUtzTmZYTTBQT2ZMbDZvOHh2Qmk1UHdv?=
 =?utf-8?B?MUw5S3dXdVR0bVorZHVwV2R0YXFxUUVuYWJLMythZitCSTRPNWZaSWVxaDd0?=
 =?utf-8?B?YXJCVUk2aVNYVUg1bzNVTVE1NFA3VXl2OUs0QnkvZFJGVk1pRXlKUTZEQVR2?=
 =?utf-8?B?a3VNa3pHb1grelExUm9Jd0VibUxTZHE3dXlRRDdYQUEwclQrWktJb1NSa0dY?=
 =?utf-8?B?cTBNTlJXWXN5TkFyQVFSaWJMcVJDNU9qU2wyQzhjY0tCcWZ5eUJwK3oxc1o3?=
 =?utf-8?B?ZFVrMmJOMTI3UCt3UGtaclM2dEZwL21YeW1nU083dllNVzN2Nnd4eGJVenNp?=
 =?utf-8?B?UVFsYVFMYzk3OFdYOW1Oa1hDclh6em1rZTg3Qm9EalB0N2crSFY1L2xuTUYy?=
 =?utf-8?B?NUdkRUVybFRaaTBURTh1bmZlOCs2dFZaR3l6VXFKN0dCanlNVmJwc29OWENH?=
 =?utf-8?B?R3J3N2JjU015b1NzK3phM2FsdHpWZUxtQk9qTlVadDlhbWFtM0JVYVhaZVI3?=
 =?utf-8?B?VFZGaEgrZDRreFFhTnJhbVBNaHc5ZUprSzloM09VaUp3Ym9oYnI3ejIrYVpL?=
 =?utf-8?B?R1hMSVoyTUpycVdhQVlkTkhQcVgvMU1WemxwY0luYkJ0S3g1bThDRCtYazNo?=
 =?utf-8?B?Znd4MTI3K01tVUZaR2tXSmw3Sy91bjY5TkhXSk1UZmRlVk43bkFRaVJSRDZ5?=
 =?utf-8?B?VTVvZUxFQTBBT3d3WUhWY08xbWpzby9mYzdGVno2bVJVYnVMWUdDK1lyR2ln?=
 =?utf-8?B?R3J3YmE1RW5yakNVZEtQdW52WTVZV1VuSlk3UkhxSGpUakxKRC9RSFg4c3lB?=
 =?utf-8?B?T3JVZDZPYjRqVnQ5YVBicW1kYlg4N2xoWEJaRmpUZTA1MFh5aTMva1RQVlAr?=
 =?utf-8?B?eUZVRzBVTFVTYXJWNnk1R2k3U2RqV09NMVowT3lFby9kY0hzVHgySG95U1hY?=
 =?utf-8?B?RFJhT0tDWnhzOUs4QWZYbGxQUXVweUdVMDJ2SDhMVW5KZGp4dVZ6cjhidGpU?=
 =?utf-8?Q?RUXr/zdc//6cLLH20qyN+Qsalkep3tRWEjp74ZPVuMtg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab9c96b-1cbb-4cf3-a69f-08da5f2d30b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 08:54:52.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtP85ticO7mfJrFxNSutTyVYFQzBLDcP97y6kkBqvULIE1ZmWroBB0jpjhw6fMlFPHyUUWrliWFNg458EveRNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 24.06.22 02:46, Dmitry Torokhov wrote:
> Hi Oliver,

Hi,

> 
> The reason I believe we should be using interruptible or killable
> versions of locking is to give a chance to bail (with Ctrl-C or kill or
> whatever) in case the system is wedged for some reason.
> 
> Where would this mistimed harmless signal come from unless user actually
> tries to interrupt module loading/driver binding/sysfs access?

timers, window size, ....

	Regards
		Oliver

