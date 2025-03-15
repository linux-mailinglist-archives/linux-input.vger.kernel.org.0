Return-Path: <linux-input+bounces-10853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623DA62A38
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 10:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C474F3B3CEF
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 09:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8321F582A;
	Sat, 15 Mar 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="HFPrFt25"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19661F561B;
	Sat, 15 Mar 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031304; cv=fail; b=WTyAXMj6S1A+LFdmkabaWkGnLhEMhLafkrILKNRWcAHnIfTxshHGM5RER6sloHV+N+tN9zQef7mQXH0c+rguMfYPpKcyEII+Ic7k8lM/b05ehih8Fch2lLbT/u5JcWiSE8l7cqnzKxLn1ybMTxwSVFHUSFghDbBp33lYBtBbScg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031304; c=relaxed/simple;
	bh=vcRyZY+gOjl3fwuxO0T6ypy1CBDG4H1dzGDg/wvNm4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=i7nRbbbmaqWyUzvamiI8JfCW2vjYh1m6weO57djksK8rME3HOHnyJeBrwKsnnLuGrHZO+vYjzCczm7+c8wo13pI3R8nqOaLNfAYyFwhRdWY1tooEXgoz7m3hvWnutY7RD2kGGxSPC3+EUX0qxnfIn8REOngjkr7iDDJ9BO33oHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=HFPrFt25; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpDiPYtMid8zyLMEB9najsrX2xtuQQpIMLzqEjlzeYOiA9yGEX4yLYxpXUgyqmToG3uic/46XBY09xUzue5yIreimJgssQUjlv2p6df6VD+lnM3c7nMQofNn0qeU48ddDMIUYMJ7wi4QOVRlLybGrpVe8D8g8jiyPQs0vAk2rOPLAnwSR0VOgj6LIzHSLezSfrS0EiAy7sJQXZRyJqJVJ+1pLdo/lrAYs4qxlcEsRDapoeOgTNPR2++ZpRttAZzlsGws39kbE1qWkkNexEuOGftFc5/MXFUmWkwaPpmcOd79LNRx/P5qQvnNQcQhqvTfBh0tQXA+kxI2tq6CwLXzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L21BrEY0MwQnNKmPPGyjOqbNdDpqz3gMjzZYSw0qqmw=;
 b=wnhjfGWXpySmHk75T5c6hVzBuWFfpck+5GRTA72wtT1KlCpWBebbx2O3+vzXdVVf1LL8getcfOon6KA/gjcT8mOSQMewmnG4iIgUpNYUmF4UdChCT/0rvyoXWZpVr6qdPx3CZjNH/m7pmSYylAJ/yiXYFv0dxUmbor77Xhgo9QoZSJol69NH3e4ZWNu1K7uDZvY/CQxR0oZuByx+8PzzQ/QYxL/A0hHRIr8ZP42m68F1EUI90uWX3zRrgcSmaNW4cQeI6q0Zr5S/MEbJS/3lQkrMe2DjV8Q58ioskQ5j+zzGV7rSRV7jlu586kCm/otbdQc8oh6uQ8ZH7SDWtiF/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L21BrEY0MwQnNKmPPGyjOqbNdDpqz3gMjzZYSw0qqmw=;
 b=HFPrFt25WfobwQmbObnCN0BOM1HAB5iYfdRJ/5cjRfUWZEekUAfW08QCwf9ap1pDqn1BgPtmEUuWdylDoM7nYdpr+UsG9mg6Q8hEn8vTcw5oYF13JWykPFajCey7eoHZO2I/SrTSGs1AAZtobFfB4o2eZy7T+upCf+m+QYi6OFZVzbrMLpm3sLQLS+3ZELJfunAExJwfar7ztTfGudzSoSW+LJBZr4UPMQb6/vPGa6df5XEYIdg3vC2SCxrpeCHkN/SBIYfpHMHCy1McyCYZdqz/pVLOvl9SOX+GZYFzq7YU/cPCJVxA7SeTuhJ3g7DxXJ5rh8816vtT/FzEStcJXQ==
Received: from BY5PR17CA0027.namprd17.prod.outlook.com (2603:10b6:a03:1b8::40)
 by LV3PR22MB5229.namprd22.prod.outlook.com (2603:10b6:408:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Sat, 15 Mar
 2025 09:35:00 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::c) by BY5PR17CA0027.outlook.office365.com
 (2603:10b6:a03:1b8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Sat,
 15 Mar 2025 09:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Sat, 15 Mar 2025 09:34:59 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1226EAD4D0;
	Sat, 15 Mar 2025 11:34:57 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Input: snvs_pwrkey - add configurable force shutdown time
Date: Sat, 15 Mar 2025 11:34:53 +0200
Message-Id: <20250315093455.1100-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|LV3PR22MB5229:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9aec251-81a7-465d-8006-08dd63a4a7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3yoD0O+CNrC8viDofpzrf4PJL/HqzMWJw4PD5+VdLbZ0H5b0GqZjUpdhXNfa?=
 =?us-ascii?Q?SkuPte+pw60ljnjDrfqZqpdelo+iDYmKbIjmNYofTZvgIYT3ngEk2DRjyxSZ?=
 =?us-ascii?Q?3VlKKs70pYgOk1oH2io/rvj14n3ZKM+OmktAMazRBnHVaq6RpONX2hAaPFoU?=
 =?us-ascii?Q?g7PYnJ8xf6syi1RUywAaAjd9sVyWp/TWrdCgsAxsB0WiCkZrCqM4849nm/OV?=
 =?us-ascii?Q?YX3rRuQdnieND79ebLa7xVyeGo77iUtxhXf+jdvHIjM5rfV3Hg+/yYnzrNWA?=
 =?us-ascii?Q?ZDSJ35aiSgOkOAdOHSD28Hr0g5ajGDsKIs1/e8Etpxn4i+67q6ieuItWhNV0?=
 =?us-ascii?Q?MxRkDmN9DQMIFli/xiTolF5prUXx0PtZR+AJV3ewJA3a6kkQWAvbHUDYC7rP?=
 =?us-ascii?Q?4BkgmvexrhqHORtwARInEeHU+IXM6tKRqiSTlhmvtqz8O8i7wbSH4dAnos+b?=
 =?us-ascii?Q?HqbP7gQSY47SB+dGHDQJFNQbt7B5fF6EJo6naQd4UNLvEgEQZ6IITiCA9mQb?=
 =?us-ascii?Q?0Ydxdpk8+kVroe8UItCIaK1mwUXYZL2VkDgJZSlRX2mmqA3cj3EO3cy1LDLH?=
 =?us-ascii?Q?WDjorPnLKnYEsneftxElU5hl6aOFPFUeBUKarhn/X/Zn4uv2rElfpQcPuPtN?=
 =?us-ascii?Q?a0jAQ/x+rzYwWQfY890cQib6NZfhYxIbKlJN7vCljt6G2UznrRzMQ62dPRzw?=
 =?us-ascii?Q?b3zOAYZ4Dp3AaR5IRjHFQI+Sxc2+/9es52Gk2OiCK/oKn/b+h0UxsjhDaqDs?=
 =?us-ascii?Q?GSKrhmDICFxdBus28oH65Fo2iGbloi1zjpKK7b2uwpLeh+k+cmavT8ibrukS?=
 =?us-ascii?Q?GkG5vorGp9PheAuVZDvDXPWDAsWIUnhEAY0lqUb7Q5mTbFIXpneNDX9/svf3?=
 =?us-ascii?Q?RDt/9sKmsPpEPD7XzyAA1Da3vkDSX3kTBsLGD0W6/HcRxioCZ2iEwlp6Bvdu?=
 =?us-ascii?Q?OuHKl96O9L+rQXRpEFdv72WXXv62gKvwVTfwPSelH4OuJgnDPPGOFnWPZeaX?=
 =?us-ascii?Q?cUFMCnaasjOoWMUuSmfA2MvMEFEDEus0c1+rVJOjekjK/Yd8N7HITwx7wpXh?=
 =?us-ascii?Q?lH69dWiNnbd+gPOXWA2MV/jc+QXyiOAZ2uwRd70/va+DhEkgsGaTgPaUd3eP?=
 =?us-ascii?Q?fxoaSU94sM/w/E0dgjQ+Gsg2A4RoxraEXIKHoG3gSRIsa3tkOv/zgr9hq5is?=
 =?us-ascii?Q?QGn5JiG7D2ojop3UbbMO/Lt4KgvhovaOPUqh8RvXnOlj/T73BkkgSFEY/pH6?=
 =?us-ascii?Q?Hz5d9K9K6kQCRb7uICodnZN20MIX38R/K5S4e6dKqQrMeJZGahDIRnzsvro7?=
 =?us-ascii?Q?Y/WnU00EQWz3YuYzTIY2C3oLMvd8EEuCqNIrcINHZRRTCuLpCIhGupstZBCG?=
 =?us-ascii?Q?sPWwCtkKj5WouG4v+Ws7J2pOQaJ6Cc1rvG4lMxLgBVYahZaxrcmnVSYfMpgw?=
 =?us-ascii?Q?7rakUW1o3V0xhddKcEkIuLDYgv+R7Iv3fMxlQdnfxuK0cLb1XZhHEKfYYgmm?=
 =?us-ascii?Q?Yp0MMQo6OwQdgjI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 09:34:59.5053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aec251-81a7-465d-8006-08dd63a4a7ea
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5229

PATCH 1 - update binding
PATCH 2 - add support to driver

Changes since v2:
* Fix dtbs_check (thank you, Krzysztof, for pointing this out)

Changes since v1:
* Drop binding

Ian Ray (2):
  dt-bindings: crypto: fsl,sec-v4.0-mon: Add "power-off-time-sec"
  Input: snvs_pwrkey - support power-off-time-sec

 .../bindings/crypto/fsl,sec-v4.0-mon.yaml     |  5 +++++
 drivers/input/keyboard/snvs_pwrkey.c          | 22 +++++++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.39.5


