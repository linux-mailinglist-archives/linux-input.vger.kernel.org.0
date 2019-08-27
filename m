Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 614EC9DD82
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfH0GSh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:18:37 -0400
Received: from mail-eopbgr20062.outbound.protection.outlook.com ([40.107.2.62]:18780
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725811AbfH0GSh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:18:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajehQUUlW/5Goap9q643tNGjL1BbLSIJUDFKEjpnvF27tK8rXBKfZlqEsq25o3Jh4LElF8HmbW7ecZ+8ceb4WJ19FdHQGfvrkkACkcMfD0Rvj1P1XFpBU9CkGu45b/wrLi6cR//IjJxUpCHoMAiVIO3xlEUuQk1C5X4J2qN2s4hLY7TB2L+FMU8ZeHDAsB2K8porABklJHXVBcopqVW0ydOiLEfB0nxwJHL05dlEaBCAbqqXrFzsxIxSE9DaO9al2jDZxjt8kvXBMriQQz+xsKJhejpJR1ac7596R5m+ty3CFlg/3m5AgcCH3mT9YJE77Fq72ml1WNZXOT684Q3xlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh8Y7POGQExJuCAZLqVXeYBNrtw6e7YdTml3Dludo+w=;
 b=TKYn3mcbBV+dNw3zA30WLDIxYMiKnH6SDXo4DY2861+zFeEGX0r1IefO4KWUmFFd/NOv0XF1Jqtzttj47UfTmFRx9nQXOIlSXhOQnVVhXD8lCH3Uwq4SYxWTQRF8vKQQhnPZDBPhAGRyaBCFLUi6fE/4/sXMiwT4rhXF2y5y8O5rg2BkXtSoXsyt/ou3mkGj9uqyISp+nLb3rthoBujrwhOQQg/5rIHXIWtYhlm5ri1BEkAElFlYe9xyVLenC7f+AadgWVGnqOIRze+3YYvm0OiFCGRjQxlafYiZQYRA5pl/UYjKVIQYf3v42S5Y/3SPSrrVigMljwuT7jWZyguyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh8Y7POGQExJuCAZLqVXeYBNrtw6e7YdTml3Dludo+w=;
 b=BFY/tA9shlLD/v5c2JzBHg+fPvS2fe53eHlrlj6nq+OonodofGFhkmUYhgfc5l19K0oO233bhPqKT81natxRT+37caGUylKY/pwA3QS+rKlg91ybYGuQQt4o7WsxIROHgnQOsN1xJRsHAuBH93H83sytRpXiD/XNpDpa3j2WHGE=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 06:17:53 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::8f2:412c:88c6:a365]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::8f2:412c:88c6:a365%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 06:17:53 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Robin van der Gracht <robin@protonic.nl>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>
Subject: RE: [PATCH] input: keyboard: snvs_pwrkey: Send press and release
 event for i.MX6 S,DL and Q
Thread-Topic: [PATCH] input: keyboard: snvs_pwrkey: Send press and release
 event for i.MX6 S,DL and Q
Thread-Index: AQHVWa5ZFk23j3f7OEWRDzQvDh9iTqcOfq3w
Date:   Tue, 27 Aug 2019 06:17:52 +0000
Message-ID: <VE1PR04MB6638754916357F551502102589A00@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190823123002.10448-1-robin@protonic.nl>
In-Reply-To: <20190823123002.10448-1-robin@protonic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f6b6e0a-19a3-4317-a10d-08d72ab64b40
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6638;
x-ms-traffictypediagnostic: VE1PR04MB6638:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB66387E91505A7CBB3D122D1C89A00@VE1PR04MB6638.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(6506007)(446003)(7416002)(102836004)(6116002)(6436002)(11346002)(3846002)(26005)(186003)(486006)(66066001)(99286004)(86362001)(2906002)(229853002)(76116006)(33656002)(478600001)(256004)(14444005)(66476007)(66946007)(54906003)(476003)(8676002)(53936002)(81166006)(81156014)(55016002)(8936002)(4326008)(6916009)(305945005)(7736002)(9686003)(74316002)(71190400001)(71200400001)(76176011)(316002)(66556008)(64756008)(7696005)(66446008)(6246003)(14454004)(52536014)(5660300002)(25786009)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6638;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oa92eBpqcOwClrchIzJ8XsWmQRh/4avcISNwo8v3EFZWqAtJT/kpB3BlyzWSPzFSxwbY83SblKR2v27Ah6VUqdlpqLXoCpd8mgCMDo8fxu4nOYrSYEGRzhubR/MbZDv/ful2hVSNxmwncQG4Is5wuo2ygGYv0o7bZG6Tg31lF10yYOpOgAIdq0iL7x1Prw8F8A4l1Sw/F6KXhAqjAPT0md9QdPkwVxL8TMgI8j2eJNVaBYK82EpXlAMUE1nnqQY1kLLC5emXECodOk2BkDNtKaEvw264YJ+E+6yuoWWuyXwcbSMB0H2r02YpMMawHaET4GZU3m0d6/4CA+PxuVodnKq0ihGbSZPbzls0egcRvoCcHTF21oEaiVB/QU0uASDrlkF0P3TyQnRFquS9MyuzJQZmeofAS9v7+VVTXSpnA1I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b6e0a-19a3-4317-a10d-08d72ab64b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 06:17:52.9726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/XtjRz0VVFRYrVLkWVXbf5U9772++bqT/D0GKEaAlazE1VzXnmPk4R0u7FwMP2PYVVctoPw1adsF/GeShXuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6638
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 23, 2019 at 02:30:02PM +0200, Robin van der Gracht wrote:>=20
> The older generation i.MX6 processors send a powerdown request interrupt
> if the powerkey is released before a hard shutdown (5 second press). This
> should allow software to bring down the SoC safely.
>=20
> For this driver to work as a regular powerkey with the older SoCs, we nee=
d to
> send a keypress AND release when we get the powerdown request interrupt.
Please clarify here more clearly that because there is NO press interrupt t=
riggered
but only release interrupt on elder i.mx6 processors and that HW issue fixe=
d from
i.mx6sx.
>=20
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi       |  2 +-
>  arch/arm/boot/dts/imx6sll.dtsi       |  2 +-
>  arch/arm/boot/dts/imx6sx.dtsi        |  2 +-
>  arch/arm/boot/dts/imx6ul.dtsi        |  2 +-
>  arch/arm/boot/dts/imx7s.dtsi         |  2 +-
As Shawn talked, please keep the original "fsl,sec-v4.0-pwrkey", just add
'imx6qdl-snvs-pwrkey' for elder i.mx6 processor i.mx6q/dl/sl, thus no need
to touch other newer processor's dts.

>=20
>  static void imx_imx_snvs_check_for_events(struct timer_list *t) @@ -67,1=
3
> +85,23 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void
> *dev_id)  {
>  	struct platform_device *pdev =3D dev_id;
>  	struct pwrkey_drv_data *pdata =3D platform_get_drvdata(pdev);
> +	struct input_dev *input =3D pdata->input;
>  	u32 lp_status;
>=20
> -	pm_wakeup_event(pdata->input->dev.parent, 0);
> +	pm_wakeup_event(input->dev.parent, 0);
>=20
>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> -	if (lp_status & SNVS_LPSR_SPO)
> -		mod_timer(&pdata->check_timer, jiffies +
> msecs_to_jiffies(DEBOUNCE_TIME));
> +	if (lp_status & SNVS_LPSR_SPO) {
> +		if (pdata->hwtype =3D=3D IMX6QDL_SNVS) {
> +			input_report_key(input, pdata->keycode, 1);
> +			input_report_key(input, pdata->keycode, 0);
> +			input_sync(input);
> +			pm_relax(input->dev.parent);
Could you move the above input event report steps into imx_imx_snvs_check_f=
or_events()
as before? That make code better to understand and less operation in ISR.
> +		} else {
> +			mod_timer(&pdata->check_timer,
> +				jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> +		}
> +	}
>=20
>  	/* clear SPO status */
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO); @@
> -88,11 +116,24 @@ static void imx_snvs_pwrkey_act(void *pdata)
>  	del_timer_sync(&pd->check_timer);
>  }
>=20
> +static const struct of_device_id imx_snvs_pwrkey_ids[] =3D {
> +	{
> +		.compatible =3D "fsl,imx6sx-sec-v4.0-pwrkey",
> +		.data =3D &imx_snvs_devtype[IMX6SX_SNVS],
> +	}, {
> +		.compatible =3D "fsl,imx6qdl-sec-v4.0-pwrkey",
> +		.data =3D &imx_snvs_devtype[IMX6QDL_SNVS],
No ' IMX6QDL_SNVS ' defined in your patch or am I missing?
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
> --
> 2.20.1

