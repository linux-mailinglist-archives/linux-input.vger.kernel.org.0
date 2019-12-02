Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6B510E9E4
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 13:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfLBMBg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 07:01:36 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.4]:52110 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbfLBMBg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Dec 2019 07:01:36 -0500
Received: from [85.158.142.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 99/8B-19913-B1DF4ED5; Mon, 02 Dec 2019 12:01:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxTVxjGe+5HeyW9ei0lPRYLsTMmc7S2YuJ
  1CcGZfTA3JtFlLkvcdgtXWtZesB8RNNsckzElzRRkzioWEZyrMSk4p0XabdAZYBE3dJkKHcwW
  mLIugAwltLBeLrrtv9/7PM95zvvHS6CyTrGSYEvtrJVjzGpxEmZcg2dqlPHIDt1wh452B3twu
  qPhD0B7an0YfXtiCqfHWn9B6Qp/ULJRnONzhSQ5LZ4D4pzP4rqcBy1pedhbuIkzFJe+ixtHvj
  yLlMTTS7tPRLF9YE55ECQRgGpCYaXbJxaGqxj8qyOKC8MFAGec0/MORnWi8Od+H+AHGVWLwHD
  ookQYBgG8eW4o8WYRIaZoWNM5OP9ETp1F4LX9xxB+QKnzALrmelA+lUy9Br3NIcCznMqD1TXT
  iMBrYf+f32M8Y9RK+PeV+kQTQZAUAz3eF3lZRnHwk8kbYp4XUVnw29Ox+RpAqeDkR+fm61FKA
  e9E3POVkKJgY9t1VOAUeC88iwt5FnaV3wKCngGv/RpZYDU8WRdcYBXsdVctcC4cmfkU5dfh8x
  2fFwkyDRurKjBBXgln28sEuQRO+w9KBF4F26aCC5Hl0DedKchhHFaOrD0E1rj+s7PAGbD+yoR
  Y4GfgmVOjKM8ktRR2HYtg9QDzANpgNRUa7RbGZNbodTqNXp+p0WlonZbZo2G0rEOTz3J2K5Mw
  tcxum9ZWZsk3F2g51t4CEkdVsEuUdxk8HI9q28EyAlGnkPEHkR2yxYbigjIjYzO+Y3WYWVs7W
  E4QakhOPUp4S61sIVu602ROnOZjGxJStZxMjyVs0lbCWGymQsHqBhri0L26BlSGccUcq1SQl/
  kQxYeMDu5JxeMD7wUqZTIJRCKRTFrCWi0m+//9+0BBAHUyaeBbpCbO/uSn+4klkMQS6/ff5Ze
  wM/9ayn2IK/Jc7fU3fsRjx+fey05LvSGVyDL7BjZWo84fUraTL0kq4geaBrBdIU980vvs3SOv
  +49cXBFvOB9rfaWx7vfDSZsvhVybpKkbnI8ykPHZ3jRPLHDVWDnR746OvuCsyhoaOrxuS+rWb
  xY/NZbfUD6ybvjk26nh77oU1mDzbW/T3r4NwVDy8+WIKmXr6AcfM+OOpwNVw93avfol0ZnmL/
  welep4gAqfenWPud2CZ9/JzVUMipqQS87aM5auyKpeEpv5+mg91SPfUlMt5XY2OgaWZXtvYn1
  F6K3ZTe//9PKYIYv8avzh0bbw9gvyQPqHJ1Yv2bzit8qibW+2Fu9u8dPrA1hcjdmMjH41arUx
  /wAzHyUDWwQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-10.tower-229.messagelabs.com!1575288090!901066!1
X-Originating-IP: [104.47.5.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26262 invoked from network); 2 Dec 2019 12:01:30 -0000
Received: from mail-he1eur02lp2051.outbound.protection.outlook.com (HELO EUR02-HE1-obe.outbound.protection.outlook.com) (104.47.5.51)
  by server-10.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 12:01:30 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asmYlyKAJCQDpHf+cVwmGaNd/sUrXCIxXN2kqEr6l1o4V+dIIxDIl39Mk6ZbY/JozECYGjtrZUkIRci2xTRHB7RqEmUQUI6Hr30HJV11J1Ul8W/IqScCniIBPeUFMl3i/C+MjVxGG3Mcc2WMVhWEJvmBh+sP3MtXqjwckfem4oe8eTZdlxH1rAPgUpJNaAQDQ9/1yvV/RrGNeV7o2ZOVNnaNOr6N1RcJ+uj+PSmHU+h4NMu+jHN68zjbnVJd7o5wJeWZXmivb88mStSlBQO9E2if5uVYfqDxf3OSmT/30dFiPeudCuLO3AxReVxz2qVDs1x/hEeXb6MYTHXpHzSQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4QHMsi/j0i4QdGMHexJgNj78A/u2VswKKdm11730Lg=;
 b=aLnAf78bWlDu7VWa8zfI2X016TC6lCTDT3LkMNykyuFa8a9ilatAcAt6G4sHfU/xIXtOMThBrYj/8YduIEsLVTUsD0E9m10PeAEiiHCMgqx433as/wDL4o54+nJjcKRz1WYPk9J7iYJittzb4SN7tSNguJVvhHxvGsWrU/yVey+wl+C5EPtmoSfz9W4IJbRR7qlB6V/pvBPC1qZeTLKGW2Kv1O/zjKdBeFrLWC6l2Oj5iC23jktViTCHDvkykcKPPPQwE1abnYi2SR4pGDKjIOw78vblNHlUZGKS6ZBDZuuGyWRbWgv5UFDTY1HDXzm0yXVweMf3nm0FH/a5i3oyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4QHMsi/j0i4QdGMHexJgNj78A/u2VswKKdm11730Lg=;
 b=D8at6Fv/nDFMlh05mCpUEwwCZGy2l1YViLCKzOxz8hXMVzwXVKl/ww3SqmrUTMA1qrxBoZA07Elm/Wryu5YCMhANG/wbjhwfoBYn3I8UdcL5VJ7eFWDQGe43k2MKMl/37wGhtB6ckuss/kniQSBZhTx0jAVcpO0jJjQs71AnOZA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1012.EURPRD10.PROD.OUTLOOK.COM (10.169.154.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 12:01:16 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 12:01:16 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] input: misc: da9063_onkey: add mode change support
Thread-Topic: [PATCH v2 2/3] input: misc: da9063_onkey: add mode change
 support
Thread-Index: AQHVpSXSkcjeADvIkEKgFVB1nojTlaemucfg
Date:   Mon, 2 Dec 2019 12:01:16 +0000
Message-ID: <AM5PR1001MB09940B9ABB7B1A0DD41B15B680430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-3-m.felsch@pengutronix.de>
In-Reply-To: <20191127132304.22924-3-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91d85c5e-e7f3-4009-b534-08d7771f5604
x-ms-traffictypediagnostic: AM5PR1001MB1012:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1012592CD1AAF04C16FE1E9FA7430@AM5PR1001MB1012.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39850400004)(189003)(199004)(186003)(71190400001)(71200400001)(33656002)(52536014)(478600001)(14454004)(4326008)(7696005)(5660300002)(6246003)(229853002)(81166006)(81156014)(76176011)(66556008)(66476007)(9686003)(55016002)(64756008)(66446008)(76116006)(6436002)(3846002)(66946007)(6116002)(25786009)(54906003)(2501003)(8676002)(446003)(11346002)(8936002)(2906002)(256004)(14444005)(6506007)(53546011)(86362001)(7736002)(66066001)(102836004)(110136005)(74316002)(316002)(99286004)(26005)(305945005)(55236004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1012;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1QCmp97BdpqT7usB2ZfzQQdHqq8Y1FQV6bM974ORXXDoqu1JKwdYnqV7yzkimEVJsb0punP5RrchzFPmZUeEjrPb+fFZ2TMeVsLU2QjS+BRsXqNrauVqZ5dkOB0P0SgkUqMBVTK28znVPcN0UO7y80iUquV6R8oISjsiz70AaOJ4130DByAYOfzJ+1A8E6AlG+/x4iMGMJQjQp1eIW3PMQWvkyxTt6yg0wftfe1sfkEcWPvITnv+UzxRLaqzLnNMQs0EpE69mDW+i23URnIS7SkKN8abTjdLuTFhTkqyjj1wIpAXo4OAnQcuBOCVn8uIVsOG8Mf6JiVW/nXOaogD+OGJhRdwKzWxWQnSny/WjQ6e+Fcr9YjXw9yGzAN2+ESDT1lG3faMc54feApp8eTZ9MBrxQulc6+zfLKfnRl2scSeZ01J2w4F8k5qiCZmYTTB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d85c5e-e7f3-4009-b534-08d7771f5604
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 12:01:16.6625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zL3Q3LtO/nk9SSdsGiDPE6NgIfjWUZrFVGBYMQdNEj/GQpd2hu2r3XucWGIZv37RwNIs9PTEl26yiwsBnFvyRapAkPpIb/PpLTk+BzN1EeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1012
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27 November 2019 13:23, Marco Felsch wrote:

> The pmic state machine behaviour upon a 'onkey press' event can be
> configured using the ONKEY_PIN bit field. Most the time this is
> configured correct by the OTP but sometimes we need to adjust the
> behaviour so we need to add the support here.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> v2:
> - make use of da906x_chip_config
> - rm unnecessary key_opmode
>=20
>  drivers/input/misc/da9063_onkey.c | 16 ++++++++++++++++
>  drivers/mfd/da9062-core.c         |  1 +
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/drivers/input/misc/da9063_onkey.c
> b/drivers/input/misc/da9063_onkey.c
> index 79851923ee57..3a3f06a33eda 100644
> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -19,6 +19,7 @@
>=20
>  struct da906x_chip_config {
>  	/* REGS */
> +	int onkey_config;
>  	int onkey_status;
>  	int onkey_pwr_signalling;
>  	int onkey_fault_log;
> @@ -26,6 +27,7 @@ struct da906x_chip_config {
>  	/* MASKS */
>  	int onkey_nonkey_mask;
>  	int onkey_nonkey_lock_mask;
> +	int onkey_nonkey_pin_mask;
>  	int onkey_key_reset_mask;
>  	int onkey_shutdown_mask;
>  	/* NAMES */
> @@ -44,6 +46,7 @@ struct da9063_onkey {
>=20
>  static const struct da906x_chip_config da9063_regs =3D {
>  	/* REGS */
> +	.onkey_config =3D DA9063_REG_CONFIG_I,
>  	.onkey_status =3D DA9063_REG_STATUS_A,
>  	.onkey_pwr_signalling =3D DA9063_REG_CONTROL_B,
>  	.onkey_fault_log =3D DA9063_REG_FAULT_LOG,
> @@ -51,6 +54,7 @@ static const struct da906x_chip_config da9063_regs =3D =
{
>  	/* MASKS */
>  	.onkey_nonkey_mask =3D DA9063_NONKEY,
>  	.onkey_nonkey_lock_mask =3D DA9063_NONKEY_LOCK,
> +	.onkey_nonkey_pin_mask =3D DA9063_NONKEY_PIN_MASK,
>  	.onkey_key_reset_mask =3D DA9063_KEY_RESET,
>  	.onkey_shutdown_mask =3D DA9063_SHUTDOWN,
>  	/* NAMES */
> @@ -59,6 +63,7 @@ static const struct da906x_chip_config da9063_regs =3D =
{
>=20
>  static const struct da906x_chip_config da9062_regs =3D {
>  	/* REGS */
> +	.onkey_config =3D DA9062AA_CONFIG_I,
>  	.onkey_status =3D DA9062AA_STATUS_A,
>  	.onkey_pwr_signalling =3D DA9062AA_CONTROL_B,
>  	.onkey_fault_log =3D DA9062AA_FAULT_LOG,
> @@ -66,6 +71,7 @@ static const struct da906x_chip_config da9062_regs =3D =
{
>  	/* MASKS */
>  	.onkey_nonkey_mask =3D DA9062AA_NONKEY_MASK,
>  	.onkey_nonkey_lock_mask =3D DA9062AA_NONKEY_LOCK_MASK,
> +	.onkey_nonkey_pin_mask =3D DA9062AA_NONKEY_PIN_MASK,
>  	.onkey_key_reset_mask =3D DA9062AA_KEY_RESET_MASK,
>  	.onkey_shutdown_mask =3D DA9062AA_SHUTDOWN_MASK,
>  	/* NAMES */
> @@ -193,6 +199,7 @@ static int da9063_onkey_probe(struct platform_device
> *pdev)
>  {
>  	struct da9063_onkey *onkey;
>  	const struct of_device_id *match;
> +	unsigned int val;
>  	int irq;
>  	int error;
>=20
> @@ -220,6 +227,15 @@ static int da9063_onkey_probe(struct platform_device
> *pdev)
>  	onkey->key_power =3D !of_property_read_bool(pdev->dev.of_node,
>  						  "dlg,disable-key-power");
>=20
> +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> &val)) {
> +		error =3D regmap_update_bits(onkey->regmap,
> +					   onkey->config->onkey_config,
> +					   onkey->config-
> >onkey_nonkey_pin_mask,
> +					   val);
> +		if (error)
> +			return error;
> +	}
> +
>  	onkey->input =3D devm_input_allocate_device(&pdev->dev);
>  	if (!onkey->input) {
>  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index e69626867c26..aaa1f1841bc3 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -510,6 +510,7 @@ static const struct regmap_range
> da9062_aa_writeable_ranges[] =3D {
>  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
>  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
>  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
>  };
>=20
>  static const struct regmap_range da9062_aa_volatile_ranges[] =3D {
> --
> 2.20.1

