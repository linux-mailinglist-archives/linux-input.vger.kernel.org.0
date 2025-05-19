Return-Path: <linux-input+bounces-12434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DBABBDB8
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121923BE123
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A2427876D;
	Mon, 19 May 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ixEQ44nl"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BE278757;
	Mon, 19 May 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657687; cv=fail; b=DcMtXGQ7ytSGFVFeBliwxn99WOHdd3M3pWImurEfVBU58s0LZivhX4FLoXKde2xUlKp7gufY0VOValy64kP0DdwD8pPBCa0WMBaE1+T36gtF1U69/x4+1e/swhsiWg8WCgvhiRLlcnezygj7SYWrfdGhsBKvQ/LVsttUmS0YuDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657687; c=relaxed/simple;
	bh=SI3kxE2sPeCpASOtvRaFl/tUZ1PHixhGedqocC+3YQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s0EhIu2qMcE6T6Pz3CVLAsvE8ONNczBE6lcE3nUk6rU33wx0ito17zIWT2QW4unyDPkJTRtBgxEzYSV8WGp2LLFl/Z5WBOQNWHalRzLTbLUAD4fKZrEVkswpqiAXPaD87NsAvf2XeA0V/SnRQ3efDfVuGbEivSxKJPMIPvtuo4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ixEQ44nl; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3dm04BLyVk4bTYMPE7u0WhhyOiiwk9ptlv9r1eXqBi6Rtlp0TzJLt8FMdkyEnUO4euS6xeviq92GUQR4bBY0K8avBghWuuo2CTqju1tY7cd2Ks6tJ84ZijRhsaorHOpnAXRTZsAs49kvSCte51lAIWx0I5C6lrYx4/HVK3uzREK1fnwfW4zpcnIIs8bPhs4Sn2ztHL/fOXxSQG+fT3MbFNphH9yZFfNdXovg22ID3JDZUUcoJXjtqipFei9SKR61XvUTY9duiJmq8TrsPHSYGFGO3j4lRme4DWOjMkNnu7v12J2uO6HVKPSgLfVB+lt2bmeEya+pKFdI+4bISUpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoWY8zXwhBczKVsnFzJ4+pT8c3fKb6ZjLvy8+IblYVg=;
 b=tt/ZAYCPaKGd+a4KNSxu4TX2Ys1Qtt8Bn+kEkDSIb/uOgKVLboWDQscVAT29+DEttqTaS0vIvDHArLGq9BmbqItrbwGa1uMV+1OgdH7+TiL8RbWLjFmsDJ8w7G43fj8vh0OSim92znHDvwKcsipBKoNiAALpy6ptYV2QyclnCm7KOnDIeq60w0RqGO5LI1CwAUKme8ThfR5xa/0Dz6vKmx/ZJ3fc3/d9jmMuwhP+wl2SxzEatFetV3IaHsrslZ5SQRGC2wqpYCi0w2Vcx3ZK1tbLejOBL1pKj4EmyhuG++Z35Rk/U39h3rvZzjq47Cjl3pLrv4O8sRdI6ZzdFz+Rpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoWY8zXwhBczKVsnFzJ4+pT8c3fKb6ZjLvy8+IblYVg=;
 b=ixEQ44nlLQsiUJL3UUwNI/YKX7XxRMbicoNeRmiuknj7ywKivW56Xh+ikdIln71p2mbLGIK/xzlUSJgJCnemlr0FbJDCfg7U9hpXHRKXLB3XPW+aS4QnKRvRLNBmYuedfmZDNs5jK/YF3Efa7qHh+8vGwIaPK75BN/VZe7q00MttIOse5HZvervVUzFb8ak9wdaTsOE/QYiotL/Ydm0wiWjjeg1YpIHEqTTOyq9P+g7VavlnHYOlVI+7RoncJP2cfbJ2yyRV5V/I6rhoJwmzXLaC67IREekLpGUT6RxieA2itdVqB8TqLGbeeUUrbc+xyaPJz1BOrgKco7ByijmdGA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:27:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:27:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 3/8] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Date: Mon, 19 May 2025 17:46:18 +0530
Message-ID:
 <PN3PR01MB9597520BF0501C351DE1F7AAB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-4-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 082ea6ed-b0e4-445c-3fa3-08dd96d09665
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TV79KLUZXH6jYsApOyagGvS6O9lHRqgyvVpKNJHy9XbNXBenq1fCcCrKyErSXX76LxYVrYyS1pwW8Z9pmPVHbFylaME2PG43YYAy5HLX7RNSM7iODz83411y4jo0aKGWxEfzCNA/4yyoWT6BCYzWjh8TRGK0je6ZIoaE7PXqwaBoZ8g/kLIlLM59lJqImtpEanSojU8WBvimJBcgryASb/spJ6IXGbBJTdywPfec2CsQLJ43AfjpoDIyrlNLJsF+ze1crOrjClot4d6OFJt8rMtQE7Cqejz7JwPnaDPBT3kNB036T5R1JA9HikQ0aeNiTDdHs1ZryNOwGUHaayfrK/ofWRwP2OXTpWIKCpoLSVCJ8OuCq3c9dw/tYr0yeZdDbGQ7yyGY9Kq8ixTjdE3xnBAHlQbE+i3ocsl0MIjEeEBL2pTZERONYZ+7ALZNCNTOUX1TqtirkXPILLeBiphyxvOpX6UKyP8rz97lqD2zadIkZ8PweOja0MBcIqiVsIPqyg+Kcpmg5lvIEoq+HpS+58oEmMJKmeeKIIngopSzRyhtDl/n77EKoRptvlDOBPIWTJSjvesM4W2hjmjy8VE1rDs9J7u/EyqK0ncL6pEbW528yxxkaK0/9bbLTh58LRMqNb/kAzK+k+akNWvA83ZQKQ15bhwHZjja6prC9i1EidcfVtaftCAUouVRfHEWw+pmk0OQgl5RdI+cmAZBWxj83o6DDiSV9b78n1fKE406jEm0geYLQMie4i8v3jkblVO+GGf3i2zZnZVdLDM045SIAsaUcSMkIrQcHk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TS50AlMYOFOyZsPf3iUnVIhPuSLm3XgsnywqSuG7UPnV4fwSMK6vT3xd7+Tn?=
 =?us-ascii?Q?CkUcRXxA1eNO9falg4Xx7OcHSu5JtkR3qIavt+C29pcvB/Rv92Dx0DMRWD5Z?=
 =?us-ascii?Q?T/v425mpOZtK2NUrZSYS3CohEa8qmJMya+s8RkBjaf7RybRjxJ41RrJJzxwv?=
 =?us-ascii?Q?d9MbTERdrsNWAz4nvjcxe3o+73Isl6QnylvxG5GYGSGMDU5GkZ1mYw1kEjbr?=
 =?us-ascii?Q?zOrkbVp0kWP/Zo/oO8K6X0b6OWQxFgXT+eyGGiWK7Rm+o6Sp565bWg8RDKFE?=
 =?us-ascii?Q?0jTtDEEcP85er0L3G34YrjsLKJhvZBZVDr4W9/MjhH4T83QdJ+Iexo8u8lfd?=
 =?us-ascii?Q?hf1FPEth+bobRXi3hk4mVFypClAyzF73945rgxNWtn9yTa4bWv8UCM4nnzh6?=
 =?us-ascii?Q?EEiuC6KCw0vUYWLr6GUrh2Rq/D6CkCzhxGnCkgCINJ5ajrLmc1MESZVmNxuu?=
 =?us-ascii?Q?PDFiyKLEq5cbcjVi2PpPHW/B2Ckz++31xl4YawSrRiFa6j8iDddqwqgBubEf?=
 =?us-ascii?Q?vxJC9sFcEB3P3WYmrtLsDbmZgRWPrBt83QCvqQinDi1ETiga7ptYdBm7kuDY?=
 =?us-ascii?Q?Yhw0HVMNTFOQnys2mRPIHPA2PfyTrOOPF1MnKm9RSP9JXlXQVfihvGULCqfi?=
 =?us-ascii?Q?oVckXIwXM2ksCmJ/J1h4+CNWJ4+XZFYUVWeYmcqsCt/ZrfBDCMI9qz3CRi6a?=
 =?us-ascii?Q?8/EHVOxBrEyIVC9EuvG1YvNrzhB7c49rZqqgWLc+0aCCTp5/K6XTY/JIowsz?=
 =?us-ascii?Q?IkZlJ1dEGonoBpoEjyc2xFyeaoPkjdXZR1Brt1taPWSp9ZWYvV/gUrPWbkcI?=
 =?us-ascii?Q?+VhhbkEj76stnG5KLKgmiyB3RQ2Mer+5zRP0ES6hvjpNZrriz/j3eaEhbkzh?=
 =?us-ascii?Q?Bcie/mjxwwrdEYiSJ3r+bG7VidMXaewv3tO/7Jm4zTK98sVroSBPFZTa+PYb?=
 =?us-ascii?Q?UuFZA3pwuuraObZrhUEKu/qwph9AQvdnIBDKZCKW6dJ6PVVmNCWeqNvvNl2N?=
 =?us-ascii?Q?RmMhmV/Mt5XTmLG50qFbgRfJ9xp9iPHQsCpJpddyNlU03rj/Mgh7lCZq5adE?=
 =?us-ascii?Q?Qt3cWdzzj2cgPfhcaMV5q0jF9evQ9TIXlr5xWyJ4mMHORVabqCI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P+OGDZjYEuXvknaRvmjvfC5gC7odkS8yALuJ8RgRyAHJvKgrRaPWHoTuhnEy?=
 =?us-ascii?Q?fyybEundjLQjnwx5xmmGjR4G4GQOfOPeTntfa9RrGmbKNrVGuoJbLY467d3O?=
 =?us-ascii?Q?tmfbJNxKz1x93AL2tV/sYrSyEHmR5EVpazdzA3g1GeaMFfLRSx+PQ+MkS7vC?=
 =?us-ascii?Q?AOyR8kOO2wocnU9sh2XTndiOnhXhQrLAkCdTUvF6/0HaVPW0ddPO4AlGP6aG?=
 =?us-ascii?Q?1L8IdD3N8cTwYsuFm1HN34qZATukJAvNckFzz8SmTh9T11iNFr/3i+PbRQb+?=
 =?us-ascii?Q?xXJmXAaAxi/oTuMYERAgqHuwU6Cm9EiBcC3Gyf3aW6wK7ERfNLS6Pi6NUvkJ?=
 =?us-ascii?Q?TKkWJECxLl4GB8iztjIhsti+Wo26Kk25BCgRRPBEpr1M+h5mnC2q3fAox6Ao?=
 =?us-ascii?Q?AqJWSP9gByK+3n562gRkZl24wJK5zFI2IIYmaSDAxeXu1BXDn5s0mShYMkJw?=
 =?us-ascii?Q?jFoR4mFety9SPVOvc3XyjtPdj+B5hvVAFGCaPjRRlp9X3sGYOywmyLA8gVRS?=
 =?us-ascii?Q?HCkBlHpmBFMObxaPiIwbTOm2+9mECSasaVzrCoz3SVZe1xM15KylPhkZgrTt?=
 =?us-ascii?Q?wS2DXPnYTMUf66ilIuZsr4+rm1MqN78koKPQl7+32EA5icCJf3mkeglCFcmP?=
 =?us-ascii?Q?ok3/hsftBLS6tfcejUR6bkex6wHpAwZV8YAgY5BnStYk8V+8u/bNZCCGwPsL?=
 =?us-ascii?Q?+4OvB4nolmQC13KLX3rfkUS3Qm1gSWmi3BlNlIeh2ipCrpX8X1gBIAs3p9dl?=
 =?us-ascii?Q?qwksEKmJlD5PzgTn8FbpC02RGBWOMaOTKkHpEWr29aZSdLHL9X0tdNLO2FSH?=
 =?us-ascii?Q?7SgDv1ABET0SNE2SYpRHMEpeal3lzbA4XeNCOebXVdPEL6VVdlJ9gpbBq+Mf?=
 =?us-ascii?Q?avRllhpk0SmzQO4ohS+AjwIYxTNNzrSh1vtU3+dlCkJG9wnd9T4F4O1wCsx7?=
 =?us-ascii?Q?LWzUNKfi3EHChEL5ReUIMHg6W4ffKNEMWCsKT2/8DYRAycVP61O4IlZ9WwES?=
 =?us-ascii?Q?LvI21ijBgDtkmvoqIk9tVCqlO3bqJdO1C7WIJRqTRDChGrf67jTT/x1t4Vpp?=
 =?us-ascii?Q?qbW8woSZJeQhmgi1PrJRsepeO4UZ0ylS95u1HsmgbF9KV91E8No0h1qqpu2h?=
 =?us-ascii?Q?2o4ZYeJPxXTB0JjFQGeKPnXqfVsnGSc+9W/kqB2QuX7uoInbAQFzyvk2lxcL?=
 =?us-ascii?Q?GvRTM6ZoeAkxX/bfUYMbCEZu5p1jA1dj3U/BBqKL5eu4C6MgRh6xlgVQtESL?=
 =?us-ascii?Q?pCO3UU0liPCJoq+zF0tI9DyuC81U+BnnbW7HL6g8FaabNU4LvNup38YzsmOW?=
 =?us-ascii?Q?y7U=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 082ea6ed-b0e4-445c-3fa3-08dd96d09665
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:58.0280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
 
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
-- 
2.43.0


