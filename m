Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D30D65C5DD
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 19:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238696AbjACSPg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 13:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238550AbjACSPe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 13:15:34 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341052185
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 10:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNT/TqXJQ0Abi90+K1duSpc5Dv4/txT0O+hvDzUwVHGNERKBYpOaeDjY86guJA7sWrsAC0tUYiAvJ5su0sF2QNpFCC2mWBVPv4DK5DbcgHs77nhDD0hwQvtQ4gGfqLW1RuiabemKgyBwE8GT0F0LgGVLf9srPgs0arU69pyjQtR+hNbmVxoer7rKjHQ7bsxxp/KxaxlXOZ90LZ12I+IIq5kQA2+lCMm5/7QFxQN/hRipuHoSV6I1Wm9b0Zj3LvGCWRXpPqMs4VBMza8fxpfMqIBfFYJhho+jjKm+u17XlzTSVJ00ZPSeJw+yEkTbN/U6BaHWOskQFFu5Z73IvsCwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3yzkzEM7hrlV/iQ3/w5EYxjgtEDmAjsBiU22k4W/ts=;
 b=cPeRbz3FWNDfyzKJa13iT8QOlYETZIPmfSYeTVRsFDRLWBZyKrWGYImf8uNKImAC5xgPF/HOGUSbId1Wl6yYwWcIyGlFQLb65IrV5tGPp6/SyBd5W3H6u/rB1P9INkDfvjtugR7P3r9d2JHjGiis5CguxUF0PUNF278dd3nKupAS/3YOjOFdZdc4Z5KXzkMUBmQ9C/SJnLEh0xHhzZMSHBM2SUIpIC2D4UqPUD1b0/fa3yuG+l9R5wV/HoxgKs5bkxHHntXc1gSgIFZOb3YqqM8uk2TbZMRTsralUYVWKbD6Mm9A8vxvDUQ5Ps9KAZJmlRC1AHw+XLKd47pk3Xb9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3yzkzEM7hrlV/iQ3/w5EYxjgtEDmAjsBiU22k4W/ts=;
 b=CbswcuMNr44/OTAe1SusR+U9CJuT9Pd1XpUl4rdvQupU4sLQn4AYaddcX8li59ix2V+tcNnO/MMOYRERGHFFjaQ+RMm4lC8/PnYd+H/9SE9TIByXJvj5LzW6RWvGTMyjM7VHGCV0kTkcg0ENOxrZ3HShST/90I8j2zYCY6oKdGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7084.namprd08.prod.outlook.com
 (2603:10b6:510:7a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:15:29 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:15:29 +0000
Date:   Tue, 3 Jan 2023 12:15:27 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 51/69] Input: iqs5xx - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <Y7RwvzlPZSPlVjTk@nixie71>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-52-jic23@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102181842.718010-52-jic23@kernel.org>
X-ClientProxiedBy: SN7PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:806:126::19) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a1ba21-9ae1-4e02-3f29-08daedb67efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jN9YOLMQmEVvrSAEpbPhIcLVIehrXnIcNbbRKv3NtGVJ1lhzPLAR12Ins8jsCXKttbZ4YkrNaq4AGs13tTzoaM+IsZJBBPUN3V/FVl2U0eOsLZ1yBR8vK/w3b3AAJSTXyrn3faErzYHqLUKNiNW8HRrLTPQxfkMd/aWWBcAZKamcCQE1gNYaVgnZHPuI7r59yzt+RCLlqgwtunjCqBshppeV1JIf47hyablNeKI+GaZxiTI0oxJ++4ogqXX0h320OoyDokOh0YMLsF8EKZ4/CGatti/pBfM7siMPH7d5osSra5DgxVSi/o0xXtrN2YT+kH3amxSHyVj9xezBD/GdUlthrHa69VI8Yrnw549ARdFE2GDeUbOuqZfHrMg5/z2t82NrVwzZ2+GZzbnssPAZyspk1jRtNaUNQuN4IgdxgVSb8y04/KRNpS/y0SdMpd+rv1EfYKjolIU+ko5sK/yc07SbwT1lWhHO4DJ3eu988kCdky1vlJaseh4qrByRCaDKq2TOwF2tgtNE7r5FsyRs7RpXeh7FDrl6qKCxXh1nr9FqH0EDkoyQP7O8Vr/DQ+KBy31meVYaq7l9fq69umdm6yyVt6rMFbrYTkwhCrwni6pd9GM7b7CnPfwTkd9VToU8h0JIRwN1MdMnudpkPaW58F13zqcmXrRpUcnIlj3oGZEOm4jfefq8HhOwECn1wbP1/UaZfWl2R+LmyDfp6HjtaX/4YShf0+Yl9LEItCYcKsYtf9cTFPPVamopkbYm78CK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(39830400003)(376002)(346002)(136003)(451199015)(83380400001)(86362001)(5660300002)(8936002)(38100700002)(2906002)(41300700001)(26005)(33716001)(478600001)(6506007)(4326008)(8676002)(6512007)(316002)(186003)(9686003)(66476007)(6916009)(66556008)(54906003)(6486002)(66946007)(22166006)(42413004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5k22UyNDDAVE7Mbsq+Z5s8GXbwfZXGetSRl9pejBFM/cygbtLV7dzBFhwDv?=
 =?us-ascii?Q?fsMHT0W7Gh07OA/nFosCXuv0gEZouF7tv3O7UqbDas/A/Bkcz5xUPSn4J9jR?=
 =?us-ascii?Q?of+o/HZ/mYxtErtw2vZpbeWNfn+iR636RMrQ0O5xKXrdMKNm7d+AevWgaOUA?=
 =?us-ascii?Q?kv1B4Kb8pbnJoRP5upa6dUPZ7OZR9SUIZriVpYtp5wpeYDCE1p3Q58Cl2JCF?=
 =?us-ascii?Q?EMm/SzQZrc+oaDZL3qllXKiKb0g4i2FmbbJNq1b04APIA2h5ZatUGYCU5ZX4?=
 =?us-ascii?Q?E3Sy0q0iU+h6+HRfE9Bn+fdKVgkQXTOKmrx3iAIjELtsfNrLU4QeSWu58FKW?=
 =?us-ascii?Q?HZQdicDMbOgl5LhNBTFcAoK9Or8H/om35ug/dTuKFPCnIZix1Kzjb22AmoQz?=
 =?us-ascii?Q?3tF4OTkX8JOwrOR8ecgnGCaRG+jIGIZNZF1LXs7t41BAtx8lar9LlcuTkbCj?=
 =?us-ascii?Q?1PsuWHlmnBRaVscc6FA2R0f5kXo9KIRGszH2Y39ZpNAIc4E4IkJtHArQx1w/?=
 =?us-ascii?Q?Jex5TE0gLFEK7rUUk1a5g+QzSg/yD7DZbqcwZoPIHnrC/ZEg/9qPo369OTtD?=
 =?us-ascii?Q?/li8z4XlPjbAYmbYiBHq1h4HRkuEEvSXuIYOKHzsxVzeawzT0D1s6ceV6MKL?=
 =?us-ascii?Q?29GDMv944oavPpnOiabCCxWgvt8lRSaprM9o+PFKZSErXh7JNLHE8SStXH4+?=
 =?us-ascii?Q?KriUmeevjE7wtNXRzhTJ+mIWFhirSKJrMpmCe9k169McAs3UZvm0qwd1kQbP?=
 =?us-ascii?Q?FqaOswGoIy4w/E16fbJ75DTh7VdssRyVHm0BqQto8F+VkGgS6hYlzsW3dQSz?=
 =?us-ascii?Q?LqagJ0e9BQ4dB9DmHECp2y90hNUdr+dNmZdZLbhMMJOzvwEJBouZXXmi72fF?=
 =?us-ascii?Q?nrLg/gniaV9LmlAKuw2187xB2ZRl/YBo1HrqdENaRIY/x3J7kRQw4q3ZnVkG?=
 =?us-ascii?Q?yyyB4qBd/2wPZ0cjib8y8xVl7QQZO1KNqIZhM6CS7HlU9P6xIoSnB7UHZDs7?=
 =?us-ascii?Q?H7Kf2+kwiimS/KtHIFRlp5giShrg+iHPOu+bF1+3RfoiZoxyCbJmvA6sfcZt?=
 =?us-ascii?Q?7N48U6RHSN9qlahZisx/3CQNt+/7bIcnCW9RkV1E7YKQomB2YE/b4S5U8671?=
 =?us-ascii?Q?tPUJ/y2RnqO+7a0F8+V3YAsB/o5sftPL7G3tJGwHQhWsKutBthW/SdXmUdie?=
 =?us-ascii?Q?XAuS63gbKjIaxF6N3lpoWlHJkRyK/d/zlbQSfPDJY2vzs0N3QD+PaskFJGGY?=
 =?us-ascii?Q?mq1TOP762cYMIOz9Nj9SqhyVgK5lwY73I/d+NinFVcV4K3M816LqMt2HtA4v?=
 =?us-ascii?Q?DlmvgoSf6x2uPDyOhGetVVRda3JEpa2QvTcK4Jotd+KutehzEuow3bzVKLjo?=
 =?us-ascii?Q?FIb/SY58qFIQoXvHNIs/zEp84LUCD3oRARMTDxDMBJTYpsrcmUcC1i9LTkj9?=
 =?us-ascii?Q?eGWP7U+/cCnwOoemSIH1bQqUVzFjIk7ax0FVU17P/lDLlai8RyCyQdn6EzKA?=
 =?us-ascii?Q?GsGRuxTvOyjmOZHypk/tA/g5PSzUgsjeQCD1LAfNknDBeTS4WYokSsTpe330?=
 =?us-ascii?Q?ygk9hKm2oti7RjjdRag9HtBT0YbcjeCzwPIqQLPM?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a1ba21-9ae1-4e02-3f29-08daedb67efa
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:15:29.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vTI3oRQNaOm6g3qP3IXBcfplQsHCUvEPshcE4jZrrM9CTc/YvNiSbkXwtq4aB5MK9uANM5lmtAqjql6D9UbeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7084
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 02, 2023 at 06:18:24PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/touchscreen/iqs5xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index dc3137a34f35..c73e9c5c0077 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -979,7 +979,7 @@ static const struct attribute_group iqs5xx_attr_group = {
>  	.attrs = iqs5xx_attrs,
>  };
>  
> -static int __maybe_unused iqs5xx_suspend(struct device *dev)
> +static int iqs5xx_suspend(struct device *dev)
>  {
>  	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
>  	struct input_dev *input = iqs5xx->input;
> @@ -998,7 +998,7 @@ static int __maybe_unused iqs5xx_suspend(struct device *dev)
>  	return error;
>  }
>  
> -static int __maybe_unused iqs5xx_resume(struct device *dev)
> +static int iqs5xx_resume(struct device *dev)
>  {
>  	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
>  	struct input_dev *input = iqs5xx->input;
> @@ -1017,7 +1017,7 @@ static int __maybe_unused iqs5xx_resume(struct device *dev)
>  	return error;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
>  
>  static int iqs5xx_probe(struct i2c_client *client)
>  {
> @@ -1090,7 +1090,7 @@ static struct i2c_driver iqs5xx_i2c_driver = {
>  	.driver = {
>  		.name		= "iqs5xx",
>  		.of_match_table	= iqs5xx_of_match,
> -		.pm		= &iqs5xx_pm,
> +		.pm		= pm_sleep_ptr(&iqs5xx_pm),
>  	},
>  	.id_table	= iqs5xx_id,
>  	.probe_new	= iqs5xx_probe,
> -- 
> 2.39.0
> 
