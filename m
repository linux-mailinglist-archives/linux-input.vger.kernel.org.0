Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FA575D932
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 04:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjGVCro (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 22:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjGVCrn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 22:47:43 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1C310F4
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 19:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmKutaNgALqkNK69M2IXsja8DiWhk1SbBUtK5OUQ+sGMfcBZmUamZWyoIi+mGtyAdkYhQG20H9WuBZ35RNbl+m8BM4P1PCUqBnEaP82fuNbBhe5gq/LDcW/WFjlz65tYMqkQU3vTb0Um3kp/2xJJ+yYMrrOuZhphSPyhrbVWx8Hxxslzf85CCYr1E9cL/QBUwVxFVIPIlyVAmcHZFD4oGgrLAmZC250QFZmHOpLjpEG8PxUkuNSnXPzRzZtzGirdF/WKsRcn1LwymtXuYP9XPLGgagDvyRWP0d84nb11uJIwonu90zlUytgTdWPJLfSgz1w8ulw5g9AOF1LlOmJBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3cfIsoL5Mn2qtjXpTNnvgMZViSsht0nHkj76rOq720=;
 b=NoYuUaGC+KghNObAxJDGtDir5tTroVWa9Zi+BLVFKaTvmxw3bNVq9sMLyzAgRO5dYfug0ljze+Mk3Zm5nzZQSeSKbSj6wZzj+Na8B3YgmaA9yRixZCv0lreUQKVORpky3BNbf70zZop+rPRDlO5IlE6h2Q/SLtyA20h68X3AnoG2VQLsPFnTjTOI8B7oyJaS7GYBAZRz5IQNSY3ZOR1CYRW9bkogYNpQqwnnFWbnzpMPgLbqyHvPJg7JEFqFzuEPdnWIAvUO6v3jtKluj2UFIa8Wf7PU3r+tTCYgS/oXew0HMBPOBwHGloyTduiNni2E4y0NcWo7zUIQlM9PT/tjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3cfIsoL5Mn2qtjXpTNnvgMZViSsht0nHkj76rOq720=;
 b=NGW6ubzcZMyYlxRyUS/T1195sqqlU5AXejR8Jk66bQJBdVnI11KXYd7qjjCVH3uAUqItEF98xjigFQHkHnWokptfT0DQYClzyuLp+HJb5UxkYkm0NasHkFldBanuEsIlzMArhUiTjvDbAt2XVwg3rRgUMUYNb1Pfgg4fwhOeF6kRL/3guXFICatgN15ZRUL+UJwxe3MH/Ue2IZnIn5cl8QZPCM0+ToEbQpglG2fGDSI45XQr52kmCx/8mF/FBzfcMnUmvl0v6RSTzjMoRSz8AOKTwkcYfZW/gNnkHscOHUMG7j9sxXz1xdtfFDX/SizXM1yVhS1w4NN6vZVEkz3w0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Sat, 22 Jul
 2023 02:46:32 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::6933:8c58:b59:ba17]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::6933:8c58:b59:ba17%5]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 02:46:32 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     HP Dev <hphyperxdev@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: Re: [PATCH] Input: xpad - Add HyperX Clutch Gladiate support
References: <20230722010532.120280-1-hphyperxdev@gmail.com>
Date:   Fri, 21 Jul 2023 19:46:21 -0700
In-Reply-To: <20230722010532.120280-1-hphyperxdev@gmail.com> (HP Dev's message
        of "Fri, 21 Jul 2023 18:05:32 -0700")
Message-ID: <87a5vo3bpe.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdf715d-5639-4551-6c32-08db8a5ddb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDHLfSwCmwa1+cK2EUi9LskS6uz6G3yboB3/ifYsTIEIGHUm7s7HgN3ArEpPGzmWfMaCrhxer/GHSGZuNF2qtd6zJZf79Jto/Ezi7LiTLtpvig434lizfiAjHKuz9AZ/gnq7gjXynsJV+oJViA+6x8F4hp4pRkq2qrh7Z3KWgOqaQWZorXJ1DVBrwZ6OU1/url7Yk71OjUa0FUQjUCgzolRf3klREMZGAyhJbVWXfUs2UIyOBDFvumMWXbL7XaGBkT0y55OAdAOnzq6nCGmp7B1Ibry+p/kthVsjgnMUbwwZllh9S/gGyjfr0nGaCCMHEyxUcV47R2X2la3UEzOOnkfGS+65byvt1G7KL6LzBni7gjmhBLAN0wT5Gfo+KpLP1FwaR/zck69RTqbrzZRVHgBZ9gkPPi5l4RpXI2Q3kRNaDLWjil+4trruX8rRqr7jR9VzqFrZCmxjWNOcYl+m6Qff8zswtgTt9lwwdEFa1k6Id3n9uaUdSatjcN26ANKHAIVgU9OebWMk5KlrlVa4FV6bgyIngoB+SWlxTArJjHOwXIKj/v0mxLXLs/yA1FqDyjQBxL4VRpxIv0pznnOH8MUwlzJ7O/+CTePDgTQbiIqmiFhlcxH0jBzxzLmCHJ2qamJELlBzoQpDkj5P/YSSKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199021)(86362001)(38100700002)(66946007)(8676002)(5660300002)(4326008)(6916009)(316002)(45080400002)(2906002)(66476007)(66556008)(41300700001)(478600001)(966005)(6512007)(6666004)(6486002)(36756003)(54906003)(8936002)(2616005)(26005)(186003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H9IYaa2pc1GXWmD47j5n4BUo5EKYKhMz1ouMj0P7M2xrVgjI8i/jfDQaud/N?=
 =?us-ascii?Q?q2/C8bMp7oADDO2HGpFJpRQLNmSYKgQDCgKe6iVQajjhA7SRH+25dc+uMl9S?=
 =?us-ascii?Q?feCX3tcHY9Y9x+Szay+cYO929s3h980xKQh4micwnf1X+D7ixLfbqDLamEoF?=
 =?us-ascii?Q?nuGBlElEkzCZbXI7TcuWx4lbtcCL2+yRfUQ07Mq1sGf629eFlXhDZGmgvj4o?=
 =?us-ascii?Q?NDijv2aUznqE/edEyw3naD+nporgs7Lxq7icbRFGSMVfO8pmS6gTsWRH12rV?=
 =?us-ascii?Q?/gzz3FvSNVwjIMaaOSfqRp/ixOFMb6W8X9HQS3kigVyLWQVZ19CpDFurfzxt?=
 =?us-ascii?Q?KUohTMoeyyovIgnJzo+SjHhYki5Z4JlohETRMtFXwF9h8bD+X5jwW116NaPq?=
 =?us-ascii?Q?lVKAXgdFMtlnaTi/sDPLEpX5npXpJABpW2tx8P5FrikU4qughPXnmnPFy0Wm?=
 =?us-ascii?Q?MiicJXkejbNDxAwgkT2i6A1HwCSU1yZDu64s5Uhg8GpBcS6WGp9CYjEPX12J?=
 =?us-ascii?Q?Qi2fZ+Z4sd/9/Hn2aiZc85E5X5BZel8j+V9sUIeoYMUsuCDxx7nF+8QW3NBI?=
 =?us-ascii?Q?pzawt5/GY4EImLm4X02Pb9ru2H9GWXlMY68qiALaRfSQWrjGax0x1C+hA6Ky?=
 =?us-ascii?Q?21qmg8+Jxd69vt9JiYiViSx9QWVsq252mkh6ahAfhZsP4ZdIqaQIifJpcRhO?=
 =?us-ascii?Q?IZQQwn/FgK9LyowNX93ysaCJoN4OceAWD3JFZ/x5C/oZkh0GQGoB1JtfoWlS?=
 =?us-ascii?Q?/ii3WpxiPIusajpBb7BeziT/ztJ5kEDXGl9+bdUJQqTLYlbQa4gxI7AWpsRh?=
 =?us-ascii?Q?f3b6rFgzklTnpXflRzdxAHbx0LuLzbEX4n2t5h3yHXRiA28nnTypa9Yp0eIB?=
 =?us-ascii?Q?PuiyGr/XWJZ7ZQlRMCt19x3SFvePEg683yzKPwxNfhokWACCi2V/u8KDsHtL?=
 =?us-ascii?Q?omlGFKlL0/60AzfMbTtmmmapjl+ppxdwrdBR/m48JgPbM6L20i2R1ApOfHpP?=
 =?us-ascii?Q?k8miKbK1h9wzisOca+30YPZa5/HeT2SJMRnFK1+wbkegHgHt3tnBgvyYSeGT?=
 =?us-ascii?Q?i/iggLSBkWlETWXRml5dewdp5TxjMOkQf4SzfyGLrjUrviDGGxkpGQ6zrMw8?=
 =?us-ascii?Q?PDtTq15bqqFvQRIzxElpiGv4WX2X1Etiq4Ji5Dl3XbHxkvgAeRXmMvGdkHf1?=
 =?us-ascii?Q?//xXciApzNNhGNCzxgQSjjEO5cKxFshPxdK9HQxD6yzUL8O+ZnD2riVFKyhC?=
 =?us-ascii?Q?Cr8VBID+pHpR/FWFmUMBrE83E5DmEDgktnB/AL+FWZSdEfA4IoZbYGW9/uI1?=
 =?us-ascii?Q?apFHNlgaVr8EMdgxnLpsdJNbgqQYYJpB9WU53W+Eh9a2aM/6GFt9v7wrqX5a?=
 =?us-ascii?Q?pjxdvEzS9etAJRCpSk+8nK6XmA3Sr7LGu4LczFUfjqLIs6+5ApPNAN4paedL?=
 =?us-ascii?Q?A7OBv/7LERrQj9He1+SdJu3S1G77P7QvR2UxpSm5QQ2EzF6mY6sm0bgBInTX?=
 =?us-ascii?Q?cQiIZZT4jGXh2udlj8gZv6Lr3RMrq4BDwho9R00Xm6WmHyEtkygjEcB5jicw?=
 =?us-ascii?Q?tcPdFh70TQZF45i31IE/xT3bd2vSd/tjSsLiT+xMunIPxK1q0jXfXmKEk0Ji?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdf715d-5639-4551-6c32-08db8a5ddb5c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 02:46:32.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLk2/4Um9zkE2QZnHuE+xq/Al7eOXCIGyyO0fFbHaUwbMQrwFSsCDuIfpErCiMatEmyA8Gi+HnF6krUuKD0CVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 Jul, 2023 18:05:32 -0700 HP Dev <hphyperxdev@gmail.com> wrote:
> Add HyperX controller support to xpad_device and xpad_table.

This patch appears to be a resend of a previous patch but does not
follow the right practice for patch resends.

  https://docs.kernel.org/process/submitting-patches.html#don-t-get-discouraged-or-impatient

https://lore.kernel.org/linux-input/ZKxVBULWtM30ZJ7D@google.com/

>
> Reported-by: Chris Toledanes <chris.toledanes@hp.com>

I think this may not be an accurate use of the Reported-by: git trailer.
My guess is you would want to use the Suggested-by: trailer here. This
patch does not solve a "regression" in the xpad driver that was reported
by someone or some automation but rather adds a new controller to be
probed by the driver.

  https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> Reviewed-by: Carl Ng <carl.ng@hp.com>
> Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
> ---
>  drivers/input/joystick/xpad.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index cdb193317c3b..dfddb0bba8d8 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -130,6 +130,7 @@ static const struct xpad_device {
>  	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>  	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>  	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> +	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> @@ -457,6 +458,8 @@ static const struct usb_device_id xpad_table[] = {
>  	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
>  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
>  	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
> +	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX XBox 360 Controllers */

There are no HP HyperX Xbox 360 controllers previously supported or
added in this patch. I think the above line should be removed since you
only have a XTYPE_XBOXONE type controller. You probably do not need to
match against Xbox 360 vendor-specific class since you only implement an
Xbox One controller.

> +	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One Controllers */
>  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */

-- Rahul Rameshbabu
