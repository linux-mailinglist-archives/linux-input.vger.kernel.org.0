Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5641365C5D8
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 19:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbjACSOX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 13:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238644AbjACSOW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 13:14:22 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA05FE5
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 10:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxPaMC/dXlr1hS7V0v4Leb8MUatpd4HZAil35tRY1jKcEwH5Iz2P6C0qpQMMpkO5D6FCNtljkvuV1uHGaxy6iySTWqba7/tn3LBbmvr2MN0qs23Y9ujle6amubFISsclkk1qcZZBUC+hh8AfSVzVkylg//4IbYIgWLFJMD/PMkRI/7oHtrS1c/RwQFOnP3WXLqvswM04XsVpydUAK36TXuwFc8fu+mgwIeOpQbYXuMN1d1Ge3Q+feyu2Xyq2j0xY5mmn3dPv36zNkxlahpShlXpJsVLvzMnaVdWu9f91UIuimtfs3OcVI/4gau5e2CrlMVq7evT+2GT/SOVsHfUmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbM3qHSsE3c2Oaoxnd/LOfmNDcxLa1bfB3L0K5m4T+k=;
 b=RsJnU8u8GqVBuaUG5lGffcZ3cmd3jCtniXauICtXhBYTHNSkJIteXGiBqcEdpHOOtFu1VXjU492BUnoWUh4aOQ6FqnCQ2FzMh2Qzw/+rsjZapqCIur8WeUOvZKoNcpj2VLNmUTzhyqeSBWNe3qu9D+FNfnTrfJ+bMM6zz27BbLubVyt82LJUXGQZ2Ohb0FOCa0MlWS8FB9Ratxf61v5Zk3n9x2GUbiVEQGLboWCyXnNyWsxpk+cRcJfzHUJY+z85VqgHakrJyvgKdcH1Ur0TmH/pw92jMepNVS7qOnRrDxDpiI4IhpQiskN4SKYNf4WH1kW8My5K8sSkpVSeEYNidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbM3qHSsE3c2Oaoxnd/LOfmNDcxLa1bfB3L0K5m4T+k=;
 b=yaPQIbiNydbX5o+xOL0x+Z+pCzIZJFDMn9UT7jyJI7EFPeogG52J4EoQfx06MM5B5G9mT+E97v4Oborf/E+2UwJc0JFA+lM5o4ZtK0w1wxYV5jHH7zHxzk1T1UqYRph+cUBel2qLYhMljW35KfMGPS3y42jWbsUKOMaSr8nxn1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM5PR08MB2522.namprd08.prod.outlook.com
 (2603:10b6:3:cf::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:14:19 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:14:18 +0000
Date:   Tue, 3 Jan 2023 12:14:16 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 08/69] Input: iqs269a - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <Y7RweBrDmptbKs7C@nixie71>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-9-jic23@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102181842.718010-9-jic23@kernel.org>
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM5PR08MB2522:EE_
X-MS-Office365-Filtering-Correlation-Id: f4eaed10-737b-44f7-e9b4-08daedb654b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rtxy+X1k38stN2Wv9wGjP8msmzR5h5mhuv0LMTo45rWd1qbk0MYNhVMbH5Grn6LK4YP3pHAqlBVsRlVxZuGzbmNN35PYknem4IXn4ZbfdSHps8/GTRpRQEG/GpLyaEg8eSUSW+n2UqHEEyEz6L4/b+DOAWobRdBi5rrSK1NZW80yl854b6M5HxsiQhU5kLdVlNRAv2VF5oZKoPyN9b4g50iVLo/sOVoGNZgzreUU+iFW0jSZKaVe+stgaLgEL5g7XJAzs5V1s3qzB6gIFuX5OehY4QHulLlP3zvtosJGdBSIsjwUlOtRtBNlQkkc0zH1meXM8PajdnMFTQttaAzvDarufg3KBlOksyY2XWMKyxttqiyjgDtXGl6v9L+nkOyMweQvnPw5w4iQeXSJiwfGTfWKFp/fOL4EfrIaPdJR7X8aOOf6GDigKBOYxy1jDN33EMX3SiMd1WwQkk5lzm2Tdh/DWWiAMb6FQwSuJLInRom5sSjbtNoVt87EY3QrQlh0mld7iaABSEwgWcpUDrrHNV+Kheben4bt2F6GazZTZpoEbkm8WVPI0aFD73kNXNHeM7Z6xkH7MZYZHf3rlz0f5ZqEJLbMSvhj0lDo4NFIdtKoRuiVxxwkGylAyW5cq1uw5h4mDuHCUDgDV+0IYkv6eF/HPm+3zCibPqmybGYH/A9WQk7VPiG+ihbbdfumWjr2eUIKUngdOWsX6G+o4QZI4+3UN1gGzdI1+UR9efM8Awo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(376002)(366004)(396003)(136003)(346002)(451199015)(5660300002)(2906002)(41300700001)(4326008)(8676002)(8936002)(66476007)(316002)(54906003)(66556008)(66946007)(6916009)(966005)(6486002)(478600001)(33716001)(9686003)(6512007)(186003)(26005)(6506007)(83380400001)(38100700002)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YO67oaunJIteVeyLaM1bhhxeY7K6LsTwlvpfOWmXLnVSevTDkkHmd5mSknH7?=
 =?us-ascii?Q?fMF4N2MDehbmRB4mllYtdXqC6vApeOXHuhqT50O5XM5Z9++jG6WOagRNVr+r?=
 =?us-ascii?Q?WaHF8k2cko3zlxzfaBr7DGx6yB1AZaknexmj3gQ+p06PgKfq9GR81cG8d6xO?=
 =?us-ascii?Q?umy+L/y9GuxOUibrSMYZyHEEI2XUuAgdbjnfG8aCn+q6RLLys9O3g968B6YV?=
 =?us-ascii?Q?twvGgu1i+TSlMO1Uja5Y0k1D/EJPwRDrfhTvlV1ZA94Jh2vx8XnXm6dxA95n?=
 =?us-ascii?Q?DDY6SXPVyMCbT+Kki7qL5QXYmkhyYi6eAmyW3qYMTO4vtlpmUUpKOamWCaK6?=
 =?us-ascii?Q?JjE9XOAqWDvPFN855t56L/5/8hJGpdN+RheH6WAvblHEhyphAMdBWkQnChuy?=
 =?us-ascii?Q?JQ/pkbKRDHsFxUQS7VjewitI2XVuUaxykfbEiOouwplLZujqjUAfr7u6JUjL?=
 =?us-ascii?Q?UEuyW7vB0QLdzvmAQKC5atrEHAu32TEvqaWD8NVYfPjXnwtacDcxy+erDoyT?=
 =?us-ascii?Q?kI5ltNNuBGM6LbsJ20/z99pEYaCzMteSo3seOP34EHiv7Lz75s/mrUe0wrhM?=
 =?us-ascii?Q?ZeiVJeurwXedCXUAHUTK/CMjY+CzPjFFw+mC2JD+DDKxsiL5JmMLwx3oJRWF?=
 =?us-ascii?Q?i7QLk+BRcajtAl6eaSghJ7VZIySappe4aI4j8Co/hblfnHwwtFKNhMUURu2U?=
 =?us-ascii?Q?cB+BgCwGLExZw3U979H78LUN6jbhtfO3x4fcirmznLFFsrqXrjpc6lIGObAH?=
 =?us-ascii?Q?4hHHrseIXAVl70IyfWFOuvXtime9LJGJkN2PJ097p6ORp5G0VS9AOF+Bfhgy?=
 =?us-ascii?Q?GwZvHPwEwwNMG6JYztvbl+cDAEATsbuSy6slBLNY4SzJlm1pbhE7FODXYx5z?=
 =?us-ascii?Q?7xG9ZqptdAanOWbumnLghyOHburG3SJ+7PUPkCuTWswZ60c7syn7olW/v4jh?=
 =?us-ascii?Q?QHh8nZp/vDeI+DNJ6n7YW4LxUTQcLf7N3f3SaawYLK4jrkeJkNp6JkfrPd7n?=
 =?us-ascii?Q?Dezg0UdHl5sN9RBKSIHpo0JcrL2Y/Tx/UgkB9KJu77mgRUw5vRp3jE19MgMW?=
 =?us-ascii?Q?1sVDqLIwkZuuKFszSku1GYMqDb9IauzTlsGqLEbLX/68v/Gfi4ciesDcqDYX?=
 =?us-ascii?Q?zetm1lIQhtpmjvfshJOx04vFDTFOm3svPFFcNzy6+IDgWzki+gkvYenZ/STp?=
 =?us-ascii?Q?BTgfRVlw2zVlVNMcDfVs61bM84csAgWH+ILAqyNwrrmshLn2gQOvZqJavk7y?=
 =?us-ascii?Q?5pzGMsirO3QwS35fPabc8/0t76iz7qqsG0Gnke9F3PG3DxJv/hUi6IzcPH2r?=
 =?us-ascii?Q?RsThKYBp35t0YnztdthH/5HWZDUkA1XZl/0N/gU/wP8tOQ33NwH4KKBF2MpE?=
 =?us-ascii?Q?+NZXaLWCwZVUBSLSGg/Q7ySiu3uBInsq16SY63U1ATKpWubXHzyQkwMd+XiS?=
 =?us-ascii?Q?EnRw+7fdeFDKZGD7v3dRJZpaYzCS2GMlEX3J6qIywZeK6zI2dbXrTLHnXaJW?=
 =?us-ascii?Q?nV2BTfxwxkWqAxplEery3dOrcXvF/44NETxbJyuUp4LoeKk9BABNxb5D6e9V?=
 =?us-ascii?Q?MNbkUkaLhVpmVRlq0e852b3JNtpw9uhHZ3m7C+Vf?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4eaed10-737b-44f7-e9b4-08daedb654b2
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:14:18.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NELZEFpZmhvKFuRHHIj5EX/F8ddsDAHNQ+WGM8KlvJcVrkeqcscUc4YhhoFpk4xqJwJYuWF4WhO8c61f/StEtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2522
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

On Mon, Jan 02, 2023 at 06:17:41PM +0000, Jonathan Cameron wrote:
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

Thank you for doing this!

Just a note to Dmitry that this would need to be applied after [1] so
as to avoid a tiny merge conflict.

[1] https://patchwork.kernel.org/patch/13087784/

> ---
>  drivers/input/misc/iqs269a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index a348247d3d38..8348d8c85e1d 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -1697,7 +1697,7 @@ static int iqs269_probe(struct i2c_client *client)
>  	return error;
>  }
>  
> -static int __maybe_unused iqs269_suspend(struct device *dev)
> +static int iqs269_suspend(struct device *dev)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs269->client;
> @@ -1756,7 +1756,7 @@ static int __maybe_unused iqs269_suspend(struct device *dev)
>  	return error;
>  }
>  
> -static int __maybe_unused iqs269_resume(struct device *dev)
> +static int iqs269_resume(struct device *dev)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs269->client;
> @@ -1803,7 +1803,7 @@ static int __maybe_unused iqs269_resume(struct device *dev)
>  	return error;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
>  
>  static const struct of_device_id iqs269_of_match[] = {
>  	{ .compatible = "azoteq,iqs269a" },
> @@ -1815,7 +1815,7 @@ static struct i2c_driver iqs269_i2c_driver = {
>  	.driver = {
>  		.name = "iqs269a",
>  		.of_match_table = iqs269_of_match,
> -		.pm = &iqs269_pm,
> +		.pm = pm_sleep_ptr(&iqs269_pm),
>  	},
>  	.probe_new = iqs269_probe,
>  };
> -- 
> 2.39.0
> 

Kind regards,
Jeff LaBundy
