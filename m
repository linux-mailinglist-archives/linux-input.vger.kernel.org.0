Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CEF6CCFB8
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 04:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjC2CAt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 22:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjC2CAs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 22:00:48 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DBD189
        for <linux-input@vger.kernel.org>; Tue, 28 Mar 2023 19:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvK8T3/+/EDRHmco7qD/dvUwD3fabLoNUiKuRLVXcAcTeLg2ZThrpSS8CGugLWOrs1Sw4wPhtm0qYjq2mD2fyGxldQKEa87ONkJ21WwKzLCWknp7EYTy+UCzTnq2rTFt0+Yn4mh5ZAA7nAj5l39I3ESObDj6BNkGjPgQLqvtPjwyOOR4nXZN28/WwS3CNsnDP9WVYRo8ZKUhADLBSfMLJM/uiRjVvPZbZaF0UXy3Anbw+BQZTlWKMQ8plC11zU8+3GtAHuzCc8RX52K8RuLyDxirRpIIrbN3kOT0KbjD83o6R8gmEjxBmyxDxWa9tI1S0JMWMU9JNkXHnFiTIdtgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoFtLXlZybg0LYHexFhnPuMzBXwh+9ADHvYTor3CsLo=;
 b=j2qPVIuowJR4qgYb6ghVj8gBZcEWGlLMC2oZxnLMX3noDYLAJMzp835ZI3haP0sHiC6NzFirp5CZzgn9KxQKMwt17pTYhq6pw1blBTRUUeeRgrW9p0F0qXF+85YlQHIqOKlSKP5VxaaKxsPBWOQODWxN8W6uNaEOKZBmpjheJz2a6AO9EyViWStXHqhGhgrqRBzBIMlHDeWviVDkYho4gTvTLTx3RmluhgtKCksdNUiGEiUnRnn6k83DzceuJmHZjxosxZXa3Hd3QEkmysTSWbrupts6WRcslBDqfpw5QU75timgCX+Z4A++htl4QcdJqBroqVj1uL/ZWfGUaatmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoFtLXlZybg0LYHexFhnPuMzBXwh+9ADHvYTor3CsLo=;
 b=rkYwt/Rxw+U5Nq28pgihjrF44qtnwiwcrRK1mHI7Jfw54Lk2X5zTZyk2oqKZIB45ottVVuM2Cjh9ytxOAvOP7e8c8nbWs+XiJ91ktcINwgN9W22n+4YStds600qJm+xsgmHSQJHKsWjVDIFTrlVVRv0Lr3dNnSKM12cc0Pd4rhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7556.namprd08.prod.outlook.com
 (2603:10b6:510:10c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 02:00:42 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1%4]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 02:00:42 +0000
Date:   Tue, 28 Mar 2023 21:00:37 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs62x-keys - Suppress duplicated error message
 in .remove()
Message-ID: <ZCObxV3MI15pbGc+@nixie71>
References: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
 <ZCImXFuXgh+rsRl5@nixie71>
 <20230328060829.tqu367vf3ewgiz6j@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328060829.tqu367vf3ewgiz6j@pengutronix.de>
X-ClientProxiedBy: SA9PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:806:22::19) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b82942a-2d87-496e-a0d3-08db2ff966b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQ59yu+zZWj/y4GVih6siVC0nj6HOvT1tiBP+NEUmxjz/TpvrEez1UR9+qOojmvR+KEHcM2dN3mZ0FQqcTL4VhsbmaRFZyBUlOWE2gzFolIR9pZSZgoePDzF19aRL6t/LbUkXZbQVkWVsj2GiuvgDvMceizbOYGiaYoINsH71oa6h6FOYh9hYj188Lc8VE5HsMqTmF3F+V5h790lnkZFjkOg2JNq5z+qEhUWsWyYujhhYgyxbuxCyp09T3/lUSKIdk4zh+XfNiaTTHTwKsHvlYQygFD+aKx5AiurfqKiOh2ulTbQZB7PVfNnHVNjAxBCodI+nTjcL2Zqd/zIH6Q/WhYkg82Rzq6z0s7FuMPDN/XjviBJKonK5G5cM4vutDTLhlZJSc/IvdEoc92JSy2ovEZcJsVUqvG2bQhxcWA54P9O7WNBHig6JuNoaXYGrT/OW62dAgLuiKy4BdjcL9aQL4ij0Bvzt42Ox7HG+vNofVtb2AoimVsi8LWzkegWAOVfdvRtIbl80IJa0cvSmB3ZSkch0LSWjoX5oqTPefr9TSSLSAQ+RqMLKD0Xux6y+9uXP/MadASq5s/w2BCHka4dQ0PtOSvBqliJr8AdwnU0SqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(376002)(39830400003)(396003)(366004)(136003)(451199021)(83380400001)(478600001)(2906002)(15650500001)(38100700002)(966005)(6486002)(6506007)(54906003)(8936002)(5660300002)(6666004)(316002)(9686003)(6512007)(86362001)(186003)(66574015)(33716001)(26005)(41300700001)(6916009)(8676002)(66946007)(66476007)(4326008)(66556008)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iW+dpZ1gdWe00kA4S5Cyctuhow0m5twOfSBSGYKH0u5mIGSS7APPIEJWmH?=
 =?iso-8859-1?Q?5550y3iQ11Fgu3oDTiNgVs7f7Aturt7mRDuitBbfHpY7iA914irN6W7uON?=
 =?iso-8859-1?Q?oaLpojxAc7tcFCWeBMEDe7sOMlWn2+7ZgsMpGdQiKDp0JjUDzGvcy4EPmz?=
 =?iso-8859-1?Q?1854Iyk3Bny1XQu4x7o+P67BiiDd6yDWQYKhm0Fi5mddUfs3yb5kQ/F4aN?=
 =?iso-8859-1?Q?swmJzczBii3VBpNTXyQ5t4T+al1PvsmOZVpwJ52/2GS0b5mdVDu8sLwo2x?=
 =?iso-8859-1?Q?D1SlaYevC53OnVuMzo/SE7x2fUg1L6sHdtLQcO98ukk3RmM+z0POLbTXhf?=
 =?iso-8859-1?Q?XPbMqQINjOSCuw78V4aCPYinXFSbs7TBHQ68tnYcxGj6CTzjsUg53fvm2x?=
 =?iso-8859-1?Q?G3fCDrEpNTO6Ujd4UW3J1OjpF+Ya5Yfef2EZAF4839A1zLMXGIkJsBJ8Ek?=
 =?iso-8859-1?Q?uz/tPZQH98bKX37PiURKApgcwjBSxdA4Dx4ZJP81cvN0Qci8pyzO0l9hxJ?=
 =?iso-8859-1?Q?zBk2U/CXLHLbx0XKpYe0YeGm4jsF43mvaFjZHVOO/W0t+P8V9oxtqvLorQ?=
 =?iso-8859-1?Q?uzy1SqhW26G/cGsbxgGKj6Wxr3tHhiCCoaC4IpkbI4Of3rEQ9HeAF2HCzk?=
 =?iso-8859-1?Q?N+i8LjVk16NZ6DVCW9f9s/yY6FvV3b/alM/74x37PvYBjPDizRFUU53Igb?=
 =?iso-8859-1?Q?6jpeZB5YrDOjNnPrYBnzNWnLqaQMKzz2ZTTDeTZ5zbIsUc8MxjUq66c3Sc?=
 =?iso-8859-1?Q?/MrjQUv5ELO3XeEe/B2LH0zeu3fMTmU/z9ov/r3AOe0A1vVjHWI3g4NCEV?=
 =?iso-8859-1?Q?/AjcFDh0JXcazxFzcFtSi9uYyRHmVaYQA1yopR1FY4QVUVFuwvP2/+++j9?=
 =?iso-8859-1?Q?oX7aLtdwLL+U4O2w0HztFom3Z+HGEHPVB/w60gfbrt6hUZuy0vLMI6WxY2?=
 =?iso-8859-1?Q?vnM1xTSj5IW5Q3NEWNLiXwlcs2Y0KhOtcBSR5Lunm/HFRC09ODbCI+p575?=
 =?iso-8859-1?Q?J1VrmTbfKbUGxOpi1AtK5Sx06d0rvu4pR+cnRpYi5Lk6qDzoNAqShvzbUb?=
 =?iso-8859-1?Q?YVfOwgkVV1Yh/J/pC4jTh9Ksmbq7jvUUmvvpCMAZln4Std5vshDB9hwS1k?=
 =?iso-8859-1?Q?7rDEA2hN9RH+fwEiXfl9Kj61Icyg2e7FJNpfNKt8W+A2dtDTJ89upB0L+x?=
 =?iso-8859-1?Q?FuRfiQsfbZJHDr2hewtDIJTP3Ie2upNXzuNWYka+zWVGofrmgD0vmPFYxF?=
 =?iso-8859-1?Q?k2x2M/QzBIhX9aOFKPY9INXbCLFnaNMd6xdoSeoYGW8Fd9Y+r8MggCqCXL?=
 =?iso-8859-1?Q?G9LBdxQyBBAaHUvAyGIGLnHffzHFQRUcN7h5ugVoGMFw7A+CNhYM3/CM7B?=
 =?iso-8859-1?Q?P/7uSDM77rjxtA5OXytun6pnW+UWpy5vh/yadYmCI1GuUXV4HNenbw2kvD?=
 =?iso-8859-1?Q?sToumbhn8CEilRkngDSnyEA0pfBWzo3crVaoY/xlwOYS2n5j+WSbUZnP3s?=
 =?iso-8859-1?Q?0vL09pNJXEmWO48UsQtZXpzDngqUmYVZuspNrPPFhIjqGTqCIgp5566K+q?=
 =?iso-8859-1?Q?ehSMxrRC9UzXYvEiFPttYbeQ1gMaU5rddYst+QWyS2FpToKuWyQjdu1SU8?=
 =?iso-8859-1?Q?8BmxdOeSZqvE6mAVHkeZn3vBXIioW8UvSr?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b82942a-2d87-496e-a0d3-08db2ff966b7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 02:00:42.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB4Np1GCc5zT00uNizthFD3V40cV85EgCYIzBiiFnHN5IKAFfboN6TacOXEeJ57+vcLqBv8YZQZ7ggcVjvWU5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7556
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

Thank you for this additional background information.

On Tue, Mar 28, 2023 at 08:08:29AM +0200, Uwe Kleine-König wrote:
> Hello Jeff,
> 
> On Mon, Mar 27, 2023 at 06:27:24PM -0500, Jeff LaBundy wrote:
> > On Sat, Mar 18, 2023 at 11:51:10PM +0100, Uwe Kleine-König wrote:
> > > If a platform driver's remove callback returns non-zero the driver core
> > > emits an error message. In such a case however iqs62x_keys_remove()
> > > already issued a (better) message. So return zero to suppress the
> > > generic message.
> > > 
> > > This patch has no other side effects as platform_remove() ignores the
> > > return value of .remove() after the warning.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > I was traveling all last week, and therefore unable to voice my opposition
> > in time. However, I figured I would still provide my feedback in case this
> > change may be proposed for other cases.
> 
> It is.
> 
> > > ---
> > >  drivers/input/keyboard/iqs62x-keys.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> > > index db793a550c25..02ceebad7bda 100644
> > > --- a/drivers/input/keyboard/iqs62x-keys.c
> > > +++ b/drivers/input/keyboard/iqs62x-keys.c
> > > @@ -320,7 +320,7 @@ static int iqs62x_keys_remove(struct platform_device *pdev)
> > >  	if (ret)
> > >  		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
> > >  
> > > -	return ret;
> > > +	return 0;
> > 
> > In my opinion, we should never silence a function's return value, especially
> > in service of what is ultimately innocuous and cosmetic in nature. While this
> > specific example is harmless today, the caller can change and hence should be
> > the only instance who decides whether the return value is important.
> 
> The caller will change. Today the caller (i.e. platform_remove()) looks
> as follows:
> 
> 	... if (drv->remove) {
>                 int ret = drv->remove(dev);
> 
>                 if (ret)
>                         dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
> 	}
> 
> (so ret isn't used later any more). And I eventually will do
> 
>  struct platform_driver {
>  ...
> -	int (*remove)(struct platform_device *);
> +	void (*remove)(struct platform_device *);
>  ...
>  }
> 
> and change platform_remove() to just:
> 
> 	if (drv->remove)
> 		drv->remove(dev);
> 
> The change in question is a preparation for that.

In that case, this change seems perfectly reasonable; although your
ultimate intention would have been useful to include in the commit
message. Of course, I could have also bothered to read the statement
in platform_remove() and it would have been obvious ;)

> 
> The reason I tackle that is that .remove() returning an int seduces
> driver authors to exit early in .remove() in the expectation that there
> is error handling in the core (which there isn't).
> 
> See
> 
> 	https://lore.kernel.org/linux-spi/20230317084232.142257-3-u.kleine-koenig@pengutronix.de
> 
> for such an issue.

Fair enough, I would have also been fine with simply converting this
function to void straight away as part of your impending wider change.

> 
> > If having both fine and subsequently coarse print statements is unacceptable,
> > I would have preferred to drop this driver's print statement and continue to
> > return ret. Or at the very least, include a comment as to why we deliberately
> > ignore the return value.
> 
> I have a patch series in the queue that will convert all drivers in
> drivers/input to .remove_new(). (See
> https://lore.kernel.org/linux-media/20230326143224.572654-9-u.kleine-koenig@pengutronix.de
> for an example of such a conversion.) If we add such a comment now, I
> will probably miss to adapt it then.

I don't think a comment is necessary anymore given this is not this
driver's final state. I was moreso concerned that someone later would
identify this as a bug and attempt to change it back.

> 
> So I'm still convinced the patch I did is the right thing to do.

Based on our discussion, I no longer have any objection.

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

Kind regards,
Jeff LaBundy
