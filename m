Return-Path: <linux-input+bounces-12204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADFAAE2A1
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19FD4C40CB
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4093528B3E3;
	Wed,  7 May 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kYASH7v5"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1628AAFD;
	Wed,  7 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627102; cv=fail; b=beMRmTZKD4Xkm4WqjqjBZDRKULYJBVQGvfhYKEETNGPktYpm505JRSjNiKLD68GUkefjTIb8/YMjJX6/qSeqNPGJ39Fqd2MG5NClTd8LSIGIKHGwJNH2LaqHKfNbc/ZwGKAPu9zk86+/catIOU7hbg0cY4Qq0PuJrIDROjcUunY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627102; c=relaxed/simple;
	bh=JTzG7N/zBWNZ9e32nEq8iTU4qJ581GiDRCtPiKfiREw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kGyrfv09GE8aC2TNz/YXJLH5LS4CN7sXOM3hSEsKkOtJxOftpRcxXcATa5iR9v98pjnPyy7FxdkG8A2rSeOnQrvzlWxNQT93rv3IbIVlg68if7kJBkTiVbEsQ5oNY50pRim+0mhgpAj/5ACmQ0wkfwXhxdqndC+sOJLlix8ky/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kYASH7v5; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT7j/CoC2udWcUncUIFvqB5pRPpjTTsA76iyudpWJYk3a7tVNcwi8+U5maDjPXyilbJdJ2K54zOPBEQvJjlowXyASgWYUXwoXljU387QxYgwSjwrDwlMB9E934gGNf2VyObN7G5VX5BTWwZ4GqXPNjdedW8phETQ4kQLcmgNqvMbkrTJmnSoL+5SVdPzJWcurkuktbrZH7Uttd2FeLOXR0mr7IPePf3v5raebC2NIH6vPDK8fIbRoJtKg/Ua5q5WSkJbM7THPkNHVriGQZE3CDU3QHN6sjEVVcOqa9n2p3niHV5Qx3+5Mp1DBhFiCW1t+UtOeqR01vR9eUeJi4cHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vJ3AWEq2cXtSBDSlW+AmDRK5nDiN6XX3Nf3RzgEnHQ=;
 b=NtKEcEGdLTXXH8Hak9fGRGAfA3eM+OE4dVyXPyA/AqRqeQRDXj4ipwaQqb4laMtBnRB5nhIDTuwW3LF2a4WJSehGTLMJX6/exwPs2bT9LiS3JagKy7JVXDrUxB+5DwC+4c5e/HF5GqU5uwONVbdSm2a8M+EMLyjD7/+I1l5nRKKP0NpEsu8bSAH4tY2s4idAYr4S0rkIkrijXZJrBqlPhIlZkf6IRuBj3BDbtU+lbbW8wxRSfQ/U8202zcGcOsizKoDEygWZOXXAsn/gdKNqmyYDKFyhtBsEAgsABqTUs+McUhtwwmNWlIISM6MW5QPfDAGlu3WtHslbu25TgGLM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vJ3AWEq2cXtSBDSlW+AmDRK5nDiN6XX3Nf3RzgEnHQ=;
 b=kYASH7v5s7HyAgL4roL7sdPARozOwymns/jtyUHQ6SsdwUct2NPa5q5WstKmwiFDJHqzFPDp50r+v8pKM4EMKeGUOHuVshqGyf2v7Mg2yUsICbGyKYYceZ1BXhySuGf02ngklpoygw8UOb3NcqqzRlr2LIMPRmYMUsRnhQciaJ1AF25qmGVRyA10FrgFLZjXHJ/TOCZuMWhPa8OicERX/Isuo42oN0XN6H9Iprg7aMug1df+RxPblJPf4IjEWwCxUJQ/oOd5giXf66cEXvpcnjggto6/AVBVhbPgK99DnjX4zF/5G3A2xCJDcMly7S8WEJOOlgYcKeO0IeSQWUaO7Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5559.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:11:31 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:11:31 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manuel Fombuena <fombuena@outlook.com>,
	Carlos Song <carlos.song@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuntao Chi <chotaotao1qaz2wsx@gmail.com>,
	Matthias Eilert <kernel.hias@eilert.tech>,
	Markus Rathgeb <maggu2810@gmail.com>
Subject: [PATCH 2/4] Input: synaptics - enable InterTouch for TOS01f6
Date: Wed,  7 May 2025 14:05:16 +0000
Message-ID:
 <PN3PR01MB959786E4AC797160CDA93012B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250507141114.25077-3-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b82956e-504e-4015-6d4e-08dd8d71106b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|7092599006|5072599009|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8hqaa2nx/ILFYKbz62u4XAVDNyf0WVII3MQzNTyW2NGBbA4tjEO+adxNYNW1?=
 =?us-ascii?Q?Ad33Oy3utZBQOCnZ7TLd7tEYsDu8RWJBdZEAQHF1OFPdVlRwv8p1i8ZxbZgd?=
 =?us-ascii?Q?uj0mg6N3/4pLVVpT8nnkG15pm6NUd7lwSF7nL6Dvk4uEyIJTzjeGrevKJDZb?=
 =?us-ascii?Q?OkKfSG+oapTBgA+NcQ4AWe/SM62nkAVMEV8c8HD8Hr3hU4FsT4n6FW6aWhw/?=
 =?us-ascii?Q?b/d1GIwMevNq6ZrPWp/bvhbtkVeJLsp6NicTc/X7NWOW38ce3sCRc4rGsurT?=
 =?us-ascii?Q?1NTf2J2HpPjEhmOXNCz+eCkLgq1qlFTGYC1KhcK+JBX3Eu1Urbru9JQNz5dc?=
 =?us-ascii?Q?pqlVf4sc1T6ggNnYYjK6loTG92OvxglN1E55UJZnXj/eZ09u57A1JPspFOc6?=
 =?us-ascii?Q?+5srQEI9k89Efpzw01A9r2QxNrHMKfdZ4Mrm9lFAzNIACUYEFB7UHYo88KMW?=
 =?us-ascii?Q?In3j/Rnk3dHfq1mMTz2gRzt+e4yS8nmkdftxVQRBwZtzqVkCgR90d2NDU6gE?=
 =?us-ascii?Q?MCt/qOfF+27klYT3sPIm8ZViK00A/gCo5Jj88hreNwFj3MlZtnPyiIWMi55F?=
 =?us-ascii?Q?9rlf5x2By8y+7Vz49SAceSdm+ciWNR/55qNE9rFVxlz6F0F/CxPKKQ0FrNHN?=
 =?us-ascii?Q?w8absUGQJlgjV4ld4C2vov2VTfniksinrSv03bXw88XzwS8oJqzHrCwVgtiJ?=
 =?us-ascii?Q?KqPj3kKQADwyVB3fRF08EmYjwYP9EBlhxPlGaidbUrDdOAwqHU+yz/vPJVso?=
 =?us-ascii?Q?8H2lFAcTxAnSj20up+jFhLhYe87XkewXpxon5E0Z+d2aFep95XSTibkHoBLW?=
 =?us-ascii?Q?Z42/n4vc+PU1SW9hVsqtmWm8tuWuQ4IhtkyOZzeIi/4xEaph1NZONlfkbIQx?=
 =?us-ascii?Q?GVi9/+hJ0cN94f4aRnRI/9gaKsE8DF/xuEHJz539qRep44x9c57cL083I84k?=
 =?us-ascii?Q?D7pj11PoAtu0DQ/42eSB6akN8ebgzBpD1kDWXfNICIT6rHge7JSMQb60GkgL?=
 =?us-ascii?Q?6CQJ8ixbuNGzCs1mdjIJOLEwywSu2D9O2v2Npjf/7sejlxsas6JaKbLC1klW?=
 =?us-ascii?Q?kZDvoq7EKk5anedhaNbvoVTRyFg4w08+HvIzW40H/xlqN8ArBEo2HNigZllS?=
 =?us-ascii?Q?loqgqkHgl9KKMZVJYiIRegCfh4KWeTU67M78sCUPLNXbbSEGHPWFGo+CXzuu?=
 =?us-ascii?Q?licHl0+wcbfyrKwlUiOOTtTo5Bp2XHiJX131ZWV1CAARGipH88VXU3/lYWZH?=
 =?us-ascii?Q?ZlMSVCnKluHHcrF2Ni6ZOyQ47fWf0vVKxuhBDN2prw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BrI3iS3wOudCotPOFlgS7l4y/p0C87ZpWRQDvprm1GFli+eGsZL6+LIdiMDS?=
 =?us-ascii?Q?AmEaqHmZ22VCERAaTWCU0z30lwLfWkpTAw+TDDU5CTQlPkFLDMgCemtlpCPe?=
 =?us-ascii?Q?l2G1vzGhJyEVxpRF/FavOPuvSt/kFoCjA+L1RSMGLg3qWeg9tTAsrGckYWPx?=
 =?us-ascii?Q?fxSLM3ineagFOFYjUhhSMlQtJt0QMRL/AjiDB50WjLkcFtwe4fGlsCR+eM2/?=
 =?us-ascii?Q?SrlOm6HEYMBkadZmjXQfsfAWNyg4/uE55rTHYV8FiiGGNOggtYeKV1DHmckn?=
 =?us-ascii?Q?d63zmlkfNcWVFWGm0OEKlm7neFtrtgjN29TPGxKIGRC1lmsWXtEutu8ZT5Km?=
 =?us-ascii?Q?g4/vCAR2724dkCn4w8qJWr3awAjIEqTtzKc5tBNI3NOdULmej7P6u4SxNFBR?=
 =?us-ascii?Q?E3e4CHHDGDeHCZL04YvnZtjbvcSEL3hdvsvtmmSdTg9SRuvmsD03Mj7OA767?=
 =?us-ascii?Q?4GGgDRJEH63m4194ZN9udwIKKJ6786f4rxRBNdEm/wi1UUm7RKm/lW5TliOd?=
 =?us-ascii?Q?vekHOrwGzE87HS+v4rytHqivGbevu3eQ79kV6oeyHfj7IGMJqD+j4fnbvb3W?=
 =?us-ascii?Q?D2swklZ4y2NkZdWrQa9qebE0k0w+6xAYHT/YgBG6BZFCrLqBDfg1WDMant5b?=
 =?us-ascii?Q?Atnr11oBcIqjjzCNaDiAtebUeNgHOej+/390Ai9HZdNoV6AF6BYrwqCnF+Pg?=
 =?us-ascii?Q?3y0/SfoloZO+yZQ6axErm5CleDnuryfUSxH1KiICIrvlzj3cl7UhAdqXDezL?=
 =?us-ascii?Q?v6l/FhDGytKl4FsANZKqQawOJ0Kw10ZrAr5rtBZtA7ljqC8mqpv/Q+fkSxxt?=
 =?us-ascii?Q?y7A9DGYCMKG/R3UO2PtodrEId9r7nds1FQBbFiKyPPYE6+NieuDh0wxtbB+O?=
 =?us-ascii?Q?lwzF/rQX1z07TXSX7QGmj7UgxnxmIhHJJhXfgilOArUSFnvn8kw9KEEqyncf?=
 =?us-ascii?Q?N/xC0Wsx5+YPMSGV+ve1Pbu1cO+uInL2IYx1H/rSrr+MQnZGtbgzZouSVr4W?=
 =?us-ascii?Q?02WGZ+wD5LU9CfAdD1nCKnYwEnAr3pzWBlx0qZj1FaP3qWIMedRcndcR3cZe?=
 =?us-ascii?Q?UumxPt/eNsOJc4znnCZpsXsRBSH/EeoK6qmgB5ulBxJsJx0fgH0EXRfHVKLu?=
 =?us-ascii?Q?uT734pU6Eden83kuXyxuAGm9DLo4eBoVvoAGMPE0AgA2SlJ6mZ4Pw7TBfPz6?=
 =?us-ascii?Q?fkXX5thpmKcVttLpAptZMPPrJ2VVJlhKLkk8VosfNYjgs/OwSVG42ig2DNI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b82956e-504e-4015-6d4e-08dd8d71106b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:11:30.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5559

Add support for InterTouch on TOS01f6 by adding it to the list of
SMBus-enabled variants.

Link: https://lore.kernel.org/linux-input/c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com/
Reported-by: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Tested-by: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 753b9991b..a1b896b06 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -195,6 +195,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
 	"SYN3257", /* HP Envy 13-ad105ng */
+	"TOS01f6", /* Dynabook Portege X30L-G */
 	"TOS0213", /* Dynabook Portege X30-D */
 	NULL
 };
-- 
2.49.0


