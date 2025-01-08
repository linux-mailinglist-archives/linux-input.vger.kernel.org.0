Return-Path: <linux-input+bounces-9065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF8A05D38
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357B31674A0
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AC01F8EFA;
	Wed,  8 Jan 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="A38HBXgQ"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2052.outbound.protection.outlook.com [40.107.103.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC82D613;
	Wed,  8 Jan 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343979; cv=fail; b=kRjq5mEWID4tGgcH2v65C1e08zGFQet+WQiCj6W9VxluAe8am6kR7wovd2u2PDgiEDoPVXnEZHzqBgGja6bWXvCfyOrk7tbgoYiMQ5hIFIB63lzu4CCep7Q0k2ENRE/U4f9lfLIlDsPZppijW/7x9GeNfVzhTWRmiYZ0jWqmcAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343979; c=relaxed/simple;
	bh=paa+Dd3iauEwLnDi8H7/NMbOpsq+73SqJJQXX9Z+cBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8tAuSqUpEQoiW/igwzO+WQ5Dm+GgtJwh92kgMnTBg6tCsvrCwORywAD4ZMdVRpBV8ka/JJv+72uyk/SC2ftRhi2A7/8bB1z/Hr+K0SfTjztV3otZYVuq2V9KDGdCUUFJh0g4B5IidqaXNTjziwAfcHtmDl1MZbwlSta6Dfo3g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=A38HBXgQ; arc=fail smtp.client-ip=40.107.103.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOIUpNTdfZHZDVywAlnF/vj5RCldY9oXKYGvotQzaYTxYXn05ugytUz40oV3F9OSt19oIc3fnOfGQ+9BrtKg0XsdxoIGcUpmMvivW1YXFfPognB2sjoSnLRoaLCQxe0Bg10SJ1wBRFs8e2LImmezJC6lzLdfCRD2+JiTMx8JO+wAGvB60xb0KnigBfirMNIPu1oZEtAklXfs5fykcH9L8/3LtMpMhpoMO27mVqOanRyhm+JzC/pmERyInPRx2Mf5twjP41Ugj3KDS+/Lr6V4j7+ypVYVKlCIcWZPFN2DrogX/NyXNmbKpqX0s+Ove0srcWUBfVF0zttZ0wIbmEoWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s2msHWctMnBkkjWb5UWcKqW2PuzyIKxIbvunweAHk0=;
 b=fkmZtJvCzVzGbyGRdfuoUbtBj5R8a3prqpJoDByzYe2bDttXjIjkYhIhXterAvQWgu5S//XLN7b3kRNphEvxwXnV+Ua0FBt2XSc2vgLJCTF6KyNy12SYE2/HpUm8FkStMmvGS9qUu7hg0J+19H0f6PJ5O33G+wSnsxViixiijgCylUzcO8+ekcb4iFntEC7sjw8FVv6xzui5X1V2W6F2XeUAwdiFbkGPIJKFXzxiYTv2GfBBlaemGSwbxwpcwdLYBWjUV6eAUL9/sE6jcHy5X3JMdwRcNt3oFllMLAHcLVf0S9XRbbkuVg1uHDHvEzR4f5uNG4eaBZ1PCkmT3WDVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s2msHWctMnBkkjWb5UWcKqW2PuzyIKxIbvunweAHk0=;
 b=A38HBXgQLbWgTjY3iSFifYxvi572Fp8VwcqCHlRwL6h0vd0m0lm2bW/h0NlLHqGWIeZ+4+H3SHTbxn+KULWzQ5QDBG788qniCHqqTYM2kBIxEAbulxksYHlQKTEbUgxGbA3Bnk4P/g0uuNJncA47P1tU3csGRJd+bvUDxex8cihBq+IIy8FA6Jhm1wSaYxf43fEzNrDXmlo8I3GrR/D8ZGqNNHFZHvRnXjvsOTX8Cc3JIN7u+fpRiaFc7lgCL/9upDrrvYDrOq0FABjcMoOCju6epvL7KC3h2z6zumaAIvvdQaaLuimEf+qBKv58su27fwiuk/wSD1VRX4YLnTVPQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:46:14 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:46:14 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v4 5/7] dt-bindings: input: matrix_keypad - add settle time after enable all columns
Date: Wed,  8 Jan 2025 14:45:05 +0100
Message-Id: <20250108134507.257268-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::10) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM0PR03MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 444abaa7-028b-49ba-98f8-08dd2fead1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmbLtUmotfBeBh74Eeld58OsV5W4Vm1ZGSyQ0BthXmn0sl2jhHN09ZgzowwC?=
 =?us-ascii?Q?Bn13bwVoqOmtUYSF30Ubievdldw9PNBMW1TjSVmaDH4xK/iSt0cqKl/GM2BS?=
 =?us-ascii?Q?DXx021MGIT03PLLt09iQUa+1YyLbh0jZ9myAtUPm7pk4U0t+aQrDtDBH6ud1?=
 =?us-ascii?Q?iuJ5rUNkBXrkak2JQBqGJoCtwWZW2VCVJo0rRO2Tsbh+zy+CC2O/5nolE7Pc?=
 =?us-ascii?Q?9maYWW3uZJfpDZai1Mu7/qeGMqUWr1aKqg8gjO/cVmZdZWKi14QEO4DeTlSO?=
 =?us-ascii?Q?mnweUtzVNKG8x+Tg8I0fHXg1+ABxU9wWV3NX8psW6ZO6esSW5vvHPYqvNyme?=
 =?us-ascii?Q?RX8la73OVNJRM5zw516uMUUbo7gVVKZplazYfh5fVQloPLNXjJXC3oKdqO39?=
 =?us-ascii?Q?+3rM0T5Pkf1dZ4PCE2/M/J26DJ/qVb13CjOw+bTC1IjfvIo/uY8Pez2zkte8?=
 =?us-ascii?Q?+HcEItcqGsV9chV8cKJPjn+eDzT8rzrCv3v4ks4oFn7k6iyF7a3PDKAb88cy?=
 =?us-ascii?Q?3waqD5thRFlzHHSEiYbWVN2jr6OLeVn0pKpLMzvtC1p8GQjUoY/lVPQRfKhf?=
 =?us-ascii?Q?Pi1nbrpfkcDSajiEAiseBAlBrQoom86lp20y4Cj+CJsaGUbkvsE5AKeVkh3S?=
 =?us-ascii?Q?mRwYBYcN+dBWmCtA14k2x4p2OJIcv2UzgwMlQ3T6Xl/jiVF1NQSAmxquV7GJ?=
 =?us-ascii?Q?FMawimgNKg+8FLutgUQQTuiU/bNkKBtpb5s1i5FrkE2iFj5jor0RM13xFnj9?=
 =?us-ascii?Q?YPAUA8+r7AUKqeZ+LEnrMXa2u8WOtTy8gzf98RuMHpHnCms0VYgyBNOk4k+O?=
 =?us-ascii?Q?vT0kxlsOBI6IIc1r4WGMZgy6PxApj0HVAoIovJWx/8RhyzC8FYj2QzKKo7SU?=
 =?us-ascii?Q?hnQCo3DVTgsJKBNKw2YzC47DGUU0vyeNO/YJtJtaLsYC4xjVgg+bbB/4j+dd?=
 =?us-ascii?Q?BqqM51OHa424usY9/5Po6qVO+8GmWS18+9jtazaYDPsu3mzFWBlx68F9gil+?=
 =?us-ascii?Q?97EAK8QCVnf0LVvKkOBU11tBdCB3h9yU0ydlhtgd3v2h85ClXdSj1z09ZCsD?=
 =?us-ascii?Q?IoKt80oPg3+kKJJNcrGvU4Bg7e/eeOH/zEUzAChahCg0MeBq6PyzLyGwA3ec?=
 =?us-ascii?Q?SAbaHQx7J5RlCi51v/ReyAzLkh4Gi1LQP2l85IIxlj3OVGNv8ynagU/C+shg?=
 =?us-ascii?Q?KOv8ZNFFNSabichaAe5NYLALUkx8JzizgQaHjYDLt2yk5nnegFDzk3hwzoJS?=
 =?us-ascii?Q?mT0I94Sg8/ScCmg5g3frmfLmgrmwFKBOVjVj5npTiCjnf94shJgGsVoEbzbe?=
 =?us-ascii?Q?5C+PaOkjqm81FXei9P0hM4xz6xZM0Rfe3vKWAN5dAz7k41/qpQccAUIZ5PlU?=
 =?us-ascii?Q?lLFMMmoReTN+xvf2ogQiqdwmEzh+aHba5VmXSeeapNnYZo7eChrVUnQkdgff?=
 =?us-ascii?Q?p9eM+3N1IM+bWBNE/LT+o8fqrwBVZjiQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igcjxXcQp15Lvd47UXS9xEX/LXLbJ6snXRQiWoQCFTTGJl8BK1FXjUiNLrDu?=
 =?us-ascii?Q?L1hDGy7xzeDPa1LR0ObeoG2BWo0yepz3YtOi9UBybfVCNUyGlvAZO0h+iyMa?=
 =?us-ascii?Q?BrDoLrl3uRlDqJZtQfJNXjvDRSd7+ewQQNS0Q7i0o3VUXEwYTv8lbYL/C80L?=
 =?us-ascii?Q?ixI5Ke63N6iPRDU4HpSHXZZMPHC+SjbBCVQB0qj5bGsRFZtkDFjKQBrmXaTJ?=
 =?us-ascii?Q?RKCXGXxuto/ElsyunuuXC/77/dd7APWEGvZf8cW3sRtaNjxyIwux/oj56R9s?=
 =?us-ascii?Q?3mGlwc3WiTHkS8ojNgVuhtc7DeW4eStvYYzM5fOXJqlK38jSCc8wQGPJOF5P?=
 =?us-ascii?Q?Lh81sz0TDbY7ToBmsd5sv8XqhAQRZsSkp/I1lMygNWoLD5rv1TC1YFLF6xuj?=
 =?us-ascii?Q?GaG4dD6qUD4yT6GwsyHR70ISgTOJq8sh6dOPWM0Fc5X4DdLrS6viX0gqvzn9?=
 =?us-ascii?Q?x/lTb42+4tOrI+diWYx0qupeAMGsPbHuJG6UGJ6fuyWsdJ7Im3hmndAO/mTX?=
 =?us-ascii?Q?9/CMiC+0MYzl9YR2ql7Bve6IginL7DZwbn7vXNAcXolnn0whzVXIlnsV+aFG?=
 =?us-ascii?Q?SV5QjdqIe5gB2WLbHRQHJQ8dAGL+9+HLI+zLQOi1rQP2FKxNPI9BNNWSoikw?=
 =?us-ascii?Q?LGDRRnywU1snh9xUTkObX34xVHBs1/iRYrhQjnIiAHo8j0nSh0OkCbiX0/4S?=
 =?us-ascii?Q?nz/FK8pUvlOJRkel2GWGDPfcsyiXMfM01V+jOhNGVvbtTHfYFA74BH8Drsox?=
 =?us-ascii?Q?4wN5ld7/sD+QAihtzczUlH8/wauMIVFgJPOMQ30BSp7dZzh+b9FHOdwFLzp9?=
 =?us-ascii?Q?jiy+QhKqsD6RNVXuMFvDSHBb+XKBK+CexGS9eeKE56V24V4QrMnLCXQLYVMG?=
 =?us-ascii?Q?v8YVQWFKCATOVdWfVlUiX76fG3EmS+ZuxcXU/5gkjxqXjR/SfZ+eJr52Y5R0?=
 =?us-ascii?Q?pQ8tnA1SYIDl3Sxf7kBrNl2iahDQK4txbAUKRnXhQ3GId/sBXCy4Bw8S7iTf?=
 =?us-ascii?Q?poP0pEpZfjp9TbrFBKKwR+PHrJKQXupm2irSKJ+f4wSJGd0kjTDlwdCmo5Wq?=
 =?us-ascii?Q?AO3CYixMda6o/3/AKv3C7Pkg+MiLPe8B/1QJvLMMNY6JqdbZgS1nL4/MxStu?=
 =?us-ascii?Q?1Fm/wMj6kd+5Hf0iXWXQgtBiQmRgmcVgg32+l5IW3/N/mw7zWawunaVBM0eK?=
 =?us-ascii?Q?p9+B/VZeeTqEr/GethPSoB6aWWaUYa8xdrshQGu7MeTVs/9xN234DZ76SqUf?=
 =?us-ascii?Q?gxMhTTmkgv7gMfaOpNy26C7J42NjqAM4RiFag2bNo0cdwJZR3uIrCMpALQEM?=
 =?us-ascii?Q?6vRZjvUz5KPL2zaarijbm063TV2KL5wbaJdtUIjJNLg/sXoTRmt5Qr5RnxI/?=
 =?us-ascii?Q?2S2WjcjVmtnI7g0asG1OzhpAx3vajusUS5DWrfXob51Gb4ssQ+YaxoJTxQDV?=
 =?us-ascii?Q?rZ+u2TOzZ6iPo55513LrwqoD8NASyWgpVQQaAvbIZDLuMWgQAiMPUj34NCRp?=
 =?us-ascii?Q?7KauN4mlqzp/242posX/gl4f2OeDj0anpkqDubY2sErqs93t9P3Wij8iu5Qv?=
 =?us-ascii?Q?RB61bYBaYRT4GIfmHEvaDyrbdL+XJwvw48BAc2myess60SzebbOzM4x/Czgz?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444abaa7-028b-49ba-98f8-08dd2fead1e8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:46:14.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQo9nzi1RWXV4TI52ERv8hWiCjDqiJaZSSXe87Deuqv5rMCRfte8kAFF0QD3BGj5rp9qCDM5yrblYh5WQnNTIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307

Matrix_keypad with high capacity need a longer settle time after enable
all columns.
Add optional property to specify the settle time

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 0555c1e..408474e 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -57,6 +57,12 @@ properties:
       before we can scan keypad after activating column gpio.
     default: 0
 
+  all-cols-on-delay-us:
+    description:
+      Delay, measured in microseconds, that is needed
+      after activating all column gpios.
+    default: 0
+
   drive-inactive-cols:
     type: boolean
     description:
-- 
2.39.5


