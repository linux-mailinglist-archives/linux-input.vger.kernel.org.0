Return-Path: <linux-input+bounces-12205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0BAAE2B2
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C1E9A6644
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F1728DB5E;
	Wed,  7 May 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Y/9vX2Nt"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0528AAF0;
	Wed,  7 May 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627104; cv=fail; b=OJRotjfF31usNZWDt26UxTYTEMg1HdGjMYeE9Q78DuPqQRn1A0fpMqfUfFEfZHvg0ZcBREKArJuHJy6PgSWaky0WsSvwKuATUyG+BXY9Pq+RiToyl9Eu0Bo/WXXmHivt+BypfPk5IlvFeLkDwPgA5gvdpI4PPSF93KgyUw1E/LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627104; c=relaxed/simple;
	bh=zjcGWPRv+7ZOG861GUoeNAM87lHm1wmAIulKOyJyRbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cyj0dQbLoP44Qc3WY1izorjgYGOHxj55jwohxgdHz9/9ji5o+3Mrbscnwhwv1t+C5K5MiM8bW9z/JBjve1rmJSFjjOy4Bz72OnZQxjPomCSu5+hhhNmM/4Y8e/caRC4/+ASd+bujKYkfe/4cbvQPQgNVCsQQJLLJnDqMqUvYFWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Y/9vX2Nt; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB/LrDgx+yeJQyYxZ4arKvYsDDb3MCvlxtO0j00eVtZyytMNdyp9Ec4PCI3oJK9z0f+oeEsBbyyO2IOBG05btPISq8Qvy5wZGQQaE3N2+IRoszIoHW8Y7soFG9ApcRO9k5U2V1+18Nr6HDExq0GAO4oufHLU9rUFzF7mHdWImB6oPgYnajz5OlCj/f25hQSkUK7GcetUBJqj23o6w5HpNf8OKLnF7bspkcRTBghjyh3yyOqGuWyRO47pTPg6XGVQGEQIqXcjGWbvw2z6nbkltN50CCojn762sIGm1lZZ56sHehqGwQV8l6jw3o+IQ65Am5PQBaSeVLw2IyRiak8YJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiE2RPwD2vNMty43JVD/D9JQNOsAkZLwyJTK441qu2Y=;
 b=GTbgjt9/I5N8eX/Gl3bgqQxryQFx0YW4KApddagPZ2YS1Otxinc4EDzcGXCNmF27z2bAQjWF7YJw/Xwr1nb0s1Il1ra503aoL7hW36AZvBqlVTln7Eq9e+DI7dmN+/szwXDYJggCgSacJgG/pU6MtKuT40CAyhbZwqZSMDojrlb2RqlUKwzO71ISY7/DswYbgYrPHzKP/B6f0vRgATTKp5m4f1PB+npaTCGNmKuqhgimX3xEHsH1yiG70LrfvZMLZIpcq6lxbdFK/oessOcsDi+Wje+P/HUxMVTYDb0aFWqy+66hpPE97ku33A7mrRsRwUJH688Dw/0LMrj0eTGd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiE2RPwD2vNMty43JVD/D9JQNOsAkZLwyJTK441qu2Y=;
 b=Y/9vX2Ntgoft2l+CVRhTFY0BDiZwhs9ZpTIvwDRe3QIMv+pnXUVVyfy4TLTye2ZeRw9EmEq2+sFpY87YF6rWfDo6sj/KlCSWgGNJKLyUQgFFkV2vFoGXNVdHQHsLmnG2pbSFpVd38wXlk5STPyDBzdUc1jB/Uj5erA3ZM+CMvT25x+EpuCnoLCgPlLQZZuwOlTbwDzKQyDMaVlTLKRoGhhMsAQzui57gogFEGDSfMG9HshZNlr9oh+tlVLg7z/oikidOUYrTR7OUe4geuOTtM1NF/pyPpQa73leQq3P7C4kOkoIzdDvbiUG8WXxMSmlPN6KNWN0Qy/9lrBy21nEK1w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5559.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:11:32 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:11:32 +0000
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
Subject: [PATCH 3/4] Input: synaptics - enable InterTouch for SYN1221
Date: Wed,  7 May 2025 14:05:17 +0000
Message-ID:
 <PN3PR01MB9597C033C4BC20EE2A0C4543B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250507141114.25077-4-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f189395-0d4f-46f0-2b18-08dd8d7110af
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|7092599006|5072599009|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d/PMyeeRbQOTGTgEoLjNtLR3vDt51swy6uczhJmAvWCYwgM1il/ChjghVQqM?=
 =?us-ascii?Q?kWorz6LmGY4L2DDiqVvZjtNGeHO8AsXZNvkTvgj5lNps56og57B85yT0SAwT?=
 =?us-ascii?Q?Tb4JHqywdhtIT8PNDy+gC/1UcZgVpWQwDfM1rvgc1peaU7PNfpZrBzG6AT1o?=
 =?us-ascii?Q?2qGAImLAPmSdDde1b9h6CBREQzwopQEDhCmMvDBySPTkYSjpR4BeD51MGTsA?=
 =?us-ascii?Q?rctDKbLYMjJjvc8ZDWXWCBIneu3+SOOE2G7bcDoW6dRgnh/CYO2ytfgMK0iG?=
 =?us-ascii?Q?guMBYc2oH4kWh1lL5cfH7GKc2anoX+9wnzIVbncF5q0W+Mw5MOMYz9PTU3lc?=
 =?us-ascii?Q?I99czWhnDDx2l/gEEzNRFjXq3dafg8GGHS7S2N7qNYEdm5OHCkiqUO+/Oq/8?=
 =?us-ascii?Q?GZNE94cCQCS1u9513biuWOKMlLZMSHzvgNm+uTrM3gXfIhCc4Q44pS+DE8aj?=
 =?us-ascii?Q?zxMfsTBOakfqOFIP7vFLqn1jgtpbluEe8Jcg4Sn6j5lU5pkJAFQeuykySXox?=
 =?us-ascii?Q?bm6SvbirPkP3dBeDHiSkkzrIPtzRTEQcLxm0ZITFy/n86f6Z65bsQl4JaI57?=
 =?us-ascii?Q?0iWPWRJbP8dQzOkmrNvG4OhYCyGLu1pZvkicAA1UndZvHHZf8KKdAUAJgMVa?=
 =?us-ascii?Q?7pqUulLxndNCdM7R1WK/MjBKx8nlrQZKYy+sLW9rvDt/RwqDztEy88zgqdZL?=
 =?us-ascii?Q?jGkP5ARADRkyoFKICVE8SqHoBQAQOlTPdK0Qwdd1tFFgpoCxkoAVtO+/bkCb?=
 =?us-ascii?Q?51zzgDGebBoL0WbQqb7yQrOXTV79/6K5uR8ujOCTSgjx2tdMXuc//9RHSlSR?=
 =?us-ascii?Q?R161woFWljtu+4rCClp0uE+rx6xG9itCz9rVxVvpR7HbBoBIY4xhTqSvPwwF?=
 =?us-ascii?Q?mQfmpLg+38znO5dcXshEm6dHrIbYd6GvA7Cj/t01p/TS/BkytdJ4vNkpNd8t?=
 =?us-ascii?Q?BJ+kkI2H7NrXSHK/UjetFd9sHH4VFgnZna0Q54ZovqdOil8GBkTconmw9u1I?=
 =?us-ascii?Q?8/Gh25h7eLnzsZn8Uu50Gey0lSDOqaQj9hvZ+nMIJ/BnYbovTwwsUoBRDTBD?=
 =?us-ascii?Q?AeoFMkUJnzuchMB8TmqrcNDcf24BDQPbwSJiSx/9zoZi4oeImFdMhX+H+bf8?=
 =?us-ascii?Q?6z3rVI2ph0j5LlshnSmXa+pyMoAozcH3ye+H8YyjBy/SBOhMpZfudWJI2J4K?=
 =?us-ascii?Q?xkuK5Hrj2RRb86O4NJW/aAtPFemjt9Er9lbhukPbBeEjmbVapsfc6hQGL4l8?=
 =?us-ascii?Q?Zg8nOJq41v1io3oQ4Y+RpbmmUtkF4pMgqokRCRJmCw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrFx1M3mCekktI32tNf8DUS/6GOVPp5THOgEyC6uqH70xYBoCguTQae7xlWF?=
 =?us-ascii?Q?9vemZ2+4ohn9veg/EPfyEGHTvHL4TYl4eXZThgWEvhWSfZ13jm22zWsotjiD?=
 =?us-ascii?Q?nlvei7GbV9hyVXMK7QgvmXTZ4/7LT5/UmRXBSibDFHQYhuusz5588dSsCsZC?=
 =?us-ascii?Q?myWbne+ikmlreC6s3lE6zercwLUuM4xHcKdCYgTTbgROwFnkz3XLiI7sbTLI?=
 =?us-ascii?Q?2nubw+6MQqdh0gNTYxcKVpRzJrkhWK0+9G2fZ+++hAuwRFz4Cj3DBUcyuIZX?=
 =?us-ascii?Q?mB9X06dm0olVAFrypLBGXc9VsLTCPYIulYt34KR6Ldrpdwmo8E8CqUQz2SZB?=
 =?us-ascii?Q?RTjJRZY70edlRN1WYMYVTIRNrpFOJpgu5mKuia9zAhfRjdvzgC7t+xqJzm7v?=
 =?us-ascii?Q?+CZSbGSbXyHMYPnBSpeUt97VsRLXrntUG1FyGoCLUh/WMLkmqt2Zayjq5xl6?=
 =?us-ascii?Q?5J3Kk3vNlKe7Giz8YodJRTxBoJpWAKXalpftq2cLOXJIp79oCBO0UI7RpdLD?=
 =?us-ascii?Q?RxcYnJ5ADfcUM86O7UZbMJNdoOJ7TVUMK0J2QmwhFES/l643WV9uGV74bVCD?=
 =?us-ascii?Q?CsfwwgnsSn42u/veMa24U6PKfp5CqHLcSpjbbaPQ6gJH+7meT7l914Jn9vma?=
 =?us-ascii?Q?DeJpqd+Upw1PDqMP60KOmzk7Itnrn1PR0NlWCLysBVbM454Y20tTgoHjwGwr?=
 =?us-ascii?Q?tjxaCzlQHL8IHpVouRVHZk/tYPlSX8XdzmlcLH4m4mr+95xNNGt9QXHnL9NJ?=
 =?us-ascii?Q?RoVfOUyA8iLJniJIkGjbjai3gVeuIfr0Ko5CA2F+tBQ+zeLtRictb/V+EmZN?=
 =?us-ascii?Q?JKzv+mLwnc8PkQKPq68ryumFBPMJRtyvTQgsEzM+UA381sx8cIEVueNexCMf?=
 =?us-ascii?Q?6aHNem9r8lL6pzqcJZ7iSbKwWpvxK5XKN9g1yWHlGv9rd1RpXq1KeLxsmaLh?=
 =?us-ascii?Q?RDp8CdIEvRe2HTZH/jvTJPDh5z5Q2t1G7FKvZC2ftWr6s/1zav1AQ3m12M6w?=
 =?us-ascii?Q?AIbZTHJgAxF0mMQLNTFhoEU4Ecg+XFF7KDN09MxuIqcfECsdevdeDgMVgDpM?=
 =?us-ascii?Q?ibmf+SnmsCmbLlXvdZSxeZrh+A5TIGkp7QjZuwzFGSU5FvEeEhsFqOg4a0J1?=
 =?us-ascii?Q?qNpZP+hSX8as5CcMKELRVdiCWVg6KauaDqlvdPy3pepbgOR6ZnT+wpoEsT6s?=
 =?us-ascii?Q?NaGjiYahwCy/AvHqrg2Y/48hLKK43e8Sm8cEY4fgVOlH914LMeo1XRqyVtM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f189395-0d4f-46f0-2b18-08dd8d7110af
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:11:31.0914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5559

Add support for InterTouch on SYN1221 by adding it to the list of
SMBus-enabled variants.

Link: https://lore.kernel.org/linux-input/325001b5-12e3-42db-96ec-05bd3f23ab35@eilert.tech/
Reported-by: Matthias Eilert <kernel.hias@eilert.tech>
Tested-by: Matthias Eilert <kernel.hias@eilert.tech>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index a1b896b06..fd48f89d0 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -190,6 +190,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
 	"LEN2068", /* T14 Gen 1 */
+	"SYN1221", /* TUXEDO InfinityBook Pro 14 v5 */
 	"SYN3015", /* HP EliteBook 840 G2 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
-- 
2.49.0


