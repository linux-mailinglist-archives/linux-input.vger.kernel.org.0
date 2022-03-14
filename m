Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F1E4D7BFB
	for <lists+linux-input@lfdr.de>; Mon, 14 Mar 2022 08:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiCNHf0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Mar 2022 03:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiCNHf0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Mar 2022 03:35:26 -0400
Received: from eu-smtp-delivery-197.mimecast.com (eu-smtp-delivery-197.mimecast.com [185.58.85.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 416BD3983B
        for <linux-input@vger.kernel.org>; Mon, 14 Mar 2022 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=camlingroup.com;
        s=mimecast20210310; t=1647243253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SwSVpdhZAskrbz5koABY9UwZXcplXHiRhFl/wX1tF9w=;
        b=dgv9ZwAOxGh5xhJoL3JLEezwv6rBw3guNPbGe/MQTsg/+SJuX3/9XgTBg2arp7MXUkfQtA
        vdTTLd+38cIpwvgyAwZ4uhJ3qNQbFEUhMryVQU9lj/7QhMcFKKqTeYgb+nEb4Dz54evAem
        2joBLiEpJMnyeI0NQ63nCJxyvUzPrWg=
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (mail-lo2gbr01lp2057.outbound.protection.outlook.com [104.47.21.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 uk-mta-260-rSiLCeSROVaaEX000cLyfA-1; Mon, 14 Mar 2022 07:34:12 +0000
X-MC-Unique: rSiLCeSROVaaEX000cLyfA-1
Received: from CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:16b::6)
 by LOYP123MB2992.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 07:34:11 +0000
Received: from CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM
 ([fe80::e0a5:31a:8eee:5040]) by CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM
 ([fe80::e0a5:31a:8eee:5040%9]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:34:11 +0000
Message-ID: <8c32195e-af30-cb8a-1641-77b7ad6e2bd0@camlingroup.com>
Date:   Mon, 14 Mar 2022 08:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Detecting invalid gpio keys configuration
To:     Jeff LaBundy <jeff@labundy.com>
CC:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Krzysztof_Drobi=c5=84ski?= 
        <k.drobinski@camlintechnologies.com>,
        Lech Perczak <l.perczak@camlintechnologies.com>
References: <5a233ff1-cde4-b432-a170-86379bec972c@camlingroup.com>
 <20220312011100.GA41683@nixie71>
From:   =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@camlingroup.com>
In-Reply-To: <20220312011100.GA41683@nixie71>
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:16b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 809f294d-7a7e-4acb-df09-08da058d0837
X-MS-TrafficTypeDiagnostic: LOYP123MB2992:EE_
X-Microsoft-Antispam-PRVS: <LOYP123MB29922B2A2DBDB4115ABBC416920F9@LOYP123MB2992.GBRP123.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: rbrkjLJ9U7AZzWN4GkdGl7dP7BIXRZHMt0aJMF+AiDOmqAJI03igvH34ZggyMTsS7JChC8zi/MxrPZpH7xNQr/i/KY6lBim8TUtU+XkwcNCu2swo8Qrrav0pmgFUqHlXJ5v7sYC+efFed0C1AuINQzdNJq9tT9GOvn6gQLHiQuQ67hGBLuEok6IHO0ntldq4cqKsnIOm8dWQ9AczRwXDvUGtzU5UusIrkqa2Zldu+a2wbUImNnhjSzK01MhDclKJ6ajynTSC29zfTqMVLyo0hEpqerdsZXqDhrXzZAzRz3NHwBKSyQYGvKxJSZ2A6/0Ybdkj4LN7A5ZfZOx+HgPcl9RApHobytVC58S9ciyoDWumjm4kdOzQTk6p9VC8lMW8MjN629LUigwrt8K4oZ0rgJRuCxL+zd37IoPp1PFb3xwZwjP5C5GIL30LmPeY6Ixq/U9xzSTTppm6DlZLzCvZigiQ3U+jrlomq1hN/AdCwqavpicTsZAEG8UFMhQirwxn6J3QlcqDqi7uqtbxyVvgkFaEy0eYTjDLyMejGnx82iOYs6iwVWuCjRcr9/XaXl3M8a6PZZJJZEl+78qhwLTTlw1qZ3gVV3p1+xt+Y7ETQLCIpzK9rqLIS1sffwDsOnr286wKg6Ayer7rIyMFhRWuGpKxoBYoM4naIt9hx2KhacZYgiiKd/S5QtMNOIAO8Mp3bVUsJjFa77Yu5RawHz1Nj9g6eBG1rkLmDgRUFWeZd/JHnLMewT1bNuqXuQUmAdC4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(107886003)(86362001)(31696002)(8936002)(5660300002)(6486002)(508600001)(6512007)(53546011)(6506007)(2906002)(38100700002)(186003)(26005)(83380400001)(31686004)(66946007)(66476007)(36756003)(66556008)(316002)(4326008)(8676002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hpckLpKP+AvC9c+L2EYhsg2fzx995X2YQNuSr1CZZSG6zUPo9Z8N0iqq1FdE?=
 =?us-ascii?Q?gr/chskwdQ2MKnJBcUSZtAcbyjONeDgAxXAwAXlh0SLyVqrBoE/Bddw6L//V?=
 =?us-ascii?Q?0mcbawIYuK4VYQzU34a4DxrmcKyQLcccdQ2S2td9eWobf2rgk53kEj4kuhn5?=
 =?us-ascii?Q?Yxzi1lMltjlmrIvbpX42MlUoFJnDxGn++5eUjHiaiqAztAz9GuyJvIlgw19I?=
 =?us-ascii?Q?bm+8bZpChnQLCMiJ27iYP0tRa6TecNUhgDj0yvlhypuDzzzd3/MXrtsOGjTp?=
 =?us-ascii?Q?3CbnCxZLM0wtHcIaL+6zW7JyqBERV3KF/ipcqTYZE/hQZLyHBbUpxrBVpO81?=
 =?us-ascii?Q?NCSXdEQMW5GDYa53SJRh7yS/ceuCTMMmAvWJK69ceBT5Wmgv2+piWggWUiA8?=
 =?us-ascii?Q?sYlxC8tqzEC1wjb/XpvlT32Tk9RwXve7lTOs4PJJGpnXN+4Uxed/pQNm9s4F?=
 =?us-ascii?Q?D+PvXUkjFr/IByhBW6M+r/B9X4pVKTQvdYLrSqczh7rpaxhuDY0T8o9CoytL?=
 =?us-ascii?Q?yi8WM5w/AReLH4znyu+Ezr/wFNpMzHH5n//ni2mx2XK3dnZQJ2tPT21h8w2A?=
 =?us-ascii?Q?kkHqdKa17JeKlxgdQYYrat/ARYlEoBxCnMWobVgL1ylMlc8FckGC/m31cZz1?=
 =?us-ascii?Q?koKwfN7XEFH+iY8x8lMTZ2sk+hD5K/tkQzdjsumuS7hPc2bf7rO2iumopYFe?=
 =?us-ascii?Q?Y0PerkDe4zxmSIu6IXoOKnEeWkpW20v+iwsgfjs0ZQYjnWchQTjC+TmBQFNa?=
 =?us-ascii?Q?P2tNAGIUzB4iukflbzDOdFexbWALVsabg8sHmpITj2kNm3yq68BtY7tmMiJw?=
 =?us-ascii?Q?G7ZJVMhsylUVbzEBE1hYpT2KLy77yG8mWUIOY7Df7FatU3lWhmnY/RY4N1qW?=
 =?us-ascii?Q?3nB6GlGuOqIzO+npcQb8NEwFf4SSHlS1HNrVnYZYLYR8yJaV0dNWH8ZLhstl?=
 =?us-ascii?Q?DlxbRyNQGbV2GotSfRq7FyBfRIb8W+dbNW28QAw3LO/tJai5SWIlZHeaBBTJ?=
 =?us-ascii?Q?ODisDHxKgNAfuwpL5HcEcvGdVUS52ztXl6OJeO1PyDMFiFKNjiKGpF7AnXTl?=
 =?us-ascii?Q?ZkdtXGfpyHpEAGxUhSwL1dsgSTQBUo1JFhenrouySeqs063CV1A5RupUitXi?=
 =?us-ascii?Q?garzD7YWTr708Ux6chkPAj1KDu2tJwMrB3n4LRz6WtLljd18Cr0TTTHu+B2T?=
 =?us-ascii?Q?vkf+HaDEqPFj4Ov9x7pXdpUn0jNXtDOXbE/WIa3wB2xqHlmOoNWlKKByV/ji?=
 =?us-ascii?Q?9goTgrBA2QsR1MCZRuqCcWhsGnU4Ip8t9AFPXj+eRu/8LPMT1/JPVx9UW72T?=
 =?us-ascii?Q?6XOZbWTa843qGbt03oJm2VON6kff7QRh0wawfMhG5mlTNiAesb1UkTHL7DXL?=
 =?us-ascii?Q?wckvumZ4iRRPsK/ix/s8pEHAwQP8zq+Oy9+/NxIaM1QHP3FZYErnvDcOruYG?=
 =?us-ascii?Q?CsFCBqisG6IQdox4LzGavvRgO7nsZqTHp9I5kpLsR6fqs33I2TFAKw=3D=3D?=
X-OriginatorOrg: camlingroup.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809f294d-7a7e-4acb-df09-08da058d0837
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5572.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 07:34:11.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fd4b1729-b18d-46d2-9ba0-2717b852b252
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0U2TQ0sbNpzHCyhqblnEsNgiP9Un/n48f1PaLD/TTUaK93StndS8R9F/YPGZvHW2NJbgQEX/0oQJ+gzQ0tai4RntSGnmoYd+m3zyENEcIeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2992
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUK97A341 smtp.mailfrom=tomasz.mon@camlingroup.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: camlingroup.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12.03.2022 02:11, Jeff LaBundy wrote:
> Hi Tomasz,

Hi Jeff,

> On Thu, Mar 10, 2022 at 07:57:53AM +0100, Tomasz Mo=C5=84 wrote:
>> While provided example hopefully crashes every time making the issue
>> obvious, other code values can cause much more subtle issues.
>> Should the input_set_capability() warn if code is outside bitmap range?
>>
>> Best Regards,
>> Tomasz Mon
>>
>=20
> What about something like the patch below? It of course can't prevent
> dts from specifying something like KEY_ESC as a switch, but should at
> least prevent kernel panic.

Your patch does prevent the kernel panic. On top of that, it also makes
troubleshooting much easier. That is, directly pinpointing the issue in
error message essentially skips the debugging part.

I think this is the only place where a code check is missing. The other
places do already use is_event_supported() that checks if code is below
or equal to the maximum allowed.

So I am in favor of your patch.

Reviewed-by: Tomasz Mo=C5=84 <tomasz.mon@camlingroup.com>

Best Regards,
Tomasz Mon

