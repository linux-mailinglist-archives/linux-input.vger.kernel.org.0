Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B85C33AA11
	for <lists+linux-input@lfdr.de>; Mon, 15 Mar 2021 04:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhCODjA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Mar 2021 23:39:00 -0400
Received: from mail-bn8nam12on2081.outbound.protection.outlook.com ([40.107.237.81]:60513
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhCODid (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Mar 2021 23:38:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zwdo+yYfWJcRY2O4cbYVKka5VK380sosLo16TuHQW40DsBk7UT8jVgOutIHhKmoH3yQK08f8HM8Gld0YsNmtIEsMUD1PP5NdEmYjgmAjcjGd+Dcf4rCjmpDye+14XhOY0LBOfizbAaleDq/xdHFLVTw6iuzbzLgLukhzMcyr6X5cHBYA+WJ7aA6CQ9vUjiR5h1ZKHqSvavR3BmDRwOA2vhU3iKAmktoLU591rCJrqt36lQZmHrKfG5S+oTiSmnwrpUR4w8RBvgk805Ic98U47jSMp1RAWmZg29fwJVCRbjEqR6YbIZvcLGuEefMNt+d8iwPiecdkTTWJ3MRQyX7fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVKNvY5npYHOL2yxouzHliIcw/26e+2RMXgaUnG1IIY=;
 b=VYURUZIiriNLqMAjJR7LbwVhiuzrE1/bmIozIIifqNhy0Iz0rqhdv7E/Ec8myUwQ3rib1iU177I2pDWJpQHk+2wDBAqwm8T1Xoug7Sf0NZnxserwUqxUV86sqVjGge36UCQtqF7RR/6lJpW4DX6Hw4tlTs/IpmDlfOTrpvXb8QU8Ii2RpW/3o6tRoSkt7Hw6Mt4KuBnv24B4dq7dAARBedxmOFHujbEIlKI4rghmaMbe0nkSNZnJ66hEg1tOShbklN6Khylaf4wloJ3oTrf0UvPnD2nP0vvznlXY1eeCHFKtW4RoYwHaC6aKKuxgKHxP7zxNkAiAqUHC5H+QC0BRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVKNvY5npYHOL2yxouzHliIcw/26e+2RMXgaUnG1IIY=;
 b=fjfMEjSgF3Zj3mBQVYcHJZrM7E81UGHXJUMVZVDuWbmxHdgOmUi8TmdoXG2/B68tS12wEVenZPJ1eMU6TtV5f/yeBS37xJKUklZj/k7K4EoaGueq/tP2F3sN1W4tPMHR2BipV6xloCb48eDG35PVhMrjZ8iPqh4OX+j6C/RATmw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from BYAPR08MB5510.namprd08.prod.outlook.com (2603:10b6:a03:d1::19)
 by BYAPR08MB5991.namprd08.prod.outlook.com (2603:10b6:a03:124::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 03:38:27 +0000
Received: from BYAPR08MB5510.namprd08.prod.outlook.com
 ([fe80::11c5:ce33:aa20:51c4]) by BYAPR08MB5510.namprd08.prod.outlook.com
 ([fe80::11c5:ce33:aa20:51c4%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 03:38:27 +0000
Date:   Sun, 14 Mar 2021 22:38:22 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/9] Input: iqs5xx - prevent interrupt storm during
 removal
Message-ID: <20210315033822.GA4337@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-7-jeff@labundy.com>
 <YE2rZycxR6elopon@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE2rZycxR6elopon@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:805:66::40) To BYAPR08MB5510.namprd08.prod.outlook.com
 (2603:10b6:a03:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SN6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:805:66::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 03:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b7d8e76-80e0-4181-81b3-08d8e763cb7b
X-MS-TrafficTypeDiagnostic: BYAPR08MB5991:
X-Microsoft-Antispam-PRVS: <BYAPR08MB5991550BD347861AFFF84E49D36C9@BYAPR08MB5991.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHlgfAg89GwC5KfGBBMMzrqDBZiMX5xEcdt24PhEP6+pZWLbBgsXEY1syQUt+3AxZJDA6eBnWHSDkLDcMwFGkBuaVjqxAGUMy/jn31kIpaWGdHKIZfB5w1AP1c6RaH+PrFgf079v59M3YP2m5cC6bB+0EHlClMop8mQ7a62QLXZz1QyjM2kcVW8v8cSWbS9G+9BUSijqXis+/e1gV8U2XTSSnhpQC2waNnxSmGxkELXiBFAbmWwTCmZbYs4MtfajJyVT+PER3E9g3NUqp0eZ6pWnLx5bjiZUVmxhN294zaiYmubrNrZnfbTjhIXwq8DOyxvtARaHnXrNtZqhXWt6DBabjRVlwCfRQOGnNeiFJh/YoJNXIWjU74jSvcgPT/hIJ8THNR+TR7ucF3dXPbQDc++VnDh1PIkPefoidvDZb/zHt7pU6ao3yJPWRfIeQnSbyXGyYEnteYTeYxj3Le3gxu9Rtzkv35MFTpoSsGM37MnfBxsPzfDEqAXa7eRGFtn1fKjNfIpFZvFwZpI15z113OcEG+lIwh69n5Gs+0sjFRsahQVkVYmy1s1HnLXtFdVznNz/M4+7b1c4bprQkyC7r80yOjqRxYIjsx27CHKlIYEFcbX/XA3++3YG8SZt/Wn7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08MB5510.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(396003)(39830400003)(83380400001)(66476007)(1076003)(66946007)(66556008)(52116002)(8676002)(36756003)(86362001)(7696005)(4326008)(6666004)(8936002)(8886007)(5660300002)(33656002)(55016002)(2906002)(2616005)(16526019)(956004)(478600001)(26005)(316002)(6916009)(186003)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4lHPYp+3OeN6GNopb4v+PgwtIRyFrcKG85Ef1Wnd08wpRZpurOLdL+Su+AjH?=
 =?us-ascii?Q?R67HQvuvRYwOnf/RXHz7DM7H+e7ENJmUt953ZFCQxTW+WM4ImKx+nNR7vbsN?=
 =?us-ascii?Q?SlRFxp2GHisXqZAJqxynYIbLDIMi8mbny9FL3E+XQE6n72kLU1/qpuin+8/v?=
 =?us-ascii?Q?YaU1tb3Zw8VjTGTrjZv5InbyYNUPq+NUdQl7fZCWKJN9M8jiYYaTQGTiZbr2?=
 =?us-ascii?Q?65uBcyUPzgLyqvsPxnMGNeh1mWf+FpzzTST6I0xhizrqFEqxU0amELUbO8vH?=
 =?us-ascii?Q?sNVFxwh5dDoNhFOPzx2vBtgazRROJNjoBH9oJOV7hHiGS+PXxWLwP2RJp+Sx?=
 =?us-ascii?Q?aIkypt5lrMVbn+NrL75Nw3yQ/mMkHeV4hOgCaIvQDDC89n6rxwzfe/QlfRHl?=
 =?us-ascii?Q?5DuBRzgoaZexYIrslcQlE804vw4GiBZxj7DsPiOVynkdiS6D1gvz62vRk9Mc?=
 =?us-ascii?Q?6LwVwsos+jcWbOpX6iLBer3E4JUMPEiHj5lNsSEH0302SkUnqPNsNeeOiKwl?=
 =?us-ascii?Q?DUDWWjgjMZFoMhBdZ4vy9aW3mGEDS6j60+IUhxcI72R/erZrwHikiHCCbAR8?=
 =?us-ascii?Q?BmHoGfgVNc9ul7GNKoc6KsEDp7yO8NRq2NC/6xb9xaGJRzlGIvEapoWav+Qt?=
 =?us-ascii?Q?DKtvTYiKRjgYm8yZuzVT4cgjuapO0l/PhkJY3oy1BqjBv9sOhWNYFEAWaiJN?=
 =?us-ascii?Q?xr2gzTfgFDP6dfSroOHN1KQL0I+7hnfZKkD16t6YYVrtrgUVFh3DYpheKIJB?=
 =?us-ascii?Q?R3Gy8vPhW07T/RqmFW0RiU93hutPK9e1iWA+NibuI1p0GZa9VkMCT8AuJa3s?=
 =?us-ascii?Q?gC/uTutVITNrZue9L3Uc6M7ZVBvS5dFdOylIR1QjCpclgq5m7waXw+7aq8ga?=
 =?us-ascii?Q?afSXVJAHb6nNLmrUwdoOOXp3MeK8f6qOd9Pjlso8TvYCa+a0QWiZYaFirDro?=
 =?us-ascii?Q?xBAEA6jNEeW6ThytJDIlUuf+x2Llai1TN25K7QkLYeONW+kfqlx+wnelLABT?=
 =?us-ascii?Q?ogdHFzpanfV7HWAAILr/ZXyCkMfNPXOfmuVsgepZ26EMPVHV/kiZBVr/mzl3?=
 =?us-ascii?Q?DJ3YdEogyZA27pJvNXZcy9nuutlLZeXx0qk8bH2sBLJtVMLEr6zRgFh/XYLa?=
 =?us-ascii?Q?IaNs/pNE8DFaquGY0COm3irotXEjDOEzkRAahUjRxDavwCi388Lnd25I62DD?=
 =?us-ascii?Q?jbtTVZDuHjLTM9tibKPtkYcYSzx+Fy47hOita+3mTSttWDyOkiC/ZD5oXgy6?=
 =?us-ascii?Q?6yh+/sucLp+XNW/sYZSIao03B1y5EF0VyMRjDt8zFqG16LIs3YyljhggkIuy?=
 =?us-ascii?Q?JZKBVmYukXu/emNktdDiApSr?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7d8e76-80e0-4181-81b3-08d8e763cb7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR08MB5510.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 03:38:27.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB1mSK6X7rX86IKq6/SP98iM5+L7qymhK9TAPpri3OfbpTroBO4OiIlkO40lR23aZBTIW4uEWY5PY2bYCuulmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5991
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sat, Mar 13, 2021 at 10:21:27PM -0800, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sat, Mar 13, 2021 at 01:12:33PM -0600, Jeff LaBundy wrote:
> > Unsolicited I2C communication causes the device to assert an interrupt; as
> > such the IRQ is disabled before any registers are written in iqs5xx_open()
> > and iqs5xx_close().
> > 
> > After the driver is unloaded, however, i2c_device_remove() sets the IRQ to
> > zero before any handlers may call input_close_device() while the device is
> > unregistered. This keeps iqs5xx_close() from disabling the IRQ, leading to
> > an interrupt storm during removal.
> > 
> > Placing input_register_device() in front of devm_request_threaded_irq() to
> > free the IRQ before iqs5xx_close() is called does not cover the case where
> > firmware is updated at the factory and the input device is registered well
> > after the driver has already probed.
> > 
> > The solution, therefore, is to remove the open and close callbacks as they
> > do not buy much in the first place. The device already starts in an active
> > state, then drops into a low-power mode based on activity.
> 
> No, this is not the proper solution. We should rather fix i2c bus (and
> really all the other buses with non-trivial probe and remove) so that it
> is compatible with devres/devm. I wanted to do this for a while and I
> guess we really need this. Could you please try the patch below and see
> if it fixes your issue?

Thank you for this suggestion; to be honest I had not considered how other
drivers may suffer a similar fate and I agree with your approach. I tested
your patch and it addresses my issue.

That being said, I would still advocate for this patch because of the other
reasons mentioned: the open/close callbacks do not happen to buy much since
the device effectively "opens" and (almost) "closes" automatically based on
touch events, and getting rid of the callbacks lets probe finish faster and
cleans up the code a bit.

Perhaps as a compromise, I can squash this and the next patch, and speak to
these points in a consolidated commit message?

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy

> 
> 
> i2c: ensure timely release of driver-allocated resources
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> More and more drivers rely on devres to manage their resources, however if
> bus' probe() and release() are not trivial and control some of resources as
> well (for example enable or disable clocks, or attach device to a power
> domain, we need to make sure that driver-allocated resources are released
> immediately after driver's remove() method returns, and not postponed until
> driver core gets around to releasing resources. To fix that we open a new
> devres group before calling driver's probe() and explicitly release it when
> we return from driver's remove().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Tested-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/i2c/i2c-core-base.c |   19 ++++++++++++++++++-
>  include/linux/i2c.h         |    3 +++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf722a424..b8a96db2c191 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -518,6 +518,11 @@ static int i2c_device_probe(struct device *dev)
>  	if (status)
>  		goto err_clear_wakeup_irq;
>  
> +	client->devres_group_id = devres_open_group(&client->dev, NULL,
> +						    GFP_KERNEL);
> +	if (!client->devres_group_id)
> +		goto err_detach_pm_domain;
> +
>  	/*
>  	 * When there are no more users of probe(),
>  	 * rename probe_new to probe.
> @@ -530,11 +535,21 @@ static int i2c_device_probe(struct device *dev)
>  	else
>  		status = -EINVAL;
>  
> +	/*
> +	 * Note that we are not closing the devres group opened above so
> +	 * even resources that were attached to the device after probe is
> +	 * run are released when i2c_device_remove() is executed. This is
> +	 * needed as some drivers would allocate additional resources,
> +	 * for example when updating firmware.
> +	 */
> +
>  	if (status)
> -		goto err_detach_pm_domain;
> +		goto err_release_driver_resources;
>  
>  	return 0;
>  
> +err_release_driver_resources:
> +	devres_release_group(&client->dev, client->devres_group_id);
>  err_detach_pm_domain:
>  	dev_pm_domain_detach(&client->dev, true);
>  err_clear_wakeup_irq:
> @@ -563,6 +578,8 @@ static int i2c_device_remove(struct device *dev)
>  			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(status));
>  	}
>  
> +	devres_release_group(&client->dev, client->devres_group_id);
> +
>  	dev_pm_domain_detach(&client->dev, true);
>  
>  	dev_pm_clear_wake_irq(&client->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 56622658b215..5d1f11c0deaa 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -306,6 +306,8 @@ struct i2c_driver {
>   *	userspace_devices list
>   * @slave_cb: Callback when I2C slave mode of an adapter is used. The adapter
>   *	calls it to pass on slave events to the slave driver.
> + * @devres_group_id: id of the devres group that will be created for resources
> + *	acquired when probing this device.
>   *
>   * An i2c_client identifies a single device (i.e. chip) connected to an
>   * i2c bus. The behaviour exposed to Linux is defined by the driver
> @@ -334,6 +336,7 @@ struct i2c_client {
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
>  #endif
> +	void *devres_group_id;		/* ID of probe devres group	*/
>  };
>  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
>  
