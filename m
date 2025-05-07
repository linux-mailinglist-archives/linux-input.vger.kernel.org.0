Return-Path: <linux-input+bounces-12203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA3AAE2A6
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED49A503A82
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E7D28AAF9;
	Wed,  7 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="cRu9Jk4z"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5928A1E1;
	Wed,  7 May 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627100; cv=fail; b=aGFCyHiYbPQvXr2T3gGYQ7kF8GIGPWWcPtCZAnj9VgdJOtYQtMpRSegJlLgrnIocG2x7jHNCwYVE3VwNQsWYBs8jZARTQ63E1fRvR9+SGZ5LD4fdoJSALkypSEbDjwx0mrPcv1HiJCT/pYOVSbpl09LZE9vn+1Hsxr/09rynj3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627100; c=relaxed/simple;
	bh=g1++arQe2UegzFvWQKrlyqQiTuYIaS+8S11jXuqZ3/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFiHj+J+uSlwsaG60KdL9J9QESHe3b6Nqmb4IiAyuzu0iG8QFxDuRHtDSajJO9fcj2OfOluW+gIafWfmgKFYVLpzSV1GaP6f7eErsVwzaU7o02cFZVu2EOdEJJShmFKpth4Xih3tXNy86RqkElMTMuG1ygfcL2UoMrUu5857DAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=cRu9Jk4z; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkwb6tEMUtlv4DXZV0Nn46j3hsbL3PDAWNTXT5irPV14ORaD2XDSpQXmskY5zguoqWGzGP+4FPujZxXlfr1k9JHCQLwLFfjgGNsMcfg/ODquwXX2o1Hf2Q76/CG6RX05Sy6fP0KT5i85aultKvPfQ9B63ltAZiilhvZFYugFpgFZEOrZ3LZYukQpXxTNbUZ6lQeJ1J8ubDYsfmeTMaXaycX8zIiBNt4Y9hXE/O78AnEx3BOQq5YrcHf3zd79cLHR1Levdz7rLRiAY0Zh8+R6DNtY3JR4ej1NQcRi6EV31uCrnECoryBdncrWxGOPZDCv/eMMc24o1afaP1TSJT4+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFwyX3AKgty3OyzFCIEb24wWrJIknQYDF2QiwHCXwfI=;
 b=J0l8AfcgEq2HUR/fiEJJBIDmyaj6h1kjJuk5f13cNW75nFOtAy6KVKT/d+ItDrlDYqO8B5Dnwg98Cj4Uzku64jW6mdiD5Ov9gaP+qb7wkJLQF113NA1RKFecccSX5bIhrKAgI+Fgm07QwTJkGYwpZQXFQPDOgaTt+gnbztT3aA5g4hEcLOSy7xe6wanA17CI7SOR07lF4uZ8qU8BXZJ3beki1S0b6EFY4vVJMM7kNgzGRNg62pglgslS0dvV9dn3/X3zQBOiG/mw3NB+ueVtTcc7N3SvNf06CeM+FjacBfiNRHFln9jgUebZNxoeeD1AbfVPh+24j66AD1fT3vWitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFwyX3AKgty3OyzFCIEb24wWrJIknQYDF2QiwHCXwfI=;
 b=cRu9Jk4zBlqvC+aVZ6u7hWvhZeuQa9ntNIPnaNRS3+v1UowL2e6xT2+ndqMT6SFUngEL1siXRKQkZPIal/lnhagH1Gn1EA0zi4LGgH3h8axaTpb5d7F3/yasIWIC9U0GtIEN+te/4BOMht8caSGwD+zQTS/s6yWTBe99p1Xa0Y6YeShkVrGWlrhFtHig1r2YujN1Q/a0ufYkb+PWlwSi1sCu4VpTx8P+cVI4VOWAnIUfs83OuNaLq6kRwjyh50Jfe7dbv/SWApaohNS373ccWuo+PYpoaYx2D1dMHx6xYlqsMaFNBw1yQV81lk3vvBa7jkA44gaktS7U8Vj9i6QGig==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5559.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:11:30 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:11:30 +0000
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
Subject: [PATCH 1/4] Input: synaptics - enable InterTouch for TOS0213
Date: Wed,  7 May 2025 14:05:15 +0000
Message-ID:
 <PN3PR01MB9597711E7933A08389FEC31DB888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250507141114.25077-2-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d805786-02da-4e2d-cacb-08dd8d711023
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|7092599006|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NauOBtQYGkCnNp31iiYvzEKhrzwZ8QoXwBfTGyM10B7/DiNhZwe8kyPvh/bj?=
 =?us-ascii?Q?jb/3oQlRFbdpkgZE6htJ3qoUVgrVt3rpBm3QSa2/abX+B6rvwLg+h+aqAPs8?=
 =?us-ascii?Q?3NNfr6V91e2Jwa2RAVS9/WZ74euS7p9aFeULUN/6TUt4xjw0uFbj+rbt2U99?=
 =?us-ascii?Q?QB+AViuYkYB0Vr+G5RUg92DwW3Y5lHL8KowaB3oiRTYJLtyUHv9TgC+yNQCW?=
 =?us-ascii?Q?jB84ErvKutkYDgzWPyCeUp2C22vo8zhHpJsIJK5BHyQTjxzQlHuS28bs3JzG?=
 =?us-ascii?Q?vFCTZKtQamiN0MX671Pp2kiC80hTL3pB7A4dlXJ/1wc5HSzaPZkW+QD9FD/u?=
 =?us-ascii?Q?K70iqf51fSfckpPjdb2d/RbsrVf0SKgA+AS7Bu80ARTMlFtQ+fq9SSUGoWJH?=
 =?us-ascii?Q?460VT34FbFvEFsrlAF3H37tgiUK+q9rOiA8MMUs7P9Pvz15EiBO96E0TiI+k?=
 =?us-ascii?Q?dafRoG51WWIX5jKUv9HeZrqD+gP4fyz/f/n1XU+aNpuAE2lv+rHDtRolJ/Xr?=
 =?us-ascii?Q?aq6u10AIOyVN9Y360RrPoIiftsUkjYNydVHVr6ODUmHrYW5J1F/f1Y8Qd7U0?=
 =?us-ascii?Q?eRqVIbiJdRArjJa3PHL+lk6GUOBOsSb3byv0kwpOdhMRpaDmn9pmb+bZ0fS5?=
 =?us-ascii?Q?Z8HrADB4MJrd+jwLjieOJQTRtRtpnQQHfoffpss49ZVrpOHKeelgLGmI+srk?=
 =?us-ascii?Q?30vcGWg1/Cq35L76lFWTsn0ceocJbZ7NzicPn/aG6LRiq1hwLfENAqhLGKMB?=
 =?us-ascii?Q?qHXMIFrhNAyr6Tx5XMKjQ2qZ+BLMfN1zAZ3nrH136zCAwFafwBqdO7xMxctR?=
 =?us-ascii?Q?roEpQzgBAXPjqPFTMlJ+sp0OEYsFYMmvLT+v98HDOmvJf161sZLprOjEqfq6?=
 =?us-ascii?Q?jSkB4wvXVSLst0BNlFPZR1ysmZI2hFww0FefUr1pl8kOcmHieDXFLYIXnPMM?=
 =?us-ascii?Q?sPz37uCjCUhMrtJNIMQHgDWeCkwZTr7aSJTHaRzPst65kdyG/qEOXBLDVurj?=
 =?us-ascii?Q?c3wSs4W44KV72HgXYpi1qzLAGnDce+HoXhGYTZc5gTU5j3cYtKRh4Ysgx7gP?=
 =?us-ascii?Q?QIfNkwwZ3oK7qL4XJ5s3pcHp2exU+XVXuWkot/o+lFIWaB4QIIY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jk3miwomYMKzFLLYsESs5+jZjy/XDI7LX4sFOaD0N9AKhdi2/7GefCUaZ+uu?=
 =?us-ascii?Q?reZKZYlVvVh/UoXQaTa5frgqOwkAQPCeeBB86le2omvgHyTyspLtlu5Lem63?=
 =?us-ascii?Q?/JM/+ybUwypD62bPdpXkWwRvqqj21BRLGm+KBlDHXbCwH/R2qieiJCv7VXsT?=
 =?us-ascii?Q?Z8vJ/cr1Pw+G3XApM7MTtsLPmkvPosR1RwXaFTjuspB0QF6ZbrS+/wsV8FKT?=
 =?us-ascii?Q?9744KByza1X3tfELkvMLPNz9wFoKZgq1m+nLDEHZIxv+zg8zAG1Ahv9f4/tI?=
 =?us-ascii?Q?qBh9OduuvT8ggo0XV98sBUxNA0l1cu7ANXGzaPRziwpuJpmJysyrI2e7wzMe?=
 =?us-ascii?Q?4euM+VvUWz5CcUt1HZa0/LROhGQ1XUt73SAeka0X4o8bauMAtgqnGZ9oXA1D?=
 =?us-ascii?Q?H9TVVnXGRRQd5rqJ5rNDep6EMTUWoHqCt69EyxZFas0Ae91TknLL85DSYQu7?=
 =?us-ascii?Q?Y2iEPl2B93dlyenElHXptA56yeTkRCsGKTPdYUAxTRA5QIRlfG2+pWMjsWNR?=
 =?us-ascii?Q?9cVws7ujaiCx2hZDaOkT4n+RzHp8w7nYK6hjk8EcWcjD4dzpmpyMLORwJJvq?=
 =?us-ascii?Q?7ejR5moVn6uPSJTvMGu6CMJv3zaUzfbWQSzR/mvDU1A+w5Vt5gw4/JYYgplf?=
 =?us-ascii?Q?KlrvhnOV57UPaUTfZT/o66RnQZN2gQW48OTwBoq+LhYVEQpx9bWyPWZmxSLR?=
 =?us-ascii?Q?4dHZ4TX0KUZC5ZpIdN08SJPaXLkt2QWRcHxKIHww4rshPrbyUOxSUqcJwu5s?=
 =?us-ascii?Q?u9dFVVgha9UoBLiTAfaCazs9A8QLlxdap2VdzdNrg2okFxg6bbVSwJhX/vAS?=
 =?us-ascii?Q?yAonmO/KKnyc2YrAc2SxWK5/er2901pAVCBalvVeFwSU1nIezsU7NDcQ0Yxx?=
 =?us-ascii?Q?AZpCes636ec0f8SHjk6PNatAKgkE6NpeaFAkEiOUhOwWT+0HXu+PpwrUYzw+?=
 =?us-ascii?Q?7lMU4hMGxjq+ab94A8q/ZLEiq5inbd9KsUCW1NAwvVxwjbsfkixs0OwylAhu?=
 =?us-ascii?Q?ZPoG+JChZmEcNRCa8ECn08ovZKvA4UJby56qJpPe5obZmf00L4rlfcPHdvay?=
 =?us-ascii?Q?xwfWk474Nc8ZUl5/JERSBjSYky1QBroIiMTZ8A16fCWAq77Dgjw31hRBbf6Y?=
 =?us-ascii?Q?MkmDeiPXVeRR1yTydiXj8Ju0BnXg2EjiMsPdvUos5OmlD4Rg6NeKaIE462SB?=
 =?us-ascii?Q?uUwhG2O5oeeoNotALr99KR+IdQ4hIFW5C7ArWn0tS5fN7OqxaT4O3jJts3Y?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d805786-02da-4e2d-cacb-08dd8d711023
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:11:30.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5559

From: Manuel Fombuena <fombuena@outlook.com>

[    5.989588] psmouse serio1: synaptics: Your touchpad (PNP: TOS0213 PNP0f03) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[    6.039923] psmouse serio1: synaptics: Touchpad model: 1, fw: 9.32, id: 0x1e2a1, caps: 0xf00223/0x840300/0x12e800/0x52d884, board id: 3322, fw id: 2658004

The board is labelled TM3322.

Present on the Toshiba / Dynabook Portege X30-D and possibly others.

Confirmed working well with psmouse.synaptics_intertouch=1 and local build.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 309c360aa..753b9991b 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -195,6 +195,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
 	"SYN3257", /* HP Envy 13-ad105ng */
+	"TOS0213", /* Dynabook Portege X30-D */
 	NULL
 };
 #endif
-- 
2.49.0


