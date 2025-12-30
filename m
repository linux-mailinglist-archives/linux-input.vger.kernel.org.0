Return-Path: <linux-input+bounces-16738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63587CEA008
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 16:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6801A3020CD1
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FE932692B;
	Tue, 30 Dec 2025 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="W/2BOZZe";
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="lhHojDsd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6E2AE99;
	Tue, 30 Dec 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106868; cv=fail; b=QlZnAVv09N7JxecUb8lRK8OV2bLkthtzSWZFUnIc1FlPIHB5ztbquxEmI1FB8XnTNkvIZU5BLrdSj20cN+SHm9t1H5KwZLJCEGAxrrR3vXncqEc76WamP33KLIlX/RYaMK4+hM37rGAQRINpsBMBB8isl9KWoX8IWccl6yaJKXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106868; c=relaxed/simple;
	bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huv8KAXiI2HtiW7XH89nzUKfKmFkpvb0EN5rLwhLzOwHrSsIyVJ3k7k3t1r92YYbBDNYnB6bdR8fnb2CvVsM2cCT0EDMQnwlvzmtFkZo56oKhXF+u2oJyySkk6GMMyNJ1r97F/aqZuIoUPWL2/6mCaIaPaxjvOBNHudaSNG/w6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com; spf=pass smtp.mailfrom=garmin.com; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=W/2BOZZe; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=lhHojDsd; arc=fail smtp.client-ip=205.220.165.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garmin.com
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BUDsUk6030438;
	Tue, 30 Dec 2025 08:57:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=smb3v
	QzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=; b=W/2BOZZeptIyMPE14KM2p
	xP+xnPDypwPuEjdeLwBy4dE2joSaFmcc4870a4SyrYWMTygSTl4JvcXNFTT2ONIv
	pJT3NQG8n2jLuINFKbOXpqdDOVoiG0Dc90wXeSPZ1M+nm+LkiMAnBQQTveIEjNN2
	flvT4XFqgCuIIgjGiP9RIZSsH//cww6pmfhOO5n7V0Sgv3WczIbASP8VhopKm/Gd
	YlXIZtw4FDHXLGy0xCIEUJN7+ZVP3oOJyivWO2yY4IEQfRnzfGFCqYu1P/iRETqA
	eESF9Ks88kWRhq7iceOlUPEzitSYLY7Ih+f9rtmlke29+rkOGM+nRF5WPhd1KPoz
	A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022080.outbound.protection.outlook.com [40.107.209.80])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bcb2egqw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 08:57:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbeGseu5ONLuNqzfDmNXeTMPhb5PAN0DkOx9tHgh9kfYWgIkViiMY1vxn0vrEfy+1brl0/GLKm13yaANWf4SEDTHoomGGbW9ch5BRCBs+cxt3XZd84DGzzwF2bAykvMJitSzKiDuVbjdR0nTCoKubxFp1HYpX/YH2H/8XpRmnW1L5Km6ihgLcFDucK+y4EAoBkTLhkRyG0KYisAcxsOgNKiZIfo3Jz79qPm+d0y37k08npPkKqWWRQBl28FQztu/7QzPY3ndCk/3Q7DVQ6lXJnxt/GZW3v08zwCoks4VwCcOb2CK7TzZNRIdJ/bX2wpjniollK13NmtzZ7kdfVuDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
 b=CKs8K/aHc2yMlfHAJyOnMb4dWeKlJTRI56fu96PEKfQSYQizrHpfUI1TduQvN8LaJAB8Qaiz1iDe+3mQJD/8WgUmvSbPoSbZQehUNlciALaM3H/HrjwaOOQiKZvf6CDvZRtKUb4EoWXgxYAPcO8gHLYDxfr5IM6Sx8ZjWRi3BBFewd/DAyAPF6eSe2TgfYtmu4CN/uvDi6v8WqvqTYpAVlb0m1upSc6ujHLxmrpWyJ6CoyouV6ETFRn4lX1huEYoG8SCFyC+VP5W2RydR2z+8FDRolnrpyAmlfTfd7Zzih3ihvLxj0fdYk5laEVZt6qr5t0t+urPm5kcs9GEOMSBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=garmin.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smb3vQzNtzic4mno0IjJ6EokvjBslpC7d8eZt0vl7cI=;
 b=lhHojDsd8AFwAhAMoJiEvuYhcsNWWrapVR/aQ5ZIvkxd9F7XfBhg/gb5I2mA3LLvOiGVpO5XrCT8jPqDq4Mqjwe9EVbFpsKViqBkFvSWgIgrGT646EYRkixleuQIDiqs7sUMIPxxVfsWLmFceNNav+qtWe8Socot3dfHuq6uDi0XzNQyrqBDfHeUA1XRD4IUrFd3m/3wdYFSfRz2pCDm0wrXExKp+wm5nWkkhHFHlBvAN8viuzJZMM8xvImZJA7HKENDXtWl1OLcnubCr6Oq5XtVwQFEHuNX2s0GiEEaagsjcI7808GNl/Yc6JG4Sl1cnQv8008m79hrGTI7+CJj5g==
Received: from BY3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:254::14)
 by SJ0PR04MB7664.namprd04.prod.outlook.com (2603:10b6:a03:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 14:57:22 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::31) by BY3PR05CA0009.outlook.office365.com
 (2603:10b6:a03:254::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 14:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 14:57:21 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Dec
 2025 08:57:06 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 30 Dec 2025 08:57:07 -0600
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 30 Dec 2025 08:57:07 -0600
Received: from OLA-7VZWMW3.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Tue, 30 Dec 2025 08:57:07 -0600
From: Hunter Moore <Hunter.Moore@garmin.com>
To: <hunter.moore@garmin.com>
CC: <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] input: Add marine keycodes for radar control.
Date: Tue, 30 Dec 2025 08:57:07 -0600
Message-ID: <20251230145707.810-1-Hunter.Moore@garmin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119163844.1343-1-Hunter.Moore@garmin.com>
References: <20251119163844.1343-1-Hunter.Moore@garmin.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SJ0PR04MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 47adac9d-325a-4ad0-d5ce-08de47b3bc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9N1adTAfILiPRbhmDfBpo+OLSMeZAZYxHXYSkVkr6g5KUZ5KBQq8R451ayKm?=
 =?us-ascii?Q?lXKdaPX3BS0eQmoiAwHRKys6bN2iKOCyXoGZqHUz85y9eXtRJAR8wkoLkf0H?=
 =?us-ascii?Q?R5s4hl66nqBXjZNVknexDSN45pDCW9uXKpx/n2Z/yx0KLG7pB4555IOXpZ4O?=
 =?us-ascii?Q?Uf1+GN/KvHujLpo/dj6+h02jcJXJZlgMBmHYfAzgnrqIM396rV+j0ZtAMkMW?=
 =?us-ascii?Q?ykLqX1NAH22fwECj6/F9Xx+F0BhUGovgpMwPXb7zXqgiW367BcdTpMmHh1C7?=
 =?us-ascii?Q?vnw99BBUjewX+UeDmBUMx3WPo1WxC8RtSZZtRFaw3Q+JnjXPbrWeRUxLf/Qn?=
 =?us-ascii?Q?TXo9996KsS/uX7bTQJ6RST5M0j+Az/OQRWDjtoho25HoMmTd1DdPvGBEKTTE?=
 =?us-ascii?Q?LMAAnSYooiAX4MxXaH+nq/gDgnWTs5JyoERXC9hCLtdDvZLbfGtASzymmHb8?=
 =?us-ascii?Q?cIQ407CQLbGsEv/I+YLd3nqnpGq5GPBsmjNk77sWHxKJteJc9dtep9VBAE2B?=
 =?us-ascii?Q?DzLW6f4YwEGrLDxLsWPRQHGLJMiyHgdglzNCqKnGDf4GyjRIm1Ef7JdmVB1E?=
 =?us-ascii?Q?phfd4p0zyueb14OYDPuIVZ42t1ukJ2m64jp2Djt1cqTafAgRjpXJCcnQn8Qe?=
 =?us-ascii?Q?GyrFPT59Db+kuSWE+DNPCHGQ+ySSfwEgi7CaINGix/OCZJiFa6tBoS6JPWZC?=
 =?us-ascii?Q?/p8HrlR+iwzqz747Dy2gtcYFHUZnBQH7L12lI2fmmbFkidsesmdP0XVVYzTI?=
 =?us-ascii?Q?vrlC2bZI4rb5PVjvt4upcBmGk9ywyiTjWgWZRRyVMn6BH9d7KNJRCKriMPgk?=
 =?us-ascii?Q?cTja6Jmd+aEiU4OaaxIZmAJ/s2AO955WoqpzWQz8qXVW42ldvpbNf7Wlh9+n?=
 =?us-ascii?Q?3hkak1DZi9G1mdTYzhFi27J4so0u0QmrgQXHz+szAFLVJcy73Ts3OJxJzvUn?=
 =?us-ascii?Q?qfmrrClCFiig+UwaRicP0BxuAF9/GtumbNvPTuXQ3GmpQSTLcAhHVlGvG4HA?=
 =?us-ascii?Q?ONrL/3/c12tZgGuFVM+cTeNm68v1KzEocFbN0JVio2Lb9zpGkVsCHANQrore?=
 =?us-ascii?Q?l09aBJ7aJ8MR+LkBAIlBn5wU71SXGUbbQ623B3G6O3Mbd+H4aNvyRyhPMlaI?=
 =?us-ascii?Q?TcI6TZk51bca8J8bI/KUzZ6rzAAtV6N08ki5Bnj44n7fRoNz+rxTXd4IqQdQ?=
 =?us-ascii?Q?fLkLgUKvP+T6Nquo06kshFdLHmz8KDv/NRyrQbFIc2HsIo6FYqIFGBgijZe0?=
 =?us-ascii?Q?05rSZRsAtxFTK+zC6w68cATm5gzG854zL/PBMTsljQ99WPl0RLcPdnLiFVAC?=
 =?us-ascii?Q?ncqW9fyrsDpNQRq8Ghsvr/nkfVEzmgyglO1oqEn+EdxTLmdBaoSph+tk2+az?=
 =?us-ascii?Q?rE8ZRWBslKkVqtRI9Xk+MqRUPyE3hfsjkCs4Kjj9CuGMOrMoB8lT/ZeLDnha?=
 =?us-ascii?Q?h+T0hDRSvq0To13jxThOiB7eXEImFo55Z3fh9+OKjr3NikcNIwZsfBApp07S?=
 =?us-ascii?Q?jhFzIdl/OUcAbJE2PdKV5DHk7mbZwMWg4P9xMF4mmQtVr8hMiXVY+KYr9Bgb?=
 =?us-ascii?Q?e5GkyVq71tqYMEUlIDk=3D?=
X-Forefront-Antispam-Report:
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:57:21.8719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47adac9d-325a-4ad0-d5ce-08de47b3bc7e
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7664
X-Proofpoint-ORIG-GUID: 7G4n-ZZjOWHO8jZFWVO1BexZsfuOwMVO
X-Authority-Analysis: v=2.4 cv=Aay83nXG c=1 sm=1 tr=0 ts=6953e854 cx=c_pps a=12vGVFQirf4vZIp7c/z4DQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wP3pNCr1ah4A:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KmnlVFwBRt49Jrc8DeYA:9
 cc=ntf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzNCBTYWx0ZWRfXw4DHozkf9c67 f4W7oNRNdjqM/m8Bdvrg007LU10hf+dav4reD9KR3WqsFleRJwnKoBJj1meZhZGAk90/s9mngBj tnHM3ROS05Waq43oNypXD+Ne28nX8871inrJMZwayDxDHFDqEo1mYmAtwEVnTaLJrzunpAVJwkF
 513p2y0D1HCQaIVXhAKGwC4OsTBpHMcI41bHtW0oThMTK1pftZyJqolUpUm5LD875jDYGre+Gek XAUJo42iM2p6t1UEJkDkaB7DLzHP/aD7irybR71nD0bSpeFp2lMsfK7m+Le9Y5MDbmiz2j7TLlc Ma+6owcysnROm+ggNGXXs4JJuBGk0HtZIHaBiEroJjGbtwJCc+xOH3I221VcBFz4CX+DE2cAZ98
 pXzbwSkKWZfk9v7V1Uhv5enI5IS2Tk3Pm9g1HggbwHYE9Hf8QllWHO2qHeyARH2xz8G1HndKAmF prqWAcx6biHmIOLiINO9lJZP9fRk9pNJWDaBrNG0=
X-Proofpoint-GUID: 7G4n-ZZjOWHO8jZFWVO1BexZsfuOwMVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2512120000
 definitions=main-2512300134

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

