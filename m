Return-Path: <linux-input+bounces-170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F47F2D07
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911D4281C90
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482C74A992;
	Tue, 21 Nov 2023 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SLNmRty0"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2061.outbound.protection.outlook.com [40.92.21.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F89191
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 04:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ58OnxTK04/3I/MseVVKEVggkICAYtc7/7YafT5vJLgLSTKBO04FMmO9Xx7I6ZBXJO1SuDw0Ejye61l/dEq0D3bzXUOHVGirgEEXybzIUt4fmdq+55silzItNjK9aUsbXduyXM4SxPq1z3vUOEt8F1c1izcriY31KvbXP2rVMFgRvSCeL3ekx5lR8LAR2g8CHhEvF0lwhvCmfOoZ0hEN9Jcz3BgAoqebAOkIKR76gqwO6N3r3s5XA2UvbISIAmeegM+zoDQPfvVq5j7atNtiTN5eWI5nCARAFyUA5VPi0dWHD5rHB0k6+vKYs9Wz7YTU1qrwP0+e1A1PUviB6M3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uUEnHiOQWuvB79zTym8wZ7n7PgEbWWXqSjqdM4mGik=;
 b=Yy8Y0Kr2EyDBRZK2ueJetaHS5U594VE8ypL4Nl4e8j+3AVgdjHmm0ErO66qQZ3hJQuMGGINPBjliP+ks+KyIXmYumJTgcBJFMOc48wQVojcx6nqpwIOvpae5NMdC3sRb0nCVh2cB5IC75JvCVJeRAZ3KnojX+7TuM2w1dvZI/klyCsN8Mi0BlBX1Oa+DwOabj6EO0KppdEtHpPetPFYPNTuQaeCa5IvW6NMJ6g0z5Y6IMGcrybvg4B0yd6L72VFMfMcxEBN1/pG7nb8z5Att0NZ5CP7STe1qGCOhJ3SQviUyuA0zx8/eXW95Ljq1gIPy9lXfuqn4K49vnFbjSmcvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uUEnHiOQWuvB79zTym8wZ7n7PgEbWWXqSjqdM4mGik=;
 b=SLNmRty0RWpke+sxog2oB0JHDUR/EiLsfHruVhk1UB0Wj16RKJgFUmdcVGRj4QABQGCnZ0gadNDGnyW+9AfK3MYRnToHC6wGxyuIhKL6EdvjJOQBX8z80IIxzMDyOfg6nLyY341n9ABkLr3gjO2oXHo0zAHvOUnfBo46wIkTbBGBmY8AelZYteGS3fMgmAT61wdYDWK/cswKZq9PwqOldfPRQ0gyKKKO+2EppUeyIeCG7ySZM9EdYnojMNKN673dlViYbwIJy4c6Ti3atnjxwQNknzMluEvmwMy2lHUgh59xXwvuREuKIKvDQmQeb0aovexKUiNIBtb1X6rLoe72WA==
Received: from DM6PR04MB4121.namprd04.prod.outlook.com (2603:10b6:5:a0::10) by
 CO6PR04MB7889.namprd04.prod.outlook.com (2603:10b6:5:354::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Tue, 21 Nov 2023 12:23:19 +0000
Received: from DM6PR04MB4121.namprd04.prod.outlook.com
 ([fe80::3c6e:ae8:ec6b:efb1]) by DM6PR04MB4121.namprd04.prod.outlook.com
 ([fe80::3c6e:ae8:ec6b:efb1%6]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 12:23:19 +0000
Message-ID:
 <DM6PR04MB412153443FCC205E5A9DF20DCEBBA@DM6PR04MB4121.namprd04.prod.outlook.com>
Subject: [PATCH RESEND] HID: multitouch: Add quirk for HONOR GLO-GXXX
 touchpad
From: Aoba K <nexp_0x17@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina
 <jikos@jikos.cz>,  Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org
Date: Tue, 21 Nov 2023 20:23:11 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
X-TMN: [iDnT92PRPr9m+G1nuBYDlFQl3Sl0jC60]
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 DM6PR04MB4121.namprd04.prod.outlook.com (2603:10b6:5:a0::10)
X-Microsoft-Original-Message-ID:
 <7f3c1b358b594c094263ff3b625ba1c560b6e28e.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB4121:EE_|CO6PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 68250560-cf1a-4525-d5ef-08dbea8ca54f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18/bEDbAR29ANkosHxdU2p0pzh8+sLNaxvh6grCKmY7M8g/Mo1A6KdnHD1yD/QmmZMwWur8OPKLDG3m7ac7swvLyFfOryIbdApigonI+Haz/DxpbdQmcy7/9Zb8Iu3/HGXWBvGHT5GWVGW8X2sphjhG6WAeeI6xa4lybKDKd3n0plVr9O5IJilDh03Jfplz04l/4COqJmwDsku3+czb3iD6hPENwJGBWLL/XSxgPFVeWxViyF1xz5xDVoFXz6MeiBdvF5h0DLWWuR3t967+oSTVlSSkg0X1j5EuuZHGRxF2WN4/NhXZd9t+CsV4ZNvG22yvmkHYphwN44ayEojJvInyOhG7ch+Vm3XoZUFDvNsfkdYJqE1Uk+IV7vYPL0ksLsb3X1hc4mgtngJSCpZQOF4fjvX1bSLfoIVat9uLOjo9t8jf8sVFKgAu2rrNwb86j24zJH7FiBjU+EnNdUt/W0C8qKwO6ckxvikv0mh/Uzl6KSbmv+6A0WreesztTJtD8h9zYow3NIE0T5UUQ0LA4Wm7ztvlVQdHaxaBUID7TsEVdOFcdFQINFX47Mgku23dV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGE4eGlxbllzZ2pjTWM0MUw0SnJpdUMyVlVqdkx3VldMa0dIYmdMeVFGSnVl?=
 =?utf-8?B?MXZmODlZejZoNWNEM0RDMnM4QXFBUzJlTWhxOG1yTklSR1lKanhhbGpNY3dR?=
 =?utf-8?B?Q0R3YlV2UUlPU2JTQ1RRNEZQa3NIU3phaWdMUlh3NzhFcEhBSHE5ekhnRFZ3?=
 =?utf-8?B?dGNXRE5kS1FWVjJJdXJoWFVRYWFXUld4dmlzdEdPcUxtYkhBY0dFS1RVMFc5?=
 =?utf-8?B?NkhtZlZZZG5BNDZoRkUwT2JHaUR1RFN5bzIySHdaNDRGQWg4UWhidU5xMEpk?=
 =?utf-8?B?ZHhaZDJYZ0xxWnUwVDBmQjBkSE9pb3IrVkdjTTJWL1J2YkdVMGZnK0llUXAw?=
 =?utf-8?B?KzBIaWdoSDJVcTJSYTJ2K1crM0ZObjd2NVBpR0cwaGRkL2FnMXNqeDVMUEpN?=
 =?utf-8?B?TFpLdFpQWWZvQ2RqT2IzWW5xaWppaEN3N3FrYkljT3NlUGo0NXN2Y3lCRCsy?=
 =?utf-8?B?NlJ6WTFSME8rZEQvWXpEK3B1ZXUvUDZpQjhPN1ZTSWJlTHJ5alNZTFlQN2xI?=
 =?utf-8?B?OTVueUcwNmQvbHEza0xHb0JXL25YOWw0ZmY1SlpGLzgrd2ZVNWU3SmpVcmlD?=
 =?utf-8?B?ZXYwb2JGMUxvS1FrZ2VXMFZRdUFLZ1ZKVDFlS2tTYlNrTVZlbUM3UExVSW1Y?=
 =?utf-8?B?RXVBR3ZEOE1EM0NCcUJlYVZvMTJpeFRwelJDRVZQazYrWUVIekdJcnlxRHMr?=
 =?utf-8?B?akpjRldTa1BseDRkUlF6NDVNYXR5bTJWRU5hU0pmQzZ1dkJSeVNHUkt6R3pR?=
 =?utf-8?B?SllEZEhYSDFwVU9ibHlHdXNEVmxncVdITVFnMjNwYnFBL3g5b3I1YytHQmhZ?=
 =?utf-8?B?alNLQksrWHo0UlIvZzZtYTlTV01TRU0rQkY0TjBBK0c2WXdxaWhkeUM1d24v?=
 =?utf-8?B?ZndaUkM2MDU0bkRQWWFVbzRSTkJjZytRajNMVVJuakFMZXZRd2VUMU5Gek4y?=
 =?utf-8?B?QlI1Mjk5MTRid3lRSDB6MGFUUFdmNTYvdW04dzdtNExiNGJ3TDVqalZUK1c2?=
 =?utf-8?B?N0w4YXFVRWVrYjA4REV5czNPbnFwbWJqbm9BMWltVDJqd0NSK29SNkpDUktZ?=
 =?utf-8?B?Z1IvbURxR1EvVllTaURncTBQeXorS3Jtdk10RHI5TUdIK3lDS3ArWjhORENx?=
 =?utf-8?B?Tzl3Sk9pT1pIL0dod2x2dUg0djZ1YmkweVloN2xKbURoNERrbHRDWXF0WWJ3?=
 =?utf-8?B?YUNaZGQwV3ZEZFYrdk5HeWxUWDE0MmpPeTkwQ0dNdTRoWnlYT0ZxSEtJaml6?=
 =?utf-8?B?N2haUE0raVpTejZNRkpyMmVzanVLQVRDeFhlSGt6blg5bFlzcnVTVHV1dHlr?=
 =?utf-8?B?eWVuc2RGR1BrYTBWOXI0ckRIbFNKN2VBenRSaWo1MCs1ZDBmcU11STBCcTYw?=
 =?utf-8?B?V2xsSnBKYkNTdHI1OFBZUVA4bmZMYzA5N0U2dnRuK0c2OGxpRkk5ZC9pYVNv?=
 =?utf-8?B?MjZpYWZ3US9IOHhXZTFtK1VJZHVxMitPR1ovVU5PQkpTTFQ2QXpIV2pXdTFP?=
 =?utf-8?B?L0RkemRHYTQ5eHRHUTBySDlCamVZZklTWEovc0E4WitVak9oY09YZW8wMGN6?=
 =?utf-8?B?aFQ5b2d6aVFNb3NtWi9obUhOckFubGp2dU1vcUJRYnYyOEoxMGpnMXBsRERj?=
 =?utf-8?B?d2E4OHNjK05JZ2NidEt6MUdjTmFRV0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68250560-cf1a-4525-d5ef-08dbea8ca54f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4121.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 12:23:19.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7889

Honor MagicBook 13 2023 has a touchpad which do not switch to the
multitouch mode until the input mode feature is written by the host.
The touchpad do report the input mode at touchpad(3), while itself
working under mouse mode. As a workaround, it is possible to call
MT_QUIRE_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
for such device.
The touchpad reports as BLTP7853, which cannot retrive any useful
manufacture information on the internel by this string at present.
As the serial number of the laptop is GLO-G52, while DMI info reports
the laptop serial number as GLO-GXXX, this workaround should applied
to all models which has the GLO-GXXX.

Signed-off-by: Aoba K <nexp_0x17@outlook.com>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e098cc7b39..fd5b0637da 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2046,6 +2046,11 @@ static const struct hid_device_id mt_devices[] =3D {
 		MT_USB_DEVICE(USB_VENDOR_ID_HANVON_ALT,
 			USB_DEVICE_ID_HANVON_ALT_MULTITOUCH) },
=20
+	/* HONOR GLO-GXXX panel */
+	{ .driver_data =3D MT_CLS_VTL,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			0x347d, 0x7853) },
+
 	/* Ilitek dual touch panel */
 	{  .driver_data =3D MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,

base-commit: 4ea4ed22b57846facd9cb4af5f67cb7bd2792cf3
--=20
2.42.0



