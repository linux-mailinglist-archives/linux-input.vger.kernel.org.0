Return-Path: <linux-input+bounces-10621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119CCA56755
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 044867AA557
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76BD217F42;
	Fri,  7 Mar 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="c4UCmb/W"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38DD2066F9;
	Fri,  7 Mar 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348783; cv=fail; b=qy68q9nnDsjmjdtSQIaew4jDTPlYoq5xxUnahNw7DmbXEnkHvVLogUd8DSenc6gRImxsX99H3bYW19Lhvd4RePZs4B51hnFcESmcElUk8zMzJQqeIcEGCO9G2K+gev5Vg0b7w7LdpyOKbs/phAgm42b0qTnHh5FjGxH+KEY2lzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348783; c=relaxed/simple;
	bh=WHUUh7QWuN55HvSFusPvS3TggS8reqD8qwZ7Woo7cyU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sFxqpB2oJ2BzHl3u+2UA0z2rGDpOjzjtYUFdirLzc+d/hCkZvR1wBZF0QnoQOxMaBCI/fUC5EmbIhxP7Qp7YKAG7FXBcwoY1zsvi1zBRMSyPV0zh8kELZcfzjutQz73pjwACXZABgB/2qEHISsXXzoLScmPVpyqzl/pedBPH9u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=c4UCmb/W; arc=fail smtp.client-ip=52.103.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PX6BEgwTRFQmDYIYqfVTBpECmQZedgsu3z7hKs1/dKmZiKXf3u57BOkN6Yp8We/hzyrD24guXhDj6XjQGaZXdz3cABp60Wq0kZjY7BhD+BvYORVVoBr+rDIgsiJsSp1H6sx72hL/B8wLb7lOC+CTnia9KFtuHuozFy3SDUSwv+uCI8mKPU9XTd1+hyJtC9SycsmxJQwFOg+Ce8tIPkWB0hWIRqGgINZjkVujT6qwhglw9K0D7ukDYN7iwkj+k712P37OW2L2u4iWOz/rXSC/slH6tKAa3kScNvywnfDRKsoDVVPHuM5EXwnhMkdGZjw/94cyTakl0itr3uxS9rEVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfURnbVasnG66phUTNDFKcKrWjt3s/2L+KXYWRPcngg=;
 b=I7fGHI/OHx0BkGpLOZNpQSLFKYlGWV/EvCg3Z/xX+Utd54mGzYGmO2QfqsxaHw5QzLe9Q9sJOSTz7OxPwMD5kNX52izjpz/ONmPhdtdpOe9MhA02oTwjm+gqoWYw/+CpD/WxvneWkJTxdIJBoDK9o7y4Z4A9PdyakFpnloE7A2q6BzMZouG526ZgeF9te8kYbDRamWbHJRUM/CQR2ww7ljzre0OFaj+N0gYuBiNwza+1r4uWRb0Bh7Vr/UyKL6OAOTPOKC2KOMeLFYd2QSFZ9Ez/p/L5Vl3xlaJY3eeOgJ4/DY4lA+Lo1fGFeh+ol1zKePMX7Z1fo13xCArqkhqJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfURnbVasnG66phUTNDFKcKrWjt3s/2L+KXYWRPcngg=;
 b=c4UCmb/W4zbmdv1r4a2Ky6dBpzbT2buISMkm0mwrDpW/990PAJ4sXnvb7vajYx71YpTW6KMOo1mvm/KZv6al2JI9N8KsUODVIuVUmMrEjKFEe7KJXN56d7itZZEGk5iPKJTy2A7vBVpIwA4r/5MMW1W5RWDHzOglXiGr4u2X5vy7AwRw3WC1To3CtGkEeI74rI+XAO7bM07s665XzOLVZ4TpClq2v+2XYE+683+z2ppZ4DAJ0GfoqyOIYl+HDXUFWWo68RKGdBzrPzKSr/cLraEM/ZAUpKVslLxtiUhq1jog4n4+nAjDRWnK58N3KjI1FAXk+X9o6J3LuJmc90lkOw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10324.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 11:59:32 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:59:32 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jkosina@suse.com>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 3/4] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Thread-Topic: [PATCH v2 3/4] HID: apple: remove unused APPLE_IGNORE_MOUSE
 quirk
Thread-Index: AQHbj1hjsF2yEwn5OkGqk3x3FQbZjA==
Date: Fri, 7 Mar 2025 11:59:32 +0000
Message-ID: <E53E5129-131B-4AB4-BC38-A6A2EC1FEBE5@live.com>
References: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
In-Reply-To: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10324:EE_
x-ms-office365-filtering-correlation-id: 351633f6-8edd-489d-9d0e-08dd5d6f859e
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|15080799006|8060799006|19110799003|461199028|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rxskW3vFZMeTCRCtvDPrAmh1FR4fnfAEajsW+kqn9sB8gFcZ1Uw0xF6voq7z?=
 =?us-ascii?Q?5QJu0n/MC9F0dtLjvIBkN0ZtZHFAidsNo6TQZhjygL1a/UuktU5J4BLwSlQ1?=
 =?us-ascii?Q?ezec9yk2ACS8YosQ2MD7Jpj7LhcCRiR9GmKyb20uQ9WNBnG2mSVxDEXhGznB?=
 =?us-ascii?Q?ikYtEhM4v0pURBKHJEQd5gumJiLdZDy+x+o9tKrOVK9dpzQ68PcrGZSaOXWw?=
 =?us-ascii?Q?OP5GYlhy1x8Y9P0z11r2NgIFFdhjW5FMBs9wjDbRTqupZRkq3VO1E0kWnxf7?=
 =?us-ascii?Q?WalEUJyW3v1XTCpLgz0ImixudpTbOrHR3mouTgtPSyi0ApDVWeOyw4TCpb9s?=
 =?us-ascii?Q?WvsH9OZAPTrltqJh+RsuZ2kycptOZODjl85fJYDurmwm/YvbZ/oPVcexcdI+?=
 =?us-ascii?Q?+fdvcPSRxPAKEC/zQx1K85fpdK84P2EvGN+sM1w7Y/4nY8BYLh22sWsT74cs?=
 =?us-ascii?Q?EpXRzf1YMSUdy7RpZ/N/x0LMam1wrltO2GBjTvlXUKySD5mXSkpPBBf6B7xR?=
 =?us-ascii?Q?0OfOh9LpySPYzx/29FcY/OlelZ/wNtuxs/cAzfEhxbO9m+9SxNqGqAb4GO6X?=
 =?us-ascii?Q?5/qrCQOS3HNhTNa39DRohV8c2Szk959tUafRgp+UNnVIezqThwDD3ibgyraY?=
 =?us-ascii?Q?BPPwh9FMnUEjltLys4dF1bdR+r0vIGrJe+Wv9jDqHb4RZvNAkJ5hf5BFAYc2?=
 =?us-ascii?Q?kdNZCEUBQ+Iq7WcSFPOtz+lt9Qy0oPbhaukuVPZB9Owt4DlhDgIsU8xvndtg?=
 =?us-ascii?Q?FIwskmHFCUszHtPq/Q1rqprqWjR4awPSqdD8KKfTXw9jnTo+xl6v1zksvpHD?=
 =?us-ascii?Q?x3H0EOBmuKmZknXCROrzvrI18rsY2sVYWXNKaniMLKv51Y8RIST4r/Gcbf8K?=
 =?us-ascii?Q?eTPPC/FtTSaDeZBysIiGB1Glwzkbht40H5qdmnHoSbk7XffhxPDoCPS3Wlph?=
 =?us-ascii?Q?pUQz4kBtLExT3k5naZSfcX7Asgsg6RD3b85RB409biBmCIgmHVFhwAc/hYCz?=
 =?us-ascii?Q?Op0Oe5FtbdDP93tfA0LX8aVtqp8rKilZqkhw8Xx5PCa74dgegXuEmYVCFuZ5?=
 =?us-ascii?Q?tyqeRrOaabQ/QHW6JIrtLQkoRBlR4w=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aCWhVPznqbjoGr+2rSAvVWyGhEAOVrMIli/ZIO9LmQvDkz9kHrE2B0Gl4mIR?=
 =?us-ascii?Q?APjiXuAY5UiUYHi2nYyGo6iuCjHIu9dRJCM3fIB6XgexX6i4D8ELBX4AFmIa?=
 =?us-ascii?Q?6KmgfsDRLsapbhIRhJcbdcdWScXX2Alr3pP/jwv6drE53H5j7Y5NlpGuEHnr?=
 =?us-ascii?Q?HdiMmLBTkrDBOP70WFN+R7zgJHiBWH2uNwEQwilr1TJY7wGZGfJEiGJINTj5?=
 =?us-ascii?Q?ffF0gnePVbLodIw+Nepe5RUMbgXUU5KFSmwMfz1fQ41otV60P1z7hzEUo2Ei?=
 =?us-ascii?Q?kCGejEaOPr3PNrgx2Iev4x4m2oEiYeX5Qf+aCUOjFywI8tEpxlSrHKdkiZrg?=
 =?us-ascii?Q?ht+r3KzhxgHt675hYwwbbL+TKK0zXYtWwPagoY02dsJAe5UP8r/Fx+j4wIYe?=
 =?us-ascii?Q?2y1sevE/Ps0VXTrq/GNH12Fsbye4mvr5rAHZ/S701KpI9wY3F2T9rIH2bvq1?=
 =?us-ascii?Q?MgOi8JhOiIaBxMv37FfgK6i/cSo0e/cBn/DUVP0+qfiA10cdigF3LGQtB3AI?=
 =?us-ascii?Q?EcOo5InEEobiqpaZhBndUxmZtIo5HKOlv81iBiUVw3XBqpYtgUSUvDrA+trc?=
 =?us-ascii?Q?qKqhW8X0tz311tuay7g/uAgf8ju9ZNH0lM/CbILwjtxT2Df8heKobe2bmmbP?=
 =?us-ascii?Q?7paJitTO6Y+hYtUizpjqgXzA9r9O/7HYd4os4Afj2zNCudWescsHnwCarQrK?=
 =?us-ascii?Q?BZcaJFF7roVf1D4ivLf5wMNhZLfDcfzGdfrzvbRCtXctUM/RGX899EmCLFnH?=
 =?us-ascii?Q?Fyq6Hnf/IKSxGFDgt7CdBWoB/0aaV918SbrerRSMU2NbLmmeOAPcvHinK46I?=
 =?us-ascii?Q?Q0zxtY9SR7zed84gQrTerp5HO6Y3A83uydSGaoXfh8O6MY1tYIxAIHpFevAU?=
 =?us-ascii?Q?aqjG6p9JvFFnUWAM52snwV+R9TduUAnLWKt2SnWVA3LIbZyPW3RUon8Mszp7?=
 =?us-ascii?Q?luC6t335/VaorNqVtI2PxB+CZnhFYuUMax62Z2PMVXgafZA95M/+63VX/mRS?=
 =?us-ascii?Q?1gDKEGbPgVROPAC8EB+MBS2xZb9W+NtnitmCPyrRN52ZMZrf8m1qlA+luC+n?=
 =?us-ascii?Q?jmBgZYKOjhI8/pL6ZfHefnOvNjhYay1J6jHz1eZneWaOwXwkdYJoVQpCcnbE?=
 =?us-ascii?Q?FKtvhOfcb1JQWRZwmiY0mRIL22jlwk4rK29F29jdgPo8LvLNYbEwILXiENrB?=
 =?us-ascii?Q?OOZjhsqrWnB+XEt1MwtCBr4+IvSIIThg21Ewg2kXkXanDQBvNhKE+1px+ULQ?=
 =?us-ascii?Q?zvtdXZM0NYn5a6KudMk9CYfRZkc6aAramk+EZZ92kMJgz13K92v1aBpmuy9N?=
 =?us-ascii?Q?Mk0cwQiNaZ3PQ5dZkYECt+cD?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <99EC3F8BBB408E4A993E72E832B8CD80@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 351633f6-8edd-489d-9d0e-08dd5d6f859e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 11:59:32.0381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10324

From: Aditya Garg <gargaditya08@live.com>

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
=20
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
--=20
2.39.5 (Apple Git-154)


