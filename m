Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBED6CB254
	for <lists+linux-input@lfdr.de>; Tue, 28 Mar 2023 01:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjC0X1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Mar 2023 19:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjC0X1m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Mar 2023 19:27:42 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7868C2713
        for <linux-input@vger.kernel.org>; Mon, 27 Mar 2023 16:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgSc723nYyRqTHaNSyyucLzHQIMN4BQvWHi6hvViMzYz0P3hEwneNRCaV+3VF2Ss01fwsnv8luco11WYanrpIGl9TBU4zhxi475ynnAaGr5Hk2EbGhOXrsKgUe7nUy8NxfOuibHacPhJznxyyHMbqvgEBiQQtehC8rvzPtjqGNdMSf0LU2KOChFRu2gVP28qQ62B/f2Kj31eDdHIKzmi2n0r+rfe7It23uS2CWELZz/0PlsITsW7DWUgrxZXDf1EKRxO0ri2aXq3UiG68LXN6tb6Ju0b+d14wLDuT5KlTUUKSBTjoBvTqo1Rhc7sUA0LU5m7GkcnFgP2ebkUk65JcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1swQ/BAP6+VxgilqprhegvJs3OgNMFDfxVm7y7mJ6E=;
 b=Zq508HmXVyVgyXjwPKZ3e8MBCwSx3J7u02+bhnqZ3VWR11HAJwIPQ5NB07S9D6ZCZ+rHQYau1fY4Ro+6QjhfhHlXtDogDm9VjoHyb11f+XrasTpGt4HCM8hfk5RU1oaUrYy8IkZEZicDYl2Rig1U2lHQXmbGpryZHfHViaz6QxP9O1fGHFTu+cBLxt1RG4U2vD2cS6+y/EJe4heCKi047M2HTaLjMQzs+/+qISgzT0gQoOuCtuaC4NVfJajJRAI1zUx/sBAo737UIed5uhEdF3HmS71CVNwdBnzOBLZBkbCRdXpc19CWTarENbnB79Ir9fMdofqEBXFMfFRTSe95Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1swQ/BAP6+VxgilqprhegvJs3OgNMFDfxVm7y7mJ6E=;
 b=GuB/qGTm/XDWUU+hM2NjWLa2NyPHX6EP16NxBMC6GIqG0I0rcy1nNqViLEUBn0A3bNzSWV1YGvQR2UuL65ty3wTLzzUiYHJIKFpXVB4IRDeI2+oGRkk59c5IE+Is5D0GlMbSn2N2GW2X6HEXSKovUFrlAaR5TsBt+O/CaEjuqmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH8PR08MB8630.namprd08.prod.outlook.com
 (2603:10b6:510:255::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 27 Mar
 2023 23:27:31 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1%4]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 23:27:31 +0000
Date:   Mon, 27 Mar 2023 18:27:24 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input: iqs62x-keys - Suppress duplicated error message
 in .remove()
Message-ID: <ZCImXFuXgh+rsRl5@nixie71>
References: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: SA1P222CA0093.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::18) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH8PR08MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: f726a9f5-3f89-49e1-4980-08db2f1ad5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hm4do6Z2mvBmnpmU18Xl24B2Jx08uxknPgilB13s96+EaI102M15SM0BLOrL0LkeAcWvM//R4zQ59cuDtSfunYlUhjdnQQkdFXop+S/pByIQme/DUx42UNYraG6LIA9Z+xqDJOcfGhvJDnfRXX1UZ0IjSFJOXsT42iC3piNd85AmOnxC5i7uuAUhL62VCNPs/wGW/BgOukEC6dR1W0JBP5mZfD4r9mnk9Wqfr/sSC+HgD5fvJA3Oos6CvyyoEluVrKOnE8ev/LwUJoOifcx+En+FGxY+wngcBcyLPFecWFVdHmTUvuIngJntF8y4nB/hHCH1EZ44HK39lJBqh/+2jHl/gQ3/2AI+tb+nHWvIhqfg642dwVjNm3YVY75tmtTXlkkYPJUjFM9eI7DpULl4Fjc/MnUb9FMOA95Sepl1Zv/9BDatEts/QOrgYkX05xw+UTJWBep1sq9MgkDEktWb5KRZK61ib2RQdn3w2QRNXR2wVaQzhYrnqbJ7bYkI4EocXHd3VftsKvowzpsYyznooDokkETVIbRTUuyBscnHgqTwzoR42UU3X/K4/N5V4aHYXbwnfFbpkFRKVcKsOHS0KvpeM4/xKZrr8t/T42u1v685Ntmc3RT7bk8x3DWpqVnMXVWO1lTwyYKOMZqKuZFD9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(346002)(376002)(396003)(39830400003)(136003)(451199021)(83380400001)(6486002)(8676002)(4326008)(6512007)(6506007)(6666004)(33716001)(186003)(478600001)(66556008)(86362001)(26005)(8936002)(66476007)(9686003)(54906003)(316002)(38100700002)(41300700001)(66946007)(2906002)(15650500001)(6916009)(5660300002)(66574015)(142923001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nRxUR2VJe+q8MmAMyDC/Fr+ERQ3nqX9kATmVKxGiIYbYNfLWUMUzNjq1xt?=
 =?iso-8859-1?Q?ObTdk6OURGnl9ohMvvL6yHnlInFg9hM5J8X7KFI6Ywr5sHxRjzA4mRRGYc?=
 =?iso-8859-1?Q?10NFtKUKknlAqtD13YevAZrSNI/G+DjJZRNdrj7W5x1U59Je2DLNqgRRpX?=
 =?iso-8859-1?Q?3RwS0b+VAJrjRLAHuWhCRlp/ZBJvkuW7hSMuWCp7hY2f1udQOOwNR/cA18?=
 =?iso-8859-1?Q?gPA/3hluAWWRak8uM84sbeB3aUq0JMpFhVnPq3xRmvhJs5v/NNLiFcrWjQ?=
 =?iso-8859-1?Q?eHFpMORkhotFHJH/9+Lq5OMdOeNCsKMh3dfA5liFE+yoW5kFQ0UzxhpDd2?=
 =?iso-8859-1?Q?ryMEGSSsTsqUbltXutZkQBSjD7y/QqBEIxS2EC4Uig7ydI2glbEPLmej61?=
 =?iso-8859-1?Q?86HCd6+bWhUsVwZGmEd6H1tqqnKG0Fw3c+MWXw8KSdJk+rns93PF7EnGVh?=
 =?iso-8859-1?Q?wMbizxpA5wIBoAB+6U1OZZFMg45GrIajNnuKyCwJhbbr3IRD7zu3I+wVTr?=
 =?iso-8859-1?Q?PHG+TwYADePdKxx7Kjwh22FKiL/u461bLqXbvvsx7fRVGgBB+tAAgA9aFo?=
 =?iso-8859-1?Q?T+dP6Te2Xs5FEpzQvTwd67bxX0nzwb8M2j1FjfMcQtiO1ch2J3m5Ky8kih?=
 =?iso-8859-1?Q?t6piSgZJy35yLk+83SlOMCdCVunhbbqJ6BGsEsDSaD8hMjyrhTM6xc/cOB?=
 =?iso-8859-1?Q?2C7UtMoJFie/XIkgZQyjXSlC6mf982cDL6HHOk0338WgrSR1LEzmHGXbvT?=
 =?iso-8859-1?Q?0XBeLqV2D4oUVseIo1UZVHPt+tF3NGJHbi/hsOg+y+xZMNGbp8gsXm7N+s?=
 =?iso-8859-1?Q?OvzkeHEsMMsrIkpuI6TxWcOqfijWbEXlEFrZiJvX4p2mXTFHZ92qnF5OxO?=
 =?iso-8859-1?Q?HTKM01xB8dOrF65cbfOoOAqMfMQaWOXhuTDY/d43YN807b/FL798TsI1cT?=
 =?iso-8859-1?Q?0LTVlvoU4WQXWFILassDEdGxDeCjzkUmZIPvdS515PlQlE7vfr7xUin22I?=
 =?iso-8859-1?Q?gxaFPcuRu+v4Ry+Zcj7tz+v96fY+XuSLKad92jlmRD8xLs5Z6gEZrMv9Og?=
 =?iso-8859-1?Q?aimeoAe7Usb0qppAAB//5BM4P32Oj5oz8L7yCO/zmIs2eSpjy3IK0tvivR?=
 =?iso-8859-1?Q?8/X5869EI2dwfrpseFBtmRNfN8SFyhmWuK7wr/sq3gGOIYaAhbSlwZm3nc?=
 =?iso-8859-1?Q?3WFKwasWXkIeGxHBWzsvtsSkjSQaOMYWpzgUDCukDoD3c34yPiiA+aO7X7?=
 =?iso-8859-1?Q?0iY/OMYlyov6Jmhln/4Z+D7m0BAhrLmmAJA4B9mmmh2L6xZlezk1MprvwB?=
 =?iso-8859-1?Q?zTkMNrnPZm9IVf99CtxJWc5z2QEFGjn8q0JNuJ/hVub8ZV2GI26bO9HW/f?=
 =?iso-8859-1?Q?Lt5nGCP89RCSUm+8zxCnpSwm1Mr+R0L7YjD6PPGgOgNyDBAmmCKuGsGs2m?=
 =?iso-8859-1?Q?YshoYSG1jQRCxRbRsvK5QDLqGmQYSq6hsQDowsvGDsqVidFe6AQ+Sde0g6?=
 =?iso-8859-1?Q?J/ToO/rU0U28GNQB9xxjUEqznWtKJqyF2TPNp3l1l+VzF/4mPr252NeUuJ?=
 =?iso-8859-1?Q?ehy0dbnlBjRLZT3OUMTgowR2u8aVDeLme0MScOMgWv2BGBsuRGzIE9bUVd?=
 =?iso-8859-1?Q?Hw+uI5PYtgJpzcuNuO8FUWF8NRQbiguA4Y?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f726a9f5-3f89-49e1-4980-08db2f1ad5c5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 23:27:30.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqXi/uqFrCJMlxdcWZ8Nn4m/jgSYdvKRFOyxdH4ut3uXF1xXhXt1PuQ72BLLRYIMr3/vXJu4xb6v3Yy5XWeqHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR08MB8630
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Sat, Mar 18, 2023 at 11:51:10PM +0100, Uwe Kleine-König wrote:
> If a platform driver's remove callback returns non-zero the driver core
> emits an error message. In such a case however iqs62x_keys_remove()
> already issued a (better) message. So return zero to suppress the
> generic message.
> 
> This patch has no other side effects as platform_remove() ignores the
> return value of .remove() after the warning.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I was traveling all last week, and therefore unable to voice my opposition
in time. However, I figured I would still provide my feedback in case this
change may be proposed for other cases.

> ---
>  drivers/input/keyboard/iqs62x-keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> index db793a550c25..02ceebad7bda 100644
> --- a/drivers/input/keyboard/iqs62x-keys.c
> +++ b/drivers/input/keyboard/iqs62x-keys.c
> @@ -320,7 +320,7 @@ static int iqs62x_keys_remove(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
>  
> -	return ret;
> +	return 0;

In my opinion, we should never silence a function's return value, especially
in service of what is ultimately innocuous and cosmetic in nature. While this
specific example is harmless today, the caller can change and hence should be
the only instance who decides whether the return value is important.

If having both fine and subsequently coarse print statements is unacceptable,
I would have preferred to drop this driver's print statement and continue to
return ret. Or at the very least, include a comment as to why we deliberately
ignore the return value.

However, it's quite common for drivers to print a detailed message from probe
followed by the core printing "failed to probe," so I don't see why the remove
case cannot be the same. At any rate, this is just my $.02.

>  }
>  
>  static struct platform_driver iqs62x_keys_platform_driver = {
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> -- 
> 2.39.2
> 

Kind regards,
Jeff LaBundy
