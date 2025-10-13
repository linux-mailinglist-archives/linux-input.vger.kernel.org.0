Return-Path: <linux-input+bounces-15420-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774CBD53DD
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 18:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C3E545BFD
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B07F31280A;
	Mon, 13 Oct 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="h4qxQ6ce";
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="dYrF5O+e"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA184309DB1;
	Mon, 13 Oct 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370067; cv=fail; b=mIdl6uNKSXjruC6JKIWChRUcG3LjRxoh5cCqYJGNNnPKeK9UwRseJ1WbTbuEIl16gbk86kR1k9lGanGs75yDLjWRM56vQy8pPnUb61ZF5h4Rh6/EHYrUzLUNCHIqknyDxE4yUWO85rxs1dzuAFckSLAiIfyJnTFcGecWBtIedgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370067; c=relaxed/simple;
	bh=HyzoZqLvWURTLk37YKcQ0kSP3UoVEpa6FhN/Tgo1ETE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oaxeUxSwcGCuOIBnVdAzV7I7lOI1eS+LSPQmHN+M+KAPCeOk0818cTUwBQfHnzCCcVIf/Vfqw6xm5/6UGqtxugpf3W8jwFGtt3zss0wNvbiz5D/PovcbVkM5Ll5HUA9a7mcA/7XR0IsjCOVVyeb8FstQNdAksUail3dQQjkLAzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com; spf=pass smtp.mailfrom=garmin.com; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=h4qxQ6ce; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=dYrF5O+e; arc=fail smtp.client-ip=205.220.177.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garmin.com
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7qF31022159;
	Mon, 13 Oct 2025 10:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=rycCxfyjGo//UGNSnYjH9ywB5xC
	t91xZrNKHdjaZGUk=; b=h4qxQ6ceT60eieRYk/zfIblKAVIr17eEamcTXxNpBZ2
	+V2ZNwt1EA0IitBOFV+Fu0JSkVNzGIN70SyyWp5ircx/wk6CKBdamddLYqjCCmeg
	nsvZ4TQlHG7CnYpcnURzmyNcxaBaHJWn+7enMQeklAaC2UrcdoJdZtdV8Rrsl9Ml
	RR4y/5TRc5SM4dD2Y6WtdFQiFFiOuJfjxTACSrFJoH7hZqOJMEjLGIW3gZBekW24
	WrVHb7XdUSw1Q0/e/v66yXzKAyg45q6WAHzP4Fj4ZsYCc/7pYscdUz3uoanvq84t
	8EaxhIj4sZkBNOu42G4qZWTPXvVrnLQ6y45Z31zr1VA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022132.outbound.protection.outlook.com [52.101.43.132])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 49rwdc0yan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:23:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbiOky4/PaYvCSvjNBp9t5BLvteXMeM7QHUFXiZ8QSKLTn7ALRK0Ls/K/iovF7irqcFk0MSO1D3N6dqFEFMxilXSVvPItP4zcj3PYUIGVawynDscCrHbWEP2LiG6LhqMjqlv28ZhjunkCzmuwe22iEa8AT47Ji+SAqxyJzNISvCobeIJlvn4rEiqNc3PQCA+ct6pikP6j8NNlci4rUCJcfxBf/QW29msNuKgtAPiLd3XIgf+0RQPIF0dxzYSaW/cHqyVhGqNdIy1BN+qKIoFSJHRWHW0tR1TxutT7yCiVgwIaOauupYwf++345bQYK+Kwr7MfNNeVKtUiickcnBjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rycCxfyjGo//UGNSnYjH9ywB5xCt91xZrNKHdjaZGUk=;
 b=xZMhrnRnuhlBsfUpW2aZm7AmSbYCU3bKkT5PQGetUUDbg1sWIMU7f+VHFg45KN6EsJ+Ve3zvMtJOL4r2j+XSWFWF226q2TCTk1+aUi3bBNhZhKclSJiThwyfBQ2+L8ZwLizJUEpZYALbUrCWTaQ30wLmNmccANitDz0OPgDbBnW/QZuqcci1TBMrwBNFGN1CLfkTEDTxWugqtxzM74Z2LsKlBj0/rWMvnNmCU6qtVLCxhpge+vVJQ3sTJjbeVagUSPRoIAAqTZFyXiJ5GkCzQuugVl9pVAvYs0En07Kd2kD+wQ8HlB0aRCsJOYtV+lb4kk9Sm/FqNDoP8x8tRvuPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=garmin.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rycCxfyjGo//UGNSnYjH9ywB5xCt91xZrNKHdjaZGUk=;
 b=dYrF5O+eUWc/qGe6GBaaRNKAQgS/yC/2GM4OMXWyQ+l/pr/VbpqZecV9Qj/f0rYoyC9OGTUXqHrKdhtVf7qaOnqZxR02UTI4W8IMMl3MLelwAYThz4m5O5K+9UbYJsau/uDzwj2geSLjwyZoQbFqP19ETle7TVLj3dlWkNRTvvZxwSwy3g/VV1k42f/gOHNIkmQrm614u9ZvGIwKZnRxxrx5jH68fEHhbS5ZiYWCFi+BsA+dnqtozoBTJS4Sn2xtrE0A7C7h0pJ6CKxcsECsO3uXJmZvmyM4P/84YsyL+oPgtl7tHSp2+jY3d1CuHw/EsrjJlboBISkONwzUIORVGA==
Received: from BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::32)
 by PH0PR04MB7574.namprd04.prod.outlook.com (2603:10b6:510:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 15:23:50 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::99) by BN9P221CA0020.outlook.office365.com
 (2603:10b6:408:10a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 15:23:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 15:23:49 +0000
Received: from KC3WPA-EXSE02.ad.garmin.com (10.65.32.85) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 10:23:47 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 KC3WPA-EXSE02.ad.garmin.com (10.65.32.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 13 Oct 2025 10:23:48 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 13 Oct 2025 10:23:48 -0500
Received: from OLA-7VZWMW3.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Mon, 13 Oct 2025 10:23:48 -0500
From: Hunter Moore <Hunter.Moore@garmin.com>
To: <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hunter
 Moore" <hunter.moore@garmin.com>,
        Hunter Moore <Hunter.Moore@garmin.com>
Subject: [PATCH] input: Add marine keycodes for radar control.
Date: Mon, 13 Oct 2025 10:23:09 -0500
Message-ID: <20251013152309.880-1-Hunter.Moore@garmin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH0PR04MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4511b2-31e0-4dcb-53a6-08de0a6c8282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6UnDnchGcWfcBWFlQjEScPobRLcT7WvPz4mew/fx7u/LITCuN+TbYcYeuFNe?=
 =?us-ascii?Q?UgFJtN7sMoQOX+BHGiANEIUGZ/qdOPuEPIlSRtxphzFEmXlD1lVVJe87eJOj?=
 =?us-ascii?Q?/Gjl61OLAR9G5TqQsyw/tTzNsuh4zSq18yTWVaLAZcSoLmaZKR704RTNDaVD?=
 =?us-ascii?Q?v+qzmCUK9chaZbb2OKgeXQ0sKe9UwuFeTcUgu4RFIrm/jZ5mMnVL8vu25KkC?=
 =?us-ascii?Q?wj0RGyVToOeuF67yUUlKa7tsX8Av0QuqaByTfOEJcLTAsDgJXZijbbTwo6pv?=
 =?us-ascii?Q?MS3ZMhq8Z0R+xwqxfzH9lK4KD2lf61GHO+Wl2snpzvSVr+Iv4ab1vZ0Zk5bA?=
 =?us-ascii?Q?EXsTECTNuDjFtwiXl7pSRzmgLGJJbE8QEgYEimOVcvhfrMH9jFjyXX0W1ZBi?=
 =?us-ascii?Q?v1Y1BmrEfpVhVDqEBArUfV9zD1oMZqplaC38q30IcsLds+3mB19pcD6XCxAt?=
 =?us-ascii?Q?C7tc8APk9X2Isp5/llRqT+9u8725cpedW/p+aJZfDoyBwsSjNbZ9yyl6GlUg?=
 =?us-ascii?Q?ibp7PjgrVB9f/hFQD9t1LqLACT2IrdyKPpni+WVPdZklOb5QC16BW3qu4k/V?=
 =?us-ascii?Q?I3F68JsVtYtXjoUoAiQ4FvSIhSa3/Rf7WGOvXWjrHtt3sKEeBzo6wGW3m5UH?=
 =?us-ascii?Q?Habr3I+RtAvZs2GJv6LGn7J04c8qkVnc6kHVJWWU+vBICponaIStNvkG2plQ?=
 =?us-ascii?Q?94FgvKShGYmkvKh26zfzJC+bKvQgPmEFGsJu+cFSkpDxiXbbZ10OHGEnS4FJ?=
 =?us-ascii?Q?6XskcOjhY7QHGGZUgdFu/SdQ9u6VMBmmrtVfzyZoli6gJSuCd1iS9DvL7NYQ?=
 =?us-ascii?Q?sBPAvv9KyPhvdu+VGE9hTzMqZPg6cRywNB6Hp9exBanPMhAhGHwO19xO1rRH?=
 =?us-ascii?Q?ACxJZ5c1gHlSDwt/izqUO7vnnl6rxkOPmp7/MX++KlQL/qjWs9Oo3x1Ktro/?=
 =?us-ascii?Q?vrRRUmdTUezC51wLLLvofUij4nPFFE/GtbG+BK8g+mTEvL10qs+4003QB7wQ?=
 =?us-ascii?Q?WwGZWXowsdnnyoQW7D50q1ciuF9gZs31DYvobhLw6J8iZtx7UXiJj3UWyl9l?=
 =?us-ascii?Q?3GyL8WIJ2k5SEaM3ezHNj7KM2eWcZvx9wuN7ju56abJv89agJdw3t+S7s05Q?=
 =?us-ascii?Q?JZbIrJrQt/7gz2V6ncl4jOzD0NXBKfXkpD6/WH2dMHzudCUaTFhyW5AyWPv0?=
 =?us-ascii?Q?EP5hsfApxxCdskQjgEyBb2qPbkaCf9EKB7c037rA/eYTksRsu+EzdyxQt4lY?=
 =?us-ascii?Q?LORWXBfhyg7BGcPUVZAr14TTjSH5ktIJON452lT+cZ7KWV7ULiL7r0+dQ+4F?=
 =?us-ascii?Q?xgYs4srGvEADj7fznch6mKLtDbau0kTf8Tb0hVg1G7eLQWCSEQg/X30fPR4e?=
 =?us-ascii?Q?4Q0KZh4t6QI8nhYGM3g95YBqvh8nrqEG2H3a3xc1SrBs+Vhgy1/SItvqLg8S?=
 =?us-ascii?Q?CA+EVPfYcBJdlrW/uqwa+mVy+e5ercsz+4sxvuzaoFWTj8RRxjc7pvznkncC?=
 =?us-ascii?Q?OAP9GOXqiCPWOI8xm98rQeC4ELRVwVf8NxEvOyYGBgfcmdx1fZUPjI+HmJZF?=
 =?us-ascii?Q?MZKJg5xXBJDR0FfcbNQ=3D?=
X-Forefront-Antispam-Report:
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:23:49.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4511b2-31e0-4dcb-53a6-08de0a6c8282
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7574
X-Authority-Analysis: v=2.4 cv=ZpXg6t7G c=1 sm=1 tr=0 ts=68ed1988 cx=c_pps a=T6DPE/DVwP9kL+SBve89ug==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=x6icFKpwvdMA:10 a=qm69fr9Wx_0A:10 a=NbHB2C0EAAAA:8 a=DoN9cN5wUoVrpapQZuoA:9 cc=ntf
X-Proofpoint-ORIG-GUID: h6YYfrPoLf9SHXiY6J2cLTNInn5goUaA
X-Proofpoint-GUID: h6YYfrPoLf9SHXiY6J2cLTNInn5goUaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzOCBTYWx0ZWRfX8KaKcQEpdHoq bc6votDKHm0Y3cFohN4lDDb/w7SA6JJlsYDz7zqHomfSXbKS27s+YX6l5vhEqetuo43/I9jsJGP j+rsij0dThhogyNYF5uBVGBVP1Uv+tBDkscGAl2oejFs0NQgTQYi0xLhMokHp9qwlU2j1O5Py79
 mYH0cm9eLZS9DJuJC3t6l0Lc2b6P/w93LCnUjbVcKVRR/qSg3GG4cIVRyInMImxZ+l+TU5DA6vy MwQ53ywHVoUm40Hoc2DCANYV526waD+f0Va6fS4VAXjjf0O3peU3IGIet8Pfqe5o0nVjTEMEhk+ K8eznIClnUe3jh4JEq4SQHfaeMpIDOxDH5SOkYFfqIuL2R6UDoyz1u44eAaEbhcuLS46gt4ggyl
 VoazcvhEeLo21u5a/hSYeImR3x9yPR1iEAuUUZAnYVECbdS3iBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2510020000
 definitions=main-2510130038

From: Hunter Moore <hunter.moore@garmin.com>

We are looking into adding some additional keycodes to add support for
radar control. In total we are adding 29 keycodes which seems to
exceed the KEY_MAX limit set, so we have also bumped this value to
0x3ff to double the available keycodes.

Signed-off-by: Hunter Moore <Hunter.Moore@garmin.com>
---
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h | 32 +++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetabl=
e.h
index 6077972e8b45..97f8867955de 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -333,7 +333,7 @@ struct pcmcia_device_id {
 /* Input */
 #define INPUT_DEVICE_ID_EV_MAX         0x1f
 #define INPUT_DEVICE_ID_KEY_MIN_INTERESTING    0x71
-#define INPUT_DEVICE_ID_KEY_MAX                0x2ff
+#define INPUT_DEVICE_ID_KEY_MAX                0x3ff
 #define INPUT_DEVICE_ID_REL_MAX                0x0f
 #define INPUT_DEVICE_ID_ABS_MAX                0x3f
 #define INPUT_DEVICE_ID_MSC_MAX                0x07
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/in=
put-event-codes.h
index ca5851e97fac..49a7fd7c0e23 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -815,9 +815,39 @@
 #define BTN_TRIGGER_HAPPY39            0x2e6
 #define BTN_TRIGGER_HAPPY40            0x2e7

+#define KEY_RADAR_TRANSMIT             0x2e8
+#define KEY_RADAR_RANGE_UP             0x2e9
+#define KEY_RADAR_RANGE_DOWN           0x2ea
+#define KEY_RADAR_GAIN_UP              0x2eb
+#define KEY_RADAR_GAIN_DOWN            0x2ec
+#define KEY_RADAR_SEA_UP               0x2ed
+#define KEY_RADAR_SEA_DOWN             0x2ee
+#define KEY_RADAR_RAIN_UP              0x2ef
+#define KEY_RADAR_RAIN_DOWN            0x2f0
+#define KEY_RADAR_VRM1_UP              0x2f1
+#define KEY_RADAR_VRM1_DOWN            0x2f2
+#define KEY_RADAR_VRM2_UP              0x2f3
+#define KEY_RADAR_VRM2_DOWN            0x2f4
+#define KEY_RADAR_EBL1_UP              0x2f5
+#define KEY_RADAR_EBL1_DOWN            0x2f6
+#define KEY_RADAR_EBL2_UP              0x2f7
+#define KEY_RADAR_EBL2_DOWN            0x2f8
+#define KEY_RADAR_VRM_TOGGLE           0x2f9
+#define KEY_RADAR_VRM_UP               0x2fa
+#define KEY_RADAR_VRM_DOWN             0x2fb
+#define KEY_RADAR_EBL_TOGGLE           0x2fc
+#define KEY_RADAR_EBL_UP               0x2fd
+#define KEY_RADAR_EBL_DOWN             0x2fe
+#define KEY_RADAR_SCANNER_TOGGLE       0x2ff
+#define KEY_RADAR_SCANNER1             0x300
+#define KEY_RADAR_SCANNER2             0x301
+#define KEY_RADAR_CHANNEL_TOGGLE       0x302
+#define KEY_RADAR_CHANNEL_A            0x303
+#define KEY_RADAR_CHANNEL_B            0x304
+
 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING    KEY_MUTE
-#define KEY_MAX                        0x2ff
+#define KEY_MAX                        0x3ff
 #define KEY_CNT                        (KEY_MAX+1)

 /*
--
2.43.0


________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.

