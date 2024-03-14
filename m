Return-Path: <linux-input+bounces-2381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3287C491
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 22:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC4D1C2162C
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 21:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86057640E;
	Thu, 14 Mar 2024 21:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="be9c6oeC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V62EpOln"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02205C61C;
	Thu, 14 Mar 2024 21:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710450206; cv=fail; b=sAyhYEuQ4iV3K5vQaOEPa5L6uSVnGJxsJ5qrKxTTpMrmCHkMAbEm4y2vSA1KiExFD/jr6tWtwqJ2/TG9cfpi69Ys6AkpKR7nz4EIUmInU5VKaRwHHGIuv0TfjTS9lat0Q5cQT+2uscSmmeyB9PpNqhnv2FjcNYqYi70melm59WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710450206; c=relaxed/simple;
	bh=ShUhdESNjrH/YzdqzNE5inaqj7TcrCKeb3JavQkRpJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LEUfzJaW0g1YFQdOspClb/MDl1NHvEu2GEzq+j6nBptA4JFCzWgqWlULTtslbY8Jrg/uAPr5GFfKTWzn2KAVCvX7D+8oy4hFQVqBc+IM9n6xNHA0XRyq03eMenR9ZNwn81NrfYheesYNpFgB07Ccp479TLt8E5K6KOlkuSbBFhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=be9c6oeC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V62EpOln; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E7cNZ0023193;
	Thu, 14 Mar 2024 16:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=ShUhdESNjrH/YzdqzNE5inaqj7TcrCKeb3JavQkRp
	JI=; b=be9c6oeCxiMA77ssCQATJglm509cEYmp4vTcm9CUAKZ4pe1GdAZagWd2s
	2ZvCrFiKwIRie7iZOMMmaaLc28GUy3Y4iydrl6mTE1QF183J1cGguwoRBQz+1UEs
	k6Bi6O+CKPZCt/X5XLqNa56xWD+WBE0bno7UspiIgk/OfqrBCeNYVAe+o+fM467r
	h0dv6S2gowm092FlHf9ogtBJMT9K9m6QzsT0mtmQfYr4jfuE8PGOSJ6rjtuGPENA
	9P4oI/yfG+6BF3IdLOeLbxfkrzg5jcGvBoXDUDKSX2feCCG4nDXJNr+Nr9fkGH6q
	iZ1Q14baHcmldpIM2VLtLq7FWVIjA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wuf1f1rv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 16:03:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTlP9+dKFDiXShToZRTvBhZMjkQhjfKy/S2M/384TnAvvybiRuc+WDnoy+eK9QQAThfiSCL9guUPxuJLCsweW04YXAyKm+q5nbQAHoSEJvwRpKuMfi6tGHh8wwM8nx1eGSn8aWzaOZBGnwOItLY/noHhLkk4hXl9qkwzPg/fJpOk40CjeRk992RKzJDBra1fGLhVT3Vyi+nOCraCRvnlYidKbSgnNaTV5zQSbAJeqOSzFBMcSu8wtZbRP2IrGUdtbRjjVgS13Wz6aZFLdEeRS3cRYnS7vyzXIogQSIAR+NU6i2pr9qjVddOuKkf/bokJmbEkoPBfeR1e7SEYTcx5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShUhdESNjrH/YzdqzNE5inaqj7TcrCKeb3JavQkRpJI=;
 b=IGnbxHEdJFVVsOQDqea3ntv5rNkbpR0+y7cKJNLRuweYSucBUqxr8CGdNLgIJOuVTf0MASwnSHrxNP0BBLdeA2qOotpQdsmUmgSoHXQtoGfd89AqOtOzNs2nCbJUg2NMiMNrfm0kMSqOheemlEbWRuigDNxzpq+yg/tFlvHFSWYz+0LPqaU5bTJaeTO4Y3ChTF2H0tBIMg+4VTy3RBgn9cNAoVu76as9pIRBuOiY/EG+mC52p2krplHuZ5/1dJOC3nFdVmNWZx4J7YKnMkfyAtfSgFMJGBSjaUM58qyt0/mzd2cv5PLBPHUVEQEjA3Po3e4LQSnb9wXDol+StGV9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShUhdESNjrH/YzdqzNE5inaqj7TcrCKeb3JavQkRpJI=;
 b=V62EpOlnIUQbJCIjKSPwLv/QMnw5oCAl4K1T9MeMEVwO+ubsMJ7VkVx6ReEMq3Agefhz/0AbuWfUURoYtJdYgw6b4ZTPQeloU+RtPhGYfd5PyjEuqWp38m4Bgf898RMuTBFpvI9IiV/06SOJpdJYLUdY6DBGl2QML0on4Dben18=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 MW4PR19MB7176.namprd19.prod.outlook.com (2603:10b6:303:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Thu, 14 Mar
 2024 21:03:01 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7386.021; Thu, 14 Mar 2024
 21:03:01 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Mark Brown
	<broonie@kernel.org>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Topic: [PATCH v9 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Index: AQHacaduJqGy1qAMm0iUF9x94vi/YLExpT4AgAYdZQA=
Date: Thu, 14 Mar 2024 21:03:01 +0000
Message-ID: <510B2927-5756-4CB1-B34B-E4D8B8681DE2@cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-4-jogletre@opensource.cirrus.com>
 <Ze5E1KxRltUTX4R6@nixie71>
In-Reply-To: <Ze5E1KxRltUTX4R6@nixie71>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|MW4PR19MB7176:EE_
x-ms-office365-filtering-correlation-id: 965f1788-a846-4b52-80a7-08dc446a2280
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rDpPlJZQmht5nIXmu8AxMCusDvP4vDt5MBo2kvdJiMo6OK7bHOrQcNMM4E7AcXaouR8nmTt4+mWW6yEZgjMlvxmVMnbN7oCE62Z2+1wAOFalCprYDhNRPBKvK1SFNt505gdTxqV0J2wustxhVVavnaCkqgmwzxBTVHoMnJOxpAtBz2CbXu2lyLsADM5gmkeK8MNndvJkoGn5EbY4KBtuWXvVsv2stZuX0gVLVsLquV+3RqvQCZ/RwDH7SkvjLNVvlTfzY+j4IeA/jPdUi+oSZGPGgZd3Zb2fjDZQRjic7HYz1rnuWLaVzIlWX7XQyNSNahLvlBLMSzoBq8kvYQLPcwK/SM1wT5gTE5HFJIpLKbAAxk2IQD2XkjIcOfiMoA7duclHVfGgq9MPW2jwC4XBKI1QcgzyWFOMSl4PqQJhFmnBh8+qz2zMGohrm/Y5Gl2ucT3Sbr1hR9sewKIkdVyFKhFunptyzz89GUp+vKsEQoicpOATozn45qnkuu5za9I7MMHbMvF5OiEmfNXSREN0yB3UiXN5yjZOpcHEeOf8tL3a5wig0ZEH7sjkMUNUBPA7s7/+govEijouCUyGnxjKbMbxls6HJX1l+bHhFxCd+2oS+lG9z2ytiw3Y1u9Kf8q4QIjvWaBD3yNagSdzkUwYsFYuLrN/IQajuejvdFzaRW24OMn/gwfMunJVYwPkWT21qTd5v8vBBsahFvYXqcQQIiGJ4W3GPwXrS70L7jXpV70=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Uf/l5wzgMyNOMeEhpcpyp9asCTKQk3cwF0jjKtE7wKpc7sJbGaTUhEKR9FEm?=
 =?us-ascii?Q?mLqQDwYboHshNhDo1qX5BSsh8TZO/YPzxNuSC9roQdpbJeysQsiwPPWhexVh?=
 =?us-ascii?Q?ibJ6iFl15t3m6Z5bT6jm3tcr6Rc6qwl0yOCOAJmtQNE8OeyXX3cvpolXgdVa?=
 =?us-ascii?Q?ZaHg2m+tsq/HzQ02B4SSr5bggArdzitrPOZTIcqCkBJxt8v0dJasXhvZati9?=
 =?us-ascii?Q?OvtPJIlEims2X/bzG2IM5riYgN21uUCsPUxMivMGRG1nd9VFoMJHxUo1Adn5?=
 =?us-ascii?Q?NHNfxXzkzV+FrV7rk6BMv8/y4O81alMLIecKlv4hMfpeYNJhgs/MgRMzpd8u?=
 =?us-ascii?Q?MfJvWDpZaM7YgGvtNe4GF1/rl+gGhTyFoECT+BX5mXszikP7NzTY1k7WBaYZ?=
 =?us-ascii?Q?xttLpjwYSqIe3kDc7AnhEajyyCgpgOE7rKI5+YpzoIE3XhC+GaZPwlUDHOVm?=
 =?us-ascii?Q?WJjkVDpVY8/nG3wFAYWFq0+GmqeQSrqdprdfN8FGQbPBt1bUK3ZASpjn8qfE?=
 =?us-ascii?Q?Ev5Ataa6NzfSdY77dkZb3P2StKbnWlAycbxxZieFJUu7Qhc1+np0bRCm03se?=
 =?us-ascii?Q?cMfAhbtWaM3V9MZuXoxYDifIfJtLK/Qag1g9gkS/JQIyu112zftHXlpni4t4?=
 =?us-ascii?Q?kefMRszQ+hxZo32tqRHWubpzEsK9d5TtIVTRQdnY5voWz0WoZfnQ7R62r+sH?=
 =?us-ascii?Q?Ip6MxH/tIhf6ZNKWq3ycb4BOf9Hykcxea5+NADUW+6kmiN16cr30l0lhJNg7?=
 =?us-ascii?Q?u7Z/GNFgHGDt4cnZJL/vm8NnHzQWlRlsVpKjcSAp5vhwY8XwtTKe6h5/8c81?=
 =?us-ascii?Q?mON/f4T/oF9YlJp5E2yJhP6r63wajVTNRjcjS+V5O9kBU8uF8DY75N5/lMgF?=
 =?us-ascii?Q?4nT/6jzsAbbn1Hxvx65/DWUmraITr6+vwW5dJ+BBstie+b/1/skCmshnCe4J?=
 =?us-ascii?Q?i/HKEIYD+SUknD14XCiBhurOpbi+NSW8PNFS6R1xlIaBM6jQWH12/D0tQsEk?=
 =?us-ascii?Q?PYYLTJivs3yYmyK9vWfv++GI6QVSJb/Y7QDGU4iJw0Zf/RND0INdRPLp2ml3?=
 =?us-ascii?Q?6BzoRs67zWUCjgqZsz2oV/UGeaD5CnYHgg2+7Uom2jF9VF2hza2rmAIOzcYd?=
 =?us-ascii?Q?TMRYxWWxG0DUC5um/zlIfRx17J38+u8/pKx8PhSugoNYF4hbKWgsGl0k8T+s?=
 =?us-ascii?Q?Q69uId/b8lPLdvpJm6tmlX/FhMBeVLNF3xmiP6T6PdvoMtbNRZjLqgsWdY0T?=
 =?us-ascii?Q?rX3A5syiZOtEoIOLb7c0KWF/h+H2T+XOW4lXYVlpgINRyw88rMMsyg3PvWVw?=
 =?us-ascii?Q?lSnNSObDAEYrv41zVR9ilkXtNdoznnwBRO7DXWyOoO0FauH/bz0Xah3WS6aO?=
 =?us-ascii?Q?hNspazTt2W2W09azh8yvVWyF9spj0KHQctw+/HgLlYLgiNXApNR7TaOctQSN?=
 =?us-ascii?Q?g7x+SFLD81mDQRvMIzJLW6JZFxRNX49HIoE53II/aeNZFenrTP5kfypGXTrL?=
 =?us-ascii?Q?hoHTnypMAsYql2phmGuMiTjLFYjNQ7VznlcU1i2bsbMz/vWzGXO3jRQL21eT?=
 =?us-ascii?Q?YRr8EQRJluMttZGt58kB488wp5Svp9a7mGnHStmftLaxOq+Vt1PsX8w0EJdz?=
 =?us-ascii?Q?fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <510C247338C16145A268F1895DAC3EFC@namprd19.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965f1788-a846-4b52-80a7-08dc446a2280
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 21:03:01.5303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eezHtUT/ViXfpoYxfDYUGWkIIe+STniuBTFvmOmZM+NkmkY6UxMG9YESw32rOdz0wLfEe90ACdd/f4dKuxnlmQAzoygD3jZonJEFfrjFiKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7176
X-Proofpoint-ORIG-GUID: CxDNTYAXL8-y0pr5nqthp_9M7BPGQKPI
X-Proofpoint-GUID: CxDNTYAXL8-y0pr5nqthp_9M7BPGQKPI
X-Proofpoint-Spam-Reason: safe

Hi Jeff,

Thank you for the kind remarks and thorough review.

All of your points, here and across the series, you can consider
acknowledged and I will work to adopt them in the next version.

There were a few loose ends and questions throughout the series which I
intend to address over the coming days. The first one is below.

>> +
>> +static const struct reg_sequence cs40l50_irq_mask_override[] =3D {
>> + { CS40L50_IRQ1_MASK_2, CS40L50_IRQ_MASK_2_OVERRIDE },
>> + { CS40L50_IRQ1_MASK_20, CS40L50_IRQ_MASK_20_OVERRIDE },
>> +};
>> +
>> +static int cs40l50_configure_dsp(struct cs_dsp *dsp)
>> +{
>> + struct cs40l50 *cs40l50 =3D container_of(dsp, struct cs40l50, dsp);
>> + u32 nwaves;
>> + int err;
>> +
>> + /* Log number of effects if wavetable was loaded */
>> + if (cs40l50->bin) {
>=20
> Is there any other clue you can use to discern whether a wavetable was
> loaded? The memory at cs40l50->bin is gone now, and although you're not
> dereferencing it anymore, another contributor might be fooled into doing
> so down the road.
>=20
> Maybe a boolean would be more maintainable; I don't feel strongly about
> it though.

I will simply remove the conditional. If no wavetable was loaded, the
register will have a value of 0, which is no less worthwhile to report to t=
he
user.

Best,
James

