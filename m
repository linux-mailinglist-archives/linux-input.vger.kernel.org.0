Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573B24D6BA0
	for <lists+linux-input@lfdr.de>; Sat, 12 Mar 2022 02:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiCLBMQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Mar 2022 20:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiCLBMP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Mar 2022 20:12:15 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2055.outbound.protection.outlook.com [40.107.95.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5192B21EB8B;
        Fri, 11 Mar 2022 17:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVvo0NK6FCjMG3/cX/5ya1T4cqiLrQD+eTFqYs83qbxl7BZh3WCse0Njmb+pjVnhKLeSigD2jYLQYEB2IqbjAkleSWmAB8K4Y9ogXvNASp0U5AZc/NI38hnR5yEN5Y7ufGVZ+tM4A+2Mu4/jevhtLU+CCb+IciUHd3JAY0o/sXWLKHpU+oxJp009hLzBQsA7jYSx5G2lN5HfrBZjK9jfLs1wGA7KwvUPN/xrAPFyBxrSWX5/axS/rr0Ymk6KbRXXo/uZTJOgDZUqWUPCOZ0Q6HlRKUoz1nK2DZKt1BMzjwyvutm6Xugf5Mv/8P8owARZ6IVcc43I/jIT9snzeXawKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEuJhvDX2M4vJDU8iliW/vRXPH4x1BRQzSbqLUbPLlA=;
 b=GwMiLW9PlQQxyc+B0w9Uov7wG7Pgh+KIUHT1knVtgBlcmRbJJUaElCDMnWRRrH8teFCgXFLCT+XhrtJuLuCAMhUU/B9dwiLAeQj+SHugteAqeM1XvDS6/8QtnLBt6FDxeGZVAPezecsf0ihBwr9qviq0bNusIu+5zpUCj4pOezXpZTa1ETGtT2vOkr8jLMsSt/M6AICj534ZvRV2KoQUr1WlB05X4MeZHRnQzBg659oxB+VeUA8d/3l1XFrBD8hQ33CVitbMbemcCrzh63ftoR1WxGomVFVhoqsT8JzyDrhuyxJyt+di+A3UnNiRlO5uaph+ggUDYom4J5yQ5zkUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEuJhvDX2M4vJDU8iliW/vRXPH4x1BRQzSbqLUbPLlA=;
 b=Z1N6F71SW3zIwLDjCtvK5Rhm/oYoS3DDkporZOq7G3pFnj3K+dEphfsTjVlF+RNYlMRnSOd9lDv0a+0iMPgvSZp3JUcN2CTsWk/GSvGnG4uloRlpHYKQche49n5Ww+gOPDmEl93/fIGmx8cIypAxPXTF75OgjW1LNyD6jeInNF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BN6PR08MB3444.namprd08.prod.outlook.com (2603:10b6:405:65::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Sat, 12 Mar
 2022 01:11:06 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::b48c:eec:fcaf:3379]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::b48c:eec:fcaf:3379%4]) with mapi id 15.20.5061.022; Sat, 12 Mar 2022
 01:11:06 +0000
Date:   Fri, 11 Mar 2022 19:11:00 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof =?utf-8?Q?Drobi=C5=84ski?= 
        <k.drobinski@camlintechnologies.com>,
        Lech Perczak <l.perczak@camlintechnologies.com>
Subject: Re: Detecting invalid gpio keys configuration
Message-ID: <20220312011100.GA41683@nixie71>
References: <5a233ff1-cde4-b432-a170-86379bec972c@camlingroup.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a233ff1-cde4-b432-a170-86379bec972c@camlingroup.com>
X-ClientProxiedBy: DM5PR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:4:60::27) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aff4ab9-d0d0-49f1-86bf-08da03c52ee4
X-MS-TrafficTypeDiagnostic: BN6PR08MB3444:EE_
X-Microsoft-Antispam-PRVS: <BN6PR08MB3444D9D8B73F655A9C2AD8B4D30D9@BN6PR08MB3444.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VL+0UmjCptny9kjR63pYqTGce35qjl3DcXOCalnRgXLHcx+3UEzo5I4hpWFq5kLEUB/g2cSYBCSt4yjn+bNr1ESdoFsQBA6Obm0wRDuhgPl2dplOOvsbuAbr/4wg5FOLvQUGDsCb2P/V6GhT+p+V5iUnwqs9B1lAl3aSTF2bnMX3MvBMojHHvg+OLUWMMKzM6GBfJDK4jxNRc0dLq0HKkcdZWutgWr6NpUuRFU0OXtttFlTwVlL9U2izF+JxyyzYNgHZ4f1V2kfvyniYHYOmIwGdObC6pyivqMuWwG+skQG07WI8TNkQaiFDf4I3EA2azlhYx30QGzyj1KjftThb2PcVwtx+iYzH3ywslshh93MxaiuvtgnzvK4K+nNWCd8WvgRGLftKlTGWDO2XX5amo3OvOL3fObLdNcK297reoI1qhzruwmoK6UlIqCT6IMO3PaW7TlvVBKENvQ7TuxMM2DJCWJGndBuhaWN4SZR0CKQu+16J3iMZeLuC6FS6ykCGrI2w1FlrHzdNNnOVIphbLS1U/9BbeBNa/bzYwiMTgaFGlrQ3RD0W17lDRCTc+PaEYhz4NGZasImdmZjtdb+E7WFxZAQHYQw/3UBKvPOa//ejg5zIobcwd6pb7v7LsDKvl7ySpIZaCx4epKzxYAi1eMaQQuO7raxIO7y/BLAoZbe6oWpQAL/kO6MeKKpkfQi8wNj94Kjx3z+J/bOJNKXiAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(346002)(8936002)(1076003)(6486002)(54906003)(2906002)(6916009)(6512007)(186003)(83380400001)(9686003)(86362001)(26005)(66476007)(52116002)(33656002)(66556008)(6506007)(4326008)(33716001)(66946007)(8676002)(508600001)(38100700002)(6666004)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjNIOTBGc1l6WnJaWEdoU3hDdUVWQmV4b3Q2KzhvOHp4dlFaT3dEbE9SZDA4?=
 =?utf-8?B?anNHL0JzdDNqOW41S2g5aVRvTWJ2YmthT296ZHpUdmxLU01DVGtXMlhKWFFp?=
 =?utf-8?B?QnBnSkw4SUdOTW1OaERHRFZod1hUTkRhWEZaN21PMmc2MW15RUs5N3NPTGww?=
 =?utf-8?B?eUlwQXNnQlVJWkoyUmhFK3pQZ1pPbGpSa0M1UVJ0RHljMjV6WGpNUk5Zbjds?=
 =?utf-8?B?Y0MyMDF0U0p5MGxYeEJpVzdzMTBBenlRck1ySGc3RTdPWlFIR3lBTWxUdkpt?=
 =?utf-8?B?YkVEVmdlUmh6NTE3RzRXKytLdEp4M1d0OCszMzRrZVlIbWNVemVCMzk2c0ZN?=
 =?utf-8?B?VEdiZy9rN0RpQzZkeTZXbm9GNUt0enBNbHNUYk5Td3RuaFpjRmZMWDh4N0VU?=
 =?utf-8?B?V1E5WTh6bXk5anhsSko1QSsyWjhBTzVlUTlDYnRLRmR4bmxjY29abEViL01q?=
 =?utf-8?B?OXg2K1BQY05oR1hPOElPbmZCK1d3cjMwVzk3cTRhbjJxaGV0K3JLdi9vUWVt?=
 =?utf-8?B?K0NoMkpxSEcyZk0xT2pYYkk0Q1ZOMEpLYi9ob0NHRWcyZVlDS0dNYmdzVncw?=
 =?utf-8?B?UDlzSnA1UE5BTVdLR2MrSWFzTGlqVFh1YUVEb3ROY21qZnc1bVoybmRGdTFm?=
 =?utf-8?B?aGhiYWJ6emlIWnQ2NVBSWDYvK1RXNGFlY3V4UzJITTdDcDYxSk1Wa2Yycmk3?=
 =?utf-8?B?ZkJLZkJ2SnllcjBxZU4yNUVKMVdOZDBjQzV0UTVoM0d2dFVSelRPckpwbEw2?=
 =?utf-8?B?Y1V2eHBkRlNleGFBNXgyR1lDcFJwSWtBZWhKTXBXbC9SWjhUYWZEaWFqNkVW?=
 =?utf-8?B?bEFBN1hMZTh4RUdGOFJIK29uSnFIR3ZyeVdvSkdPK3RMT25yZHdsaUFibGdm?=
 =?utf-8?B?aUtkS0E2WGtlT1hYK1Z5M1pWaXhQUlR0TXcrNS8yeEVoelZJaGxrM3haNVhi?=
 =?utf-8?B?aXdxQlgvU2NDY1dQaGtGTnVRQ29Sdk5RTlhKcTEyZUM0ODNkZnYzNytZSmlF?=
 =?utf-8?B?REE2MTdkVk5DRGdaZWs2MTR6NXJKenRNdHRSRmxPQ3JRYnBHblVER1YySXFI?=
 =?utf-8?B?aGgvMmRyeVJ1c0ZDenhSNUY5cWVKK2N6ZC9uWUE3WlBOd3ovK1NObDJadVJ1?=
 =?utf-8?B?Zk9UY3cxRVYvZGFBZU9SbXV6RHlWTGJocEE1NkZ0QTRwMWdHc09PYURCZzAz?=
 =?utf-8?B?S3U0bzhaWTJBN0xtWHZ1V3NaVVg4MDU4N09acUF3ekhrTDNTSFFseG5EeUI0?=
 =?utf-8?B?QVBFL016d3UyY0tIOHc1ZjNoYUhyVWJVZmpHYTNJS1NRbmN3aE1LNnNiRTl2?=
 =?utf-8?B?b0U2clAxTDJNMVFzeVhLSDg0eThtV2diMFpIM0N0ZUQvTEdyTC9QNU5oS0ZQ?=
 =?utf-8?B?QnRZQzlaNE9TengxUW9pM29McmthUjJmcS82dDQ4cGQxUGROREFyUXdjUERl?=
 =?utf-8?B?TFF0ampzaHJDYkJvWXUwbG1qbTZCd2hsaUhzZHJYMW9jd1JUT0RQOWVsL2Jy?=
 =?utf-8?B?TlhUaVVMeTA3dVB6WXhlOTdrWFdPc1VhZ1JCdjBCR2E1ZFlFc09LQzhNOVNl?=
 =?utf-8?B?QmtuM1RhSTYwemNpbmpWc3NTckxpSlhjay9LM1ZFbEh3clkxUTh4TlNDWDFa?=
 =?utf-8?B?eHNhWlRUTnRwbFlkV0krNWxCYWlsYWF6Y1c0TVdEMlFpOEFKeEZXTWN4WDlw?=
 =?utf-8?B?ZnA5d3phK1dNTDY2WmQ2TmxUZjhuTU8vMkpETlprR25wY3ZsTTVJWXhyRFNC?=
 =?utf-8?B?U2Y3QitrSno5Z0l5TGkzbTZ3eXp6U1R3TnZNRExuaU5CWXlHeU16ZmNCbWU1?=
 =?utf-8?B?eitzQ0Q3dTJQWUhJVC9nRFg3MmZXVjRBU3dhdGNkVXhQUmhrKzlFaUd3a1Jr?=
 =?utf-8?B?Y243dmY0d0IvbG1hSUpEOVF5R1ROQkxHdFhuQnBNaUtBSThFVHh1cUdacGpV?=
 =?utf-8?B?ZGQvMzBoMno2VzBqR1NxZS9HeGFkNXVDcEZFSFd0TkNRVHBlWmMxNVpNWmVi?=
 =?utf-8?B?ZUMyRHpyM3gyVUdyQVJnRXZ5NlBocFRrN3R6UmQ1MjJiUDR3NjJ1TXl6V2hi?=
 =?utf-8?B?Q2xuTElRUFlqUkhUT0gzL2lURldQWFZKMGZiTlBNRStjNG5zZloyaXZDNC8y?=
 =?utf-8?B?MlF4YkoydkZscmFjUkFSNTM2K0JxZmVLT3M1ZUx4YTYrVWVDVURFYStPRGo4?=
 =?utf-8?Q?N5uFUuYstgkUN2UB2oYzCrQ=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aff4ab9-d0d0-49f1-86bf-08da03c52ee4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2022 01:11:05.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH68jdNk0hLXWKC9QIsz1pTKFSakUAVwOd5tQfJDRDmXhnxSHuNuGXsnSWftU4+qH3Hd+bLop369hGcgOEq+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3444
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tomasz,

On Thu, Mar 10, 2022 at 07:57:53AM +0100, Tomasz Moń wrote:
> Hello,
> 
> I have recently come across following invalid entry:
> 	gpio-keys {
> 		compatible = "gpio-keys";
> 		servicing-sw {
> 			label = "servicing-sw";
> 			gpios = <&gpio3 1 GPIO_ACTIVE_LOW>;
> 			linux,code = <BTN_0>;
> 			linux,input-type = <EV_SW>;
> 			debounce-interval = <50>;
> 		};
> 	};
> 
> While the entry is clearly invalid, no tools currently detect it.
> Documentation/devicetree/bindings/input/gpio-keys.yaml allows any uint32
> as linux,code. The actual allowed values do depend on linux,input-type.
> Should the gpio-keys.yaml be updated to actually restrict the range
> based on linux,input-type?
> 
> If the yaml should validate range, it would have to be updated each time
> new input event code is added. Is it acceptable? Or is there some way to
> use the definitions from include/uapi/linux/input-event-codes.h in yaml?
> 
> The code does not sanitize the linux,code values. On 32-bit arm system,
> the above example causes kernel panic due to memory corruption:
>   * gpio_keys_setup_key() in drivers/input/keyboard/gpio_keys.c calls
>     input_set_capability(input, EV_SW, BTN_0)
>   * input_set_capability() in drivers/input/input.c calls
>     __set_bit(BTN_0, dev->swbit)
>   * The setbit changes poller pointer least significant bit
>   * input_register_device() calls input_dev_poller_finalize(dev->poller)
>   * input_dev_poller_finalize() accesses memory at address 0x00000005
> 
> While provided example hopefully crashes every time making the issue
> obvious, other code values can cause much more subtle issues.
> Should the input_set_capability() warn if code is outside bitmap range?
> 
> Best Regards,
> Tomasz Mon
> 

What about something like the patch below? It of course can't prevent
dts from specifying something like KEY_ESC as a switch, but should at
least prevent kernel panic.

Kind regards,
Jeff LaBundy

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 4456e82d370b..e5a668ce884d 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -47,6 +47,17 @@ static DEFINE_MUTEX(input_mutex);
 
 static const struct input_value input_value_sync = { EV_SYN, SYN_REPORT, 1 };
 
+static const unsigned int input_max_code[EV_CNT] = {
+	[EV_KEY] = KEY_MAX,
+	[EV_REL] = REL_MAX,
+	[EV_ABS] = ABS_MAX,
+	[EV_MSC] = MSC_MAX,
+	[EV_SW] = SW_MAX,
+	[EV_LED] = LED_MAX,
+	[EV_SND] = SND_MAX,
+	[EV_FF] = FF_MAX,
+};
+
 static inline int is_event_supported(unsigned int code,
 				     unsigned long *bm, unsigned int max)
 {
@@ -2110,6 +2121,14 @@ EXPORT_SYMBOL(input_get_timestamp);
  */
 void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int code)
 {
+	if (type < EV_CNT && input_max_code[type] &&
+	    code > input_max_code[type]) {
+		pr_err("%s: invalid code %u for type %u\n", __func__, code,
+		       type);
+		dump_stack();
+		return;
+	}
+
 	switch (type) {
 	case EV_KEY:
 		__set_bit(code, dev->keybit);

