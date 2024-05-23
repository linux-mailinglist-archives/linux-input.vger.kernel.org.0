Return-Path: <linux-input+bounces-3791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 631398CCEAF
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35A21F218EC
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 08:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6561C13C68E;
	Thu, 23 May 2024 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="GQUt3ELU"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2105.outbound.protection.outlook.com [40.107.220.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3913CA99;
	Thu, 23 May 2024 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454600; cv=fail; b=p7z6gdOBnpSdeus1XgY81TaY+Zct3A5O1Q3PFqs9VmMc0b6wVIGGYuQ9hfnwtUkHMdpJx+xO3KcEK6o/4eT8u2bhBg6HjMLRyJvrZqHdNmd3J3cUwY1CrKPiDGl9LG5Liw2JI6/38peGm00+Ifq/8IEnjbZwdOCjglO+q2Oruhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454600; c=relaxed/simple;
	bh=6NoEiCKXl2n8i9VmUqHFLWQm/IK6VPS65YLem2Yo1HU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MUk5agBKYPnSFhWbNhpQBdFdOo56A3MxbGbbJs2i0MZ8y0xzfT5N/ZJ17bf/yg6X/Pm6H9y+LCEPC0SA2uALFrXkSiQlYtEOvpJVttHtXDKh2ult1icbPYTtRuEUfgKfjLrAMldE69VeAynA40EWjtRQcjAWYGJjGk2LNKBStt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=GQUt3ELU; arc=fail smtp.client-ip=40.107.220.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsTqR08eiIpJrAoUUZuhVEblAJ5OXINZPqffdJhlfemi5iOR1dOuoY0on+zpvuRh7qew27nbqt0DuwdlxH9+8H7pBuwN0V8mc7LqN/RKojIxn+YTSr8z1rZbe3tPowTGOxztFXmbVtk89H7YfvGsk/lk7WVRHzESZN7FvTorauH8SwsDjcOtmMK5fBSreY6zYQBYNEPjJrLw5AdoMfBv3huRVCIZutlcSXAqazw5o38yC73bAb03mEFjzgIHXGInLmkCr83x8tYyqKxyzmmcF9DCv1TZYx7+mFYdnq5lIITGSa7WWXB8mVG5pqXnAMrd40wmruVQGJ0Gm3xE0CYwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6+mxUVCQOxt/GsFdSYQfTdrBO5aBxBFybaV/+ATyYc=;
 b=VHjqOOS264IjocYG1st3ClgVFqWNDnNq/p8neERvXcQWRPxnBsgOcpmDDUskoXfVvYjV1QPdsqxH/RMB6i/ZSO/Wjsd6MnVAEQ+xIPg4PdnkJe587Gags2OdzhAtS45YmKLS5hOsJSA7VdDyOJRQkEMGbebjcVPoeinlsZ/SX3O2HNiLwSaSmoczVUCiaUz4mkCugqAbjNOD4zmkpQ4B9KKgT3Maf+AQEus35ipIPZgKMbdY9TtqFTOCDfwxNIngh1NHL3cPzSJK0lTBudW/LCxV3/vkND71MfG4vLGqXMd1EZ9ZSZ0liC/i6drDAr6YSy2ZzF5GU3qXTRWtcigOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6+mxUVCQOxt/GsFdSYQfTdrBO5aBxBFybaV/+ATyYc=;
 b=GQUt3ELUSKNh8/DzixAT+RLKMu/OjZiyMj3tAa3kd3uI2CgL/fgKXd/X2CNhtR1j9LNlHMhZ6qAiv8W+Fdgczianucz+hfPe7QYvgF3bdyvzCsEdES1Ig2Lo8UeN/BTesIM+hNkx7couK8QofimdQFgDhsxPTKQcb3BAWBDRVWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SJ0PR08MB6574.namprd08.prod.outlook.com (2603:10b6:a03:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 08:56:36 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 08:56:35 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-input@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: ili210x - fix ili251x_read_touch_data() return value
Date: Thu, 23 May 2024 09:56:24 +0100
Message-ID: <20240523085624.2295988-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SJ0PR08MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: fbeff189-f657-448a-a7cf-08dc7b064025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1YKOJY0896vOFs1KTqXhIT//EGacENPUmWhOwVM36rHhQhFzF3HSxcRmEjW/?=
 =?us-ascii?Q?iBL2LWwftpN/x8uCuq/KFIVBkAY35/aA8Jt32c/WbzskCusMaqsuohOh+dAm?=
 =?us-ascii?Q?bNe2FrOjwYOBI2jgCDGB/aWbDpWQlNl9QnK1c69SckO6e6yDgJH5Oc65iXyD?=
 =?us-ascii?Q?Zuy8p9U6dcYykyoDx19Crs8oE/lsYv+Of7ggWOyh17QowgKKOA2VVXoTJWPW?=
 =?us-ascii?Q?O/169+wNGP59O8rIggu4RZOBr9KqwG3Cc7C/pL2PWyYUdVSixL5x2Y7g3yr6?=
 =?us-ascii?Q?WD5RkKpg/J4g0VAwNg6nGDhA7xZp1MXBhNttHiuvhOCcB6eWMXm79VARrAwZ?=
 =?us-ascii?Q?43hlnGRSTSTMrZC2D3PWDCyGWfYPyoolAZF4Ig4JNMfi1Fmc77zwrFzMZD47?=
 =?us-ascii?Q?AR0UI9EPzDMCvdgz7DlVFztiWOgB5mXHQ4jgUjsHFDwDCZ3+dfgwmkPSTUa9?=
 =?us-ascii?Q?IN0AFgrQqp5DG8b3S72704xTtuslnJl2pfq/CMZYOYRwnlKEmKuR+4Udtc2E?=
 =?us-ascii?Q?iS4hGG9xF3ydypbx84EYqb03wRQ4S6mg7R7F0y98S1oTcA5hEvIRmvadugs5?=
 =?us-ascii?Q?EhYX+Li5iT4G3Rmqvz98Ia3m+ZXKlN5Kta2qgg9uXVpDxADdfOcrDEbUd8WK?=
 =?us-ascii?Q?X+xoO5QIynPuYmfnAJzM4DrPekVN/9ebf+XESR9EmM0m3DD84e24JqOXE9VN?=
 =?us-ascii?Q?sg8jxK98e/kwaEnCuPl6i9NqHNnK8Th37FMFdzmo40YZ7MezwezANMa+FroF?=
 =?us-ascii?Q?wx7+fksSxb9jweF2fyPe13I2cvpSBwoRxzvRbCuzvY5DOHoB6X+zvvesP7Z3?=
 =?us-ascii?Q?0Fn+jy4ZKymRd/hwVsia3r9IhM/3NHpWOzb4nBdEJXk9V6XIPuQkQABus/6v?=
 =?us-ascii?Q?fQMzIbaS8FcmSRVLvmGU+4qOAkrHsFpkRXVKz1bVTA1CjE5XYZ59xTYZsENR?=
 =?us-ascii?Q?XN41BZmiid211VIsd9fw82gAoAr8/OVdla7u36qp/5u1CqH+QrfhEL1n9OWB?=
 =?us-ascii?Q?De90mblJ/oFzUObmvT5irsxCdxhRqWtsJdmiYkqSZdGanIMmwlvvuDOtJNS5?=
 =?us-ascii?Q?rDm98wwhnT1tFDe2qk5fFjk+HEJFIx+DEc3rDB5VO/ZKcllSZkU39S9W44Jm?=
 =?us-ascii?Q?mXz2DsDvXKYZMZsGovCJAueTpyPq9ARw+H8WZuyWUCP7o4AtEWSytsERuQ4n?=
 =?us-ascii?Q?vrZB758m0sZF3OtmyR+aei5yp80HyLEdwE6TPvZyJO7BtLNJR601DN+THIro?=
 =?us-ascii?Q?MaaIhf/wnSInPzBB4jWU08r8LwxASLuM6NhTfoW0Uhtm1Jc7cvy430kyrhzA?=
 =?us-ascii?Q?SQtRRhjL2FNWdaXLh+KzSfZfXM2WQZ6Cf05A8YCisrimdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtlTq+gjg1n1c1YVel/p9chMwDAyhij1Q9M92zbZkuAKl7v2MpV1/nTcavbd?=
 =?us-ascii?Q?zvaCFUvsl2eVUt2Dgdev5x9cBulyDQ143kud+VrYllN2t8XrexqVzseM0zUR?=
 =?us-ascii?Q?h93IfAoHHKvi4E3QS18K7eFwA4yX2+/GeWcXNItYz8rH7X7Ww7GPW/ry83aw?=
 =?us-ascii?Q?9HTTp0Q4hb2RPm7jCzUmBhqK0HMnedIlXz9cIKU+shXmLwCkLSplYr8+FA1n?=
 =?us-ascii?Q?evNf2vyVwg/ieRpN4rdUpmw6Un+QnuOkOmHe6VAobJQD7vIkeagMfrA/pr1e?=
 =?us-ascii?Q?EYFs6FdIArwVDlXAjam+vHaC15su6Lj/KXsQxs5lgvqR5efmhfs88ft2UmuS?=
 =?us-ascii?Q?4ZoE9SB98BuVwXUCc9z6MZUTKuPrISmVNs+14kBVB4FGMNuHsAGkgFQoaAjk?=
 =?us-ascii?Q?2xZhiYJfu8zaWUEzQHvO5WHXt5G1MG8loo1Q9Z1UbfSvnkU9UC96ArkebcLt?=
 =?us-ascii?Q?5O4zW6fGQ97xRSsWppYRaA8zUQB3TJoCmdk2znHoDZGxILES9XeuGOszVfDz?=
 =?us-ascii?Q?Z6Yuun2UJ7RZl+pmabd7TxRzj7ZJLJW3+zawEy5cHWLWTyV5eEI0AH7ZsSlj?=
 =?us-ascii?Q?6g53JEwtc7yld5Y+nobtPOm+3VbWOsJxohX+htizUjgFtOTMWhoXpoh5K2oG?=
 =?us-ascii?Q?y4Gy6MfeU7sx8zHT+beN0037Gd5sq6uzcZdEnuNNynB+CRdt347LNfxwTwrM?=
 =?us-ascii?Q?UnX2Su6+nEVjgW+mWAc6x4BikUOFN/muJwUU7iVrybd0AkdUln0WlVPRKb4t?=
 =?us-ascii?Q?2g1VCvCVTe1PF4fx3nItSYvD43OrVNxScV18QHl03M9T10cXiGJ4u3gZO5vw?=
 =?us-ascii?Q?xJnL07rvlaJCIXx8ewCX/+ekRe88rLYybx4iLRPTNR4yU3yOH84lkL0TMli8?=
 =?us-ascii?Q?1meepFAVWDEYkf3iuWOko00jZ77fP6DVVHx0AXTSxCANGr3ZWw30PQypS+0Y?=
 =?us-ascii?Q?nHHlEL6N0gIRQTr68eEB5H93okyrD+jR/W6+kRB5qdpMHDWNSG07tm9YdJMI?=
 =?us-ascii?Q?3wfGtmXEWEgjJM+LwGAjPuMwkDfRZ9toQQnzA5vrlbEY4TucQBtyI71MHf1/?=
 =?us-ascii?Q?6sogVktQ7LCRmnRLUS4mN3q0+qVON7UBWMOLPgDPtZgdxAHxA63JSPDV8Pq7?=
 =?us-ascii?Q?zckBwkK67fQoqwb4UxGcQvv+pd9qZmesVOT6ken9hRAelVhN0BdYNp3kDqP0?=
 =?us-ascii?Q?ZAQQT8LDMZYniHE3XMnvtsh432P/Tq4VgPz7B2pQ1HmEtqnpGTel/eU+ILhL?=
 =?us-ascii?Q?n5KSL5do3sovVSeu1EKlA3RsnyX+IgX1HlTMKeXPdpZ8ZtDmfylQEFss2j23?=
 =?us-ascii?Q?Cgb+Tgwe5t+zDwqQKcYniD8IQqc5FyxV1CLQttkxYm2pWYN2PXir5VSWFKKl?=
 =?us-ascii?Q?QaMQuLBa99jF2hJ5cqauyl0iHlWxCDtbqgE9f41MTC8DtiOaXP6AC44gc/9A?=
 =?us-ascii?Q?KTSWCnERYycUmTBANuX3ITnDvS68NY4GPtOwxe1DPZDF57yyZ5gYzsffPHSq?=
 =?us-ascii?Q?s9RebiNZ9tx/kDXXWAe1azggp2w0U9n17eNwwWuDd7vpym/06X0WRatoB5CY?=
 =?us-ascii?Q?3c1dCgxfEl31kIqG8hPv+CoN0R6GvLBnB9EhtLQeC5+1HiF5h9RxtstpA7gz?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeff189-f657-448a-a7cf-08dc7b064025
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:56:35.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc+ZxeAJa/N4hl3qvxZQZArDVXRpiQPVcZzObHrl0RnjTC8+il2sCItgF36MzcK0xgBvgQcVv+9S5jbzZmFGAYuU+U8Nj2kP7rcLybU9zYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6574

The caller of this function treats all non-zero values as an error, so
the return value of i2c_master_recv() cannot be returned directly.

This fixes touch reporting when there are more than 6 active touches.

Fixes: ef536abd3afd1 ("Input: ili210x - define and use chip operations structure")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
Changes since v1:
- Simplify change to avoid introducing a new variable
- Add Fixes tag

 drivers/input/touchscreen/ili210x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 31ffdc2a93f35..79bdb2b109496 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -261,8 +261,8 @@ static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
 	if (!error && data[0] == 2) {
 		error = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
 					ILI251X_DATA_SIZE2);
-		if (error >= 0 && error != ILI251X_DATA_SIZE2)
-			error = -EIO;
+		if (error >= 0)
+			error = error == ILI251X_DATA_SIZE2 ? 0 : -EIO;
 	}
 
 	return error;
-- 
2.45.1


