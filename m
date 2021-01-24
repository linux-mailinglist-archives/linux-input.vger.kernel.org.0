Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D73301962
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 04:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbhAXDoM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 22:44:12 -0500
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:51801
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726223AbhAXDoM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 22:44:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2HuzZwL0JGWesvgvr+kJ22ja9JmCTXbKJVilxy/xEE8RhueP+hflKO+TBykfjIaMiHSo99fsT84Y/i7DUNCOhfD+C60qoQig4xMMzz+pAvNYSn6qkeN19xn3gaxMqK3M1pEU9OuuquNQ+0jdeaupczzxXDqsXoS5mNUI8k3IorUCfb6WNfI+OVb8sOggktJ7VAbzfqFq5HM4gXlgPeHaPxGjwlUrrkIVBkI/mmGyWqpdCeg7BcRtXu3JEj3Qeotc9BhrSD1jp+JdcHV1P4/hVn39M3+MfjggbJrXiH+bFP3C6W2njHxFdDt9ybqKz7ZjfDe14h4gd55RG6lDE+zEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wzd1uuA8M1xJKaz5j+SIs91e7nzWS8JH7m4VU9EWSM=;
 b=USrhtgftOwiefoJPEyJOxUhe4Y/tLAKHvTtHhMt2ut8d5YTuBdl9zZ/NLR9xD+1DnReI42ea5dkAjTxDL1QVoQ7WO4Q/sVBoVxlSvsIHiL3ALwQJCBLaGv1Mm955vlHbfUKLuFCTwSL99RupGkdJ6PSal9FH6WjnZs3srqir3Wb+d2mDR2O6rsuBYQPNw6KXbLzZnqd90UyDwTzwaMX9gxhssJTnZV138nCNcRGe6+ARRwkFptrESeXd2e5j8xdhOuYjrix6/S6Vh0sgR/j+mdVqH+dEaaz2JiXzjXaLz/uXZutoQjg8Pc35KncoJ95MxKXI3brHr8M2aa8RswfoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wzd1uuA8M1xJKaz5j+SIs91e7nzWS8JH7m4VU9EWSM=;
 b=gARw4wmgYt1ma9vsXfjN5R3UqdM0cHE6VKT93lWL7WYKz/3yWPV8Z1i7dVQEptSPwDoe4yNA+tE4zLYCyBTfHqKxTGw2WnrpDyMAeMFlIry/86qwIqD//5+M5Lw6Z7LrD1JdoGQJ++B/N6sSRJ0xUxr//xNpgh+2/ytMAxoGkSE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB6992.namprd08.prod.outlook.com (2603:10b6:806:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Sun, 24 Jan
 2021 03:43:17 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Sun, 24 Jan 2021
 03:43:17 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 0/5] Add support for Azoteq IQS626A
Date:   Sat, 23 Jan 2021 21:42:51 -0600
Message-Id: <1611459776-23265-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Sun, 24 Jan 2021 03:43:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d9ba738-d5e1-4d86-b2ba-08d8c01a2f95
X-MS-TrafficTypeDiagnostic: SA1PR08MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB6992DAE6B6E03899F46B42A0D3BE9@SA1PR08MB6992.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /VOb6wMCjiC2KJvoIh4XsSnufD09O0y0ZItlx3tOMcdkrPzLwWDOzzphXiB80P/rz28LoCHcKOQpLWJKzc/XeF/V9D4plXNaNHMyo8UUmYGeBYqsDZwhTAAN3hWEMlB5ghFz4SG4zsyNpBB7hsYx/CPe6Ofrmqx9k5qSvyfauuluDxfqCetdiNBb1bubIN+bXX+BjISf73jKw3XugetbF1eGusnrP0Nwrzi564JgiI6pEknlKxUPuYoov5tvwS4/yR219xIMWmrxKRi7a1ICWobOsSCyyR7gWr7CjhNgTBIJThoYCqMcWYusGGDiaCdEqVV0SEiKGzJ5uwSjJKimLEHGfV1dibiB64D1commjIsidllGCKl/Ep4Yq/E6tuGSlBTv9F1OyPhW8SMhpG/9EfeVLq8cbnR3DV75d3E0jQsLvcAXvlG6R5lRZ7KqAaSfqBgXApQh3ofx+bG+8dWPmwxTjFLjl1/EjDFiCLffpnxf+Ul5LDlDIBCoGjFdtBwVMnGrH7Pu9Z2HpQ/Vrb6rxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39830400003)(346002)(52116002)(107886003)(5660300002)(66946007)(8676002)(6486002)(6506007)(66556008)(8936002)(36756003)(966005)(66476007)(86362001)(69590400011)(2616005)(83380400001)(4326008)(26005)(16526019)(186003)(6512007)(6666004)(316002)(478600001)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pht2yZz249TXvXYBPksT2zez4cVCMPZDXhw2sKPVaEED1MZD8OWHrCXCfjeM?=
 =?us-ascii?Q?G6TPTKxLi49J8mx+YTaiiE0t/oew9vV83MO/q6LtFiQv4bmX7oDQ4+pcM0IO?=
 =?us-ascii?Q?Mg5QnPDITOTQU0xuOTf0qMrrG5yvfqhM7OjSqJtUN2Yp02SNX0vBfNGG/9xF?=
 =?us-ascii?Q?bWIHN2pXusjjHXYvOs/BT+xU36NPPkvys/pjDkeZYQe+QJoJPW+xvjWmPQcl?=
 =?us-ascii?Q?T+CcYom/oNwfyetMiKM7/ineIx36FGTOBsoKNk7AQDrDry5XksXYw83j+JHk?=
 =?us-ascii?Q?z02l6MYureAEni1KVVZe15NpfYFs/Nc6ccgPrlI44IrB/JywyyP9dejFyI4k?=
 =?us-ascii?Q?svAlMYd1tJfmsZ3oOSgGLZ3ZDVukpddPxE42MmmOvsiFwTgudxm0PXpnMS1+?=
 =?us-ascii?Q?p96aVMisDHuxmTsba3c9ek1znzFYhlcM1LxEcr8wsBZWxkIGhdMDD6QYRbGi?=
 =?us-ascii?Q?eKEaVnfhpjSUxvckhpHZOvMV2pGt5J8U/lFRsJzSGPjp0QQUdTjeL/tlyRdS?=
 =?us-ascii?Q?fkIdWaeBRQ3qooDcsbnM/tn9nbtY2Y6XQDu/bZ5iTaZ9bUGChCmgDOm7Gy7x?=
 =?us-ascii?Q?eKkd65qjR293kD40bmMIyh/N9oyFQjRn4S0be/Qp6vQ8XvelrTtltWnflV9T?=
 =?us-ascii?Q?YoR5oo0xan5/IFX5QQrOZakgp8aD6ZFL1h/MLKhCIUsc0kbgy4VVZMq9YRY/?=
 =?us-ascii?Q?KcopphQpdl7743RtPIfrdKXaxlfvgf12lUt0HxAd40/U7KFc7yO4DGbHOqUk?=
 =?us-ascii?Q?mllBX37IeTGSNwfWxaF7FxptgCV6gG4XlS7kRaKMCvIzjHvKPr2I+JLwBGvN?=
 =?us-ascii?Q?E69YBf0a9h23dCr/6oUehaNA6ntvnEKb1oZTA5Bq9yArVlvOhtFZQwZFyE4/?=
 =?us-ascii?Q?CQR/5tq09e7akPR/N1h2xQDzWaYZ2x/3dDNWb4qYBrJVWlsYIgevT2J4r80v?=
 =?us-ascii?Q?qvN/rRHgOOe+HcfNswzSxXn+hxlnntv7uuFh0xVoKYcCUidTlxpNgJ5vpwT9?=
 =?us-ascii?Q?sazI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9ba738-d5e1-4d86-b2ba-08d8c01a2f95
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 03:43:17.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJNbs4JwLH79T40E2q8pPN2TdDLXJqvm7+yZ0poa3E2HJ/ax5fwckDagLl2eH19bHKjuL+QSRaXNEjboFeylVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB6992
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS626A capacitive touch
controller, a highly flexible multifunction sensor targeting wearable
applications. It is a close cousin to the IQS269A with the following key
differences:

 - Channel count increases from 8 to 14.
 - Channels are assigned dedicated functions as follows:
   - ULP (ultra-low power): a single channel that continues to be sampled
     during the device's lowest-power sensing mode for wake-up signaling.
   - Trackpad: a group of 6 or 9 channels forming a capacitive trackpad with
     gesture support.
   - Generic: 3 independent channels capable of capacitive or inductive
     sensing, plus much more.
   - Hall: a single channel leveraging a pair of internal Hall-effect plates
     serving lid or dock detection.
 - Each channel (or group of channels) has a unique collection of configurable
   parameters rather than common parameters for every channel.

Channels and events reported by the channels are configured using the device
tree, similar to what was done for the IQS269A.

Also included are some preparatory patches that move the touchscreen helper
functions into the core input directory, allowing them to be leveraged by
multimodal devices like the IQS626A.

A demo is shown in the following video: https://youtu.be/n0Q5BXYFIgI

Jeff LaBundy (5):
  input: touchscreen: Move helper functions to core
  input: touchscreen: Broaden use-cases described in comments
  dt-bindings: input: touchscreen: Move helper bindings to core
  dt-bindings: input: Add bindings for Azoteq IQS626A
  input: Add support for Azoteq IQS626A

 .../devicetree/bindings/input/elan_i2c.txt         |    2 +-
 .../devicetree/bindings/input/iqs626a.yaml         |  843 +++++++++
 .../devicetree/bindings/input/touchscreen.txt      |    1 +
 .../devicetree/bindings/input/touchscreen.yaml     |   83 +
 .../bindings/input/touchscreen/ads7846.txt         |    2 +-
 .../bindings/input/touchscreen/bu21013.txt         |    2 +-
 .../input/touchscreen/cypress,cy8ctma140.yaml      |    2 +-
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |    2 +-
 .../bindings/input/touchscreen/eeti,exc3000.yaml   |    2 +-
 .../input/touchscreen/elan,elants_i2c.yaml         |    2 +-
 .../bindings/input/touchscreen/goodix.yaml         |    2 +-
 .../bindings/input/touchscreen/iqs5xx.txt          |    2 +-
 .../bindings/input/touchscreen/mms114.txt          |    2 +-
 .../bindings/input/touchscreen/touchscreen.txt     |    1 -
 .../bindings/input/touchscreen/touchscreen.yaml    |   83 -
 drivers/input/Makefile                             |    1 +
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/iqs626a.c                       | 1837 ++++++++++++++++++++
 drivers/input/touchscreen.c                        |  207 +++
 drivers/input/touchscreen/Kconfig                  |    4 -
 drivers/input/touchscreen/Makefile                 |    1 -
 drivers/input/touchscreen/of_touchscreen.c         |  206 ---
 23 files changed, 2994 insertions(+), 305 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
 create mode 100644 drivers/input/misc/iqs626a.c
 create mode 100644 drivers/input/touchscreen.c
 delete mode 100644 drivers/input/touchscreen/of_touchscreen.c

--
2.7.4

