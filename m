Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28BEF736BF4
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 14:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjFTMce (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jun 2023 08:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjFTMcd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jun 2023 08:32:33 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B6510CF;
        Tue, 20 Jun 2023 05:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMmTFPQTirkUyLX/a1VkHQizm/qpvwCddJrC8Ag1ratg6Oa9bElaTtI4H0JH0ydD7wd9VgAEvbpDmLQZZme1HtynY0/VmrYKNwsIMjqZ6+55O0sV2UT1m9ABpgVTQ6GL/6M4jGw10kG/8C8xUODTl2lsKIc6kFKoKNN+ZCgdAc2kGOz4tuwmcFX9dycoxmdYMy8pwirPtJkuf+rjqfoKv676/NKUM1heMcp7GjZrGVMDxMPHPjYXP5vKjqQJNRB1jEQqy7DCUdmK4R5uEXznGS7We2RpEw2sgIoyT9/hvTN+Hoom8vVmHfq/8pw7X3pKEMz3apVg65+aFE/h8OZwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myvCne4T8EqSaQUeoeLEXrCdMkwDygK7qpV3sUn3Ktk=;
 b=j8XiGkmJvoipTIpiT5rxIgpEx0viyExzmhuCBA/fcOmRttOxEqzqCMeHiQ6aTL26YVGIOQ27bik8NX3Ccr4Skji3VJhgAi1EhsZ4MM756dycdh7w99Hos6yescsMlEj5J021AIPaMGnocniY/hjianDEcuAlIQhlyMP/G0Mxl/xDn12nQAV5WMAsGPw+37fe3kPzO22ExGhWd/xVGwh4qXTTYtQk59BYcK6Xj+bIDFA7Kyf+S+SRgb5WJVne0zWdlFR0XAvHtLaDg2RKZCDctF9LdsfkU/Wdi9rs7iqfYjYFizp67CKAfIMGqBHmo66X7N4rN6ClZiqS1vXVvkIrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myvCne4T8EqSaQUeoeLEXrCdMkwDygK7qpV3sUn3Ktk=;
 b=YF1Gr8SazIJP+kMq6rfLoeQWqzP7Wu3KL0oOSvz4XArEmzF8y78kfPd9qRQRs1niV0C1EUk+gkfHdmL78NdTYSkaZWrIh9gr+qlc6crP5QG7HXQ+ydRwnPZCEod3UVFf4aUGYEwz3eScenYE/v/dbRmVAnl11kgg6sCHPF9w4HyJK2vP2qf/2vRh4o36WijvRIlZatsTdgwhA6mCRqcT9CodN2/0TsYCmdM8ZW4D68D/m8hgnE1ZFZR4el57/7qsfIvvcgNM9NDGV7x2btKCh/MRDA8Nk05n6L5dtp5DsQOdwIuvHZr1WJAksy7RFxFU1aS4DARfuf1SVNawqmZHLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:20b::10)
 by PRAP251MB0490.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:290::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.40; Tue, 20 Jun
 2023 12:32:27 +0000
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::459c:ad77:2151:62a9]) by PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::459c:ad77:2151:62a9%3]) with mapi id 15.20.6477.028; Tue, 20 Jun 2023
 12:32:27 +0000
Message-ID: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
Date:   Tue, 20 Jun 2023 14:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH 0/1] HID: Add introduction about HID for non-kernel
 programmers
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::16) To PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:20b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP251MB0348:EE_|PRAP251MB0490:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d87400-ca74-4983-f7ef-08db718a6818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yEQ2Z+gxF0YCVI0gTRsH/mCynn2XbFNx8dZxjNX5NKNVRhXaJbMeH81koK+d3kcyy7FqdczPJTWRYfOX+id7wwqJWQgEzoK+n8oQJmm4jGc5LvQxbx3ueJV8g+PKBVJPFCYW3EFi+OC0Eav6SxSrH9G3nNsv0Ouo2KULx5vjGPk4Qo1STucE1WqKrQjaZkMbOKXGY0peY9zMxhqVBeajxe0vJYAgUQhuTtzewRJ/aKICDRD4g7sid1z4kNr5x7d/7KLubd7E7/tYBKczG1UQn73IW7k6PcKCqNg44jndo6CcDf5vfUw1irqNOCLNAtiSsaJKsUv5PIfw1yKM9+0c/FKKTRZ4qzB2+AhmK4iEtUAvkNxOrtaIhzgYqpO6k3vmjuxyIf2qb/cnX6SsuDWwnz3pMvHEGUzINedflkL9iq8Rm51O4Oi3ekkqmIapcGAH5Pcj1UR4zhZsBE3TsqYBztlheIGDjiBkftzVbR3VGnpH04Dd3ecVKXx/6jWhRfFZVwzzhA9xeQSmtR5dJw2OBs0CgSi8Oh2Q0fwgD7109olYKB+QDTEqb4MVdkw2tNlJ8FdmfAoJh0lArVcdZzN3La6wwVwgLxp7iZIT7WmiLmGo0czO83NVgPivyaSXnTYE1J6X4NmjDXuQerCbUw8HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP251MB0348.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(110136005)(478600001)(6486002)(44832011)(8936002)(5660300002)(8676002)(4744005)(2906002)(36756003)(31696002)(41300700001)(38100700002)(316002)(66476007)(66946007)(786003)(66556008)(26005)(6506007)(6512007)(186003)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0Ezb040YXZmRGVFdVpDZFNkQnQwTWhUMzdYRTRQUkdGeEVtV0tWS2c2aE5L?=
 =?utf-8?B?bFRjL2YwdTlDaE02OUNGNUplcHdyNjQwQUF2NFRuMElJbFpGZmNqTldWc05u?=
 =?utf-8?B?cXpqWWNzSEFJQWwzR3RUV1pnZkRnRUF2L2gwNHlFNlY2YTRTdE5YcW9JZ2Rq?=
 =?utf-8?B?b3ZTdG85aFlhNFF3d1N2VUNheGM4Nlo5MWEvVzB3UDk1OU9lRFdRTnU3MHNC?=
 =?utf-8?B?RkhrT3lIS3RnY1VUVW0vOEFqMHQxQXlFWWJ2dUt4MlNaZGlvemFSQ2g5elJZ?=
 =?utf-8?B?Y0ptdkJwNjhQWHNrdGlyMGFyMHFyVGNocExLMjVPaXB6WE1LTDlXS0ZwN1c5?=
 =?utf-8?B?amNRZDUvRW4zYllWZlhLbis1enJKMXNNdys3NFpGcm9jbHA1cCsvMUlrV2xM?=
 =?utf-8?B?U05qTGc1dHBPaE1jd2xFNjcyaXEvV0JqOUZZRzdRMkZFdERyNlc4YjBqajBw?=
 =?utf-8?B?U1BoRTBNVmkvZTVPbDR2R1I2QnczdExHQ01ncE9lZ3hBeDZ3VXROZlpXeW5D?=
 =?utf-8?B?SjNQZmJkNDM1QWJrelYzYytFN0d3MTE1UU43ajVWc2RWUkZTbkdxQU1JLzJl?=
 =?utf-8?B?RjIwTjJ1ZWxxVDNQK3hrMVNDRll3T3ZOSkoreGlHb2loZ3dsYzkyNitzcDVp?=
 =?utf-8?B?NXo0clMrNmJpT1JoYm45RW9RZmxEa1JTY1JZbVNUaDZxVEFMQ1Jpa0xId0VG?=
 =?utf-8?B?bW14OWRRcjAxMFpKYmVTbk9POXNoek9EOWZkY04vQXJnU00xWkRQd3h3Q3hQ?=
 =?utf-8?B?Vk1ZSkxNd2VUOXRjUExGamR0K3VRTGcrQk9VM0VKWDJHa0pBaE4xalVXSmdR?=
 =?utf-8?B?TmZTUXZLb1R6em82a0Y3TkRlOFVlRW5BN2RlOE5RYStpRmdVaUl1dWd2eUNk?=
 =?utf-8?B?VWlvV2lFa3hXSnRrUjBpeUlZaEQrdFg1TVVNZkc1UGFXTHZ5aUNaSTRReDNt?=
 =?utf-8?B?VTRIRmJEbXRuYXAwWThHZTVLTVYwaHNsbWJYeFQyVlRWZDZrOGR5U291ZWNw?=
 =?utf-8?B?b1M0ZFNDakpHMGNoc0VsVlZqZUIxeGllN3BIdnlvUm9seG1SS21DSVNvbkx3?=
 =?utf-8?B?T0FuVFNtNGdjUkp4SWxzWldhRTU5TUZ2Q0E4ekpnZDRzNm44N3pwT0xqcTI1?=
 =?utf-8?B?ZkZUamF4emlROXMzUWU1UkJiRDRma0lpaHB1T1IzUmJRVVptSnJWanBNUEQ5?=
 =?utf-8?B?bisyZ1FqUGRMbTRxS0M0QXJQOGVmN2xpUUNreGVadVNmR2FCYlNIMjZGcjRn?=
 =?utf-8?B?L0dwUGNNaTBzOEoxZVVrWFhYN1gwZmFGSU85U3NJY1ZlMWoxbXZiNGszTWJ4?=
 =?utf-8?B?QWlqLytmSlBFOUFENWZqTmtURTJMNEJNME1ISGlOT2dzcDFMajFYYVpla2hV?=
 =?utf-8?B?WGd6SXF3Y3pUci8zcFpnUHllL1FwSERkbU5FcWdzM3VqREwxczd1eW53bGp2?=
 =?utf-8?B?ZFlLL1p2RjA5eDhuYmF5TWk2SjIzczA1NERyS3FjRGs3R21HSFZvZ3A2MU9p?=
 =?utf-8?B?cExvaEZOeFRkNXRWYUpjS2tJS2JWa2FUdFNWQ0hFNElCUktyTkxhLzRBNEtn?=
 =?utf-8?B?c0VCdlhpdmZVdVJjZHZXSjM3aHlGNkI3Q3AvNko5Q0FwMnB1UGc0RnNCckJx?=
 =?utf-8?B?M0xJOFVrU2p3azBaTzd1YUxsQmVudnFuM1FiK1RYb3R1bVE5b0RvQ3NqT3U2?=
 =?utf-8?B?eGNQbVBQSUI4VGN2YWphYlBlQjlTMGtBUmVSd043a1laQTBDNGxmVWZ0OGtD?=
 =?utf-8?B?U3dQZDhHRTdwaldGdFVIL3pEanlxN2dJcm1yMnIyYVZhMXhjaFJyQ0tYbWVj?=
 =?utf-8?B?QWovUWJTdFZLYWRZWWpVd2IzNTVYb0lGakwxd1Zhb0Z3R1dwYVhNdXhXdG5k?=
 =?utf-8?B?Tk92c211OWZkeExLTkhBZUtlKy9LZS9ZZ0pRUDUyZXZ0SXNnTjM0QTBGSGJI?=
 =?utf-8?B?UUFTVFJtV2VNMmp4V1lOQklSZTlOMTZndWozdzhBZDZxVUVzYkZXMnBIUWpq?=
 =?utf-8?B?ZTVxNzA4RXd4UEZEZ1JUdTkwZVZyNW1aRjVVYnR1RUpIZld5RDRINUJGR0tN?=
 =?utf-8?B?TzJwV2VuSlpFS3huSjRFZC9KcmxqME1mVVU1a3FyR2UvVTNBMEl5bitUVFE5?=
 =?utf-8?Q?TkOfgnNOC6qjTjikZ/7RP8x02?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d87400-ca74-4983-f7ef-08db718a6818
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:32:27.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yilFvn7TZAc6McFSA6iuDo1grHq0yKWVVEhFZRJio/A2zAPb3TJ78enfCeQBV2UYyAWn4DBT9DyJlvTRdSjxaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP251MB0490
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This doc addition is meant to allow a random user 
to understand what is going wrong with his 
brand-new device, and possibly try to fix it on his own.
I've written it, being one of those random users,
in an effort to document what I think I've learned,
and with the hope to minimize the pain to guys like me.

The chapter is by no means complete, and for sure will require
careful checking and fixing from the HID maintainers.
In my opinion, it would also be great if they could add a brief
explanation for the different quirks (I've left a FIXME there).
I hope I've not misunderstood too many concepts (?events?) and 
that the whole thing is not so screwed up that it's better to
throw it into the thrash can and run away without looking back.

Marco
