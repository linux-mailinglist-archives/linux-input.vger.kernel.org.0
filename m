Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA2065C5DC
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 19:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238644AbjACSPG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 13:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238550AbjACSPE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 13:15:04 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D872B6145
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 10:15:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoFam6rHk9cSnHDQWykJDqHrSRkM8KtMLDjv7kCO8dCkKzcHC514nMgizUNRUxaHojMiD0pON/RJlG+gYp3carEps8e1Ys8NDfKRQUtXDHXhZcfMmr2kZjdms1X+/3cPpFiYNsdyVh4TWkYvTOuYHluqwSfRDNA9X4pIepequFyxvW4LX+PE8vR6IH4oJ0NuJ/r2cKOdpL5eIIqmRX6crVNocLZ6a1h4EMc03BaZD/irBHFs5lsi/+nRfwwqigPGo8uOV7vY1AEIRH28hW8GZRole+57bj5mUGJfz5Fai6pcIgSKK3ZPg4GVtDYnD8IpohQ8dlGNuckNyBPlOEzM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEZZy7mHXqPYvtTQgzMwFz2L/lmUYFlSE5e1PylYLQE=;
 b=dGK7D75cJK8zWJcrmLzRgONb+Ezj5ccZ3v//GGEBi+pSWN7NpWniXYotVY415ZeO9T5tsI8OlBI4LtmbGneCZIbSJodOLRoWBLPAT/zEyqDDs7n1GDnlXt0oPBUTuNE+ucTU9+aCm/OIYH2i5rJkX4uh4J5mRZjP5CviGzZhESgiQGqBUhtnLpbJc4VvsB17W9d05zo7jSzrac7mWYC3CN+FU++Z8NgzPSelxL/bRa++bt6efErpeFBVN5JrjgLoMBCS7bOMSsivRp2yUaxw1UepkDgJiHp6WhC8grLBEsBAkfzu02tDgtqafl1ooA5PRcNDIIm8Sx0Po4Z0UCXvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEZZy7mHXqPYvtTQgzMwFz2L/lmUYFlSE5e1PylYLQE=;
 b=MJ7dMv1+MY/ANeRB8nxU1fL/zu6wxRMXy1gNkqjEM1nkSSJPju08kWH/6sJeO2qMONHCUnDWSeOW5BjFETH22pbwYY5/itaZ3T9jB0Zou/g0eAyUUBEo/s1Zckr12aHQ/HqhR4Xnm4Tqb93djKaTqbCZYly7r3nInqqX4T/s0g0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CH0PR08MB7292.namprd08.prod.outlook.com
 (2603:10b6:610:111::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:15:01 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:15:01 +0000
Date:   Tue, 3 Jan 2023 12:14:58 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 09/69] Input: iqs626a - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <Y7RwojonWxE5P/7k@nixie71>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-10-jic23@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102181842.718010-10-jic23@kernel.org>
X-ClientProxiedBy: DM6PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CH0PR08MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f806422-17b0-4e06-39a8-08daedb66e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFOrcKrfqddyed28l76jQMqk6YBQpQIX/4DWowubUa+I+bukkdOIxCwiZFQGhnRRMeQZXdEOuD/0F+Rd1S2nNpVWRFVLpqbFzQuUCtlkqv7/13/wVTDq5RJgn0ZShaH3gopfj2tYPol1vjKnnBG7omane1NnZJBT4hXmIm4t2MYhOrfKv7KZNsm8VMJQs0Xy2iIf4EfqlYA/NXlqD8b98kXXycvutXDSoWT7ZIfkJ/7n8nWNUhOal+OA2FQIRlit5bSHuH6/hGmOZJcXZiYSOLx6v9pbbwFcGl9EcExf6fQ0WP0DsA16BwmBqqojJAWUOtAeFzjbyw9s6lBbFHANFMwRG0N2jV0TPkQtmWSEg8kDwMUbij1idzi1w9bwfagUTQsQlI+AHYM/nX8PG61zqwG0qX48rMMI44WUWU3QQKQ5ZN3LtknxrrwNELZHibvXp7VVQf2uLnvEn7ztAfF72xi14y7lG3siQ+7+qus5e8knD9lT0WOA5nTbzcnm1lII2DZvWDMj9SidVNBYHnDURL0hLYaCquVYFzib6uJM6seqy6CAp+8UiifQbcyKoUKH7y+GBx8713Ul19d9wtoVcb9IIwPTXUFWFIMNR8c9Hdiz3W0yPHMERR2XxPhdYpJYb+itaVmulOjlOJciiCTWscXEjERgL/AHyhPsoCxSCZTa/2G3OEZCa8njzA0/8JOx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(396003)(366004)(376002)(346002)(136003)(451199015)(41300700001)(8936002)(4326008)(66946007)(8676002)(5660300002)(54906003)(316002)(2906002)(6916009)(6486002)(66556008)(6506007)(6666004)(478600001)(66476007)(86362001)(26005)(186003)(9686003)(6512007)(83380400001)(38100700002)(33716001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIBdNtXkf4P4so38Bqg6mpHCWVNQHyPONgIuELpZJxIQZdddidNnChYvQwPq?=
 =?us-ascii?Q?i+PSV9jUPQgj+P22Y1wiNS0kDd6isJFj/3zyvj5a2OwMocG5A/cyhw/3igH3?=
 =?us-ascii?Q?bTdcj8HVCy//PmezlNLqlhX1ltA7+sik9bZFbxdss2P6+oqtdOSoxkhVxIim?=
 =?us-ascii?Q?A0lxMZoJvadTWvwep0K3zQH3suV+NxlufeDjQLPM7VeQMjElJsEEkl7AU0vZ?=
 =?us-ascii?Q?0VKQQieREPTpMrqgAO5Nz3uW25GOKLmsj6AzRtjUEOVic1fxDRcl7wM89GCL?=
 =?us-ascii?Q?5hq4N/yQK5sJhYoNR5rs9Muomdsn9pPW3NoFEZyHGvp4dof6R3ZnIsCDzrEW?=
 =?us-ascii?Q?O3beGI0ffjZCo98XzCQnnI50IoecSjk3goIUxNvco9fekHJr4YrB86tFlzpS?=
 =?us-ascii?Q?9wA9uVCRxRE1Mhe60zpMruax9lbpbvzaigJpZSQhWUcVJpTcpzBaCnDuWVYs?=
 =?us-ascii?Q?7i5f8I1WfnBwQHBuRLVIyBYwNNLwJof9ZAIHSmZBQLxMH9kt6iiKRpXGg5Ce?=
 =?us-ascii?Q?By/AAkzEFMl73U31Rr52Vlk1LkiqQo7GehavDn3m724A00ilOV/O91Aabpl2?=
 =?us-ascii?Q?XTD60ON63EQFGFNmCOYyCKsKJRZPcmstCNaEbSZJesi53NIM8jvwN8ClrjwT?=
 =?us-ascii?Q?2ZdvP3Ge3dnhpwTsnst5ysfSL33yWDlnDJeTz15E6TxQWcmhS64SSbgvtpa3?=
 =?us-ascii?Q?XTRfrcuet8EuJu92fniOFJ5UAlarWUgFozvfPO6LpATvgm/NIrUDwDfuPsOv?=
 =?us-ascii?Q?0q+N2lU/Fc9rUmFLl0hVf4fhzsaWZbQLTyJXNgMW/PCODYYvPz07CGLnKp86?=
 =?us-ascii?Q?phTBIpjPKS827D0CvbOTIs7y0N5rskvnkJOC1PKYTLibQkvxeQch77xjxbC3?=
 =?us-ascii?Q?9Tu6onkmjuhxKchz5Xje9OZC8/FFiTZGbrGa2nqhUEQ04eB/8XrcKt6Qi9yt?=
 =?us-ascii?Q?rHAmvoxdYMfUrYa3/uFx+5UMxAZOLFNznnV1wIrmbEl9JzsOp/NzVh3B+b34?=
 =?us-ascii?Q?QfQlXxtnDuvjF8sSMJS1vK3VcG8ZPh6ZM/5xkzpN7xRL5noSlaMZe6haAHXn?=
 =?us-ascii?Q?fub4f6or7i+D31bGqkRVCR0/QaoM+6vHszBlpqbzl0WCY1oBLyWHYbYc2t20?=
 =?us-ascii?Q?mrXEFEgLQz1jpeI8I+j4mLvQAd8R77CBJT5ty8nCLTyZNd+XEyVuNNpYz5+Z?=
 =?us-ascii?Q?81rYmMx5dGurYISZsojmVhELvtQFvCkTmN2L0S2kGQyQZIVPEC6/sfUoZEus?=
 =?us-ascii?Q?eC1PnOTgheUYv1X48fHh5GXPRbR6ePcVqf7wDkatuB886gqAaiRz3hnHCqnq?=
 =?us-ascii?Q?sYs+rqUMz9fEpL/A5e3afYQTf/A2D5DbfzxkvsMGabLP78xZ8FpSQ3zK2I75?=
 =?us-ascii?Q?Cxlt64MYNlY3lxmrrwiDmM2IGND9SlOoWoenpebxjc38mWgIsay0wjrAclRm?=
 =?us-ascii?Q?aa2snavHSa12xsGgflTi2sNKqEDwb2ldHG1KRbOjDLCEHJReMsz5XFZPnW1y?=
 =?us-ascii?Q?GzIcad9j30uk5SQtFa0J0R4IdrMjcBVBVjLoT145U0yF2cTKsm7ZyQYt8OW6?=
 =?us-ascii?Q?7amE641GEqSc5Ht+GtWrD3T1egVmEma1ttnXqerR?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f806422-17b0-4e06-39a8-08daedb66e00
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:15:01.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9uKhBAWMa12Tj5G3RpY54+0gDIxPW2b2EHugoCzqVtWYP78fMUEbubFlj14vfE62Ng3YtGxjchD62TeW27wlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB7292
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 02, 2023 at 06:17:42PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/misc/iqs626a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> index 23b5dd9552dc..4727e6b95e41 100644
> --- a/drivers/input/misc/iqs626a.c
> +++ b/drivers/input/misc/iqs626a.c
> @@ -1712,7 +1712,7 @@ static int iqs626_probe(struct i2c_client *client)
>  	return error;
>  }
>  
> -static int __maybe_unused iqs626_suspend(struct device *dev)
> +static int iqs626_suspend(struct device *dev)
>  {
>  	struct iqs626_private *iqs626 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs626->client;
> @@ -1771,7 +1771,7 @@ static int __maybe_unused iqs626_suspend(struct device *dev)
>  	return error;
>  }
>  
> -static int __maybe_unused iqs626_resume(struct device *dev)
> +static int iqs626_resume(struct device *dev)
>  {
>  	struct iqs626_private *iqs626 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs626->client;
> @@ -1818,7 +1818,7 @@ static int __maybe_unused iqs626_resume(struct device *dev)
>  	return error;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(iqs626_pm, iqs626_suspend, iqs626_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(iqs626_pm, iqs626_suspend, iqs626_resume);
>  
>  static const struct of_device_id iqs626_of_match[] = {
>  	{ .compatible = "azoteq,iqs626a" },
> @@ -1830,7 +1830,7 @@ static struct i2c_driver iqs626_i2c_driver = {
>  	.driver = {
>  		.name = "iqs626a",
>  		.of_match_table = iqs626_of_match,
> -		.pm = &iqs626_pm,
> +		.pm = pm_sleep_ptr(&iqs626_pm),
>  	},
>  	.probe_new = iqs626_probe,
>  };
> -- 
> 2.39.0
> 
