Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFDC155380
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 09:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgBGIK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Feb 2020 03:10:29 -0500
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:12707
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgBGIK2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 Feb 2020 03:10:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CclBG4vWG8BW28zU4IStJ11FWF51MZOFpA7XxtralPBXaXTjjP3uRxpFbsiVyLZy+gBvNHZVtQwftJGe9zatlhlS+kgS+8jJpqxkuCmneLRvzmiyMBiDde0HNNdGs63EvzPIz1bTV2FNPfG2XMPrzYojTcoEchqWMYItYWCnQMKZzYWo7rLyoVEYJNmJYOto/FHJl4YuYotXn/2MEcEQ0JEn9F/ggL2edz5OrEaOMVbPW9ehKP07zoaBpxdPAQiIBwJYxLZXP7l1m4UZa6i0AUnCrjRwISLc4YxHExPQ3kSMVESAaLGtSoR9c73fnLsmDbsdrFCVbPveqofWPCbmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWpfQjQ8kJI8DTUzc69VkE9kwzJn0d+di+JsZZZjwtQ=;
 b=AfRWFwJWBsRt+4dJanhkUCn0kdfMqWw2WkHMERKi8CB6H1E3hp8+4XGHxfZ12gyaZOK3F+Sglt1WPYK/G5VVqoMKRh3ApgCNop/TavSu+cZ0YodccY6rL+ZxZrCMloTiPi4M1LR38lvrrerb4Mzh3neMCUNYyWj2pMKtb5SN0HCCqrfjOslwj4BTSwh8MMA7utJFnCG2EAfAlsyC45XyTj4/TWzedUeQCxW0aPNS2898PUEV1eqx38SkZy1q9kPwU95RWDnpDV+ILyuYN/NFY7m9izH83+S+KvNB7Ri/00TcGn98yuTTLqSIKtf5zvE+IM0w+VWQ0EewUALn704CHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWpfQjQ8kJI8DTUzc69VkE9kwzJn0d+di+JsZZZjwtQ=;
 b=j5eYJ8iZjZjCEfv/RtWhOgQYhxhfnDwxYXX/RLcP/cXmwaX0JgoGYriW73vuZdHqTjYo/1LOPbZUz3y7POpMTOViUZuy5LCOaTYSMJoN7sjBzObyyrCpb9WdXHBgeDMmoDoqhk62yv593nFAXgdJAaaCLWmKeMnFXY4sj0WWCwM=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB2831.eurprd04.prod.outlook.com (10.175.23.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 08:10:22 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d%7]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 08:10:22 +0000
From:   Horia Geanta <horia.geanta@nxp.com>
To:     =?iso-8859-2?Q?Andr=E9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Anson Huang <anson.huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Topic: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Index: AQHV164yHhXoESmTiUqzHJu+3DHGMA==
Date:   Fri, 7 Feb 2020 08:10:22 +0000
Message-ID: <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8580592e-cffa-4e3d-d394-08d7aba52de4
x-ms-traffictypediagnostic: VI1PR0402MB2831:|VI1PR0402MB2831:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB28313F3E7789B81307AFE51A981C0@VI1PR0402MB2831.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(199004)(189003)(44832011)(71200400001)(478600001)(54906003)(110136005)(86362001)(52536014)(5660300002)(6506007)(53546011)(33656002)(7696005)(9686003)(7416002)(26005)(55016002)(2906002)(186003)(316002)(8676002)(4326008)(66446008)(76116006)(66476007)(91956017)(81156014)(66946007)(64756008)(66556008)(81166006)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2831;H:VI1PR0402MB3485.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5i593SuVIV9VlrFODnta1JRZxl64VhMc52UqyZNe/iHQ3TjHU/NZK6KvXsgBuk1i8M0egru7iTPEX44Sr9M7qhGv5mqGR0qx7J0AqY63U2eRYS1zbh9PeSuTuX0h1dNVaSEA/zaWhdwZt31JcVMxwag3Owsf+DABF1VJnr15OjS7QwxG9sUNwmVG+TLolAg+oFolZTbbDQj2YRmO6tmOhMj5PxvwxuaxH8vbyBMwluDsyk1EANm20UHPVhq0PvCA304kHcqJvAYNhw+BWspLo8q6hpq9nf4QeseM2Ar2LWtucXSzq4CK156/h4LtYcXAwVzlsVXQkKcxma7P9awkSwHQA/ILXGw0DGBcq1I7B0L9nEErB2PqCWZ0Ca6DolBsKpeT5u4FOY+PKNjwbUW3cWS6QDT+98cnnhyhaiqQO2Swd3Cy087rsEzr3yc9jDck
x-ms-exchange-antispam-messagedata: Bhp15MSc5oNhXwm9ztodemqNFKrR8LMyHqD0nq9Qe9HfUVi4abqGMgiz82+N9FDrfNeKX9AVklGOBCVvMmSubnGct0j432qeIQBvoyr+jLNDez5oQiAx5ck0q9xdXutmMGgZmKfLKqd1upQrQPJZqQ==
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8580592e-cffa-4e3d-d394-08d7aba52de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 08:10:22.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xb7V0opFCYwMk2eE4+4oWGRLomzYNRU0HQQnyoOW28xmUxdsbRHOSjCbWA2Z3PXxsZ0MDZ40JCigQ3+cVkeoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2831
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/30/2020 10:45 PM, Andr=E9 Draszik wrote:=0A=
> At the moment, enabling this driver without the SNVS RTC driver=0A=
> being active will hang the kernel as soon as the power button=0A=
> is pressed.=0A=
> =0A=
> The reason is that in that case the SNVS isn't enabled, and=0A=
> any attempt to read the SNVS registers will simply hang forever.=0A=
> =0A=
> Ensure the clock is enabled (during the interrupt handler) to=0A=
> make this driver work.=0A=
> =0A=
> Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")=
=0A=
> and commit edb190cb1734=0A=
> ("rtc: snvs: make sure clock is enabled for interrupt handle")=0A=
> for similar updates to the snvs rtc driver.=0A=
> =0A=
> Signed-off-by: Andr=E9 Draszik <git@andred.net>=0A=
> Cc: Anson Huang <Anson.Huang@nxp.com>=0A=
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0A=
> Cc: "Horia Geant=E3" <horia.geanta@nxp.com>=0A=
> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>=0A=
> Cc: Herbert Xu <herbert@gondor.apana.org.au>=0A=
> Cc: "David S. Miller" <davem@davemloft.net>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> Cc: Mark Rutland <mark.rutland@arm.com>=0A=
> Cc: linux-crypto@vger.kernel.org=0A=
> Cc: devicetree@vger.kernel.org=0A=
> Cc: linux-input@vger.kernel.org=0A=
> ---=0A=
>  drivers/input/keyboard/snvs_pwrkey.c | 27 +++++++++++++++++++++++++++=0A=
>  1 file changed, 27 insertions(+)=0A=
> =0A=
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboar=
d/snvs_pwrkey.c=0A=
> index 2f5e3ab5ed63..c29711d8735c 100644=0A=
> --- a/drivers/input/keyboard/snvs_pwrkey.c=0A=
> +++ b/drivers/input/keyboard/snvs_pwrkey.c=0A=
> @@ -16,6 +16,7 @@=0A=
>  #include <linux/of_address.h>=0A=
>  #include <linux/platform_device.h>=0A=
>  #include <linux/pm_wakeirq.h>=0A=
> +#include <linux/clk.h>=0A=
>  #include <linux/mfd/syscon.h>=0A=
>  #include <linux/regmap.h>=0A=
>  =0A=
> @@ -38,6 +39,7 @@ struct pwrkey_drv_data {=0A=
>  	int wakeup;=0A=
>  	struct timer_list check_timer;=0A=
>  	struct input_dev *input;=0A=
> +	struct clk *clk;=0A=
>  	u8 minor_rev;=0A=
>  };=0A=
>  =0A=
> @@ -72,6 +74,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, v=
oid *dev_id)=0A=
>  	struct input_dev *input =3D pdata->input;=0A=
>  	u32 lp_status;=0A=
>  =0A=
> +	if (pdata->clk)=0A=
> +		clk_enable(pdata->clk);=0A=
> +=0A=
clk framework handles NULL pointers internally, the check is redundant.=0A=
=0A=
>  	pm_wakeup_event(input->dev.parent, 0);=0A=
>  =0A=
>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);=0A=
> @@ -96,6 +101,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, =
void *dev_id)=0A=
>  	/* clear SPO status */=0A=
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);=0A=
>  =0A=
> +	if (pdata->clk)=0A=
> +		clk_disable(pdata->clk);=0A=
> +=0A=
>  	return IRQ_HANDLED;=0A=
>  }=0A=
>  =0A=
> @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct platform_dev=
ice *pdev)=0A=
>  	if (pdata->irq < 0)=0A=
>  		return -EINVAL;=0A=
>  =0A=
> +	pdata->clk =3D devm_clk_get(&pdev->dev, "snvs-pwrkey");=0A=
> +	if (IS_ERR(pdata->clk)) {=0A=
> +		pdata->clk =3D NULL;=0A=
Using devm_clk_get_optional() would simplify error handling.=0A=
=0A=
> +	} else {=0A=
> +		error =3D clk_prepare_enable(pdata->clk);=0A=
> +		if (error) {=0A=
> +			dev_err(&pdev->dev,=0A=
> +				"Could not prepare or enable the snvs clock\n");=0A=
> +			return error;=0A=
> +		}=0A=
> +		error =3D devm_add_action_or_reset(&pdev->dev,=0A=
> +				(void(*)(void *))clk_disable_unprepare,=0A=
> +				pdata->clk);=0A=
> +		if (error) {=0A=
> +			dev_err(&pdev->dev, "failed to add reset action on 'snvs-pwrkey'");=
=0A=
> +			return error;=0A=
> +		}=0A=
> +	}=0A=
> +=0A=
>  	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);=0A=
>  	pdata->minor_rev =3D vid & 0xff;=0A=
>  =0A=
> =0A=
