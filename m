Return-Path: <linux-input+bounces-8995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B3A041BC
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5A583A7A2B
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE891F941F;
	Tue,  7 Jan 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="cz8rEMJg"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7451EF0AF;
	Tue,  7 Jan 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258589; cv=fail; b=jJ4qM1ISdiKvs4mjT862PSVL9YqEYZOkMOB7gqKk0J+/HU2zvWb5odzeToTfk3cj45w455zOnDycE+BzbYlL//vJjtmCIgyOaf9DpFsd1t3sv9AoX+fu7iNPC8sdaQjF2MLf+O/YsyY3nR62WLZxGaK15gPpE/QYMD7+x22Gw6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258589; c=relaxed/simple;
	bh=1XTyf7P5Oq8kqojjd6xrJvnnSNp+qcboT0eNC5AyLIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l7W1PsVXPhCSPCUyFg0xCv/LiF3mbYGI7cMcxRBo+y1wqQrFDJ4np9fnTuU2wXsdenXqb0Z7loVAAq2mKB7c7EEuPE/e57Gvm2pmZGumDNCQrNZQUFmhLqQ5RLCtFWlI9mZehXlRv7fAPPxGV5Vs/4fzaaArF2FR5Ri45jQErhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=cz8rEMJg; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO6mG/klPrt1KwwRehlZ2lzLVpsT7vIGKLnklyH5sufUVlSt+oEJVtkrVfDIAbQTeQITE4wbvUQ6PoMUSe6SPCFVI9H30s7NVKRe1hA5A1p3CpvTWWM5CsJ5mAKZ0YjlTL29c67H45h2+Evy3Jxv+U8K9aigR+fm5HcfqxvQG7hS7HXcPyFPLdHDw7dx5tsLiQixdKCjnS3aql0519OTzK3w3/wVDIZHn66Ek6WdOh1RyX9GMLw63BB5NoS6P4cKJPlYcPKZEIAmzrcfrnecXqozHw4E5OTzmcDk1hnP5qutZxPveijvfFFJkRBuPRMx+ch9YORzYI3RtSgo8t2hSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr1stF5XRfTsaYvohzOZiPIp8IX3Y3c3wUsDSMsTnQg=;
 b=F7fvQ0x6roNy+vUnZF5NDPgY5rBr0Kxl7M6lp9CWyzXWGn6m86qMt7iMt5tQlH94N4Lf/T/pgJw+AJM/hIiop08dYxbirDHGwdJAi8z1PzIhepLZLeyMFgvhpwo1Wi7OE8XToUQXl5Kh+F+ZzqdxKdTH5KeMg65SlGoH3xxXReWkfj55Y/+qm3lOqjUXZnHEYWTMELDnAW5iLp11hTipwMZnOnNckMw3yV0cdIqCk5iDWXZuWyuDYpsJk+cJrXxJkr6tMzpqhMfIapZ8w13lOMDAWm353tGaOAHlAo65rexxoiV4oMpXD+i/ogYLlGXYvRx03EoSYciFiq979hGdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr1stF5XRfTsaYvohzOZiPIp8IX3Y3c3wUsDSMsTnQg=;
 b=cz8rEMJgBPXKco5OLhguzdpwYUEeLkLIDwEg9R2//hxlgvYAGXiRRyn7QaejQ0jdOIeccDA0ZaOfXs9kWKZPMhTyyd3hCZniRbgfqUywAhQs3+dykGzW68oy8ok/Pzd1VlZpfE3TVRSCFb/VeRDVtldZxNxejH+CDJrltHEX7D7nmVi3dIqAR8bgmzRozynoaogxi4wzFIu/k3YYWyB6bfMbgxGB4xXWnnjbkkeMzgYuG9LwIkZnRkA8vwt/neDuBvcAUAfLqTZaUTi6fmCkpJxkhZBeb7yHuhXCiXO+8F4AXHursOqgZ1J6GO3otevKbdM1SacO5xmtnz1BL1jWDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:02:39 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:02:38 +0000
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
Subject: [PATCH v3 1/7] Input: matrix_keypad - use fsleep for variable delay duration
Date: Tue,  7 Jan 2025 14:56:53 +0100
Message-Id: <20250107135659.185293-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0170.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::12) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: a34198af-c1f5-4fd0-dad9-08dd2f23f1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lOfRmZ0J7waCl0RSHFIsjlT+CKSnPZYP46VlVPtsxNTxqmyU9URk3j0eHX2G?=
 =?us-ascii?Q?FPszteY8zx9W+qFRtQIaXLQBnoCahuOuho4vH9v2bVg0I1tsdYYzJoDE9P8C?=
 =?us-ascii?Q?QJC84NKcZ6WNc20yftF1GGBZ0BwROtH26O4thTqYwpJxYq15jNMWzsSLSgq6?=
 =?us-ascii?Q?jNnT7HyysoyemV679Sw6nfmqJwD6eT5Oqb16GslGmtIuRJ+OLuEHcSxoLNwy?=
 =?us-ascii?Q?ZTUAO2MUFktICAC+8aaanXaZYncAY1Sv9x9y7FdBEhU9qKRTMnJIJ5WeqAeh?=
 =?us-ascii?Q?psG9smeEUWpj+D4mGYtu9p31L13pWCRNFqYPuGNFCLbfPqxHZTt22SE6R9Bd?=
 =?us-ascii?Q?zJT8ymUpU3n9ItXPYpH8hcYksQOht4rliAAeyMVZNzhtnQkLDmSxhDPudoSF?=
 =?us-ascii?Q?20uompx30w06J4T6FzeFvpdWOUKBsskKmO4Y7Rfrg2+mo2dnx7QdjzQPseFb?=
 =?us-ascii?Q?KOTThSJm1al4mpwvsXcDFEYtA6grwl6wxuJnPXMLMEbFUKNqBDLo2gE32Dcc?=
 =?us-ascii?Q?eO3Y1ryRM5X7hmS3811Uj2ki4wfBPiI9cotocmxXJl5YPjYhWvssKCfknfth?=
 =?us-ascii?Q?76R7c2WawR4tlSvFh0hSDQAnv28+2gX/L1vlkOsiOMaNlve/fR7vm5A6PJ6D?=
 =?us-ascii?Q?qSpddU+GXyChZgAGwnFa/cpl434DFm8gAKu3HIpZvSMEK+4jdkxtLlbPeoS+?=
 =?us-ascii?Q?obm1k6vxJJ6d0u6fghMDCRhUqGFJSvugCrjJpCsHWD7/zEUZ0GsMZ+rnqmS/?=
 =?us-ascii?Q?71nNKO6RtNSkApG9Hi9rpAvuKKVa20DVUGu8O2vFIllolLuLem/9hyf5mRFv?=
 =?us-ascii?Q?SU158642VEzuriDikA7q1OcghbumxUQcGDo6zoSzgpRskOrJeyBb73ulToTg?=
 =?us-ascii?Q?NvLOlH5sWsaacJlaDVBk2fpcPGwMAftUCrXGIatA5HHRbExTtutRXVrBbrEV?=
 =?us-ascii?Q?86gvu4526c7JI9dKRjyaAddTwa1NKK8Cvx4FBhsNOg+JnA3t/Qe+JEd+29Oh?=
 =?us-ascii?Q?tKNaA546cde71TvAsy+Idg8D0Dsl+0mJMrLPTCgAXbSZ5VmuDj8CM4zEB9Ls?=
 =?us-ascii?Q?Hmt2HNEH0MfDTQBY78c4NjZcuh0Vljogc+YLQ2Y9J8X3G2D/Eytf1LguGQkw?=
 =?us-ascii?Q?7u4XBGAPM24svwcJEc1ai+VmVBfE+AkDYQHtEb1CjAiuqHoGGXwriQtQO42e?=
 =?us-ascii?Q?rAezwKNGCI+jG9/dY26hdRbcbNob/Lq0ZpITzLxWXf/mDcDdDYjdfPJ+RerJ?=
 =?us-ascii?Q?j+NxjX6sdSM4RyQfl4FXro/wkKBiBzk1UXxT0WabMUVRLv4scPaTOyj5h9Fb?=
 =?us-ascii?Q?fH8L7FIJ7ttxJmCVDnfDOjj1k0PaKdv80ZKifi2kr9tsozh0x2Hfng7rAUNO?=
 =?us-ascii?Q?CkcSj0/ycg8DGCeLgSGCZapCJN1JrlU4UvaNBXN3b8hLv5hpBmaV8XO0+o2U?=
 =?us-ascii?Q?ClxOu1VYdqqx6xanKipMp/ugQRbgYDTq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNA9b6XULrk8fiRYPvknSHiNegVlBHW6MjV3BqjQ/3XNyTxTtJoekaEF/laY?=
 =?us-ascii?Q?TNqGRbEpLKMaLu9T985n9bovJv1YNg0/sUaa1+DHtevDw3+3OrroC1d1uzaC?=
 =?us-ascii?Q?sve1UkMbZEP3y6ZliKA3oNZy0dZxVQoUHZOGo91+SpO77SwLGrq4rhaSQB99?=
 =?us-ascii?Q?J5HznJsAF0UjKwzha6PFqz6WebSzIgaBurdwmdUj2+fGbkX0+pziuNbPqqTl?=
 =?us-ascii?Q?KFNXR3IgO2fQ8fulIXq2EICt/o95kgGmkZbKhcHaSqC4f68+EHxtw+cOpzs8?=
 =?us-ascii?Q?V6453JF1bVb7psilg5+5nRBnyXBWOc7nX0ImfH+ICLv5z7pVQtoP03evrsKG?=
 =?us-ascii?Q?MyYzatlXWl0P/MZ6oy2CGoY3gMxc/HiBcqO3uBj4P+b/6guQXSH2762i5H5Q?=
 =?us-ascii?Q?umMtn7GTZzJ8SWZMGHIICSl+W4BUW2dZ7PAtkqMQ3HlXv9GW90Z8BReLSrvG?=
 =?us-ascii?Q?4egSKWVq+LN9BnQt3B63bVO7QHrQXlqjQHTo3ZDbiCu+G5pRXS8v/T+upynP?=
 =?us-ascii?Q?BogubcB7o1DrbVUzSrsaai7gpzfsJBnQ/lw9fXEFgVUwWCUyL1HsrvjNw43J?=
 =?us-ascii?Q?juzDyot8kqwAKM7CbVWscDDSFNSmz7uNHT0s58xhIINpIXuVA9ed0i4CbYut?=
 =?us-ascii?Q?ZTO8wGU3gtvvSsqaSS35ABmhrIbfgK9c3WYNEgg64YoMiKZ74xNDm/3p+dnp?=
 =?us-ascii?Q?JXCDA63OnAocyTgBITaD5QAqJhahHi2vFya/8kGC/vfERcEo38NPr9c3lQBr?=
 =?us-ascii?Q?RVpQG8n1lU/kEzoT3+J9wPBCE/lXsl0+EiooN1T7sHqJJHkyyIT4jfwJwCTZ?=
 =?us-ascii?Q?h0u44g02eMqQ+3oadDvo379wVwnh2cv9AcaDFNknBF9TwpCb54QutGq5ICN/?=
 =?us-ascii?Q?1Ry5VutvjOQoJbMA6kwt3Xv94VT2+qtR1t/jl3QL6gCySvGEVUGDIq9d+XZV?=
 =?us-ascii?Q?98/5MDL7BMt+ea5E4Nwxb+8bKxTZRI8Chz4qZ/utXKpA5bFXpa0uFsJDPQyG?=
 =?us-ascii?Q?+IKbqKwG3LjOqY4sxGG0GXltoSx0UNLMO5vDkiCU1EDjcYPr3D0J1xcWrQsj?=
 =?us-ascii?Q?XFL7KPzYRWqXzyNzbeY1jC3UAEW5m3NCf6gGKtKfY7fSBc8eZSBFAAGuIGGe?=
 =?us-ascii?Q?9ZnxtZ25wH0xfY5f+iXHtpeZs0H8A2q3iCnGmEGT9xW7+5RngYPjzOp0SH/O?=
 =?us-ascii?Q?j9Yb34DOJMV2p2uEuzlmrP9Y6fcFwVKU0s1rg8/y27KWqqAAT2yzbD7/UdM0?=
 =?us-ascii?Q?zCE0fumGprrABi2hLjwy8mjhYPwBiemYlLKHFJ8dDptenJzNqGZoLBEXLPFI?=
 =?us-ascii?Q?FOdrsZxOV5U9wAsVikdvob8tw/5uMen8KdqtA8DM2/CHDai38CpmzTW/WyUZ?=
 =?us-ascii?Q?aT/7zEjNZBR5DCiO1etqvSmu6jgcNygsYjFRaTQOsnnaT8aD0cuOQmFLn8V4?=
 =?us-ascii?Q?95WAp+8gASl/DamlRBks0fR6MgBjZeN0VojtP6og1/1e3WRtcZ/wnqDrIdri?=
 =?us-ascii?Q?LFA5G+jpOvcij2rI1RcY9AAmwWkQavf6+p8ttHrffP4rcujPiVyZpArx9bbC?=
 =?us-ascii?Q?Zvavn51PjukuREMc0cdg2Ef5UDFgaoxCJ0o/Lbg8?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34198af-c1f5-4fd0-dad9-08dd2f23f1ca
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:02:38.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baUV8zyb/5jv6t5A0ZcZNqKPRoKEOUViOJxcw455LaN41Wo8hsNsMXpa63RQk+NZFmZ5YESusg3BIiEwyhob5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

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


