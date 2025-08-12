Return-Path: <linux-input+bounces-13947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D9B22955
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7183D1AA0C28
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F291DE3D6;
	Tue, 12 Aug 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wacom.com header.i=@wacom.com header.b="RWAktUhy"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022090.outbound.protection.outlook.com [52.101.66.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1F2857EF
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006188; cv=fail; b=QuzwtCVuwDBf8KG+tiBdtukp0+GnT3J6kdmqPKe3y5hv9tB9YkKYzvxMTZ25D2BINiP2Dy4Bk7EMzB3zKEHwSsS0VbAmyUbl57hiKa3A5fbu49j3ykU5gLicPIphsWVdqxYXL0dorGpYlJB4Fwwrvi3rKzCXlCloDzercnDnxSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006188; c=relaxed/simple;
	bh=VtbYU4vAuTftVCuJcZdh/FaqMi+/Y/8tBNvb97WSowA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dglzBqiqdlJkPPzOI+YubtJZR4LoNsLymnYrIzncF7QJZD5eSoXx4yQ9biIVrQPhh4WIUEfcVdKaIUA10kNK1AFVEWOHhg7OduqYrNASOqg2cWG40v8qWak81f2zXCLYhbqWFiEYV/gwcDRVyAsZlIAOEWj/dY59x+Ra+xvU77U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wacom.com; spf=pass smtp.mailfrom=wacom.com; dkim=pass (1024-bit key) header.d=wacom.com header.i=@wacom.com header.b=RWAktUhy; arc=fail smtp.client-ip=52.101.66.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wacom.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wacom.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chtpqnn6Xc+urB6VS1GEN+3G6eCQZFs891Q2iDZZpw22SrGOxRl4sES31jADCW7fmuy5cvVU6TSwzHmk335zlXFS2iGUqE+iFUlJdSrrW4Oc3NCaWPAXobdGFInZb/AJNGMJeYo/ZwL2ciqWvIYLW2UkT3IXeju5tNHVUKuR8bCcu8QvjTFY7Y8ordDP0ejbZCQPVdez0oZ3uBtKBKT0j4qe6RBjbBr3X3SjbvaOgqHxOceuSshdaDk3QZALKqxTHoXlEKf03EmJFnh0icWdr5DYTZDx9hnWafBPoGyAv4YfZJ9+DGzDmx85OYgfQLw2jFFP3lYWZP7pNhYr+XJvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtbYU4vAuTftVCuJcZdh/FaqMi+/Y/8tBNvb97WSowA=;
 b=tEe0nFlrI6o7kc2B6/5nN0IYj4OE3czV+sLt0wTwN67ex6t8ASd64xbkS8nvBhNqNgoR3XLXiLCfbh4QVZAVDGhUxWNURAB5xhRbyNma3RKNXeqDw9qzM7YsIa+9zoJPRjaQeIYFLkZ7zrcUNGDFITSuEwS1i5aHQnzAODN684rJS3BaPBwn5eeIC8v8cEY1PdGzbuMZ5lYmP4mnVb0VQ9ukjtRaIrlT+BsHraiukZR05NnUSU1Lg7ZJvDccykn9zNsZr4QIqNrM+0v5SDh7MXooSksfVCGS8tcwxVWjKmhf6aObPUC9g57MTP0gs8ixYhN0r8ah+D+sVcjaMEDWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wacom.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtbYU4vAuTftVCuJcZdh/FaqMi+/Y/8tBNvb97WSowA=;
 b=RWAktUhyFvah+nDcxqCskLvATl/7PmX4Ltd1lGFmQ63KGRgXaKlI+uwM6U18UC/e9tVBI1punvNKlqSlLJH8Cng8LLk9LD2UR5DxHDF9LT0pKs/x6u7Dfs2M7QlVfaYTYFna/ws6dZ3tCAb5hZND520V9kQNPZein4VeYrgiAzs=
Received: from GV2PR07MB9153.eurprd07.prod.outlook.com (2603:10a6:150:b5::8)
 by PA4PR07MB7168.eurprd07.prod.outlook.com (2603:10a6:102:d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 13:43:03 +0000
Received: from GV2PR07MB9153.eurprd07.prod.outlook.com
 ([fe80::933:9065:1ba5:62dd]) by GV2PR07MB9153.eurprd07.prod.outlook.com
 ([fe80::933:9065:1ba5:62dd%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 13:43:02 +0000
From: "Cheng, Ping" <Ping.Cheng@wacom.com>
To: Jiri Kosina <jikos@kernel.org>, Ping Cheng <pinglinux@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "Dmitry.Torokhov@gmail.com"
	<Dmitry.Torokhov@gmail.com>, "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
Thread-Topic: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
Thread-Index: AQHcC4WateG0eC0p90usNU4bToW5vLRfA6WL
Date: Tue, 12 Aug 2025 13:43:02 +0000
Message-ID:
 <GV2PR07MB9153ED83B6705961417EA1969B2BA@GV2PR07MB9153.eurprd07.prod.outlook.com>
References: <20250710212859.7892-1-ping.cheng@wacom.com>
 <29911p88-1n01-s610-9opn-98n874r84srr@xreary.bet>
In-Reply-To: <29911p88-1n01-s610-9opn-98n874r84srr@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Enabled=True;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SiteId=9655a91b-107e-4537-834e-d15e84872626;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SetDate=2025-08-12T13:43:02.101Z;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Name=All
 Employees
 (unrestricted);MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_ContentBits=1;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB9153:EE_|PA4PR07MB7168:EE_
x-ms-office365-filtering-correlation-id: b68a08ab-e7f1-4960-ecfd-08ddd9a628a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dHqlrpwGIdjhGQrVD2wR+SMuHm5MQcBxNNmUXqjVmIUI33nJwHcXSFAfrL?=
 =?iso-8859-1?Q?bxUSiLHVsmVt1tv+2CVcWLj0JNY9g1BCvPXoF+Mdzz0+myFj96GcTa0wRY?=
 =?iso-8859-1?Q?BefaLD9/cvV4BqIcckfnTujh9aMS4cAbdv8OumKeSFy1IUiIn2dquOYbox?=
 =?iso-8859-1?Q?mXRwnYWCfeETcMhUhHOa6cRarB3CYmHSUc1pVk7oGlV+LdRrqlxddHb09Q?=
 =?iso-8859-1?Q?zx6hQF2UEt16gYamEt2tvnpObLdtRABy15JZoblTFGGHMhWQr/aLYBu14u?=
 =?iso-8859-1?Q?x7CTpojvQCGPE+NBluATI+URnoP8NzAz62RbntBtjDkbJ8vokYddfqHz1S?=
 =?iso-8859-1?Q?y8EUX324AotWPeX5EPG5v4mp7lQ14eu/agJ/7++I3WkPFre/xetB+KyGHP?=
 =?iso-8859-1?Q?kz0fyYe6FXb6c3VeDOvVnEST1DIqUmEPaBGmtl+cEvaTcl+1boEhdupZww?=
 =?iso-8859-1?Q?Bml+5ZdRS8UVagtAR+nPzMQIppL1elBi4k3kSx5cmFpJjUfZf0m0SVBJPY?=
 =?iso-8859-1?Q?zuNjOmI5bYR/k1yHlrhYAAqgZIto1+wM74XPzDUBnwF/BXiM6nM/qzw2Pc?=
 =?iso-8859-1?Q?1efhFuKPL0d1SzYLLoVM+XeXevaAZz5IrO6dAv94at3jVXDjot4OagReuW?=
 =?iso-8859-1?Q?dxf1rSxU/HquApbXgTPxtwAvauUkVgmaltT5qrbSyaxOMf1vbP1sHN1rZg?=
 =?iso-8859-1?Q?ppKm6SVN+MXdUUKM7sWLvb9zd++zhuAbSAwDQWF1zABG2X4h8llQKVX2TQ?=
 =?iso-8859-1?Q?heo1D+yYfZHmZfNJpt6SL7zcyx0gLLb/iJUJan6l61OXrcubI06SxnycDf?=
 =?iso-8859-1?Q?YBQH8tjtEkE/zjNXa1/bj0Z7ngc0CqtCuajMegLpTXuICBp1Luq87v9qew?=
 =?iso-8859-1?Q?aHaqfb55OYk1II5K2/FQxUdtXeO3JzOA6W/Ydj7GL/aqf5pjwCkRoGA8DG?=
 =?iso-8859-1?Q?/9mrT6mkSYrz4CLGzQ9CCHxaueP9Tg/F1aajc/VYD+UuyHZD8L4MDMgUNA?=
 =?iso-8859-1?Q?oS5YpAaW7utuT1Q1zhrf6NTOwBcrl43gl9C8Q/T2Fx5epnMVY+T3W8lixo?=
 =?iso-8859-1?Q?m6QHl0KKT6Rh9WVaUI+8yfkgI6Y4IL815skqMU2mqBwDIf6VzZo4dh+pDT?=
 =?iso-8859-1?Q?hfUu4IujvWOz0KwWjCOxIk8aMNQADGqgUDL40F08HA0njXiCjdwdJBJZb5?=
 =?iso-8859-1?Q?oSLWRQuz3NeEX+wk1kYx0C+KvZ2FZZNpPwsVc6wi6jU5Z3pL8oC6bYZFPS?=
 =?iso-8859-1?Q?4KTAYEwD4dxbcRxI6IFN4frFcfWZNZmmsVMD4RxkSHzuPNz28i7dCDI85o?=
 =?iso-8859-1?Q?Lwjdq4Nkul7pn/ACqq4QJV8kNyFrKb6+sZJRkHwurVft9rz65mEWA7tvhn?=
 =?iso-8859-1?Q?DymPCDL3Y0pY0V09+wox65Gswk4XIfpKFEjLd+NHphi8T+MhgYGNaAn90a?=
 =?iso-8859-1?Q?CqXoxx2eJGyrwuIKzo6s2F0EnSAih/B6L+zO6NOD5lHwx/F8p8qGzSIY7r?=
 =?iso-8859-1?Q?YLD/WXg3/DFqDh9KTAuv92d8G2aNUbHOwzAMEI8pmRng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB9153.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5TCpD58dEIYFzS+nm8eLLrC/BTXj/gxpfMQ4hjrczHniO90jnT1WDYXAbU?=
 =?iso-8859-1?Q?EoAgmT2t/X5otmaKks7FTr/kjaFlCYTvp62az6sga59HF5z9gc3rg4caT5?=
 =?iso-8859-1?Q?CJN6CJzoAXo8DDL6nJwyzXp+ylOtRZ7MGWEqvjYpb7W2uB4SJ6IKlVyk6+?=
 =?iso-8859-1?Q?CQR75rmAwGn0NJv3GmYbHpn1C19pgX9IyjoiBTtBjsdhA1fFHEpDvmXzB6?=
 =?iso-8859-1?Q?Fa4Ife7Zbfv9zYMp0DF0q20/BD9GUDtAxkQTiGVQtnbL4I0f/y0wi8y7AZ?=
 =?iso-8859-1?Q?TaHpTxH8CPWVGaC+NqECShuNaIBi0Ex3kCGqOFaGFvqJeWyb4m1yaaaWkT?=
 =?iso-8859-1?Q?7RiBoMl5YrkJ9bPyUeGqRu6Iwf2Sf5PuEItxcn5JdLWm86Zs6U2xcu6OVn?=
 =?iso-8859-1?Q?TTRWiFoRQ34E8sgroabLFRcXBeNs12YlIPwX2Qyh+CRj9+piWuUy9NR3mL?=
 =?iso-8859-1?Q?+mIo4N2IEK+BZtrxiabTO3d0BAakO2zRC33QGABUJTX9qRvBpUNbWsWYeb?=
 =?iso-8859-1?Q?IPzqewyXeaHrwC2oClbhGHVOumE4qrkC4Cjz+LXdOF4FzSfuJ8grO755Lq?=
 =?iso-8859-1?Q?baOW05kF6y9Htu0rSRIzryuWwacfOiavnS3lchVD2zP/ntCoJrIoXNyjVN?=
 =?iso-8859-1?Q?EltxxVUNG+kqY14w5JhUSPe1L6DRbIZ1PxMkR3JeRwOEdabsrTCUrdhy5o?=
 =?iso-8859-1?Q?60enSki8ZSzbC0u5ax5etTmOL13eMqCSA5byVySkDZ7Q1H5aox1HY0G7pL?=
 =?iso-8859-1?Q?Wwx8Cl4t/xnvAsSIade855HJvNFj2SH7gO6Fujz7lInQdgPYirld360PX4?=
 =?iso-8859-1?Q?tydwPsDOTiuIp9h7wH2T0iPxn8su447vjlk04GkOwtnmMfphYh37Xq7YM+?=
 =?iso-8859-1?Q?YXWxgxjyQyJegBo1bfV54AIYo4UotgWI3pog80LhcXTUYHZ+lHnjNGIOQm?=
 =?iso-8859-1?Q?ktrynFvpWQLHMX/U9Ams6/trHj39llUzzls/qOHYgWoVYD3VA5kYzv3tLl?=
 =?iso-8859-1?Q?u3Ct9ea367KqV80vNlKYKJ0W83OqqhkMESFWYfF7PXJWs74Py/ffOAwrht?=
 =?iso-8859-1?Q?hwlr692RLozfR71Rr07NvUo1RQAY2S4mcXXddqnHci6UVOp7nCtrxFzAVq?=
 =?iso-8859-1?Q?JdT+IrRxvkUWSq2mCcYUfUV6A90banRPEPMhNWRYNYA5cCACjEFhobGEAW?=
 =?iso-8859-1?Q?OGbHdate7JYSzf3J+Q1qp+JslapipxP6hjszG15ORArMmmsgsnPoZTgf2I?=
 =?iso-8859-1?Q?ZeGrghURIV/fQsILTfF2ygmeZemIENEhCoq90WgouaaAUP3lqYPk3npbzz?=
 =?iso-8859-1?Q?6TbrzLpq8HViceJbuKcP3RIECXLn7F3Lgqysd2ncgOhorHzudWs1LgDPDx?=
 =?iso-8859-1?Q?xsuDAT89XpECT2bvAGkoDXDIyQvJ02cS9DAdq6BOFdDs28sWWgGZYbSkak?=
 =?iso-8859-1?Q?qoRwLV0kMKexqiSJ1LdCe4tmuuU9I5RkR0lH4DRIdhe2YupsnkRunksVcV?=
 =?iso-8859-1?Q?PGUdlBoKxD9YrHNAktI/vnD4GNvM2HG1ij4opnRlx9HJVVpExmArY8RbuX?=
 =?iso-8859-1?Q?thABppiPsLiYzAEr8KJSkzwfywzhmBWrSiJjifRnvD8UpLy6R5ohwsXOdF?=
 =?iso-8859-1?Q?yL6F0W4wgNwaEURUQqp4oSIdLRPMZpX0Z2Yj8GD568Ycclnc3SUfZgSLIe?=
 =?iso-8859-1?Q?DMi6XFfGPQJfO2PupxqJkdOVjIJOfm6pqcB2jp00?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB9153.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68a08ab-e7f1-4960-ecfd-08ddd9a628a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 13:43:02.6240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO0Zw8kcnDnMjRiF0FombzwGFYyKJtJkBaJ/JlRC8IZdKJJ/eCzMYt9haw/fHJt2f3gfhh085HWDiqGcFGKrOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7168

Hi Jiri,=0A=
=0A=
Please revert this patchset since I need help from Benjamin to make the sel=
ftest real. Patch 2 does not do its job...=0A=
=0A=
Thank you for your effort. And sorry for the trouble.=0A=
Ping=0A=
=0A=
________________________________________=0A=
From:=A0Jiri Kosina <jikos@kernel.org>=0A=
Sent:=A0Tuesday, August 12, 2025 5:35 AM=0A=
To:=A0Ping Cheng <pinglinux@gmail.com>=0A=
Cc:=A0linux-input@vger.kernel.org <linux-input@vger.kernel.org>; bentiss@ke=
rnel.org <bentiss@kernel.org>; Dmitry.Torokhov@gmail.com <Dmitry.Torokhov@g=
mail.com>; stable@kernel.org <stable@kernel.org>; Cheng, Ping <Ping.Cheng@w=
acom.com>=0A=
Subject:=A0Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for sty=
lus/pen=0A=
=0A=
Both applied to hid.git#for-6.18/core, thanks.=0A=
=0A=
--=0A=
Jiri Kosina=0A=
SUSE Labs=0A=

