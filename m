Return-Path: <linux-input+bounces-12947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D697ADED34
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 15:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4543316EF50
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083F13957E;
	Wed, 18 Jun 2025 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Lw2mVy6c"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011035.outbound.protection.outlook.com [52.103.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A82F5320;
	Wed, 18 Jun 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251619; cv=fail; b=QkkHy/x6i01uoAxQ78UmcLmh1B/F+rhCEyr1nwNhaRDNUAbk0UwALbFI3gY5EIBPFUhBQ+W+mjVnYLPFeyVn0UELcj4MNb+X/Zv1F+KERuj1tTwkjfpVViGT0jsbleJFYSXDLO9pnQAePvsuLperehKtFNjpwdKa+2Zwz0fo5V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251619; c=relaxed/simple;
	bh=GVGaorbNOezVorUdd8MN/GBdSRs+f1BatjFtYh6oEF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m7oT0wmFIwzaArQs01HZPZMf8oe7hoDMkZSGBpBx5mwhzb6vVHIrvAt756VvGjWeqqhfkceIviWUORKzkB8W5kRMidkbLyrFT4Sgx9HCu6b4sbpLdOvbfMbm97aMimIbsV613OFIL3o1+zNg1BogkgB7a/ZP1VMErQp4iXYQa/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Lw2mVy6c; arc=fail smtp.client-ip=52.103.67.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsGUafaPMGCXEQ6K2IKttApmNb/izO5klrtUBw3AczAlLTUo1wi7u/3X8zdIzc7BEoahhNindavOP3hAJG+KHvhvW0xISkgNx0lYdPlDnqv51bsTt9asnqK2EFe1akTbtYbgmkM5s/fg/8Ce3ezBVDSF3O174Hu47n4xkZF/G7wrP10YlgOE8gYHRXANgSj/QO1NzaEoz3XTs6omiBrpRxOjZfMaNOmcpdudHis0fvchfiWAz6qicwxFk/a4Y/+ZvLrH25/kgEdzFrSjcGfsnD2u2AIb0b4Q87RxiiZKTP+aDG0kZjAQBnZ8ui8OlMfF/MaE0K7HSsGFTgF8umZ/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVGaorbNOezVorUdd8MN/GBdSRs+f1BatjFtYh6oEF8=;
 b=KqoLONbOwqfISui8BcEr3LXQrMsI2AOrro3g0v9iKeECOXlYzMbeafzhLKdJvJ8QDXMqWCWolYssPEb7YihZ6W3oLX8A5AQfuZ0iz3C70EAgDVQPJZ1il0aVuPQodB7REsRrAW3jQJoP1Dv834pQSaj3ClU8FwhREIoojPVWt68osPoWiJfsuAPM4msijPqUbF4gLeiEkjOvJbuLu143qxRnYJggj2gPMVqsPIKoZRD2m+nVdJLnJdI4BJbTOZ5kjQjy+xTD8U3inobKt+79QIIcwgKXJuRHR9GK80TJm/phIaXvE7LuVTvMdX14stzDf2rQbxDrEIGuNd42Eo06vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVGaorbNOezVorUdd8MN/GBdSRs+f1BatjFtYh6oEF8=;
 b=Lw2mVy6cHNtN7+kO/IZV5R5sZaa0C/FeMdISPtuKYDkTHRsql60o8lBXzKtwYjhTuY5yCPd8M+LGWcqXMQtgoaKr1k5CdxI/84vclaMF3GlzYLRLBDmVI6G7rZdGtuaH+XTIefcXPeo8h6J3xMMOFKfbA2aq/upBJDMt41PhPT2YGNxdMLI4gX8XNL+MQWhaeH3oh6OTL/A6O6Tecph3dyyP+sC0PLvwLRdp32epFLwMEhYBGR+dThrrJ6RVg4/yMhOLG1PGMFItNZg9XpyVl2V97S2N6nrepjadKTidyYoXf2ZwnlnSeErx6SPlUUuXY9DEogjljSFqIynhDsAOmQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB6243.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 13:00:11 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 13:00:11 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Qasim Ijaz <qasdev00@gmail.com>
CC: "jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH] HID: appletb-kbd: fix "appletb_backlight" backlight
 device reference counting
Thread-Topic: [PATCH] HID: appletb-kbd: fix "appletb_backlight" backlight
 device reference counting
Thread-Index: AQHb3kk3rAvSOC8/F0uVYTlNFCF/PbQI5TGA
Date: Wed, 18 Jun 2025 13:00:11 +0000
Message-ID: <2946B411-6566-4B43-A7DE-DEBD13D76F3D@live.com>
References: <20250615225941.18320-1-qasdev00@gmail.com>
In-Reply-To: <20250615225941.18320-1-qasdev00@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB6243:EE_
x-ms-office365-filtering-correlation-id: d52e8dc5-fad0-49bd-a760-08ddae680f2e
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|461199028|15080799009|7092599006|8060799009|8062599006|8022599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OfITy/UlEgt/REvk3jk/8MG+QNbkwTpywdBVepdTX1by33WFhit5JKeIA2N6?=
 =?us-ascii?Q?xzvsiLq2Jas7C9T91jzJuooGiB+Govvs5YhysGI5DqKNkeB2Rfb0qTAtgFMR?=
 =?us-ascii?Q?37msaKqV7x44X3z9d8QuQmDEGakvZUMih9T8tMKgOQZpjAQ1cm+83Qk4ooaf?=
 =?us-ascii?Q?SxU4vuy3+7TBv0golLcBkaeZNYMBdQIJZ7i0amBTQMjXTIwWgFNDZi/AhvRb?=
 =?us-ascii?Q?UEfVqvUkAkfdxxh0DGh52l7LdJFlWujFNWIO2USZuSl2zNGONN9ztTbNBSbD?=
 =?us-ascii?Q?xQLoSZD2sYKBB79+Ybl8w7BYHuARzrP+sG1OuPhBR5aJ9LOnLgwy5pyCpDwq?=
 =?us-ascii?Q?ueSxRfo58f5mXpdNjo+AaBuojS4/WUOMid+2sb68NwvrPiRu3WYHsqwGOySg?=
 =?us-ascii?Q?/IVhH06e0KGm01kIoIy1RYfvo2NWyaLypl48QmXXOBP0rl7fOrC6JAsqy8+v?=
 =?us-ascii?Q?EritO3D5BI7d7rVp+KQZ5/FY2W8PPU+b1k9kPVzoOOZqCmDtuqnyK5jqTqry?=
 =?us-ascii?Q?95NgU4dqTPjoKonYGdn+DOK6QWAfbGH7iroJUKXi2uzXkPKNjnYNJOO1Qyt9?=
 =?us-ascii?Q?RzmN/MgVMhTGJrNq6uYKZtVtP7tV1GRgbZP1iPfpKFv+JNa135740ppaxVWr?=
 =?us-ascii?Q?TaxxoEN1X3XkmhYnexVmnACm6mWLYzE8lcqzEOVGJzzXV4aaYy9OL7iT3q7O?=
 =?us-ascii?Q?0757DFqJoB/yxCc2bfCWpqbYjR9NsoYrzuukTXUrqgwiy8cbHEgp+gDO4XAR?=
 =?us-ascii?Q?edmZI2C9o+g1vH2iRNfC3WBYt161OcDukFGq/EgY1o2UlH5uxzGejGMdNn9C?=
 =?us-ascii?Q?xY3MH04FzsHf1NYZQlxhSD7NFHhYBIjptKIAfX9FkjS+Xp7lPrPzU5dXyGHP?=
 =?us-ascii?Q?w8FCGIlM/t82ZrStqvqx4HAqpkZ/LXgSG90qIwqdib72kHb3+5+fZxDT3l9b?=
 =?us-ascii?Q?mjw6MYL1NJSe4Xql1QOF6nQDArMNGm6btEHQ3+qCOyQ8gZGpuWo7fAx4AwGz?=
 =?us-ascii?Q?fR/C6VcVp0GJkYpNGTfGSlNbAq1MIu40AHyrDP4sx7HtkLNXAtuHOfRaGexu?=
 =?us-ascii?Q?u1fWjRNHUdTi3wNQKKvBYQ5lqFMn5d/ytZpthrHCOYGOI4qSl+UJ7mflsE5u?=
 =?us-ascii?Q?JxKp6baNdCuKWGcjWYduS6YGEDe/cXuMtA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gCtEEAsYhGi/Hq4jUo6RYc+poMbLlWthf8+k0dcH3cQH5o5dTdTwYxT2+vqF?=
 =?us-ascii?Q?RqWruB3/xe9iXXeDU/c4F49sQXnRxlx+pE1JCAAG1kIY1dLs5oachHDFySzS?=
 =?us-ascii?Q?Xt8T6mtWhMribI0UMRwC04hVIjzEL/R8EycaGJ49nAsF3AoXaRsTVyKyHeF9?=
 =?us-ascii?Q?x12J2CsZyCbxCKqjHrW/1GAvkhA+ymeO1LfCOLLRCmXO1tDYA+YK9o4PlwDB?=
 =?us-ascii?Q?oCY14Sgc9icVjxnov6IkS6O5pgyUozRfKNzaqd/k2yRYSu2eDP6tRgOnPt0m?=
 =?us-ascii?Q?yAyu5znmM5Vp+mCqX7Sx77Vpw4Dx8BPl1SG4E7UaprcgfjgUh5gX/VLHVVIw?=
 =?us-ascii?Q?JI9m2IRp9b2gr1GCQJ75nKdHrhsqK6SU8DY8cmbR91CN/d6C/7U1UnYxW9xQ?=
 =?us-ascii?Q?3GuJiVf/FNkGvnGxj00/+fl7+cs2O8Yc3plU5/S4KuJ2EZgz6YB4KrLmMqJp?=
 =?us-ascii?Q?NjF5AwO9886SiVvd4texjdog4JOA5yQhQevls9H+6uckt6k6RFzIOj1bTbpo?=
 =?us-ascii?Q?r+An9d8T0WRNUA10Rv/GlYOP/nSOHQ6FEtTlUJFtkuNAoYULcNGonMBLFZFq?=
 =?us-ascii?Q?IqmRZcvQjxmzZT4tcvl7zTyJ0ltPXC10wNorJJk45KiMtGXuuvO701+7HQUm?=
 =?us-ascii?Q?M/UZ2dqrQN3JT8RYjz241zOlDElcq0QoFNnF6aeJHpg8G+BUJAdNde2Oeu2J?=
 =?us-ascii?Q?AmeTQkY5a7DRdEJVzjvZ7VJDGD4l4IUQm98miI8KeIvkShAWj+uLMEjMzGFJ?=
 =?us-ascii?Q?oFSucCtmaSWubAjjQp8nF/+g4hYvINPOt3vM7RVhRzduzulmYotNyipLruxy?=
 =?us-ascii?Q?ESBVro06unOYPV+XzGY51rwMXOJqdo+vBvTAtu2rC3ar2r8WNdv46KIr2Nv4?=
 =?us-ascii?Q?E/1mSp37BPmO5mq+25opDIFwrz0Udg3z8O471ku8sO94puFUQM3jlOd+8EW1?=
 =?us-ascii?Q?JplHPJB6CjRPjx1qbM/HZJ+Qc8nrdnwwV/FV1/6qwAtg9Yw2U+Az9RxUSakh?=
 =?us-ascii?Q?KOrTSvVd6RjPHHO2t+N4q8SmyKX/kYpMqKOW6nStzeMiZeGM45vUu8s/Zo3B?=
 =?us-ascii?Q?VdruazELcaL9N0maobLNlyBwMeg29JO0fOcolF7Gc+vUIHR/i1Ju+ClmBI31?=
 =?us-ascii?Q?1R0CaFWfE6xfGhBnYN4IxKodA1lAJtXAwIESHSdALT/ZCObz3jHD/Ux86PoH?=
 =?us-ascii?Q?S/qRDHNxnLzaIITpoN56eioCeGAJ1d4Amvy08onNER5VFmn21ASxyIqe3MI?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF18E0F5A3956845A7674D258E01277C@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d52e8dc5-fad0-49bd-a760-08ddae680f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 13:00:11.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6243

Hi Qasim

> During appletb_kbd_probe, probe attempts to get the backlight device
> by name. When this happens backlight_device_get_by_name looks for a
> device in the backlight class which has name "appletb_backlight" and
> upon finding a match it increments the reference count for the device
> and returns it to the caller. However this reference is never released=20
> leading to a reference leak.

Good catch.

> Fix this by decrementing the backlight device reference count on removal
> via put_device and on probe failure.

Thanks for the fix!

> Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic bri=
ghtness control while using the touchbar")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed-by: Aditya Garg <gargaditya08@live.com>


