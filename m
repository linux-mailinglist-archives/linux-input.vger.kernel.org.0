Return-Path: <linux-input+bounces-10516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC8A4D79C
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 10:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2757C7A2833
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 09:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD21B189528;
	Tue,  4 Mar 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uf/Ds7BP"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD91F666B;
	Tue,  4 Mar 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079583; cv=fail; b=s3grUCx5ke7jU4muuyPRtq9H9/rfjfRbRovyndDhB3hx2m8NCGIgSJjKrzR+I5/sqt3U0eeBuQD391esmL6jgcEmzbtKwA+tHqqrHZ4RO0VYkMsnyrNWIotLZUYyVmvQm7XtLi5SsD6w/1f6znu8AfQXt2CSvOpBPlY44fjbKqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079583; c=relaxed/simple;
	bh=NFwGO/8LBWF+F7azbVh/Jg3n40sOk6UjrLu0VjgF8Ss=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aGL4+ZTee2L97PQhMM1rYr81Wc7u6HUHo3r/DqUizSCiVq3Xf3kwW1TJqTboux5oZmthItPg6IZsVHnd3CY5dbwwr7bvK0bhtpTEW62N3Al266uRHqDkwezmJBRa6g9zgkcOQhklL+WM7ZSy5AW1eZSn+V6TdyP4h541Q3dP/vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uf/Ds7BP; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV5Jz1gVkgjUKdXMxpgSCR0fgU9iqf9dIExF5ojlambww4c9YZ1sYYLw+Bq2c9FPxJUS2HCVaOytbDFvSVpDCnXboebbse+VStf9DThYMYOjj5Em4ZE7Z41lI9wME8ccqs82+rNQPswf+SrjQfMJ1QWBk1nc3zb9L5XG3BnJUToqA+4kvvBs9U9nykvk4iAukgjeTy7bNFQZ87IGRNTSbG5Nm8rEIoewfZIZ/AKyHpmvMID3CWtB6wCV0u0DedJA0/3trIDrmrSZhNGnbr9ngUkKzwiaPO7eHEe0gsPL5xfATMrGsmFh35vZiUkqm/fASWu4y1UIlNEiTj0YWzrpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EJ6DNeQr6hkmysIPWrMNQuZEkKtJMtBXLWWzuOb8FU=;
 b=AaGTx/HDjbTDondu3YKdfBeW2yreNkyApGMHULlg6CxzLXOUBUGs4IswgHjYOpz5k0w8eGiZzZG1JeyPssRobFPfK34UORpDHNj3ZLVydRNJsMKBwBGCRdul7MXdlIQjaeALWjVfbpSsB0zchd6YUkAQ/yy33J5wSjMuZ/sGKmYl4+8sKGxDd2O3xAnayhKxfVF/QVw/lCCHgAq8drnb3cAfaQsTrQTqHBCec3RaiFx7n/VsfLUyYVQlvta+OZ8agOzRxx28DMdPZxA7XdN2QIYpY4cC4ILhSBwlqP0k8waUcOudxG60lLJYyUWmLxLOxWGJaFhls6yRZsobdyC2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EJ6DNeQr6hkmysIPWrMNQuZEkKtJMtBXLWWzuOb8FU=;
 b=uf/Ds7BP/xyISDQCm0NMpqOn/LIeAPJWfGiO5ppfI4J/CcFgcHkvqWLOoWyQtEQMk6u9ViI9Tze4H7j4TodkRAqKfvOq6T3rnK31OFeCg7on4Ask3kwQffHGMm1OBDJxqvGGIL/Prlqd6bHtPAlYTXTe5jFlij2543Jo4gtZmSPkJ38XiqtsFdzqRHR0L+Rqce+te3rIyeQcBAU5JaiDDp2zBJTCW+/zROv6KX5vF2pOidyvErwTTpeeBeSXyMcyRsNCLGeykMjEcpTanfRDnlys40dTNVwmuDqlQY5Iw1yAQSFZ0/DoOaxZ/wYnXMn+bo9wU+JYEYKY3KN4lF51hQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 09:12:57 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 09:12:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH 0/2] HID: apple: improvements for code readability
Thread-Topic: [PATCH 0/2] HID: apple: improvements for code readability
Thread-Index: AQHbjOWe9saD3GiBwkybvr9Q9ESZcg==
Date: Tue, 4 Mar 2025 09:12:56 +0000
Message-ID: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB9281:EE_
x-ms-office365-filtering-correlation-id: a4902741-addf-42a1-f2b9-08dd5afcc0da
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|8022599003|15080799006|8062599003|19110799003|461199028|7092599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?06aBkEHRRaSl0/IPbLHlArtqKycU8SJ/IkDMdPUj9CvxzKPR7gelU5EDge+k?=
 =?us-ascii?Q?nrqNEVtmoI2lPWlmtQzjWgxdplZvj5NVjs10WK46J5SULimTssJpkcq6BaNB?=
 =?us-ascii?Q?KpHPUyJU90PE9MnLo6CrKanUL7AWf+bj2xEE+vf/yMvIFs4ubCe59VvqKCwD?=
 =?us-ascii?Q?w9AEdxMbR+lRUs/3kAgzrnuSCnfQAnzR48+4dhRiEv+yVDo0U3NaGTxuljiV?=
 =?us-ascii?Q?YlX5DP0o3001mffB6I8OtTzL7SJi2WuMxcn1Lhz5jf/lNDbSpxK1vhWEaS65?=
 =?us-ascii?Q?CnXX0ANAkluCfohttrf7qv3dEaGzA8sZ+J8brstiGf8reXHKbjU87tUf8VCx?=
 =?us-ascii?Q?NDc4lR6jf8ssN2Xm8dzmWk9AAPJmoSydhqgbTrJo4smnRTPmRhnW4QTr0ukF?=
 =?us-ascii?Q?PkDohp7d2SIT1Z93iYpMyo0SOeoq5HDH8jjus4Z2fKnCuUUAyWj6yk0xqqRr?=
 =?us-ascii?Q?9gE0gyx36wHRyR7VsHCAte0EPdMhNnWYJjkBn1Oito6vIOGBsK06xQQxV+jQ?=
 =?us-ascii?Q?xzhp2psiKWC4Nz4O+ei5a1IV1gFa+yc9ayRMkQhxLBgyCkU0aPMcbqL6lR9f?=
 =?us-ascii?Q?d5ShvGMNIYEfiBIj5VWtZLVBz/mDvdWLmOfDOq0+jsVFA1bpv7XvGvF/ULvJ?=
 =?us-ascii?Q?FGhDBrJLQV+DKhqQ31ZYWI5qGD5Yrgn5PBMugafLw6NXg9SCQKRC+7z6ysbv?=
 =?us-ascii?Q?m75KcxLPQqlTNEQdV+72Cuv5gjH+saRNswhacsUMUh3x29EYqrU/DN0Sac19?=
 =?us-ascii?Q?zNIcBderueF3YvwD/8FV86XokhaDGy3pxKix42+GNWEYL5GoP7hDkUtlDzdV?=
 =?us-ascii?Q?AQRvSjW9EaLG195f617AkOZHR9SC9GlDwfWZM9brKa6hnfGHzR2maX0W8leG?=
 =?us-ascii?Q?zLK0NydlPcpmjRnWq51kvuHpLwlVsSH7H4+kIgepNh9pYVQ1q/u2t2wmplSu?=
 =?us-ascii?Q?90Y4xrzRAfpwhq/2c6MQjiel9+URvsC/o63NfqfWNkh+1JhUpLGL12MXkAc3?=
 =?us-ascii?Q?thd3hjdaBTc3A2HnyD4xa0JscUKISaLXZKVUh3dSm922GZx9XICzDIaadg5U?=
 =?us-ascii?Q?LElFjLs+GVc/1FwUbFKpO0tPAfiMwpk+sNz6ZlndQn+exvDxU8I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uKFC4mCs30OzCMd61660+tk1Kz+08kXws9NPrBszIhlRHFCAPE1uJDp4JqbB?=
 =?us-ascii?Q?hRdSJgyfwqfdEJRs5Btu/JxnEQnShyOnLX11KaE/ytp7cZH38Q9sLUtMEFgm?=
 =?us-ascii?Q?653WBiIWHGrxzsSDVjSJQ+CubFS/kUuf7wiNTf4imG0ptX7R1xEYQEuyW5ml?=
 =?us-ascii?Q?iWqb46dWhfWMFTqI7rGNJExykj2eR3MjBUSvBia7fIc2oulhASozmLQo1jGX?=
 =?us-ascii?Q?hC9Ie5zZ+N5e/qjv/6j2esCr8nkrD/70mYsJa+4OBUG4aK6SENABO1Cn5b30?=
 =?us-ascii?Q?NwOMruz4k+4q/bkwffKFy9eUi/BTZ4s2epHq3snTdU0/HPXgUNIY+/LtbZDz?=
 =?us-ascii?Q?8fepKnmzlAL7F60FR41SmSfmGPgRluTLyCp5lPWWJKM8Y8qgEf/OH2FkxzPM?=
 =?us-ascii?Q?CEs5HSH9D6OaEvyma4u6ZWLkxD0YZiYijiEtg6CZjtCIgF6PDVQEuZVSzSXi?=
 =?us-ascii?Q?CdF7Q8kKwgK3sFcur1/hwNH1CBbFxBP4lDfTcwtGKCqRloT/BjWIc95fFojZ?=
 =?us-ascii?Q?G6hZZhZxC6Fb0/AQMYCvnYykwi3aOwaZnG4LWD/jQIt47eH7gT5N5J9np2Ag?=
 =?us-ascii?Q?0E8EtJ5O/zgkcUMNzBsAbtoi0JabtD+aXumHpMmxYgqc+P/Ic/lzKWjOklJd?=
 =?us-ascii?Q?vw5Bg7yY5NvwUm9pqbwgACK30c7deFUNtFm5qVVAFYeVAv1wQzDButjxR2D1?=
 =?us-ascii?Q?mNyyPQjc/HmoiJmEfNqDRao2Oy9i79v7WQKKmLCn6R/Rj+hBrPAbreVTeYrw?=
 =?us-ascii?Q?6qXPQ69gYJnv3weGcC3zUZlDPDnuyyzwbEhxVn7+bTYrD2UGTH91948IBeOe?=
 =?us-ascii?Q?/3WpCIpUZWLI0bExWdYbPApPBpK382tBKH0cz4Y23DUg0RGYtO8vm5YvKkTb?=
 =?us-ascii?Q?hThfuZIXItoy03bpGqHYZfv+9Mpq5kHB2jqm8gfvSlzt93kBYsGr5eQRbZZk?=
 =?us-ascii?Q?KXK93QBJm/MxwAIXYbRVsFTPYPbk8D4oRzVgcV5EkCvXek9SV4gZXHbm8HTR?=
 =?us-ascii?Q?Y6wSK870AJ88valfQV09guYtaZdKcphmiqcg1ezHTDyRe6Qz+jEBhbWHIZwl?=
 =?us-ascii?Q?dHNIrcsSEp2VwjNVLrrs0DyiMSvl3vxU81XRQ/l7wPhTzoD0dvQkkABOBZ1c?=
 =?us-ascii?Q?bY+5l44gB5D5LNcoX1+LcEQQTWe2psmsjCN1ykbkfxmq7rrg5SRGXedA6Mps?=
 =?us-ascii?Q?e9SCNZeV3eGaCGhrsz0zrdNOqE9ZheRyH7RTWvZVaDrU3FxEAl5kYBlThH6a?=
 =?us-ascii?Q?0CvLwdaAj3h9OjoWrOjoVNpWmCKHlvf4ak0WmE60smRptRmK8dFaMqH6FrAm?=
 =?us-ascii?Q?C6bYYikPmXA0aXBdlnFQ4p25?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA84D473B3DD7A4691733250CE48628B@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a4902741-addf-42a1-f2b9-08dd5afcc0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 09:12:57.0029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9281

Hi

This small patch series aims to improve the code readability in hid-apple.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

Aditya Garg (2):
  HID: apple: move backlight report structs alongwith other backlight
    structs
  HID: apple: use switch case to set fn translation table

 drivers/hid/hid-apple.c | 100 ++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 46 deletions(-)

--=20
2.43.0


