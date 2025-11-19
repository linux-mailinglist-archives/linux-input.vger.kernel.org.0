Return-Path: <linux-input+bounces-16222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95CC706D2
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 18:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 449AB3A4EB2
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 17:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C0A30B527;
	Wed, 19 Nov 2025 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="UEEsv2vc";
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="WhZgc3Gj"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D43093CD;
	Wed, 19 Nov 2025 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572364; cv=fail; b=TSAI3nN/NT+TIJz6bPXhhW7pjKLqrn3NQ+RZJQ4yo9X8iM5FyaVuKJJz3Lp/ex5rdgtYjhZKRVCPFos8id6ZyiHByLYAYCoubvAa60TWpA+sfW0ivZkhDiAqnecQRgx/uaIafC9s23/YOmYIrP89RtKjyVAkO09FaSkiO/XuIF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572364; c=relaxed/simple;
	bh=DJS38j7TJkFb1+7z4Bkiz2UCtYOP7dA5Lj79uW41/L8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqL3HwFr3VASpPMqYSHjLB24BEN5pekEt+9TB/vT7igdDWGLL7+7g50NyzIxFea0PMicuj15NleUSwmLoUaD1UERCWEMmE1xk+smdoEGXa7goSAVJQGFzXE9Zbn+7Mpv94Tuxw6DC0HDj4fwFKwxzv2OmY13x/PoWP7XFn+mz/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com; spf=pass smtp.mailfrom=garmin.com; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=UEEsv2vc; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=WhZgc3Gj; arc=fail smtp.client-ip=205.220.165.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garmin.com
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCKnJw026316;
	Wed, 19 Nov 2025 10:38:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=DJS38
	j7TJkFb1+7z4Bkiz2UCtYOP7dA5Lj79uW41/L8=; b=UEEsv2vc4Z772qivsNTu2
	liY74hvg5ZxQ1Gl8guvP77tyfiqKO0wd4sPOXux+H7byZF1jgcxRA43BjTbAzA0F
	gDetGjZTTT4/cqIorvnh3KFjObKa48DicHNR/0/bC9rO4B28JB6d+EmeA/++QPrr
	MUsa1RJiJFpVbwUQAZ7ClWBXczVTpti6xefwqdtKjiixMpZhlY3jChirN3Aw77Ke
	5ElcnV4l13v6tHxqmOzHEp0WAFbst+7KcDdULu6HiqVuDMDzxW3HxYlMJ8Yez1K0
	eeIhnwUB5cXYrpdxO5MX4K1zyvvGyLmaKdulEQ5icqfDn1NghpT35Pq6M8j93cUs
	g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020079.outbound.protection.outlook.com [52.101.61.79])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4ahc6q8r6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 10:38:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYvDLvjgIuzyed449TD8xWA1fHfG8D5kpXVO3RuvMkkO3DZpFtRql7pWUGiguEj4gMeNJy4hHLGk18Tfvc2tKks9bLlRQKTrXCjigNyUXGTFuJFxAdz1yCMiPqipNtb1VjsDVrJqxbStAJnCxklzDVi35QUJkQ9yQVCpgheFA4SiaVQ8v7mu35ielOryJu10txPdyLi9plJuOqYoNGfqdCQVoKY5CSHXOCGtdfWMceuZiIDhMhgEvyAPMXX5vf7AFygkrFdze1QYs777Z+f67G03ilKtEg6riEjev/u6aBv0bOXOAJ893Qp93ByZnlPdTnjZnpBuGjzUcI870mluPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJS38j7TJkFb1+7z4Bkiz2UCtYOP7dA5Lj79uW41/L8=;
 b=lVxlXBebhaGboEowddTxhQUGGmTBhFYPzyWcMh/fWKUJYxvenJfP279rqgl9gWrXO4eNUUjvVvenRpP41B6ljm/MYvVhUylZpWI9klkdmsL+wg/2I7LiiuFkDTAnG2Fj2Gxs04G1ORyq5VPCw/NEpkP/8jzd4y6zhPRcACNNvT+5iyM1pLZJngv8knkA4el5SGilo4ZMCm/60afJZROXr0uW3eVdrX/bByDarDZlYNnxQ6RZUq91DHhunUsDmOMgMlzv/DCRMG8qgjECufTzRBE14gOlEnqpaH8KGEHAYzMNrk8oMOm2kuB25VrcCks5ceKT1Pt1EhsmsaCLdRZhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=garmin.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJS38j7TJkFb1+7z4Bkiz2UCtYOP7dA5Lj79uW41/L8=;
 b=WhZgc3GjFJ6p0w8hy9LnuY7dO7m8IHaLct7ijaE1yyY49dcGD1Y/I81kem9OB3K53+N2v6OSRlJJOErrqyKzuEt/ymqm1weI0IYH1vNOhfiqZlqsqy2I0WbaZMlQ3USNXfuOrlnXbyJUAQLXh3QjKDpvsShyfjpyYB+EOQjszmpDpHMYezefEeBp9wA4UOyYfwqk4lkXtBDENMIaJewmlNSD5PYfRR6HuTwjNhjjCz1FqRPCcpaKT+eAKhrQc/nYF1PHAz1bgNBPsEsO+GxQGS9vzUHs+zkkVHFYYAJqVd8BFpBwHVyDJJ27b3SUqAIqzenaAAyfW0/ZIQ0S/TSZRw==
Received: from MW4PR03CA0357.namprd03.prod.outlook.com (2603:10b6:303:dc::32)
 by BY5PR04MB6644.namprd04.prod.outlook.com (2603:10b6:a03:22f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:38:46 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::3a) by MW4PR03CA0357.outlook.office365.com
 (2603:10b6:303:dc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 16:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 16:38:46 +0000
Received: from KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 10:38:42 -0600
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Wed, 19 Nov 2025 08:38:44 -0800
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 19 Nov 2025 10:38:44 -0600
Received: from OLA-7VZWMW3.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 19 Nov 2025 10:38:44 -0600
From: Hunter Moore <Hunter.Moore@garmin.com>
To: <dmitry.torokhov@gmail.com>
CC: <Hunter.Moore@garmin.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] input: Add marine keycodes for radar control.
Date: Wed, 19 Nov 2025 10:38:42 -0600
Message-ID: <20251119163844.1343-1-Hunter.Moore@garmin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2rtgkpu7dzfxrnmepwxmxmemiqmmbx4fl6ow336f6spjdgqj7k@fxgfc26vzzkk>
References: <2rtgkpu7dzfxrnmepwxmxmemiqmmbx4fl6ow336f6spjdgqj7k@fxgfc26vzzkk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|BY5PR04MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cbe928-0383-4b1c-8136-08de278a1c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OC83QkRhaTV6QTV5cFhVT1lpU1NXTHdlcnJhMC9zN09OaEh0Z1dGMi9Zbitp?=
 =?utf-8?B?SVdCSVJGdUpQRkpPRHhORzZham03ZlJiNXNSOHRyVXI5MlBBcTYxYndzUWcr?=
 =?utf-8?B?TVpJckw2SHNRTDA3VUp0QXYvV0hMNjFNVkJkUzZYQjVEWTU1VFIvY0tYbzgw?=
 =?utf-8?B?REMrRHJPN3dqZ3FmbDVsQlAvdFJqYXlFb3pFbldiU2MybmlDbTRaSVZqdUQ0?=
 =?utf-8?B?UFNhQ3hYWnNJTEdEbTQ3Y2hWUkdDQVVKaWp3cDUzSnhLSDV1QUFkL1YrQU5m?=
 =?utf-8?B?bXBjSGtrd1N4S0tTcUw4aEZJbU52bHBtWUFHMWlFcDVhVVJhQTd2UVBSWEkw?=
 =?utf-8?B?enpTL0xoeCtxdEo4azUxSU1BZEMyNW50Mk0wMHduTEcwSFZkY1FPTTFqaEZq?=
 =?utf-8?B?THp0ajhHSTdRdklOWjREemdrd2xULzNZOFFSVVF1VGlMZG9Yd2xHd3NzaGpq?=
 =?utf-8?B?UDlESVhTQnRiZ01QQzlzUGplbEU0SDZhTzBIVjdtWmcxRWM0NkhSc3hjZjNh?=
 =?utf-8?B?b01qd1pHOWdGdFZWMUJyYk1UbG9JeHlZdFdtYW01dFNSRWxEa1o2cXFudkJY?=
 =?utf-8?B?OUxPcG5pV3hPdGs3MzFydm05WGFZK1pKV1pkd3lpa3E0ZDl5NFVHRU9sUzlj?=
 =?utf-8?B?NHRTSjcxZzhaYXhQekZ6SEZOWXRZV0V4bjV3bTFCR3gwSXYvQjUxS21sTCtV?=
 =?utf-8?B?b3VPUUpyWFZTT09xZGNRbVd4L1ZKTzFWV3ZwMSsxekN3Rk5TWFNXeStDUHcz?=
 =?utf-8?B?WXp6VktvSnpPUmtoU3MyQWdrOVNnbm1RekMvaW9EcUYyNTZIRXpaUFduZXF0?=
 =?utf-8?B?RURKcmpHTGxESFZOblNrcm5icFljc3NjRmhhWnpabzZwd1dtZUh4bjlXNy9l?=
 =?utf-8?B?TnNaUHFlVEU2L0JjQjYwRlZlNzE0WVFxSk1veDVENVBNdWJYcU4vWC8rWVJD?=
 =?utf-8?B?cVlZaERNa1RwczdhWHJzZEFUaGZnS0tLb1hBbi9JYXU1L0pLRk1sdVdsK0ZU?=
 =?utf-8?B?bVpzZkdxL3p2UUh1MUJ3b1FpWXFuRnVPaG55Nm5nR0xwczMxWXlTWVN4NVZr?=
 =?utf-8?B?Q0JIZUVLZmxnbGRIWHhWMENudmNPVm5BdWVZRUVrTnRQKzBjN29EaWVjY2dv?=
 =?utf-8?B?Z0w3QmhPbFdLdWxNWVo5UkxZaVNQWXM2U0VMRXFuaHVLZkYyYW1lZzB0cytq?=
 =?utf-8?B?V2p3SUhpUkJGakIxdlZZRllXcnJDb0pZalBUZGNmcnJ3ck1VN2RYY01JY2gw?=
 =?utf-8?B?NFovVllHNkpzbXNkZmJEMWRMdmY4MmZQMExPM01CY3BvL0ZzNWxIRklpK3Zo?=
 =?utf-8?B?OW5uUmpidG93aktsN3RUNTIvMTBlWEdhQWlBbkYrSmVybTdlZWlSTEp4SkZF?=
 =?utf-8?B?c1p0YzRPVWlGMm5uZHJhR2VPUzliOFYvRDI1cTRkaVV6YXJSYlBWazhoNjFT?=
 =?utf-8?B?MWwyci9ZdGVKczFBcmNydjhKWWhSYmo1ZnErUkUybi9xSCszZXFYRHNMbXJj?=
 =?utf-8?B?VFdKeEV6OHJYbmNWNGUzMEE2ZTEva0tmQTFjTXRNcC9ZaVkrZjZSN2ExcnVQ?=
 =?utf-8?B?QWRhZjJJM0lHYmptOVRpNFoxU3VlQWpscmQ4Z3BMTFdEd0JjMGpxanlnb0Zx?=
 =?utf-8?B?dzVhOGh0eUZ4N3JURlZLRkYzUm5rS1BnSzJaSkJJZEtwbjdDSzNOckkvMzhI?=
 =?utf-8?B?dHp6aTZjaGlCdTVPMkhmaFgwWmliL0ZJLys1U0JmeUxCeEpkdExKWEhRYkIv?=
 =?utf-8?B?MjhqdVR5V1VvQ2svcW9Mb21hMDV4SFBsaGJNdExqUVpzK1F6OUYxd1k3QTlj?=
 =?utf-8?B?YjFSYUQwRm5adDBqclNyUFRjaDNKMFlCdHJGb0JmVW8yb29lRjZaK2I1YkNN?=
 =?utf-8?B?elpxUHE4elBHeU1vQnBWRGZ4a0E0ME1wMkJjSjdmbXNzS2hZclhSOUs4aGw3?=
 =?utf-8?B?L05WbGpXZWRIT1ZCdVVIcjFiSDNjeHBWV1BMM2tKclZUaW5UMXRpOWZ4eWVM?=
 =?utf-8?B?ZExHMUl4UEFsSGh6Y3pCRjVEdXp1c25JRlFGOHRHbm9uMkdkd013c1hQVmVR?=
 =?utf-8?B?WUwzVHRCelJ6T09aSGprRzFuQ3hWSE0wZnp5SGg0YnI0NlN6ZEhqeTRSelE5?=
 =?utf-8?Q?5NrY=3D?=
X-Forefront-Antispam-Report:
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:38:46.3539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cbe928-0383-4b1c-8136-08de278a1c2f
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6644
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4MiBTYWx0ZWRfX5MDLVd9/2ugm v2rBqGlf9aLy+pi7gF063Vys+4vDzdIE8iF+5UgS/iT0hn1v0Ed7f/aVSneD2hWAjnxkLXaJfJW 3J8sN4anGtquMPY7PPfBP7ZpJJkEhdHER3o+gLVawGzF4BPKOFe7mPrda4A2lBATdmvz3IQeEn8
 7Jdt8faWrpyIU6cQ1paaMI9nnebuiLctvd7NqVO9Eta+mmPR4z4V4oTP7Qq8Gb4gXozmTfm6hEF yBgVWk0m0wsm+BDa0vmGKwSPK+66I8RfEGnjgaigXPMEE4rZOyY8sxBiVgxHAbZoeSNP2PINvvh ogdV37ksOJY9NUEUJUv0w6cwWlft4Ex/IxkC0tcHBNaIJPF4MpqhjOLQ6C18iTU4PVQ6oOLqHbO
 uAXhy2oiHaCFiYOFkADybEy/CzsEgrzbTNiBI/2AG6VdkieWIJI=
X-Proofpoint-ORIG-GUID: Gkw6-ETVWPjr9L7qbHaBIwjt8voNYEkL
X-Proofpoint-GUID: Gkw6-ETVWPjr9L7qbHaBIwjt8voNYEkL
X-Authority-Analysis: v=2.4 cv=APmYHY6N c=1 sm=1 tr=0 ts=691df299 cx=c_pps a=tlGIxjjmudfNB24gcMuLIA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ZKGdkj8sAAAA:8 a=THScFnNn3HMubUYo2XsA:9 a=QEXdDO2ut3YA:10 a=Zolt3fAZD7eZzM7jSWh4:22 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc=notification route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2510240000 definitions=main-2511190082

Hi Dmitry,

It may help if I provide some context of what we are intending on doing.
We are currently updating some of our radar capabilities. One of the goals
necessitates that our radar devices can be controlled by dedicated hardware
controls. You can see this requirement documented in this publicly availabl=
e
IMO standards document, section 6.1.3[1].

We would like to create as open of a platform as possible to allow 3rd part=
y
manufacturers to create radar control panels. The additional keys are indus=
try
standard functions amoung other commonly available radar control panels, an=
d
not specific to proprietary features. Since radars are important for user
awareness while navigating, we also want to ensure that 3rd party input is
clearly defined.

> No, we will not be adding these new keys since I do not see any users of
> the previously defined ones anywhere, not in kernel sources and not in
> the HID specification.

> You seem to be creating a purpose-built devices where you control your
> userspace, and I do not think the new keycodes will be of any use to
> anyone but your specific application.

We currently allow 3rd party input devices to use the previously defined ke=
ys
in our marine ecosystem. These inputs can come from physical user input
devices, networked input devices, or from other applications that run
alongside our application.

> You are also unlikely to be
> running anything else besides the software that you are developing on
> these devices, so I'd recommend simply reuse parts of the existing key
> code space for your purposes (KEY_MACRO*, BTN_TRIGGER_HAPPY*, etc).

The documentation currently states =E2=80=9CThe KEY_MACRO# codes MUST also =
NOT be used
as fallback for when no existing KEY_FOO define matches the marking / purpo=
se.
In this case a new KEY_FOO define MUST be added=E2=80=9C.

As such, we are apprehensive to repurpose the existing generic keys, for fe=
ar
of their purpose changing or unintended user behavior with 3rd party input
devices. If we are unable to get dedicated key codes added, do you have a
suggestion for how to correctly deal with this problem?

[1]: https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMORes=
olutions/MSCResolutions/MSC.192(79).pdf


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

