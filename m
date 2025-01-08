Return-Path: <linux-input+bounces-9061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA68A05D30
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3BD73A6AF3
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFDE86346;
	Wed,  8 Jan 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="KJ25TJDH"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2067.outbound.protection.outlook.com [40.107.247.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082E2D613;
	Wed,  8 Jan 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343943; cv=fail; b=gsV3Zh2JWxVMvy2ACdtdkNuYzx2qUpIWA2GxZcMmZ0tiOdNlRm3d4jUj8lwX6Ezgt+pIRgGd5sivO+TtCegqJ4BLaXT3Sm5CVJvx/ym0DVIeiW2yeFUSiSk8YDhojJI+FQnaGVuV622Pz0gHkg2YYxlGsOBdmqH7gZh6LA1N92c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343943; c=relaxed/simple;
	bh=1XTyf7P5Oq8kqojjd6xrJvnnSNp+qcboT0eNC5AyLIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxNMnCfCH6kE35Q8c7Xh1VKuV1FoHwlseheEWl0fxsb+qKUIcTuyUrBSEPkA864TEALPPjd5DcILZwGMRn+TYxv9Rt2DZiT4fH1DLqSdZrVzdW4iILB/jhq3qCQEdykRDUahN6zNhwO34BULRBG0P0PpcByWgYYVXSfpjGII8Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=KJ25TJDH; arc=fail smtp.client-ip=40.107.247.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=escoNbNgn3bP7gXh9ptSKeVQI5DlXw7cV1j5BiPf4Y/VSTnZeCryGT6PSHR8o/7VP5A6mhyD6yLLCYFS6HjqH9NPQa+tGxfA3K/Iu+ybTBzX4aW8v10SOwr2G6nwILNYZDtOICLJqwQ3BSGBdisBOFKZkGa5r7gtp/i8rePSYs46P7ZRIfdtcSI12XYsejLoAHDgf4RWLTR08Kwna+szZQ59XGZ0t2hriyCb8mcYVs8bdXyMg0+SGAzxZJ6GxWKAf0vjlYn4W9YUXpYk56rqV+XWdir046GQ3NS51XH8+pGsuu29SgS0N4oo1SttQ/WwTdFM63TVrORuA9OuOK/3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr1stF5XRfTsaYvohzOZiPIp8IX3Y3c3wUsDSMsTnQg=;
 b=Uq0d8IhO5rUZHmMitcvUqxMTSuO0znWiVHyAcuzZFuqSrtW0N1b/rUg/VKZOLHyUektpZ4XsiflTNPkZJt8OzuWyiWGWcBoTaCvZTIXtA4MHiLgt9enrVarB04/Otqwa6tjkMH7Aodd27HXxGSIIN2Qh1utnt4ODZWsC3IyvMg7jVFEdUJcdVJNRtbLccM7pxGWHRx5hCNPzKXKRrJCl2PmW9d0eaDer0Zrc/cu+rvnblkR42YlboV2WWGqd7yUCTcqwSiRsQ79G6uiFAV5O2w6fN1cjINXJnatsrl8hnKVqXYKtXz9DrV9g3JErPJTsntncQPz36pnLcO8a3VhaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr1stF5XRfTsaYvohzOZiPIp8IX3Y3c3wUsDSMsTnQg=;
 b=KJ25TJDHv2SH34epd9tHaLrVtmhbTZ9zMx4u31Hl0JXQGNRjGYG8e2f49IJB25NZAEES5B9DANbaE8PuahIKapXW+cXIFd09DWV09OQfDWFKA32UZTqt1wMSWih722d94Fjhb9/FBXiV/X6VaBZQ68NQ2Q+BYM9fEjscHWnpZ6bWOyNUBsLqNHjJehO0MQEa2fRr+DzqvnTh8LR15Bp4knCwuqUmAiroA9dAu1HQDk5e1TKjdog3BUeQde06f6J9XgYEAaQDUfSjB3wjTFV2ThEN13tP4ZwMLm10oZ9r4ZWH/UkzpIzMg2gSgbwmbUrdWV8yKcBDXvsO451vQwnSNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DB3PR0302MB9259.eurprd03.prod.outlook.com (2603:10a6:10:430::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 13:45:33 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:45:33 +0000
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
Subject: [PATCH v4 1/7] Input: matrix_keypad - use fsleep for variable delay duration
Date: Wed,  8 Jan 2025 14:45:01 +0100
Message-Id: <20250108134507.257268-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::16) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DB3PR0302MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ce2a72-c8a8-425a-9cda-08dd2feab905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5KnKKTR0Evux4eT6T2sACuTL+NzCeyvmph/fod4FfIDERTbKUXAcExDiPZ9Y?=
 =?us-ascii?Q?LSnibYW+cSqhlCJNg/k4eUMh3kcwafcoMxykThyR1MJipnLpuCrqvmXJhsEY?=
 =?us-ascii?Q?tqzRngjegX2QSli+DtP1iItEyZf3YKvVew2sxBmcCWpGgHsgfvs9WSIgZszp?=
 =?us-ascii?Q?nc8mr+7jRtLVqtFbYjK86zr0JtuEIxylZUyTsRBFfwQkwdwz1n1C8FEh9lg4?=
 =?us-ascii?Q?CTFd4+RRXwQfXNFBAdzkXM8ZaEoVqkqi0Vd24B+aZjXgNDv/+zxwbUvzBDzK?=
 =?us-ascii?Q?aqQHCExZGCD1PRHkAYTIzz4lVe3FY7xeowEni06yJuuEAtlI3X3DDHb7pRad?=
 =?us-ascii?Q?VJq6yLhjhl2HmJ3Sg1yMrQKImrKD+GLsxvWLMkFok6nylYpbbCPlYr379BZX?=
 =?us-ascii?Q?E+AUXlwL71iGmA4pIAglB3mwCXMagio2OekewGzm0ClzDzA8U+WWP1og42jC?=
 =?us-ascii?Q?MtS1jLG1P78cMd1AFMxjXNMdpiJOgIVgx+nPix2LyK0RzNFtFZ2n/wYCxJP2?=
 =?us-ascii?Q?v+liYA5AWriAoXXijUCCY/XWqx7SFBjx9K+bMe/QG3YxbzsHmrtDLxWXcNbw?=
 =?us-ascii?Q?KQ5/g2rfb/GF0uFAHfI5QukHkLtjDL1aBxdAtt5+MsHZiDfrMV03w3ErVxgV?=
 =?us-ascii?Q?7uv7SVHWnBPamE+/wKN8uGXUkXec4vjB+bC02B8OQ5tsIWNxnZ0Ws0Mprhri?=
 =?us-ascii?Q?mYV449VmUZfCKVBxZkBT05xUquCC04oNclt1vDE+0PlCXssnqGFOrWUQSAkn?=
 =?us-ascii?Q?qvzQkHBwwH4c/C/YrUrVZzZFr7KLJGASgHPW4bZPDb7eHmNSeZXOXHjnr3SE?=
 =?us-ascii?Q?Gjr6NSfQZdHtwg1akSNyCXvMTCMPvZSrZR7Vs/46JywvyMT2pvBCYT4iKe6q?=
 =?us-ascii?Q?no1WySogUNV6vM+FPx7GAiaSYuKCXp8/QLfPLpJT7FnDZUCaGKKIPJh6m0+O?=
 =?us-ascii?Q?sGvIo4KFOxENGT0jmFX2Kb/6GY6WIna+8XYiqlAAmNPK4XtJ66Dw10aHtZf8?=
 =?us-ascii?Q?86/Cs7l87i920wMJFCOzEMjrplOG/u7VdqiVinHDRQlObSv8uemvoVZMM5Ke?=
 =?us-ascii?Q?ucSXCZZvRqfh8r8mlQjUIvRRRWaxIAN2Rr/cGLNcND/vdHv+L4k/DMkkAyx7?=
 =?us-ascii?Q?893LdUfFoMgD5XO5pUUFXDMJrmsncGux0PQvJ7CMG4MvaplxDZlzXuLwCV11?=
 =?us-ascii?Q?c4Qx7ALmwn57EY+OmZOZxohK6FMfj4qGzGcOIXwESurtZ54CBRdck1evoRpy?=
 =?us-ascii?Q?unc2rF3B2dCUkRQCV02jGNOTsQaoPzjiJzGxa8vSE4v9Oq1dcqVFfjH1IxBw?=
 =?us-ascii?Q?uOxoRNn+5SCmjGdSs3ObUvgNtQgoJKjpA4ZfgVFgZoxla6Cp2xRiVup7PZRB?=
 =?us-ascii?Q?bE6abw2cDVhAveBi6SZbV2nU04QjNMMZIEb4W81VGRSRsomIW/K3Uj+eYzrL?=
 =?us-ascii?Q?bdoVzn6rZpjcCLnpbbCA0wIEcADtvdK9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fUXcCp23zoeFKhMsx9C+k3tgim6bpsIIm8R+d5Jto3a6vhm52hUGPD58Rflc?=
 =?us-ascii?Q?xt0dh7SYONo4FzjvEVzEq5ZYRKpK42bR+DtY2lWStxcEXIWK8yltiNA8mSvD?=
 =?us-ascii?Q?l4Pcf15DuPnuJKLHCIJByCdh7sQDbm0wY3AkIdN2UedqaL7RZauVmVoxz20I?=
 =?us-ascii?Q?PVXyL5V0I+5bHEkbMd+yuJPSKIeKlStBDbj4P8Nk4pr2iiZzILGzFPwDfgRY?=
 =?us-ascii?Q?F/2y3l4iB+/jQI26nKcUcmnmDxwuFgXBwIXnk6e+SElOy44dE3Iz6Pzqttub?=
 =?us-ascii?Q?8U74PWQ50Vr6q/KXonCH+EWwP1rCQcJaH6cWD6IysQvmzKiJKoqyPogLb1T1?=
 =?us-ascii?Q?9j84bllCvLpmTc5ZSaWpwZU7tAz1/28YITzQoBkBPrDlGE1newSj7uko9ELc?=
 =?us-ascii?Q?DVBeBXwbLOpAVtqSwcOSDAYHcJvzDYGAwLruhBpNdh4ZXwaJMCqQVbh1l5MV?=
 =?us-ascii?Q?NXSAVL9nfnDxkcC4kDGk0hBxU5o0HAVsWkgACdKsYZqWqg6zYA/q1joQcVlZ?=
 =?us-ascii?Q?DLgbGbJzCHJ/jXOPd2eyliLDiJneFo2NfO1u8ahn+tyJmJ2H0dvP8I6vHZN4?=
 =?us-ascii?Q?WUK9nlynp9f7nKcdPyc+DdNkDLl93vr0LczLe/SuwWeGi0CpR1iz7MET0bAP?=
 =?us-ascii?Q?MLHy7mFml+tEh77qr7uE2vOhty3YIuNn61j+RJ4Nhr6ggQuiLniDsx4gp+NM?=
 =?us-ascii?Q?4vom8/vGWZHNUmCTGVURNPuRNDhdude3JBrCSXSVfgqXcjFCf4R8gySrV1dj?=
 =?us-ascii?Q?k+Fv7Y7NQz+5rjfc+tqDwEtviRv2bamuGOAg2fSkR8ltAICUIvAYvqQU3sUe?=
 =?us-ascii?Q?p9x21RxEBh8Zo7QUUo0RjCBFW0dhoWiLhL9L0uT0AFHYx2bZbkhvafgouscE?=
 =?us-ascii?Q?0ysKFrCd0RYUf3pRD8v/Cvp2M7YDdfBOkNDAKpiaqB1nUryetqlCgDOPNFd4?=
 =?us-ascii?Q?/FVCHYrJr0ZNf1fpHaLMjCJBGSyJaV6gHqqHP16E5iHKrtA5NO3KWAq8mZ5B?=
 =?us-ascii?Q?hR+pq2ng2Hdyieeglpiek4aDMA5NlJ9QALW49w1iWhmhKjSDGprYqBjuCsNz?=
 =?us-ascii?Q?PgXB383+J7GzhJsQKiiWe4PL7r6Q3dudnAgA+Js3kpR/uVJI0tpGA+hIL2zj?=
 =?us-ascii?Q?69kRJHsP/lLIqcT4+hB2iVo34fohlx4zPP4cQLbFkps3zdX/XvotLrJwp9vu?=
 =?us-ascii?Q?e9N7i+hSjifHiMaGITF1Yio/AiedzsMF2T/2SK645GZponY/UmGZ7IFROWC1?=
 =?us-ascii?Q?4aWRX4gLbN1Y+8+5wuqG3es1OfEeXtPsiY9dmPYmcr6rZpMJXftDy6paXToJ?=
 =?us-ascii?Q?PIQVWKr6cjIgvT+wpqKNpzSgALqzh4a8mHncCXlvwaPj4p3DX7kEdv1SYw0a?=
 =?us-ascii?Q?XaZBPL988h1K369RsvePlJUITXgWc/S6PiF4nT0WmRJZFus+6NvtO3fujQnu?=
 =?us-ascii?Q?6mvqoo33xxbYHDU6mNf5CkrmRtREEn4oLbBnG4Db/oXCeGk8n3sFZJJkmObB?=
 =?us-ascii?Q?m2pBNJCDgnNM0ciXrVwQOQJRFwXlPk1D17WtNuBLoHRqv7BxiTAXyeESAys0?=
 =?us-ascii?Q?k0aMCjroifOWReXaqSO/YWEDGRYJKhGAJC8XHxnynO5kOecKPDsyqlds02jL?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ce2a72-c8a8-425a-9cda-08dd2feab905
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:45:33.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XOiTJINBi7fUs8SOJPETqI1tFxiEBpZcf+PDHJk6+CCm+GMpRwYAk4riOqsq7SAiKOvMn9w+p0yWgyR3Qv/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9259

The delay is retrieved from a device-tree property, so the duration is
variable. fsleep guesses the best delay function based on duration.

Link: https://www.kernel.org/doc/html/latest/timers/timers-howto.html

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 2a3b3bf..5571d2e 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -68,7 +68,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
 	__activate_col(keypad, col, on);
 
 	if (on && keypad->col_scan_delay_us)
-		udelay(keypad->col_scan_delay_us);
+		fsleep(keypad->col_scan_delay_us);
 }
 
 static void activate_all_cols(struct matrix_keypad *keypad, bool on)
-- 
2.39.5


