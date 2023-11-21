Return-Path: <linux-input+bounces-193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6457F390B
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 23:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD5E1C20B4B
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 22:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3D842051;
	Tue, 21 Nov 2023 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b/ZtwYFV"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6792CD49
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 14:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFe4EVsnKxjmilAZFAQ5byhhQ72u3kF4goFXsfPF5+ivSYlrmrg/AgygIMI8huAqQucbEj2uPno1NgG22DNLx2u1Wc5tk+yc5/Wic4lnovnRcu5r/pRpu54arWMRafvD2eoN38kXiV0AIVUOgLU1jZYPSaF7YooaF3hyzbozzNO4Zb0AsxZnvBAzmi5+VNyX6nfmqyUmDYYrQS55jEIHYxtcNhcAXQkHBSQ7a0Hj3X8a0QdJ9ERPV+SM3nG+/MLKZ8q/AQ9ScWzfd/QZ88xSTEwumIt7p3Lhj9nb3GS1WiWIGpiOvpgIJCUinxLRLGZjYz5sqAfJWG5LIWdWKfS+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et7KvFCcEGfEkCfe5dPO3tmI4IS547RyUfpsPiTaOh0=;
 b=UCpUnCJBiE/ZRjSQyi5dloIINGESuvhgL732rXvvnpWPbfVRZwR8HeRc/1FVa4XP0dUTCmvVsDFUv1W4N4W3p0qeZ6d4XbbapHA0OkATcw4MyiIwSYJGE1dcxMQa7In28lnv4RgzlvddeBX9CwU1WjFGg3piCq5eTTq63AKdEuFd0+ZGXFjYZPKV1hqUVlnR7US23xeRZQwRUD3iV2oj++XRBox8wA8JaVE2pGTlqrYFiRfwIJc9ghIQJ+7Lc8vOGEGKA+Ht6t9VQO0SXT3Tak1A7qEgaOpOiRQ6rfovWh1IDRRzVr3GJNALs5G/+44ky/A6W+ceZX4i9WIx/NYz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et7KvFCcEGfEkCfe5dPO3tmI4IS547RyUfpsPiTaOh0=;
 b=b/ZtwYFVGKcP/oGNLHtMvTBBlCevnSGTjM19aIUSQPhC4FNBLzu7XGNPM1QTwZ5wxUjBlMAN/zb10CpwxR6SsC1ZM6Rb9CFsfFiAhqFLMoPMIqOjmDGA+VGXngrNYz+utusJ39JNyfv2uKQo+Ry/K1HEv1X7XIbJ5cZ94G1+XqqvzRmReSjVGRo8Fr1DxWtDyAFj3v0pxuiMqD1zN++1YmGzIJ5/61JqUSqTrQcyasqaDFAoH/Q6S2pR5VCdGtxTvaEck9K3FT+J1jeVeMZ9GhaAf6mcKIRuL1Cwaa1bF0Q3qI8chAuK+d7jwmH7Oz2YEVkdxGVTR5ZCzyVIp/ZUEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 22:15:48 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::44b4:6f7e:da62:fad4]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::44b4:6f7e:da62:fad4%3]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 22:15:48 +0000
From: Rahul Rameshbabu <rrameshbabu@nvidia.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Brett Raye <braye@fastmail.com>,  benjamin.tissoires@redhat.com,
  linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: glorious: fix Glorious Model I HID report
References: <20231103011038.27462-1-braye@fastmail.com>
	<nycvar.YFH.7.76.2311210938070.29220@cbobk.fhfr.pm>
Date: Tue, 21 Nov 2023 14:15:40 -0800
In-Reply-To: <nycvar.YFH.7.76.2311210938070.29220@cbobk.fhfr.pm> (Jiri
	Kosina's message of "Tue, 21 Nov 2023 09:38:16 +0100 (CET)")
Message-ID: <87pm02g3cj.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|SA0PR12MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c673c7-f1c7-4113-d7af-08dbeadf69e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/H6wdE5DpAs45XJzUCg5lN0gEQl0Hp3IWghi0bPfmJP6O6aHWzpqPH2BiUeyQNeHZmFbTkw55jm0HhGEL1p3jUFtp1PjJzPgfEbF8snlJMoWBD9SVyyTFQ7KVKY3ynUhk3Wt54xba5r0Pu+qIW41aeWBKYQyy5iCxfCkdqlFFzNHuEW8nPxVEyBoxmBWeMiFKLGS3YRuT0GeKgkeVAbwqneOsFhuUM457MrQlyhd1Ekrt9KjZ32KwsKHTS9DGrV/KnnEYqQdo6TveDjV9mWWXMjXBIipdv+6LnPK3qnxqxVAMKtf/LtqJuhmv+d7CLRTKK083PKfsATmejVEO5CMpqsdQXz3+e9UjCsR/VWk6uWlmrJ5a5YvZPXlqwm5WfuyX01nSCyr7eJiBNC81Ox6j/SCmz00jZEcory1FMZ6mdaG8DOxzFJwL7YzP66utNbHXWVemHYjE5rC02y6IKUj14CBlHsh59fiHGNuy2baAq1QkM++fdsB4y57c+8CY8J0W7/zhEJkVAZxctDOs7vXLEOhJk5XrqeXQg710kZOsFeJikyfYUs4wFDYdoJMX72QGOoImyNOsgoc9ui/8IiEHUBTuGnfJqTKgyKG7avaO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(86362001)(38100700002)(41300700001)(66946007)(8676002)(66556008)(66476007)(6916009)(316002)(8936002)(4326008)(5660300002)(2906002)(6512007)(6506007)(2616005)(26005)(966005)(478600001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k8UZJdSZgOXAhlzfbnwuDeo1dU4RHiZxdOteC8mRqSrXvPieIL7dWoezMxcz?=
 =?us-ascii?Q?10s76CG0d9vRT5Ft959EfivZ4yhncFPjsmaYPQ4bJQf6g7fnTZ9FokLHpmjh?=
 =?us-ascii?Q?8dfYJ3TGltjK7uYcWoRFwgEoU4HR51IQAYLQpIKTSCMJ9FEhKCLDE04mJ7zT?=
 =?us-ascii?Q?x7tU+5kzoadz/FIqS5mauNW8UzdnJQmY/qKnbheBqlpl8U+bV/ltzppIcI7s?=
 =?us-ascii?Q?1X39T6DeRLrSTrrbXUpPSdXJ6uE/iKKZvzpWasl0Ufw1oCXxjoNtpglQMdbY?=
 =?us-ascii?Q?pIcUjvqWnu9sDyH2ZkYPNGmlQsJVYzAf/HAtyoJ4UpAw8hUOtJhxXGqCAXhz?=
 =?us-ascii?Q?0MSoHjwIXJ+LEa6tT8Nl9QUdbnPjYLE65VurG5mZRVq38nfzXL2QOwCOcPjO?=
 =?us-ascii?Q?vDl04LwkNxnkrfmySb0EOu/6E7Dk518DOvPJiQPa8Bw8E3JRa6o/MxuxPWNj?=
 =?us-ascii?Q?Q51KDgJNkXG9EiDQ9cIlRkgnATE2qqz4LLQFJKoHBpI+qXK5Jwin5llLu9Uf?=
 =?us-ascii?Q?ZFFAsWqz3gr1ZFOiJOV434J9V1dposFzn3wWJajQfb+vHhUBgXvfxYTvSrQq?=
 =?us-ascii?Q?fj4LZvCmugjP4KW+BmGl5RSL4SMqJBb/eG/qo6h24gfL76pMaGFGFNV5gvqL?=
 =?us-ascii?Q?OpjOiNfwEkusKF9BqhpRYzLh2N7N6b7Qeu3olt7ez/1kZEYmuh6JznLgQ9Bs?=
 =?us-ascii?Q?S9xOThaN3XgVSFNMGjRHFqGZjMjDeo//ZmBiLcQ/3dWLJ1g+L0A5P3DBkNL3?=
 =?us-ascii?Q?vXRrK+WcnEB4r+Iqaru+J0O21v/w1Fxn4fCgl8D9gyJmbD+8AJvHJwkS7mCk?=
 =?us-ascii?Q?NiASelO7RXvlKfHs4D+FS78AZKJbIy8T5jW8rvP5fjCfiSgTlClHEzbyzXB6?=
 =?us-ascii?Q?V0ZCmV5iconl/Ay688lzkurqhEFN+2/SYhemZizzteHY808uhPr49F33hQ5K?=
 =?us-ascii?Q?l7oBQe0PvSNh3O3PYJu5zCAWiOzmntvFcuOKT+62D0qe3cxHeE2Uqmr5CAXX?=
 =?us-ascii?Q?j0FjKw3gpfUKmjjKoShuBZVbRbs+AGvLWBbkul09pDaL/ImruzX9MuqYSVYp?=
 =?us-ascii?Q?ULuUsoGg1Div9uowhqTR+enjDYgP/b7FNGry665aEfKe5TKwRWIxpnicwe4P?=
 =?us-ascii?Q?Dxw9HXcviDepRrEHQ6tDeuJxmqAIlY3LitudnLQ596f8GfH2RkMGZSZjaKMu?=
 =?us-ascii?Q?klg+SUzoenRHdJDv4PWNHKwD9mbqOetdhq+PVSjJfQKdArmoRBjiof0INEyf?=
 =?us-ascii?Q?Jqng4kpj0XZgufh6aqagdijiC0rvhscpKZihAD39XvUU5+QBomqn6+Wis9c4?=
 =?us-ascii?Q?pJENa1c4fducQzna3ocmN3jvysNz3msykpZEALdeyh23iMpa61vEUmV3TQxd?=
 =?us-ascii?Q?PePme41oMAhmt+1C15K4wzZ2eU1hjFz7rh1+iGYEYWPJikIolSac39Yr0YiV?=
 =?us-ascii?Q?zi5KTZhOQpZv9CGjmNDX98vV5x4RRS2C5rfsfb+RV0a9tZGnWtjAo73ctGCP?=
 =?us-ascii?Q?+tkwRJ27ZLOFJlLjCKL4TLWaZVHXd7lMkpTVoC3g/qH4s9Dr2pLW3pyAwomo?=
 =?us-ascii?Q?72VcfWonRV0+6/29fNZBEg0B5l31q4k/g1jrUCZU9Gt3vj9OFDZBfe02jvcp?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c673c7-f1c7-4113-d7af-08dbeadf69e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 22:15:48.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 919NnSP7PWwukjwAmhN4N0CG6J6o3uW3aLse7CXQ+NFFvgLNavNx0IaTEQ4Wb0WsqiKmWwfID5FUrkJ4zDQATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574

On Tue, 21 Nov, 2023 09:38:16 +0100 Jiri Kosina <jikos@kernel.org> wrote:
> On Thu, 2 Nov 2023, Brett Raye wrote:
>
>> The Glorious Model I mouse has a buggy HID report descriptor for its
>> keyboard endpoint (used for programmable buttons). For report ID 2, there
>> is a mismatch between Logical Minimum and Usage Minimum in the array that
>> reports keycodes.
>> 
>> The offending portion of the descriptor: (from hid-decode)
>> 
>> 0x95, 0x05,                    //  Report Count (5)                   30
>> 0x75, 0x08,                    //  Report Size (8)                    32
>> 0x15, 0x00,                    //  Logical Minimum (0)                34
>> 0x25, 0x65,                    //  Logical Maximum (101)              36
>> 0x05, 0x07,                    //  Usage Page (Keyboard)              38
>> 0x19, 0x01,                    //  Usage Minimum (1)                  40
>> 0x29, 0x65,                    //  Usage Maximum (101)                42
>> 0x81, 0x00,                    //  Input (Data,Arr,Abs)               44
>> 
>> This bug shifts all programmed keycodes up by 1. Importantly, this causes
>> "empty" array indexes of 0x00 to be interpreted as 0x01, ErrorRollOver.
>> The presence of ErrorRollOver causes the system to ignore all keypresses
>> from the endpoint and breaks the ability to use the programmable buttons.
>> 
>> Setting byte 41 to 0x00 fixes this, and causes keycodes to be interpreted
>> correctly.
>> 
>> Also, USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH,
>> and a new ID for Laview Technology is added. Glorious seems to be
>> white-labeling controller boards or mice from these vendors. There isn't a
>> single canonical vendor ID for Glorious products.
>> 
>> Signed-off-by: Brett Raye <braye@fastmail.com>
>
> Applied, thanks.

Hi Jiri,

Did you apply the v2 of this patch or the v1?

  https://lore.kernel.org/linux-input/20231106235557.8741-1-braye@fastmail.com/

I think the v2 would be better given the patch split.

--
Thanks,

Rahul Rameshbabu

