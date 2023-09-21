Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99EF27A96D9
	for <lists+linux-input@lfdr.de>; Thu, 21 Sep 2023 19:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjIURHS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Sep 2023 13:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjIURGk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Sep 2023 13:06:40 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C908F7
        for <linux-input@vger.kernel.org>; Thu, 21 Sep 2023 10:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijrebUKkrmWj9k3tgpYmAiUY1Z33XHP4JcGNnsPTo1WXHF8rjP42M3v9AVJkYjT7xrnTcSWosfynT5k/vK9LPWb2luik3JjGhGogFhoktWLuwD/W/dOAPM9YiG4hEIB9HBIOcaBAJJ803/vPQ2H2HBBnL15SAuQKiXM7YZlB1FBY3Jjr6ZpSmkIO8B86KBFZjzy9CTjbau5EN2b01yWQXBPVg2HkaKa7XVJF3yJL2bWY6sKpvfRt4xA/rIKNdBku2vJt7RAuwJTVF121ICbejh3dNlhhHaoaRqVlgWR1EH7QuA4Yzo1TVdyDMKRTI69hro47Dz1cK7yo2fVVyGxEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCCJcREDZtoudO7foJ7cGzDb5ACAobXI5kB/8JYLCdI=;
 b=jw9wNM4npNeRkMjqdesSdaM03erdQ3vVPt8wXY7lp+cbARufZj6abfcYqJaXWTCezopKOLUpJyn+fwkGAqtVSRyxZ/RXcYqNkYxK9zDPN298jJTwi0dk7vOwoCAPG2h3BZd/XqBISNWnKRlnqbQK18WT6TRrWlLrQUl5YUcf7mJVyd1VTjq1lzNzxQO3J1RVa772+gS7lcZBL0NYIREtMFvY38ocztJm0n7zwDTrYL7nx7rVcf3kewQVNDENfr0sXAnGLzhaB/V6sIdkEZA8EZRlH+DTgpQxYqNVCLM7YRstFHsgFVJ+j+3f8QFkRhBryxntAbGBM7r8TqVftYdQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCCJcREDZtoudO7foJ7cGzDb5ACAobXI5kB/8JYLCdI=;
 b=fyhqkXunGC6Uo2vJUG1ykmHibY9hxG8sK4XR5oSWUgSLfuHjeVHM1eYfQCl6WoPNqX4tsmUgLR+82N5257guwAJH0vcmBlKAcoYCfK4W5ELuLx5PhiiZETcrBERKXjAy/lfXmFRWnXGSdzpC1nzmxxOEfd8gQBe5XSufN/8LskM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CYXPR08MB9020.namprd08.prod.outlook.com
 (2603:10b6:930:e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 11:29:44 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::946:aafe:294d:b6bb]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::946:aafe:294d:b6bb%2]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 11:29:44 +0000
Date:   Thu, 21 Sep 2023 06:29:40 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 04/52] input: iqs62x-keys - Convert to platform remove
 callback returning void
Message-ID: <ZQwpJGpaG/D4+2ey@nixie71>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-5-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-5-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: DS7PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CYXPR08MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c115c96-44a5-4be6-878e-08dbba960d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHiuw0/wFozPx64j019Ne3loZQkzzCSINapEJ+62y3QGHOEvmZSf2pzAx9Y+K/Q3lyAlD+hv4VEQP62k85+5pBTWLO/cpDMtn+j+qbbTzsltUjP6+oUDuRz6j61PyCMXG6Kdq2jpY4GMGd+Rc2WllRhNzmONlgFeSC/WLly8A3Zq9ke3kFfxgcgy4qBWN0SFwJhLPWz1rmP0DYwDC3W/wo93qIY9vqIaLi9HZ/6p3Wn1STCA2lrMvZV6WlvGGoKvmPFqionM3Lud3+xW2TZXU5P5wh/H8vujYqaS/m5YeVR0LmABjbQYwOakdL1GYiaRwwe5niypbLuyFX9YcFGofRVyqfmobqGX20gVsttQbFj5elFjkpbnVGXAmW+I1ifT9vp2ZRt1ZSBXSujqtmzcQFbYOjW/3/JfXRMbaiFzMoP0FGLS/n/KAmNnXCMC7PcGQiUeiiHZdNlIjQQyfMflc3ZCo23m6wM6QpbRWa/KhoT3wgJmKwDwtjEegcof+0IfxwR7EfcaZTimVz25L75TbS1XjJUUf5j6l6a/vzMgTdQMiwRML9dXTtkzVIDfMY8z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(39830400003)(366004)(396003)(376002)(1800799009)(186009)(451199024)(8676002)(5660300002)(4326008)(8936002)(6512007)(9686003)(6486002)(6506007)(66574015)(26005)(83380400001)(6666004)(316002)(66556008)(66946007)(66476007)(41300700001)(6916009)(54906003)(86362001)(478600001)(2906002)(33716001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qcQzHpyDZQPIb9pZs/Ku29Uso7A477+LE2riWnAnzVv/9ni9rmY8zhs0/E?=
 =?iso-8859-1?Q?IYSDSq/acED4g+8GcqwWL/DsyPNiUPFC9mjACHqTXabCy9UXCRugRMr8hF?=
 =?iso-8859-1?Q?ekKMVbvE9L0WYOqhvjjpaip2UpJBC6xUSflxes2XlA28v6QGjiGtyZ5tL1?=
 =?iso-8859-1?Q?n1zT+6+Z5/R4W38D0KBbuzLUWrLNc25fmVxTrwOikX9TpDScd/TucNIDdz?=
 =?iso-8859-1?Q?GeQuIaXYMpvOy0xNm4VDdSvX8P3Exaaj0mO6iB9RMAx1EY1Bl5UtcQnVRG?=
 =?iso-8859-1?Q?b7D7z3G81DWFKetBxDZnc3LjravhVFl/pBqprMIMlEi0OVyh6atUaHBKrs?=
 =?iso-8859-1?Q?4uxIJni2/cce0NS+FtsYXlM4oNniKJPvp4V9b4XRq61znhU63DpVuSt0Pn?=
 =?iso-8859-1?Q?KDBjo/95FZRTGueq+hgjN4rfEQP4kpHuv436Mm0JaeztthIAdqAnrdPpt1?=
 =?iso-8859-1?Q?Q8Oj/o68LCkOWAx+isa++VFhKZ5coKjFTafLIHYWdPhfS/JIBJ8a8jSzHm?=
 =?iso-8859-1?Q?ROim/4Fa0zZmvAOU7NFPumoldEO0wSQM6+7G4BVS/I8lrd+jDQ6MaFBUW+?=
 =?iso-8859-1?Q?LzTk91IDBxo5H3kjDV1RUlNyc99n1mpwqxv70826JN5OCN3XEcE+uCouM9?=
 =?iso-8859-1?Q?MS1zS1TmUnqsPvbIUSB6PpL7wFMtSdYMADA16wF1zaGcd5p9HjgAiBctOZ?=
 =?iso-8859-1?Q?HWXrsH5xLK68MZt1b6umzRfFvAaI/tnjlJzOTsTUeCm4mEHyW6MrCPn2OB?=
 =?iso-8859-1?Q?eDhk5oXZumpy0sxyoZ/Fd4GeB0Dz3KDPv1W88OmRYP4kxgFF1Q4a7zxHwJ?=
 =?iso-8859-1?Q?pr+gs69MAzCG70cVGGuD2BPvSw8+gNkmYuNoTB77OhtLZ5vyGPs0qmbKv7?=
 =?iso-8859-1?Q?+XSfk2FABL7XLAI32yxTU3rynVVZIP3LrGGLyrp2u+E38DaCA/CTDUDm1S?=
 =?iso-8859-1?Q?36O9E1CCbHufXzspfyqNikEZt89YqWvRftsEC//ZVduaPE1rCq6elbzrf0?=
 =?iso-8859-1?Q?FCPyShqDgd3EQ5ySso5lppplkccflTL27Y2292HWrdwHdIu331hwMGmJIf?=
 =?iso-8859-1?Q?5h0CUMUBTC7U8wf3MOmsH8KlOGYewLcwJ/7jyYK2AvktLeT6/hjd3Phglt?=
 =?iso-8859-1?Q?mNqDyfFXFlM4cCCXK2C+T3PMK/K15FgbU2nv1hyp35jnL6nIJBLnO8cl6b?=
 =?iso-8859-1?Q?DCx3kpy9Q4+3FUNdwDrVqpS+ascBoZOk2eZPycX3oCideNS/tRqZ/Z2bCc?=
 =?iso-8859-1?Q?7lwipk92LyyC3X7SSuOia1t/CKe0SwCpmSK2qPAXQFxx8UgZ9yuxoyyK85?=
 =?iso-8859-1?Q?9mg2XJO68W8t8pORJsl42MeftUCVi4b2f/y6aJB2gIRFrcszugaJxu22wx?=
 =?iso-8859-1?Q?RWRdtCxADJvxv67dJBBhwDkViX+qOETYL3qcdePxhY9mK98obCceW4r9xw?=
 =?iso-8859-1?Q?yNnQa63luWxqlqKG1Y0Bl982eQ9FVJF946J8VzCOYwSALsCvHt67ymyUDQ?=
 =?iso-8859-1?Q?LsbYaNZROpp+Yhs4BuA6qA+VtyqT7il2KZXb1wSA239KSRWLZlzTTQAuV8?=
 =?iso-8859-1?Q?PeGgIPLM19s8R9yjtclZgRLoLIzCX2NczI/MJ4ZpG/EE2PlRdPQ7Y5xEoe?=
 =?iso-8859-1?Q?HA4Q9s1i2UoC5A51KKgDEBfPfStpCN/E7d?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c115c96-44a5-4be6-878e-08dbba960d8e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 11:29:44.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXRel16o2qC1ft/DtdM6QF10Pp449XjbzTagxnUvtAzgf6mA/1h3Bo7IuLgXZpBH9vFXTwp4sS8IsWjyNZKxCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9020
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 02:57:41PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/keyboard/iqs62x-keys.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> index 02ceebad7bda..688d61244b5f 100644
> --- a/drivers/input/keyboard/iqs62x-keys.c
> +++ b/drivers/input/keyboard/iqs62x-keys.c
> @@ -310,7 +310,7 @@ static int iqs62x_keys_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int iqs62x_keys_remove(struct platform_device *pdev)
> +static void iqs62x_keys_remove(struct platform_device *pdev)
>  {
>  	struct iqs62x_keys_private *iqs62x_keys = platform_get_drvdata(pdev);
>  	int ret;
> @@ -319,8 +319,6 @@ static int iqs62x_keys_remove(struct platform_device *pdev)
>  						 &iqs62x_keys->notifier);
>  	if (ret)
>  		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver iqs62x_keys_platform_driver = {
> @@ -328,7 +326,7 @@ static struct platform_driver iqs62x_keys_platform_driver = {
>  		.name = "iqs62x-keys",
>  	},
>  	.probe = iqs62x_keys_probe,
> -	.remove = iqs62x_keys_remove,
> +	.remove_new = iqs62x_keys_remove,
>  };
>  module_platform_driver(iqs62x_keys_platform_driver);
>  
> -- 
> 2.40.1
> 
