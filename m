Return-Path: <linux-input+bounces-9000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C3A041CD
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B491888CD1
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA591F8F1D;
	Tue,  7 Jan 2025 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="uSzM8jui"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C951F541A;
	Tue,  7 Jan 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258639; cv=fail; b=T7GzphrZIGiGHMqN6BaWCdAOR9V02X83zBdHohge6MNkqmSZHn/ogDiz0DwKYctO7CMRtgpTi1w5ExU2MeV3aPai7+toA7F16UuSbNLzRdyQ5QtMji/aEa2O9sHN8D9WD+bjLx9WcSBxFWjwl72wLkF9woa2zl5HBUwsM78S6Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258639; c=relaxed/simple;
	bh=nMe7EhCD91o19QktC0RODj/qDgszHJkHyESftwpSiRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQxeahXFWtKm6ZGSYAS+1J68dU5aZg+CRG7QQKDWxJXX5jzOI2mLRx88VtyKlcWFA+nvu6ED596NNC+3X2bNuPTiws+i3544rVsE/qaDZOsTofFqQbwECdOM/T2hFLXkFbQbx/qkiXMs6mIsinu7ENTVF0iNg3SZHAnoUznvo/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=uSzM8jui; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQc8cICANuMGKpFs8W2AaoRJLbQZjvfkA51XGdc0RopuEL2foI4LuJqO5h/dpCoDsmGsxpOi8tMmvtQMRDR5g9C31VMsbZA60pXRZGTYvXIMgamkBIMbBznGDHw8etltnogi2CRDE1svUF69rt2wRLQvUj+8HBsITdxvvluaBDpKGlCer+nd4IU0G6BVOE5kbmWtE3RrifuJsGKf1dwyAaDsA+eSw/a+UkiPlClnjQLLfZ2WvMN0nFZIozKpxJrU7mtHFhiVhrvta9rQNO5id9L94cEN+TLQuItEKj6aVmHxRNH+DbCTsvkgvjjp/qgNlouo5VHiWKOwEBLdJPprMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=WI2uuaKw1BVhT9xvQPDd9hXplHuitPLajXdxWnqPTDh5PeLi7Y3pSsQm6TT+cbPZtodIFnAm8yh3Gr8n8pNQvlgxMVc8iPXzzHYrC6VFTQ0uizNuaXrS23unlkzNXDmNwZUaAwhUSmGgQM4WfE6N/KDDILn7fr8O3xrpVZgPO7qdic1zTAZre/yO8YnF0qccxZKoNTGt1XTNzNwinPJpxdA3AoILWyjnkySyRmLV3dv0GY8bNeAO8JoE0Akv1axwwx1YdzWqJakKb7ZMN7LxTXo5vCjLPaxgpStGBzJkkZE3omLdn+7Ux1D7GBSSXaxueaE6SFFHHwhh4LUGM1yJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=uSzM8juifJg0X+x+qmcWc5blIyzQL609wISWsswjlicbXaEcVuusqpnuv7yNamrc5Vl2gcOLeeVNLBkv6ElaInIPVrQ9XKKWRA56Rv5GGzD/Si1vf/YQh/sdIseFZYXANoUhrE9ua97BeDXCdN622gm0aa/JsOAKvMvwdj0XzGu9hgwME8/P29OZD4GLJZTv4PEmPNj3CRsFshOU4+gDa5w9vcXtzDJ1ozQW6vKAfyprHSHLG19s1XbimpKHnvwyjHNjNKeb8ZveRQzxhY6dIStSXSGdTcA9f3li6bUx4Anb8vmemVU0kxRl899VL+q5lVYWmfH/253gH3oKz31gTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:03:24 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:03:24 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/7] Input: matrix_keypad - add settle time after enable all columns
Date: Tue,  7 Jan 2025 14:56:58 +0100
Message-Id: <20250107135659.185293-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0198.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::12) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b71c7a6-8dc3-4167-12b2-08dd2f240d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZ//wEKRqLK7Sn0UGU/1Jd8Q1U4HCotd39pz0FkH2Osf8dyLrMmnYgTxlC2o?=
 =?us-ascii?Q?eIFBYRcehF4p+uZq6KgnXbzlVKSY8ATbv9OpHx6l5vHZexRKIhiChbANWT14?=
 =?us-ascii?Q?7m4tVfMa45Dx3wkWp//f33Kp7r8aZuRkqmcHg4YflgTv1e+3TbblWpdzLh4a?=
 =?us-ascii?Q?Bg5LDv9kxvIWM7xgv3b/UwWOuDFsxHmsm4dH+qv2nXr8l0yVW3I58gbSM4SH?=
 =?us-ascii?Q?iLfVPz6y+g0ZfZs9+GKN4rMHSha7Yx1nzege8Sha32nGhnxc6hxlkBUCgnLd?=
 =?us-ascii?Q?N17LvBMbuk8KIvNfSTO9y0wc90vsjEeIxQc5NMvLjg4Wb0DeUefF10lXZN5l?=
 =?us-ascii?Q?4OEcKPCd/UPzPfAuAgSGwKSmXRI1chTwd+A1fw0Bqm1vfw+GES92wZzEyZWH?=
 =?us-ascii?Q?njIgyVIXGM3kchUaX0LCz39kBmeRhJgn9ioJQb/4wKqTL7Qoe5xBZuV+X/aJ?=
 =?us-ascii?Q?XKsHq2uXTUiwCPyP/je8DI9VqCn5KKY4kWcMXFCFaPxrdOj3SjGfBW20jkdt?=
 =?us-ascii?Q?aH9GKCklK8RYYaVYU1ZjOuTgdGCCD9O8gIxB27rQPT1eC9bkmUzmTwAwwppu?=
 =?us-ascii?Q?NTPQhU+zHjRR1wcLmVstE6biLKiFSou77Zq0jQVrppbTEKx//GEhHgtxIoKJ?=
 =?us-ascii?Q?IqrDW0kaPPG5Mhf8JiWadfAj/BUAsDvEgFtuRTvVs69dB2X8M4d9ePKIsv/P?=
 =?us-ascii?Q?pSgpLaeA+QXdoSbj1zQ7jouYvtdD8tterI6qLo6nB9rnmr46a0hE7KPePfVA?=
 =?us-ascii?Q?KMA3D4b8c4bTsaIFj770ZWj/YktRisk0a/Po6aNfvidKW5HzlUQYkjepM1U1?=
 =?us-ascii?Q?Oi/a6j5rV4mi85f3nCMPN2qG0bj4qUp0VmP8Yt4rQSh5GmTePX3u6gz9EQpW?=
 =?us-ascii?Q?vTK7lNkpeKcrjbHFbWNpcDn6SVAo8LHyTU1lEJ8tAFbKu/njQ8AnmrXPI29q?=
 =?us-ascii?Q?Q3F0RKPyfftfm+hBXqmG8QtQg6AhGl2PnLtRIarQlnJp7NuUmo9obKMpOvRT?=
 =?us-ascii?Q?dWaBUfG4fBJCWcmkhyqoXDCTAdiq1nOFoyO3LI9ARETNJjBIrxV1Upwh6AGp?=
 =?us-ascii?Q?IyI9UNpTp2nC/+BrWS5xzERPOEDxM4G2hblWg9Y9wt7v/2GQxcTS4pp24oPw?=
 =?us-ascii?Q?/io82BYP4f8/EZQLEsGLJTwvCsFXEqJUVQMGIWrfTteRSOh9kP5lWV3On2Xx?=
 =?us-ascii?Q?GTtXHubDw74V00ya63DBheD0RZWmVb8q+Qr9in+WUCJ6UBvYUA90JbDcKnFd?=
 =?us-ascii?Q?39veXEympkWQsNEaRpN8lfJlxym+E6cvg3OlN98JqN4rz7Nyr3nVFVtHijBr?=
 =?us-ascii?Q?cNnZBtGh6kANjBmOGxaAkz3vwiVOAop8SwaBwqeJauN068PAEdXj+eKEovVJ?=
 =?us-ascii?Q?OqaBmoIzPQhS4C5IKc75fu8Cmg/bEVbd2+zK1/qrxZSOts1j53ldL7WJNXhs?=
 =?us-ascii?Q?fwaJZNKwMZSzytmcQ5yMmRGR4mdL7z2y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K7yqHLFnvxR35Hj6r4syVFolnN4xFCbR7HEKsNbfrmk9nNZnfXF/PaDEkELC?=
 =?us-ascii?Q?8r7xErGuTZHF1LqA9/1BBe7iKJXFTFrlsqHROUl7p5prlrvVBwUxl8/+xkt0?=
 =?us-ascii?Q?t+Tibdlk9Swr5uTgVtSAcGInwsgWuW4ofvzPaJyEZhDXc+Ma42wL3R3kP21D?=
 =?us-ascii?Q?OsDwntz1EvwlEL7wYHE/Ar+8rdtyIfDDcOKAz/JARhHC4sH6RqymXaV09hTn?=
 =?us-ascii?Q?Wfsdu4RmqO/ppDhir2kw2mMs2M1mHKSvmRXbYJCJGbFudOM2/O75Xv688TFr?=
 =?us-ascii?Q?ScUIn8fNu2ATgcKa29aeaju9iEYeJX3YIlzMDJ4LHYpTA9AX8RoyWT1qEDpn?=
 =?us-ascii?Q?J34XreHH0c5ssbLDhJdpt9z3pDP0M787eL93rCHIDEywHHfHHstFkRvu5sLl?=
 =?us-ascii?Q?JDtFGRL1BW4r6PqkWhUeUSKTOggCEzUk5teccBI28LMpqpgqt8rW8H2tCz90?=
 =?us-ascii?Q?1flG3xNRRgqcwopJ3zeKedQ2ZR+1QvDZuQfT+Bs8sMNJ02dP1fP2Tx8P4DdR?=
 =?us-ascii?Q?3r1Xi+NthQWPMbLHnJDLM8cOs9UljrGU7F4lN+3hI3dRF4l0NKee9SLfXAUs?=
 =?us-ascii?Q?3XDA/26k8bT3WfcsFZjJyafyvQDBLWw9v3UGQ+lHZuKze1itFs4yy5xQlIhZ?=
 =?us-ascii?Q?wPW/t4PRSeANnV1W1nGyNfaw0bfYIKwq3SVR4cZqCIjS+oACxdS4dL1/4gVn?=
 =?us-ascii?Q?baZc8Zlbhuf50mqgC2Q8ml+TjGr0Ujn7b78OMZccM3YYFw3RqSRr1x+TaXJQ?=
 =?us-ascii?Q?l69UIx5OBZCyV99mtQi5dKvcjsozajcmkd2Z1+dRZwZYLiGghf9I/60vU2y2?=
 =?us-ascii?Q?nVHamlHHb2Ls5u6S3YTQOFlfLKlSjuWWkMRktH3cHiCCA24PjWHlJz1cCYs/?=
 =?us-ascii?Q?/kOoP8cPLDDX7X+VmXO0+tvvHm0EBauUrnlufw9U3jvUQXFE3T/NNBIP7Ze5?=
 =?us-ascii?Q?HSm0rimjRT+TPU+qOu9AFXH3RHIPvjzlN1nltbZJlBPUbH6hzvs43w88sfF3?=
 =?us-ascii?Q?L2EZ0IbmNo0RlS367z4d9xD8hFIqmExsamZpBQFZFX2ECwxiGQsOdMl4AhzP?=
 =?us-ascii?Q?fpPl1wR6doF6qZ6wSLkoFrxOf85PlK8ErPPktgwhpo5nXw5cqFBLoXdWkC91?=
 =?us-ascii?Q?DKyPW4DILGtatoxN0cb+7lD0qpKMNcOwAgTLI8LGnUhiNGSXrU99wuvx9T0s?=
 =?us-ascii?Q?PHaau3INHnmCpzTzkxSs2+8qN+aJjCXW8S21W4p28UCpd25uAE3H1x4SCaYm?=
 =?us-ascii?Q?C8QMAqBqAt2aQtSd9D1yE5EvSukuWPQ/Zj5/wxPU/aRdj/TDCoSTdqZT5uzZ?=
 =?us-ascii?Q?ngZC4pGYSvwA5CxYgRLE3KXqn8zDuSpcPWCr5Mu7a8IWuaRVJxVPlBApcIz/?=
 =?us-ascii?Q?8PA/47a0O97qX1kyIFqZdKVzAubtbxp0bD+W1MEyBINuyRwf0110s1iU8+3Z?=
 =?us-ascii?Q?JX4O8Ehhauni+TfceQCjRtipvcTB1yg2lNbJlzwDu3mE80TI1ZdNea2NHZMd?=
 =?us-ascii?Q?B7ZsbHcSr21PoMN/kG4EzfnATXS/rZOpbDDgbxz+LCL8Q4IJMvepv/hKVN/Z?=
 =?us-ascii?Q?OvNw0KHQuWzKMnXlmBIG5Mr490vyk8WMOgjDOG/8?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b71c7a6-8dc3-4167-12b2-08dd2f240d10
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:03:24.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ybs2fnVHSaxNoPtD4JGDoTSB6zx++w6mnRNgPJi/CHMCA9Y8V/nS+UB9GwQkMCDsbdSenGVIiWf3STxeXNb4eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

Matrix_keypad with high capacity need a longer settle time after enable
all columns and re-enabling interrupts.
This to give time stable the system and not generate interrupts.

Add a new optional device-tree property to configure the time before
enabling interrupts after disable all columns.
The default is no delay.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 90148d3..fdb3499 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -26,6 +26,7 @@ struct matrix_keypad {
 	unsigned int row_shift;
 
 	unsigned int col_scan_delay_us;
+	unsigned int all_cols_on_delay_us;
 	/* key debounce interval in milli-second */
 	unsigned int debounce_ms;
 	bool drive_inactive_cols;
@@ -77,6 +78,9 @@ static void activate_all_cols(struct matrix_keypad *keypad, bool on)
 
 	for (col = 0; col < keypad->num_col_gpios; col++)
 		__activate_col(keypad, col, on);
+
+	if (on && keypad->all_cols_on_delay_us)
+		fsleep(keypad->all_cols_on_delay_us);
 }
 
 static bool row_asserted(struct matrix_keypad *keypad, int row)
@@ -400,6 +404,8 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 				 &keypad->debounce_ms);
 	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
 				 &keypad->col_scan_delay_us);
+	device_property_read_u32(&pdev->dev, "all-cols-on-delay-us",
+				 &keypad->all_cols_on_delay_us);
 
 	err = matrix_keypad_init_gpio(pdev, keypad);
 	if (err)
-- 
2.39.5


