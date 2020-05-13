Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CFA1D06F0
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 08:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgEMGI1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 02:08:27 -0400
Received: from mail-am6eur05on2064.outbound.protection.outlook.com ([40.107.22.64]:31226
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728784AbgEMGI1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 02:08:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWMzI8Knn8SvfXNLDYksGfXYLqoo1te8YDEgCoMn88vazvK+BKEV77r0u9kIhQn3LN8l4DI5tHD+H7cLhfeH/QE3pX1zm2UtQnJIiqY7vw3AumrZ9JF6jT2P7KH6sIvbHD3pyj0MJz8vLwKt8pXEHL7MA/r7XdU/MHVK78aK+hVPzI0N9MTrdS1H64vaiRyLxl8Wb9lHgKmTwS2mWZl3Ju2D266SaRF4gUBsi6D6jjLYJ2mciarZdyMWtLstqLixD6no6QTAWhekrvRvozBaU/pE7PoZzh8bOwLHP9TDmkTkJu3YNSWGYKNL96SmIXlg4gKlZljBLL/+ThnU3vlaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZnqv87wKQSnu7fTTuMfSgt1037AB3qIwxJuAsUFlrU=;
 b=ko13059Kk9n4t9WlKxldxnLHjJiFwgFbMFcVAk8/k8YvhqfA2g66o6ab/XrUGRc/hApF0jYANeHk1JwbJcLHswbHVbPrQvjF5/BrgDzBIWar3a4HJjauu5CL9CGCyuhem68v/QEWYjln4i/ALMW6kTbwnB8Y8Ukk6Uoya2ckV6lF/wzAf+whc9VPl3J3mL4nXqwFDlqLWalr377CTXx5IOXsPiIJJkRHblqw767uJynjNoS40yB/I8FfaI03IFugvoABYpEwuponPfcs7RdzkbjVsV9oNWqcV9KLrKzI+swgvP9pYVQ8HYYieVFlxIei/kX7OGs0yhojBVf93+Rd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZnqv87wKQSnu7fTTuMfSgt1037AB3qIwxJuAsUFlrU=;
 b=hheJbAX0PisubUDVhXuCeHjbuVivMb6yZ4Almoezrv9/cPXeP9Lj+mhE5W4NnqFpN5yEm/qKRicgbiD4oRhCVOXhtwSa86uMUTsNCvNF7yCV5fsupqhWxETvfl07owQBRSPa/xd36FeBcOyB3UhOsG7q3wYm52GamAGi/OYOHA0=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3834.eurprd04.prod.outlook.com (2603:10a6:8:e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Wed, 13 May
 2020 06:08:21 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 06:08:20 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] input: keyboard: imx_sc_key: Use
 devm_add_action_or_reset() to handle all cleanups
Thread-Topic: [PATCH] input: keyboard: imx_sc_key: Use
 devm_add_action_or_reset() to handle all cleanups
Thread-Index: AQHV+QXTnOoa7lAvbUqq8EjvsNdNNKil53Qw
Date:   Wed, 13 May 2020 06:08:20 +0000
Message-ID: <DB3PR0402MB39161C863811D9CDEA301A9FF5BF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1584082751-17047-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1584082751-17047-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6a9f0390-62f4-4a6e-47a9-08d7f704098d
x-ms-traffictypediagnostic: DB3PR0402MB3834:|DB3PR0402MB3834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3834BA5434888F6D37CA87EDF5BF0@DB3PR0402MB3834.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79kknHmGRhFrIv7ryrfMes71ChFajvx1uIQ25fXcfj1dc8SKHLjLF+SBZ0Dyd3D0rU0MWmOKO3Dn7QiBadR0WifhlZuLV5GQ42cxWSlav4cUIcBWbnDmN9r+ucZXy1RxSJxH9TTovu9/3VgBRQ3XnGPFwdKJcFEwk4CYBrzsd/K0s1c7D+7r2xzdk+T0C9vpDYbhNwMPRn6hO8pdT+Bb/QNCUOA+5/JChAMRBYfJV8YaCEMZXFWoTI4fDUyZFD+aUXBFdUobcYnC2YVQgBVrW3mxKXXQX3Js8sIcZi+mvK3eLrQAQDp0SJg7IeQjbLXESBzZZY32Oh+rJskInOT/tU75i56WkQZ2dbKvjjM6+E9zxIRAz1X1eP3s76N+WK4WAa0+qMcWuATmL2pGaPB4/OQwu9t8c9XwQcuzQG2QBCpdA39dEvY2cWSru8EJFPEvSLZgMSZ9iOoloFeSqsAxVDJ1b1iOZf3wFpSS3rcotiV3iFOnKAyKWKhE/hGj25paGbFvGRA9rPOgxcGiHXCX+bTfvIIn3/QJpfTfeJsduf4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(33430700001)(66556008)(186003)(7696005)(66946007)(64756008)(52536014)(66446008)(76116006)(2906002)(6506007)(86362001)(66476007)(8676002)(316002)(5660300002)(44832011)(55016002)(26005)(9686003)(8936002)(4326008)(110136005)(33440700001)(33656002)(478600001)(71200400001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dq4OVBzbjagak0nNoy9GRdeu4cFD8YFPpWlY+GQM4bkWM9/wztR7dsb5+4b4EPx1mZx4b4Cwwc+lewc6Yyf3hqeYOfS5xUiM9exQy4sEJVZAadUeKTe5qV30y49sXY9ezC8SDzmpHvpwuv+gOnmbikCKJ7v17d02gSAsFiYZ39khiLl/aaLzGvK55EeeuoM0hA376YanmiRZtb1CyzFJ4YX9Yu2rRJQStfFLN6fwQVIobIvdnrKqwfI51ivkg25hkqzsevJ8FnR/aARkCFMo9gVEL+fkWw1L/jEcA/LInQl9k/TfZWodVIBbgjSuV4i/tZR25Tw9jV0xjBWkK8ZBfcer5rin5kNPvg8ca/w1aRWhokHK7jQmmFBwJL+p5OJbAvLMiizhERK0w6mGc2WiqHTtv/DA/kS58IJ0ICKIUGvX5iFLAA1u0uNgDvXBjc4qzoadhtDrtzQWaO/MaKXeZP8eSdA+zGne1ont0iA785E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f0390-62f4-4a6e-47a9-08d7f704098d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 06:08:20.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6HwZ04Cyxb1eduiEuMc7kKBRaZR8qUUSa2LQK+TqJNzTc2OM+Dh6mlsH4SHBTmaBUdwU5rNT17iuTSOFrePfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3834
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Gentle ping...

> Subject: [PATCH] input: keyboard: imx_sc_key: Use
> devm_add_action_or_reset() to handle all cleanups
>=20
> Use devm_add_action_or_reset() to handle all cleanups of failure in .prob=
e
> and .remove, then .remove callback can be dropped.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/input/keyboard/imx_sc_key.c | 33 +++++++++++++++----------------=
--
>  1 file changed, 15 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/imx_sc_key.c
> b/drivers/input/keyboard/imx_sc_key.c
> index 2672fd4..eab5dfb 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -96,6 +96,15 @@ static void imx_sc_check_for_events(struct work_struct
> *work)
>  				      msecs_to_jiffies(REPEAT_INTERVAL));
>  }
>=20
> +static void imx_sc_key_action(void *data) {
> +	struct imx_key_drv_data *priv =3D data;
> +
> +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
> false);
> +	imx_scu_irq_unregister_notifier(&priv->key_notifier);
> +	cancel_delayed_work_sync(&priv->check_work);
> +}
> +
>  static int imx_sc_key_probe(struct platform_device *pdev)  {
>  	struct imx_key_drv_data *priv;
> @@ -146,27 +155,16 @@ static int imx_sc_key_probe(struct platform_device
> *pdev)
>  		return error;
>  	}
>=20
> +	error =3D devm_add_action_or_reset(&pdev->dev, imx_sc_key_action,
> &priv);
> +	if (error)
> +		return error;
> +
>  	priv->key_notifier.notifier_call =3D imx_sc_key_notify;
>  	error =3D imx_scu_irq_register_notifier(&priv->key_notifier);
> -	if (error) {
> -		imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE,
> SC_IRQ_BUTTON,
> -					 false);
> +	if (error)
>  		dev_err(&pdev->dev, "failed to register scu notifier\n");
> -		return error;
> -	}
> -
> -	return 0;
> -}
> -
> -static int imx_sc_key_remove(struct platform_device *pdev) -{
> -	struct imx_key_drv_data *priv =3D platform_get_drvdata(pdev);
> -
> -	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
> false);
> -	imx_scu_irq_unregister_notifier(&priv->key_notifier);
> -	cancel_delayed_work_sync(&priv->check_work);
>=20
> -	return 0;
> +	return error;
>  }
>=20
>  static const struct of_device_id imx_sc_key_ids[] =3D { @@ -181,7 +179,6=
 @@
> static struct platform_driver imx_sc_key_driver =3D {
>  		.of_match_table =3D imx_sc_key_ids,
>  	},
>  	.probe =3D imx_sc_key_probe,
> -	.remove =3D imx_sc_key_remove,
>  };
>  module_platform_driver(imx_sc_key_driver);
>=20
> --
> 2.7.4

