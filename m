Return-Path: <linux-input+bounces-12206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC79AAE2A9
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEEAE1632DF
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C0728DEEC;
	Wed,  7 May 2025 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="TsuApM0i"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03E28DB67;
	Wed,  7 May 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627106; cv=fail; b=OC6ZDFUFpjwkb1XCkcUehcIM17YG/STFOlwECBlbG0wxOIc2qZmGzFo0uuAO29tbM6z4Em2PyXww9eaGrfHEwbwB7xVZ+5g9oNt3lcaSYTJn/NvFAQtqIlowKI06q2zjsikJl4uUVGsnf6+BP+Uj7ttGgMCT2PCVGG3VCGnBmHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627106; c=relaxed/simple;
	bh=Qho6/7/YhQQfGSr48Widseof6AHC2SGO+PJWoLdEuac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r11dexfmGgf5GCIjE5Wk0pFNxx9L/HQhubLCFvVu3PiFaPIjNaZYXqYPPu4YgMB20KdIYZTEP2pq/Z6xYWzQunZR8M9SgBlAVfhdpwg0hXcGyDpAwjefv9SH7GGMX5ojhVHQWEQNof0y1c26y/tYp7kKmlERfvRSmav5TTgRIbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=TsuApM0i; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK38ld6SE1g3A/PlV6wEpVSfifPQvCSBP8IMI94K+MNGnUo87/wRfSMLAiNof+4dMGF1aMQyMSmyIoxgCrX5VTgS973WSmVFJMYYtegY5sWAFA37Xs1wLbTtifYfG/l2wa2ivBshS5G4ltt27E3jlugmshJYRjPQbQFkPqEgmKX2m4TfI/2eNI9sc3fcJCnOIujj9VVGpdmD8SHJ7t5UWS64s+W47dVn8eXgatuuL6C9h8yAa0XYhpxg/RvgBZz/RcesZM85p4EJbxJxeAaZehalCnje7P3eqzEXcySryuvc+zZrjmYeCF81wL8+NXMopUEsnaITYPZ6rzqSSVpqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK0ybm44yG7h80cW+qeMaK1PInY8fgejsVq7P8BHUCY=;
 b=Ul5ZfwuAADuKblQWFAPkqn4LWOU9okEbwTfFA6pAiMh7DnHBFj6UNBHgQR9fWSJqsaG9yEeVG5RfDNLNGY3uMtwTAop83Ju/YFi+uOsdKJZnI2JtrXmhvT69EVOBRJc2jH5t33/OyqKOYrYSeDhBNnJ/6eqLEyEikYANYQ2qWnEVowRz3ii/LOAVzEvoIeMmlFb5LZ2Y+kD+iwiNre3x5nN+m86M3uLMoNPVf1J5ZgZHdnOE9AEgWjpowZ62zzzb/4C9XDHiFV9cK2oJXFdavltw5JYxwhxa/bRsXEXinYLgisPWnyNN0kiuBsz5IvhWsvnsmCU+B4YABzxlTJC6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK0ybm44yG7h80cW+qeMaK1PInY8fgejsVq7P8BHUCY=;
 b=TsuApM0i23J4HA3HlH80AWZBS4nFitl63GtHz/KHfvcms8QjnXzJK3ZgIpd/qa+bh+pnwZOqYid0Mh/9mJq6PfMapJUQnz5uoOVCyDjSCpJXjuwCO788eOBdLcM983R4pfHqc0mN3lZS/4oiLb/KJvr3nirK0USh/mOLD3voppfWwC9XXetLCv9HisYZ2VhSrmGCaxtzhknFRIKpfrCIS8Synw74D6iDIBddyskLcvd23rwhLUtgIbB+u4A72nYKk2N5C8BUimTIS821GtlIoooelGDyAJbCpSZYDQOwILF/Xtm4pH9eWRhXJbt3zwODJP/QxagBCXXrIhY6AZcSAQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5559.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:11:33 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:11:33 +0000
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
Subject: [PATCH 4/4] Input: synaptics - enable InterTouch for DLL060d
Date: Wed,  7 May 2025 14:05:18 +0000
Message-ID:
 <PN3PR01MB959789DD6D574E16141E5DC4B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250507141114.25077-5-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e497ff-93a8-4e45-cf2f-08dd8d7110f4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|7092599006|5072599009|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J/YxrlCg5DxbrqUByVP/yIQJ9zcKpwA51Vgkh+E2sX9ihI6RcqIpl6xw22VK?=
 =?us-ascii?Q?nsl+X+ndBTTfc5xP3JHshL3gaGAz8r8FiwKFNdOI1F2jDjxUicVrB4G5ZyoT?=
 =?us-ascii?Q?qglCsTsTBmGaTm38t56AyHRM2cbzsO1fJ5VfBLPaKUpVrYYWUNTer7TO2xQP?=
 =?us-ascii?Q?6w59sB2++n8hwakBWKIju1121T+1TpTPv6jusgk/DulxN1+wvXJfN+bqGHM9?=
 =?us-ascii?Q?85Oz/2lJM9uGJUsrxSj9T/zFbsWWkkRMWVpS+kDBNhPdDoMdv2L3gMbHZJrI?=
 =?us-ascii?Q?8RGCmO38Cl8KOx8Fls7IYUZGRv2oBB2nPyoaXRbH0/svdZynJTCZFpHubX5P?=
 =?us-ascii?Q?91Qw+x0G0qjlbhlrffKR23OgiUyx1Nn8ol64zYP78P1U3ZARjsn8PlAwOjwb?=
 =?us-ascii?Q?lq7UX5VSitR02gbcHDwSxQ1gxjf9cbx1IhkfX4OK44NZbjsvlHMgUXitWO2a?=
 =?us-ascii?Q?apbecGHvW/836GJ8Xrw9JfDv8/VsiP/I7yhs7bXvfOLmc1ku5wLFyO8tKWZu?=
 =?us-ascii?Q?yFbZY1MvwB9ykuHGsLhsVHKroX7iAMXtfuITMaWhSyAxwzhOOzZz9ioZNvGJ?=
 =?us-ascii?Q?qB/cP2mPXLc93ydxDiCscDAmu9zDuX9bvqSpTRS4Aaxo7XXHP5puYj5ZuIO2?=
 =?us-ascii?Q?u41ITKY34Df94x3gOZAYY17oMXdcUnuE+zCYabqviUgLMT8zclvqAvoHoIbz?=
 =?us-ascii?Q?UmxFPn338UunbHlpXNS2eZh7AqAqZERYPLsmuXPju3BuH+g+qcuMtart9gbp?=
 =?us-ascii?Q?zmpZeU2om2gKAn/UQrNmKJjVT0odmk8eQMyWnPXokvKm7PsNQBFU32JUORdH?=
 =?us-ascii?Q?OavKHRWy6WlLKEewKjeS5k1kURXik096woqQKRnPQ4wPwhhPLgFU6ang0cxX?=
 =?us-ascii?Q?/aP4/XGgVZP1dtF4olxiv5uaQCTkAhOUUADcplBTPtKiDp0GasUPJ494dixx?=
 =?us-ascii?Q?ZsiBBa0dZ3W7mUWzTA9wfkVIh+t0uOJSJYPxWvu/W7bQ+7O1ZsXXBgrAuRMi?=
 =?us-ascii?Q?NbuiS71199ZpjVP7T3vXyhfwo7cn1JpfM1OM6EyV6Rr0hUnrNJKr4N7P7RQb?=
 =?us-ascii?Q?5SN0pYHr3uBdwXTO08Hjf5jLXkW6T8JCkkbluaDT0IV8cN+7b7PimmG5yM4b?=
 =?us-ascii?Q?a/r+O+QcfQLJrOcaGyPcf3aF9dkVq3iAWuLHNg3vi9cXk2b5LqmKpHIZqmaX?=
 =?us-ascii?Q?zVuBLjSSwLHpnK59uKQY3bdrBiEPTyHtoVXo2tAaPt5XsohyL/UqfXVoPU5c?=
 =?us-ascii?Q?peL9Z+zoH2F7qHrsttLwoGWOrUWlVoRC80yquKuq3Q=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OSgMjOPNlUpcvNXdpBkjMHvJprsDUz1aqoxP/JcMO+V+IbBzxdV0x8hL6BvQ?=
 =?us-ascii?Q?KrYLbrXhXjKND0BwngyaGmL0cXBrFORybKoPzwlfusm3tt2d9NGAVD70b5TJ?=
 =?us-ascii?Q?u2ejNj2eMVhKYWjORpomjtzXV5HefDoojsMjUHtyMYhGTMSTDFf9TWca92Lc?=
 =?us-ascii?Q?LW3HVEBIADcRQ5/4SqBYgJOOOoKJkaELTKN968ylL3GDwNKtcTy/9bPDp5D4?=
 =?us-ascii?Q?tt3wozwrmHvQ9gMRu78ypXqedj6tnQv6odvZo6dCcIkQsdbWekh8LxgxKhCR?=
 =?us-ascii?Q?tlh7IqcZV5FTwm8Jy2DiUNP/O+eA7Xxr34enfsL8wciBUsnZvf4Sd+ZGmQGo?=
 =?us-ascii?Q?bu5glMx9wSc6hstb0OPZ0yt+LC1Ov3FlJQJv3JM/421l6EzN/l7ArhbGmSIE?=
 =?us-ascii?Q?bi3jgERki5m/JSYo8UFMapt0dAcVnnq3yvdgncOo2wys9fV2vaoSQotIP4yW?=
 =?us-ascii?Q?TGXcz82wUDMykpfUbwHVA+Oyy2SURCCGzieoTYuY7xxrH3l9GfD1yzc4MX6m?=
 =?us-ascii?Q?sgEdK29fFEJiLAnaWPFjDmPZTN9zAxSIjjwkpgAwSpeLqni7+ZvaaGePMntv?=
 =?us-ascii?Q?31Ej4FMLQtGDLUTO8C6eqOVKfKptHIHzi6agsXfgyQc5rO9T30+zjmXmrP1q?=
 =?us-ascii?Q?xRQOaZIsZ8cd6v9dHJNTe16E4MLMGUwJ5WViAf2c9vvlfjxUu6YA36dcVOGa?=
 =?us-ascii?Q?/+sI7OtFonoSLOV5SbHZRU9J9iYtNcswEIxZ03pDslmiqzF+6s90dSirmoVT?=
 =?us-ascii?Q?GxP9DzCivXFNDH2Y1rB3eA1pjxoAYKDvk4C7XiXUn6MoL0hkOl0vypEMSAb7?=
 =?us-ascii?Q?j/qemJpNEjzVT3/CiiWPi5wnL0ZVcBC5LbucPqmxBZ10Jg7PLYKDVCaj31PG?=
 =?us-ascii?Q?zERrMtWicxxX9MdWe7h9OWqT3iobR2UYdcVUAS09qmNSbgbtz2WAJfrQvoOJ?=
 =?us-ascii?Q?1PRCwHR9shgvkDXY7Sq7feypa7dIkMw++kx+LwtLnijGCVuqw+W8MNhxU09Z?=
 =?us-ascii?Q?TvuyzzzAVwU/4REtueHU9Gb3dWoXb9/1+01aSek3jZorEfRgfeBdKUNLlvLw?=
 =?us-ascii?Q?HMABa5/RraiWYfHlO05BM0vy39MQks7AaV0cgzprIJ3K2hY/jM7DyMKDaH8J?=
 =?us-ascii?Q?LMo2z+4uGprSLUEHgRfqb1BGnVKKoMRTeCItR67u/LVNY6+ILNWC7Q6e0Ikf?=
 =?us-ascii?Q?MPX3ebsC5FFejni0m/xy/NsJ1NM2Qi0+BvcncE1KmRc7soooCRhnkBO1BJw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e497ff-93a8-4e45-cf2f-08dd8d7110f4
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:11:31.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5559

Add support for InterTouch on DLL060d by adding it to the list of
SMBus-enabled variants.

Link: https://lore.kernel.org/linux-input/CAOcK=CMO2YKouZkDz=9oCfEjeYp-uB51trovG3Wru7J++eT31A@mail.gmail.com/
Reported-by: Markus Rathgeb <maggu2810@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index fd48f89d0..d62dc4466 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -164,6 +164,7 @@ static const char * const topbuttonpad_pnp_ids[] = {
 #ifdef CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
 static const char * const smbus_pnp_ids[] = {
 	/* all of the topbuttonpad_pnp_ids are valid, we just add some extras */
+	"DLL060d", /* Dell Precision M3800 */
 	"LEN0048", /* X1 Carbon 3 */
 	"LEN0046", /* X250 */
 	"LEN0049", /* Yoga 11e */
-- 
2.49.0


