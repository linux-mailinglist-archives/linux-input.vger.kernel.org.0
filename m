Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD4E756956
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 18:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjGQQia (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 12:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjGQQi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 12:38:29 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775EE10CA;
        Mon, 17 Jul 2023 09:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1ZEBWckPNbhi5iQLLWlOLq3EGfTeZ2l5C4joqfjkQ2sAyi2KEHtNmRtCy1G1vt/ixCIEcjj7To5chZCIVTEje9f4LNEA1YNTYygR4UY2KtT0lGDbiXfL5Ra/0OJLoZ1k3fSimOw/DoXuF1QfC4y16F5iMlra+zalR0uqEhDoTBpS+P3qgbOq1Chgr0dCsaWlIXn4zUyDrWXGSECPYuoSBz7Con0SlQMG3xfov8Uwr86YtKD4J3a9K6R97meNw3BUmxPSCZL/FH/jn1KO0UMDQbpjVKiUPDCAr8hpIL1csAYc+vYJ7WK6awP3SDwNNcwIBSqPqMGwCFwff3yE/RrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSFQbg25fcmTpjFZq4EmM6Eh0Li/biHrLXHNE/Ddz6I=;
 b=HTOL9WjK+OT0l0Ub8uy+3dSXUKMaGRgggMVg23bzrynj2RvlL2WrBb2di5GRjjkSzO2OE0iGykzGXxydY9QW+YulHLYaEqko+SG+e49+1bKBWM3roPMtqFSQK7nPLomCSO1YQ2JPTVnLt/8oIVRHqStw5BpUMlO469VP5/3R0vUIXM10uZkCpIiAMGaYiZDU8eFmewMGlorBUODwNXPrBkfcZtmYbPaPGDyDtCQwHe3vujvtY7bhHX6/U4/qmImihdMaRtPNJ18ONTX7SS/S7N76lyNuOgQbIl+3rO12GZ4aUzOpbS6d/7i8IdZuvyhGS1uXT12IDK+a7X3lcDPqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSFQbg25fcmTpjFZq4EmM6Eh0Li/biHrLXHNE/Ddz6I=;
 b=o0D4xWXHl09JHpr4nFwIQK0oJqxJRGIq0m61j5etAEfU/s2KyOTcZ+/0PH9Y7mM9M5RsGjyr+Gl7GShRr9pmA6He+QkjzkVCxPnYQ2dmFq72x/u+BEYHhmLLWAQF2a7pL3IzqqOrIFXrsF+41zk7MKRzDdqj1LLrAzkyVfsq0mF+0MIlYuKUUTJQg5bdIJe7nmjaEhH42G5Gcy3yUjo4w/tMjoJCHJD1KlsGvzSrMXlfmTohmS7aeLH/nUEsX/90rzFjVeh/yYNdYc1OitA6xHDorpV2vQHJ8zvxxkjKChOlOure6KYEVZSQDHhNVJmuvrv0vh54BSLdknCuO4QhYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by PAXP251MB0577.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 16:38:23 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6588.028; Mon, 17 Jul 2023
 16:38:23 +0000
Message-ID: <24393020-6189-8e1d-311e-8836f59fc10f@polimi.it>
Date:   Mon, 17 Jul 2023 18:38:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
Content-Language: en-US, it
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <20230627060437.GA726439@quokka>
 <dc79f50c-0539-0d7c-129a-d02d5bbee4d5@polimi.it>
 <20230710021034.GA600582@quokka>
 <2c2a03ac-cd11-7893-4b89-b88845e0f189@polimi.it>
 <20230717001544.GA129954@quokka>
From:   Marco Morandini <marco.morandini@polimi.it>
In-Reply-To: <20230717001544.GA129954@quokka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::20) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|PAXP251MB0577:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e47004-7fae-4c9a-949c-08db86e43cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m140ebLzcmomFn+W0YhUe1yVxg4ps0stC61Z7lbIGSRyIdjuwscLnWV/nMBArScOp2Uh6IMZ81FwXxdOzTDjmXMq/wqo8x+7hK4sVPDOcIdqhkEf5ECPKY74XGXmP6DYa1F/A9aPfRG1CouYdMI9P8+/i1ZlDFqFl4fOdNsVBEGbuwwGYMwuLhLA7A0LmdOty220tCUBaxJzQz+mPRGECx17QP0O0hOapSoaIg0WCA08lj73h2kkB3jzWUQN1IvAwRuMcYxl/OSB12F0WoeaelR61OL1Pa/yWm+RglOY0Tn9M+rw0+urNK9+0abUsAoupAyfAl7ovfAecCX+kmpzLtTvNq5qiQhhZ7x0lJCqmsmtNdEzd9JpZtvO5s9H4GHvTeO4wc4n7+U8+GfB5/pBNke+vbmDUE0OzG3AuGXrviIlMqgWfDNaKKjW72PExodZ5mN5SQ7svG0bciZttK2dC6xXRe9ZBUcjZcyrQv82zo94UxL/1Qn8zVuyHL6pks5AVB2jub1hfm5WApbEQLAk4cNu6egAGsxnjpSv/7FZVI34GWFqhFUc74LlnzXNLPjmuTu1dKm+K40yY55/NkQnMsa5/BuuCHmnewgos8/GndPWhs1yngIyvW+UJJUwbsgVqjhiHdeG8Ak3wSS4lCHZ/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(4744005)(2906002)(36756003)(44832011)(966005)(6512007)(186003)(83380400001)(6506007)(26005)(38100700002)(6486002)(6666004)(54906003)(316002)(5660300002)(66476007)(6916009)(66946007)(66556008)(2616005)(4326008)(786003)(478600001)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzh1RDlZb21xZXpLYUdSNFJaMWI4cWVia1pDMTRkL1hNNldKeE4vMjZEUzI4?=
 =?utf-8?B?UFhRZHQ4OGVaMjV0eTd1OU1ZQXdBK1pTQ3lWV29xNjNvSzFYMG1vQVo3THhp?=
 =?utf-8?B?U3I2TEdiaU5uUzQvUXN1ZUpMMnduZEFGUTM0RTdPV1lDY3BOK09oMzlvdlNP?=
 =?utf-8?B?YVpybWZPMlRpY2RlREh1UU95bUc1RTBBSXRxT1RlbThyWERpSWxTbkZZa3BG?=
 =?utf-8?B?WC9BanNKN2d1M1NuVDUvc0Q2b0VITEhaZ1dhRHlLL29wR3ZaL1NSblBEU241?=
 =?utf-8?B?MmNjWlVOZW5zckd2cVdTK2JEZ0NLeVlDblM3RVdUUXUvNGNLR1lLaUNIOHky?=
 =?utf-8?B?a1dSVkRmMC9aTzhiVUh1VEVUaFRjZU0xT0oyRC9kUE9JdUc3MjJlajBkUmxN?=
 =?utf-8?B?ZjNDeithU0tkZnJGRTk2emh4bTI1SXVsaVZLSkdFYkVWWjd3Zko1RVRZSDh4?=
 =?utf-8?B?N3VTQ0hwS1hIRmd1MzhTOWVYTG1tOFR5enprdzdLY2w4UHRTcVR6dXhja1dm?=
 =?utf-8?B?STlYcmJxcGdOcThHWjJXRzhIbGI2eVNWWXIyTkV2cTQ0VllXRFRUVXNWdHR5?=
 =?utf-8?B?UzFGMlU3VmxqNEY0WkRpWlcvY05scUtnSHlhWlFRR1dOR2ZwTXFsWDFLa0pO?=
 =?utf-8?B?Z3F2QStSeG15cXZzdXBkKytvY3d6Z2lZVmFzSWZERGhoZTJIRU9mSUJPdXRD?=
 =?utf-8?B?dmJuOHl4MmNmakRyUVdUdnhBZ1J3V3ByWVAvelFvVHFjc1JFVkI1M0pRKyt4?=
 =?utf-8?B?WVJmcG10NE1nSWlUSkNkTmhQMjVnckNqc2RsY1RJc1BWVVZNVlp3dXI2M1Q5?=
 =?utf-8?B?eWRkZE1NeUNhaUIzVWNEN1hBZENpYnNKK3FxRmJiWStlUVFmMFVJRlBHVmhD?=
 =?utf-8?B?K1FuSU9aNTRDVFd4cWxnTmdORWx4RitBY1RLSTB5SlhSVHpMS2IyQmdPZm5p?=
 =?utf-8?B?R2phVEVWUHBWTGU0WHM4eXJaZG0wMGhITHhyZ2VQRWc0aE9jRUk2RUFZSmox?=
 =?utf-8?B?aXkxdTZMMlNsWDlQdDJSVWpLSlA3UEFzSmdXYXdSNUVCRHJLeWNOS05JVGx1?=
 =?utf-8?B?L0hNVWFhdE1lbWU3dXNjZ1VVNEE2ZEtsZGR0ODhNRDliREJRZCszTlNXRUkx?=
 =?utf-8?B?Mk1LYkxCNHcvUW5aa0xRRXQwMnlHL2tYK3NkZVJGNzV1QjJTU3VBUkg5WHpr?=
 =?utf-8?B?SlF5ZTViMGlQUy9FYmhPRm5SNDBIaVZBRTdQY0dKT2IzZ0NDRHRQcE5DbDE5?=
 =?utf-8?B?QVpPQ0dLVWlMOGlJWTdUZWtOY1FwdnJGTVR6aFBiRGpzYnBwZHI5RGFFNlVz?=
 =?utf-8?B?bWplSGtyUTY1OUk3aHdlc21veTVJK3UzTGYwdGNyVjhqV0hSNmtTeTR6TjJv?=
 =?utf-8?B?TTVLNnl3T1dJbjEwZVV1Y20wYUpVQTFMbnhlRVZDR3RPaVpGZkVWYzJrZitw?=
 =?utf-8?B?dENwd2ZtekVXcnZGalRJM0tFbitxM2hOQ1dsRzdoNi9uaEJ2ME1ObDR4MUd1?=
 =?utf-8?B?ZzluSC9hclRPZmF6ckU4S0ZnZ2dBSHA5RjhZeUpQY2xRNHlUR2RNci9TUmNF?=
 =?utf-8?B?cVBBMFZ0NHp2anBFYkZQQ0cyalhFR1MwVS9nTHFnRTV6dFdMRk44RVRyY2s2?=
 =?utf-8?B?S3dCYVlsK250SU1MWEUwNFVvdTVWRDhybWFtd0RUWmQyUjg4R2Q5U3FqYVFB?=
 =?utf-8?B?TXhrbzBESytGdzl1azVYREticGZtaldHVnBaZ1M5VDdNQXczVkJGMFEzNmFU?=
 =?utf-8?B?UDlIdG9xV1VPeDBSUFVpdlR4dk1YcCtPd29HYk10K2YvMERqN3A1d2Vic3c5?=
 =?utf-8?B?MVJjRlVsUVZVbXJwNkxrOUVnUGlpa01SbmNtd2pJYXY4R1hOMG1hMmF1REVv?=
 =?utf-8?B?cXQxSWEzSzdyT3AvTk9tSkVQclJZS2JYS1QvNXJBQWNmN3F6bVFNd2t4Nzli?=
 =?utf-8?B?VXpURmJpQ0IrQWNDWnA2VGwvL29mSEV0YUZacUwxT0xrRE1YTWh5OU9MbEJw?=
 =?utf-8?B?ZzY1OWVndDV6anVHVVlWQWc4ZGxQdDJFUU5iczB4R1lJM1lxeWlWbDdxL0Nl?=
 =?utf-8?B?cTEzV1MwSUxwcGtwNjUzaXJxWkcxQXNJVGJOWGp5VW9vSnFzZUlOV3R4Rnpq?=
 =?utf-8?Q?MQkU3IAjRbqhQvNIb6DdWpTTe?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e47004-7fae-4c9a-949c-08db86e43cb7
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 16:38:23.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOdnzDRuyV6rhUifV14OQtquJow995LeIrDR5DurhqXVeGA8u9ho/HwBH565pJqDEMr+VT0K+Sos4o0+ZhKxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0577
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>> I've not understood how to get rid of that colon, and I would prefer to leave the
>> explanation _after_ the corresponding code block, and not move it before.
> 
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks
> 
> This suggests that if you write it as "what follows is a button ::"
> (i.e. space before ::) that should render it without a colon.
> 
> [...]
> 

I.e. RTFM :(

Apologize for this; I'm going to send v3 with the space before ::.

Thank you,

Marco


