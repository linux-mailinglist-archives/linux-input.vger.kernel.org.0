Return-Path: <linux-input+bounces-17100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B31AD211BD
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 20:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F78B30422A2
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 19:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6F133E349;
	Wed, 14 Jan 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="jD5iXf7m";
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="SRhAA+a8"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8633B962;
	Wed, 14 Jan 2026 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768420390; cv=fail; b=gt43QRJWfaG/fOCi9Spfmzlff8gOJghPysMjZ5zLzlJWpZNvZHOuFOCDzniyiLSZFEUijpxHAsjYl/XRNyjufbe7mwzQVR06SHrbyXxplco+yOb+WXsyOGh+twVB7SN01ZgXWpiOGGaLW/WwczkVUru6QJD7DbfkU0lu3yIrikc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768420390; c=relaxed/simple;
	bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RC7HSbHie/GaOdz+2ZrcKa4e3NncgnD2DrRvuPDBL+QveAHGFJqXk2cjtp38Q+2AbhSjbkquAOCE1wqdlVxKowJ+uQesWfNbp00ku/ISsdbjheFCESUtWSCvCQkPQslK8fCQNbHd28y9/dYMxVpz3BiTMION0tgj3mOs7yWFtWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com; spf=pass smtp.mailfrom=garmin.com; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=jD5iXf7m; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=SRhAA+a8; arc=fail smtp.client-ip=205.220.177.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garmin.com
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60EAsLTx003203;
	Wed, 14 Jan 2026 13:16:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=smb3v
	QzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=; b=jD5iXf7mYMS04N790QwAm
	TGerrAn8WNYC3xeqvBsBCE+x7uC1z9Ge3RyEmuaFDS9cmuMd6T7VviZJpj5k9LFi
	xCyxnU+cpHGghih3/1Pt2Y1QjLZIjGhTyYW1X3whWjcNEqv6QzKoT+EXlBCT69Q/
	lTdvbaBYpTzOV7JxKrY86BqKakZsYp3K/dSEzjERmKhuxvgh2l2jb0uIIY6yJQKV
	lwqD223SQU8nMDz80rb61xvFg9Qx5PVSYGMad1A7gnLxu7zmnLOR7hsoQqAMVZCS
	R8qvtbdwnoRhC/WRd7TOl7s+5wnB9kvfTPOqZg41zRz61feWOzN5PK5WhJZB24U6
	g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022083.outbound.protection.outlook.com [52.101.48.83])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bp9sd93rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 13:16:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U70eH78kN3JtwzIDAXFjHMdHXH7BK8Z15RQfxzZs4cKKFrjhtvsPkMYM+fXRNnv2eZSTrYbvlYEFsaalavj++HgkJIstcc/sj8E53b+obobiC7OekyCH5Rk/Kx5FbZLKzIV1pXoi7C3yNv0XkydFMdi7VBxuwwGpgtkdP3PEBgYzq+C9cYWwyC0g/RuhMx6zXT8HHNF+8f8kwtL49yOy0mVU2laPgPHYI5m6te+n0J6OlbGS2qTeKl1oKvLfQNzW9VA+Iv6u9xx4lTc/+GRmMMgCZMIFrlUFU7mrFg9q1paDcTqgDqjVpQ136BXbF4Jjb0qHFg9kiUOzYQRVz28RXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
 b=PIhZIVKoHSGbAhkXhbC/OUHORTk0Vc8uDxktI1NlaqTdx7WKeqzQJPwHLKzCNbXaqkZL6zL74fVHyD09+l2J/VizAsXKcADZ/BrYiVFrtm0sPolL+2fqGmesFURzZclpAPN4balT9UFkjio3ugoEjKO7H+yWx1NolI7W+PoSrYQwXh0sj98z9wm6xghfBIsQJ4t0jx1q0fSZ70NKy8xvWfoLXohi8b3kWlUW3x6qMbBHvkdG4XcTEQKETTniI9tJXVCA5toUmVLmQ8wdX7xyxN/idxayZ7841uoKu+/LVZxBLghmNPQdNXa8yLP1yFAWHZV7bcac81kKJlm5EWb4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=garmin.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
 b=SRhAA+a8lMow5xwG1t1AmdjSInMBjVYXJs9YjWR9QBtxYsh4DTyGEUJW1umG3pp12GJ0qw903ZDReuUkyvF1GHS+rSmI+pKND4mtn7B+wW9Qk6UVH88hAkTOl+2mxf6GyEpVN8LnOkveB6BvVTzdldVJimvW7tBefm4YCW8a9XzIBzUR9Pwd1R1rv2gk+PQAAJdOGrAv02TvTjFjLn3ABlSOfF8RcHIg45W4FL+ekNqG6MLrF5TRa92svEXLiRULr7cRDlYiF2zbaTw/byJilgBLYMpgUAh8fd5Z4a+DqoHY+sYtRxwq2RYw+W/ia4BQnF0tneqFsbORyjsjFqq7Cg==
Received: from CH3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::11)
 by SJ2PR04MB8846.namprd04.prod.outlook.com (2603:10b6:a03:544::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:16:25 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::6a) by CH3P220CA0029.outlook.office365.com
 (2603:10b6:610:1e8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 19:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:16:24 +0000
Received: from KC3WPA-EXSE01.ad.garmin.com (10.65.32.84) by cv1wpa-edge1
 (10.60.4.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 13:16:04 -0600
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 KC3WPA-EXSE01.ad.garmin.com (10.65.32.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Wed, 14 Jan 2026 13:16:07 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Wed, 14 Jan 2026 13:16:06 -0600
Received: from OLA-7VZWMW3.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 14 Jan 2026 13:16:06 -0600
From: Hunter Moore <Hunter.Moore@garmin.com>
To: <hunter.moore@garmin.com>
CC: <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] input: Add marine keycodes for radar control.
Date: Wed, 14 Jan 2026 13:16:06 -0600
Message-ID: <20260114191606.534-1-Hunter.Moore@garmin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230145707.810-1-Hunter.Moore@garmin.com>
References: <20251230145707.810-1-Hunter.Moore@garmin.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|SJ2PR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: a1897a6a-6032-49ba-c99d-08de53a1690f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g9PNI0QIC2KsC0hK2V3rQiyCQ6eq2a3UYJyMNdUPSY/rFLsVymRT1Ue/cLPu?=
 =?us-ascii?Q?KkW2tuxwx2ztm/D+5sdQPYgLMiMHhHU7izaqSb+8/wBBgnMiw7fCQWFY2dR0?=
 =?us-ascii?Q?qJ7xBGlUYNZmr5z6r1zbsgfoBtZRH5aqToan7ju5oaeZ2FhNZkM/8ztt/k1x?=
 =?us-ascii?Q?gn/83a8rQ+85kZ0JYG0Wylbq8GAtZok1cYIVzV4gHT6bmy8MIvVdq07UgQAz?=
 =?us-ascii?Q?sTRjDOmZZxPb8HL+B0doT6+7S9LctGx4VAprqSjfE97YaDTy8zWY1WYussvN?=
 =?us-ascii?Q?/8rmN4BkqVMKnDI5yB00F2XSJlJanstRwctKitsFK8MZtkRdrrVMXEZDXUjR?=
 =?us-ascii?Q?hkjr9I4OF72lLwrVSodX0mshBus5A2/e+bERf1CKV9WTNl36RvDAQCuCbtzY?=
 =?us-ascii?Q?M3dEaw+e/rTpobj1+xwMvwBhOKqIkPBu1bIQtbaEl0vGvyPymbUxag/+il0K?=
 =?us-ascii?Q?Q+SuIx2swU2RtzSsh56fkPMr2tV2Dm10csqKyBqvgWK6TVA/VVtMAsrdfUim?=
 =?us-ascii?Q?1Z6wVT+EyEQGI3xKuactmZW+FjoJpTR708zLl9GO+7JPoMCQbKIXF3/aEFst?=
 =?us-ascii?Q?CHu39+RA6y2God8gexDL9RnwbVz4yaoYPYYGvCb+SJDqhRRPDwa4j/u8HLPJ?=
 =?us-ascii?Q?1eqFPQFAsfUWxOwny2kBaOXdZvRAD5hjNlUVWCymdwOb65jSFJSoMmVvjdYW?=
 =?us-ascii?Q?gfDrFvESOAtH5+SxciWwHjutgr58pOW0C4JsIsWsGMd2OW4DmORSBW5qzBTx?=
 =?us-ascii?Q?gyv8nQmIUFg5CI7zmIDdbJrNzldboXDfnCUQw2rBQY2pICd8iRS2ziPAW2Fq?=
 =?us-ascii?Q?dtv2UktPAYz/yo9+4A2CHee3UoGMo7qK7R0P8+xWy8M0iw1AccGm1Zgy6sE3?=
 =?us-ascii?Q?sEEs+YdDPfInZVEjQqNDd/CWLUaqDh4V0TDS2UCwkd78gkXiRl17YIq5jizI?=
 =?us-ascii?Q?QX7KglZdDDig8+QR7T4kKP0KL4+SVdhva8g/+/x+H3LTw33lZKO0k4BJa20T?=
 =?us-ascii?Q?3u+UDqX5olTfOh9kIzW9Z4OfN8sOVcASChne+JY4UjseTNYiFa1uAaQ7jILY?=
 =?us-ascii?Q?CI40ghCs+6r1okyZpQogg5yGOOyogpaMj/IP+P09YtdDddfGXNdYiXaWgfPE?=
 =?us-ascii?Q?wyAevQWTH8fcAdbATj+hlB7IEFdLi8cLeOGatq2FGaXzy0Mc86sLLGWytved?=
 =?us-ascii?Q?dLtLYbTjPb820QSZ/5MBGe522kOOPkEsgycbpSsqlQLKkVYUxPLWyOUCdVyG?=
 =?us-ascii?Q?yXX0fm5uyYJMgMBhUUeCInoVb9t6pjAaMofnPNd1/neixVoU/y7SuHND6EUH?=
 =?us-ascii?Q?Z301kFVb+KMMMNgyJSCUnZ+T8NJ9Mw/BiqClLw8iVFD27SmfHiYdvrUiB7Ca?=
 =?us-ascii?Q?2DsnqMOjGVxGlcUbE8S7wcgdI3motErOwQckchbQ+ztwaNV05fmHnhvQi2tI?=
 =?us-ascii?Q?Zvg5BZ6y3EUEdd3AtE/EMMTmLpZ14b2vMZLR4F2+1QaSjIoFpodARQvtPVEe?=
 =?us-ascii?Q?Rr52Uk6yxW6y9+Q8QiwPM+qKOQCp4a8cWs1wWFLqbsTj2eYzl0DUN0AEs6Y9?=
 =?us-ascii?Q?sdX9bRmAlZMb6W1/dybPwDMnWoGScCab5SaMGtMTjKgPv2+DNSCUqsj6E3nL?=
 =?us-ascii?Q?3mzt3ut1i33bUUlNNS3TXU+Vz3wKxSPiUmu6aaJu7oHDbncSy3KffzsCJXaY?=
 =?us-ascii?Q?nTtzSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:16:24.9622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1897a6a-6032-49ba-c99d-08de53a1690f
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8846
X-Authority-Analysis: v=2.4 cv=LdYxKzfi c=1 sm=1 tr=0 ts=6967eb8c cx=c_pps a=80uo2vwcsYp3yIYYF8sMvw==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vUbySO9Y5rIA:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KmnlVFwBRt49Jrc8DeYA:9
 cc=ntf
X-Proofpoint-GUID: 4cn7xZBQ0PxSoSWa-A3fNG3wnzJiPFY9
X-Proofpoint-ORIG-GUID: 4cn7xZBQ0PxSoSWa-A3fNG3wnzJiPFY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2MCBTYWx0ZWRfX28sYRblihc3J sB5roqP+p5YKXR3C5AyAzI44hc1CEbHQ2euFcl5i0Z4Lx/YHHQ90ynjgXjO0bGW6QzIW3xeJcH4 DQFLDyR6bW8DG33upMLSiz4Htq4u4w/WIP1BjOZulMU+BA0YLQcS+IaQ0EFg7afD+Ebyk3z6xLZ
 9xUxsDZOW6y4VpXTB+a6kTilenk2IAIa+FNdPRmOpVARb3yHXzwo4pLOYlp4u56L7T16yTnc8NI IFg+7bubbleqAoO8ayiRdX4smmv8B18ERpXdQJCZJHNHFKwLASzToAwPMqCEtOfvJov32P4KRwE +vU3FyVp+MN8gUMl/cCkUW56xDirifW3lz09oYWQLFfARBPD+wPcSbRydwMWB6NJ8Y57DiTNWEY
 C6zgc9UtgtEbmyFMkrP+6uABwfh4RqEFUQlQUGwZHBiOFv1DzctmV1Fgp6KD4CYf7ucIwG8uhTu FdtEu/XYdjwKq3SXDg7ogDo040EqYB1f0mtyKjL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc=notification route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2512120000 definitions=main-2601140160

Please let me know your thoughts and if you think that any additional
changes are needed on this patch.

Thank you.

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.

