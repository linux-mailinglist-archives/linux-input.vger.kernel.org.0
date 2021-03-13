Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2860033A032
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhCMTNW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:13:22 -0500
Received: from mail-mw2nam12hn2245.outbound.protection.outlook.com ([52.100.167.245]:29121
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231329AbhCMTNE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHt1QQ+HtwyExhDw4G6e0PAAxKFKIpgYaDoWyl4JWjOveVGQQRr74iQQADJxbqXzyThPo/4Lr1rbfJVuwL41kTt2D7WEK5k9SHY3jmDrGd49t+UCM8sdvgxbZb5XyMwCbRIYqZlUka4v4L6sazxHZKpf+poaDhZOAp4IjFSccC2G7ctecDfdKa6hTA3na6mCRh3B4oTD5RGh4Boo0BcAjIUqi5/6WIq/TdVz7Osfzq4vZlVOD2mTIAcMbI0HHfdT+ekRapZoC1L0zY6cGIypJGZVGpzd41se2H55LQdQWHfHzj3UsRpyiAG/4HDXqn82B6JQsjkjt+3KzaP+vhCnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm4Pnvv7m7lF6ypO+Tv7CtXVwcQHhDrHWD7asv1Kc8=;
 b=e14Ns51DxrwiAxI8YqCf9dy3JgE3Z421MU5Zt1d8LXJYXfD5E5flqopY+mxtBjIIDrah7tB/RozJ5jQvuIiBICDWNotfFIinajUdAvenpgeviulTpwF5hQVnqNQc6xbf6Ob35VemfcU3W8H10lwxgkKrxy/g9BhX6ahSeuRXqo/eSA58KvtWwb7gpTKbp6c/5vq12PbcjDiuwth+Mb476Hq2mQz4SHuPfVacQOK46ed6ClVPOU5wA5ALOPhBrVF/Lw9KQ/uDOIPhB0Q6l0t/toOLuRcy55DdQkT7lYehUUZq4/7d9XsCFQxlGPN7ftcmF5hfZQCjIv8G/dhesqU+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm4Pnvv7m7lF6ypO+Tv7CtXVwcQHhDrHWD7asv1Kc8=;
 b=Lub5P/q7BGbSLZ/VxxRpLzOtCBKN9dOkxbpCVHk0Z7Y3s3FlAlzs8VxE+ufPLk3MhouzO8ecRJlHcVTauGRKaEMJEOZVztVI3O2sNNp5Go5ETw25ht/maOVS335gGk+WYiaulmEYYug7tG3+FmW+LzfVtPqDMckytBNL1oGUCOQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB7247.namprd08.prod.outlook.com (2603:10b6:806:187::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sat, 13 Mar
 2021 19:13:02 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:02 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 0/9] Input: iqs5xx - more enhancements and optimizations
Date:   Sat, 13 Mar 2021 13:12:27 -0600
Message-Id: <20210313191236.4366-1-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c15084-cf95-490a-b437-08d8e65405d7
X-MS-TrafficTypeDiagnostic: SA1PR08MB7247:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB7247E7E2E8553C4E10B4AC2AD36E9@SA1PR08MB7247.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rSWsjoR7RfrXt6xh1u6AaBeeNmoux5Q9WCOQ0AhjwFqe39oL5pwRgtmWOi8I?=
 =?us-ascii?Q?NepxxzNCh3s5+N1PdHUVpDvj2FE0n6Hzl9CIR55y6ZLawb0sqphBdacVgNZ1?=
 =?us-ascii?Q?a9hbmfwoEX1zSmEcCu+TaJ5fJ8pl+CrdELCqN7lvW+7UvgenYbWANyQx1cq0?=
 =?us-ascii?Q?gnuH9OKO8IcaGzgA5Lp8HjsgFY//+f8xxaAUnmEHTrpjyDASDJc9dWUusq83?=
 =?us-ascii?Q?DfrfRX7nBr9j/AiA/W5JQPKLbHoKYbRMr3/siLby7lkBKjl2c11kLovTYdHV?=
 =?us-ascii?Q?Bg5mArzWu09oTVBr0HJQt6VUfmmGSM2KS2Iv7rcpJ4S+WDz1OS6PSSQaDym9?=
 =?us-ascii?Q?ikgi6hVN3Gkkb4LIsvd6lYu0OT8VUclnuK1PH8yobi9+zpigQqXcYpFGdN2y?=
 =?us-ascii?Q?/Dkfs0uVrJOCDtugrel4nS+fIcJ0pbnLSdESYLQ4JYr/NPLlw5HFi9FmaSYK?=
 =?us-ascii?Q?k/5WvVFcrXDdUEA0xP+ghM7R/IEi+B+A/0zsfXrZ0AsvJPCsrT6mhA0a2orx?=
 =?us-ascii?Q?vNdwGz7fbxR1ILTMMBDHsy9XoDzywKpE6ulcsT/Vp/iW4PGYmXiY5JFF8Gz0?=
 =?us-ascii?Q?JIPDmCGCcUDUg0jUsu4VKAyF3sPZ1icVsIyfy0HmmMkxapjJIaj9KnWcCMjk?=
 =?us-ascii?Q?RG+3ItfvQK4lsunXXV6r4jH+BqTx9mUP/hVMKbq2WBV+5pogiNa7N/FeqqyS?=
 =?us-ascii?Q?Ne7PwPZ34cK+Zd+XNynEercsyzE2SkS2MLy8PfrHOJMMkxw7dP0wQbGC93lt?=
 =?us-ascii?Q?jWM9TeP6kLe/wE+2aep8gffS2xVMWkwkFDnNkgOt8NWEp8fmb4vJBHHJ5+i4?=
 =?us-ascii?Q?zwW8GltijNle/H1LD+pFwmAvSl5UxhCGmYaVYUbB4A7JENararGG63/0kO32?=
 =?us-ascii?Q?HG3FML4T0JLcvkjD3e+ZSZwuNmGguvZaa5sj1UjZgmBBZq5Cp/m/GSXIJ+L/?=
 =?us-ascii?Q?aaegc/opEYPMlD7W2f11QX49vOab6gNT3tVBxh6wPi5VdJPWnzWpRoToYAeH?=
 =?us-ascii?Q?9MP0ZZxULr6tfSZUfg4TmpRInZy7MiX4o2nhEHPcakDW4ls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(376002)(39830400003)(346002)(366004)(136003)(66946007)(6506007)(8936002)(66476007)(66556008)(107886003)(6512007)(5660300002)(956004)(69590400012)(86362001)(52116002)(8676002)(26005)(4326008)(2616005)(966005)(1076003)(36756003)(478600001)(16526019)(83380400001)(186003)(6666004)(6486002)(2906002)(316002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VoKc73k+P0graQHl7fqIzidNRpWtxSBjQobyXet84psAp0USwDws/rKrBVlI?=
 =?us-ascii?Q?sGUhtsv+5slNSHP0DR3LOoK5EwRDZDkCS2NbFtqS1cioI74NpjEy/sNe0byU?=
 =?us-ascii?Q?Y/4V8WJhnnB77cDShYa0q6r+NVxhpQe5dXjffoo5KuLZrricKV0M/08NaLxA?=
 =?us-ascii?Q?LPRJ0LDOLbp+PPGfMQr7Q8S+pxSf14Gh7XWI/4yCoBaemjeTTZ0w3Xe1PWF8?=
 =?us-ascii?Q?Vz4kNi1nVTHEX/t4Xic/NKPnpwl45ApP3VDFdN83fxoMFiORen3h9wqdzvXJ?=
 =?us-ascii?Q?eR66SXtH1x3ypI+XBtpOrh64G6WVpYqKk+u4zR0Wx+hVldxAtWZb4cG+T2am?=
 =?us-ascii?Q?G3ZyEyGsao5qgSuN/+PcTsMVgl/Xw2/tO+GUAlFFjJuw7IyvVwUEx1Qp7q0H?=
 =?us-ascii?Q?+Se3u65CD6Wnzgb00O1SRdXwkUdS4J+lnIVaZvk6HIN5NzHIC4W87QXQBw+v?=
 =?us-ascii?Q?Xg145NPCyiDcl1v63Kmk6bjBmR8fWZD0OAdNTZQrLZAzyuKzyyXjyUB+kI3l?=
 =?us-ascii?Q?4EsxRAfAUyWX+1PjaidhG1EBN8T9poHXZsrIf04pSUBuPQl8OPhyfXVTdqnV?=
 =?us-ascii?Q?CabQwrsN3GU3ILJvx+E9xa4rhzwCLZb0fLIBS/03IPJcToc2UKy0d+0vDHKX?=
 =?us-ascii?Q?bcqQ01oAhwZVjTLgsTu4NJmjv0alJdce/UjouiDdNMavGUEqBNpFGgsMu0tz?=
 =?us-ascii?Q?F+2pZQiXesptlfbtXhINodOjItB84a8vXU3i/E1eHGgw/ISIfrWTpP6PffCk?=
 =?us-ascii?Q?uL9uwwLYc5TbMw4ElE3j8HSqCipuq13CerdFmBGUyR1qIgyZdTC7kKFeBlwf?=
 =?us-ascii?Q?yb+VhmST3ygKqsQKfCo0OnCYXy0+GDpRWrfKh9nq8R4qMXnOpQCbkIQPN4VR?=
 =?us-ascii?Q?ck2syC/X5BzL4IYP15ASs13iRzPvMiimTZgE7pgduZn7GxgesuHpxgWLSKDd?=
 =?us-ascii?Q?Fv2k69rfPAeXQWbt9BjpThqgiAlFTtr51tNJyGqO1Gl3hqpSwobJdw0ij6yO?=
 =?us-ascii?Q?FsakTlC+96I61mfN5vJupPngnT12vCPoQ4PrU+dbk+3QppFoUhrRq1PnzO1j?=
 =?us-ascii?Q?QsppWX14wuvda+Ybp6513+dKsYnakJk8leKZ6CKxXFtWGB92D2xXMvAZbuKD?=
 =?us-ascii?Q?gHX0tMCGTDYtwu4/ywGAFZtVkGLGxUJtbqwretWQ7rOC+w3GxCDcn0eAFBcS?=
 =?us-ascii?Q?PqRHG+3MmE8+xHGp++eXfIsZshejqaGR3n0kZVtBv1JNvEVhqrdmLCuyxZRz?=
 =?us-ascii?Q?MRThU//N3GKP37WyDG/y3I/10CUEw7liO8rs5XgcUHnNuZVE1/LVdsZ1T3Y9?=
 =?us-ascii?Q?okJ33IvLNYtHxv79By86ourz?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c15084-cf95-490a-b437-08d8e65405d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:02.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XE3BbW0lzt4Y6wRnX+vM/Qa+T09J285TVrHXQXQZcBIJEwxA+eN8efceTd9Sgc0KE36L60WxLc1h4KovqHYtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7247
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series continues recent work to further enhance and optimize the Azoteq
IQS550/572/525 trackpad/touchscreen controller driver. In addition to having
been made a bit smaller, the driver now supports some additional use-cases.

Patches 3 and 8 are based on [1] and [2], respectively. Also included in the
series is an updated binding, now presented in YAML.

[1] https://patchwork.kernel.org/patch/12028203/
[2] https://patchwork.kernel.org/patch/12028223/

Jeff LaBundy (9):
  Input: iqs5xx - update vendor's URL
  Input: iqs5xx - optimize axis definition and validation
  Input: iqs5xx - expose firmware revision to user space
  Input: iqs5xx - remove superfluous revision validation
  Input: iqs5xx - close bootloader using hardware reset
  Input: iqs5xx - prevent interrupt storm during removal
  Input: iqs5xx - suspend or resume regardless of users
  Input: iqs5xx - make reset GPIO optional
  dt-bindings: input: iqs5xx: Convert to YAML

 .../input/touchscreen/azoteq,iqs5xx.yaml      |  75 ++++++
 .../bindings/input/touchscreen/iqs5xx.txt     |  80 ------
 drivers/input/touchscreen/iqs5xx.c            | 238 +++++++-----------
 3 files changed, 164 insertions(+), 229 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt

--
2.17.1

