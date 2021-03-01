Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6ADB32A579
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbhCBMnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:43:45 -0500
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:40078
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346842AbhCAXuj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 18:50:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa+CviyFJlWKqpkTtTwLVLvtsfttUy+lHg29kMbz5zV+KhUR0Cefc2qliTboy5+rjtpePupoiVc2R4yJxzWQ21fSv0ZzLs/fDxUrBcrzf+dBOEeJvvai1InurKCmnVUjO1DJ63xwHiBhLcRcJzPF8pWPyziqHAuE+ydTcFd7Ui/rjs1koJmvCEra/ruHem3xLmypLIpKks3gk29X9+p7g4NyNMhr3d0ny/afXJK3AfEUtpqlX7+nFGfwD+9lrqySXbuQvlCsU8RfYpFgP30hYZrLSOsfJy95Mh6nlK5/vaSubtk70Ou9LoStdxzSwlfgy9pKixo/D6Ed3rcjaTtJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4ka5TlzmDQNCr/MF+gUTBaq5mfghjC3mlN6YN0OjGc=;
 b=AOPTuzjIDdAtLUwJnyqaSmoocZFtiyeQB7IgxyawmkSDzTRQQ6tZLfuSVD80mVzfSURHUIHEE+obPwVep1pQceN+6/FgHpky2z9lxPXc4F5xRrFzpTnt+RefEiNuio6Zwz59CRpNb0xCu5KXataGYrBEk2s30rdF9KKkQJzzxNx1wheDlYtJwkailafL5hVA1yU/DRqJCC6C6IMx7Zw6voDN2EiaJE8s2hVayvMwZgjZokXZCsjFdSmciBDvZTu2f6m9jX5VP9UTdVCnPKYvl9pf055LIZpbE2do0NXQgKo5cQmKIxhhIBVbNj6zJo0tkbAw3sI/Pco8KD+EqRaDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4ka5TlzmDQNCr/MF+gUTBaq5mfghjC3mlN6YN0OjGc=;
 b=OOAZFwHEo/yLXpFQZf2YeXm9Mzd+koF92Seoo314fEPTDZrUAJNBdRuNEZTBHVtizlV6NYBKZTqJJtxCZQ+s+OhrQWNqBCkZ/De3TKonTR9eMPBOpweQ6Z1Yoq3dQWSBOJPTe6ov0HSri24vwnrTdYWeA/Gn/ayozUyF8pBuglQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5151.namprd08.prod.outlook.com (2603:10b6:805:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 23:49:45 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 23:49:45 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 0/4] Add support for Azoteq IQS626A
Date:   Mon,  1 Mar 2021 17:49:24 -0600
Message-Id: <20210301234928.4298-1-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 23:49:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6257cc8b-ece4-46c4-234a-08d8dd0cb0e9
X-MS-TrafficTypeDiagnostic: SN6PR08MB5151:
X-MS-Exchange-MinimumUrlDomainAge: youtu.be#4816
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5151891D33B87C9FB342BEAED39A9@SN6PR08MB5151.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahUSVOopT2ZFjqvg3wF7V9jX3ucpj9HZXO0AsnheqxOLySOMCl6PhXR3fQsT/Ju2c1Sp23dF4xzFsScKoj/QGWn7S2xIZczJV/XXgp4pm1IuzbaQrZ/RRPbZhytJu9gY2tCsN8EXBUOLdKZ+hVVFoyIpSvVj//rcWK9zHH8AGFLW2GfcT8ll4/F+HmvosS/idEpftUew2bEtSjEa4xRPXiOo7PvN21DVdPCANv/xAZtMWbFou9tcZrBaa0rVVSmol7GOtclwlmz3betFYwXdIRf/smCsoBpmllcrnuJ+88PmfsI5Nn8N1GGf1y6oq+1h57eTm0OgTZQyZsKWrdj6GwenB+gRZm4e5Tp0NXWMh2Bm7QTXTrsbyf55JHAvfPJ9PwBXhA6aqneNsJKkRer46IrsnA1POQleX1aHF2pHVoEBKCqo6kn7xFzci02EMsAyXHDu37R8rdP49r9erf3qBmSHx3mIGCWMMY8kLCPK80WBcrHmeGn2VOc5hX2gx8vBzJSXPJB/xE5nCT5FDxMxqIdcoHy+l6F+q3e76UVqDvWfRoLeaDZlxHH9Fw2QdwwIxs32H5ahFipyqiPuU3BrY8HKS1sVkxXcMuyYCxCAuKUZn4AoGXCLpby5EctL60Wn3xqnsF+xGw06W2xbNfo2F1J7+fWYsh6pbd621BrUBLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39830400003)(376002)(366004)(396003)(1076003)(4326008)(956004)(6506007)(52116002)(107886003)(86362001)(316002)(5660300002)(83380400001)(2616005)(36756003)(69590400012)(186003)(16526019)(26005)(66946007)(66556008)(8936002)(6512007)(6666004)(8676002)(966005)(66476007)(478600001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MTvpuMw7ckl0jDjTSa8HGsSddjIBrCw3wAy6cJHbqRwHupXGmoaT2OorEhDw?=
 =?us-ascii?Q?o3B37z+jNu976SMlsQy3wC41DmeRFzT/mviD+NQspYObdcKEgVSQRprgJ4W7?=
 =?us-ascii?Q?dkL4SXYwVFTbBk5NAwMfEO8uTKbJFz2ukclllPAM4H9uocFQsR4to5DA8S0T?=
 =?us-ascii?Q?YOolPlT/bK/aUDNlaI3Igua+YSDe1PxQ+lApyASw1AtG5MftjK+w2XofL4ug?=
 =?us-ascii?Q?TAszKTjHnEaZrIV8YhYxVv46fHQrT54lY3zZZe4GtGY4vBBakaY6TYqhSFwC?=
 =?us-ascii?Q?4nF/UkTBM//n03J++mps47LIf2oJ9sBZGr4ppaL3RZMKGPhqoP4T3/vPgwa0?=
 =?us-ascii?Q?qw8jSfcnJyho8lSF5J20bgKxxggnnDQdh1AULQPsXYltc+2JXKUOMFo7hJRP?=
 =?us-ascii?Q?S5zcnX8q8uW23WPB7mtz8wfemBNfY2U8RE9J5Ye5OHgoLvHOyEcND8KLC7UV?=
 =?us-ascii?Q?+oI8OJsHEDozXWYZclByrTgsIznLw76JhJXlZRHo/2xqPbQsCbvzgvm7aibA?=
 =?us-ascii?Q?IGUhbhkXHetkyPb9n3z0irviRx+qO0jysgft+BuDtzOPtFuYnMC8aumU75Cy?=
 =?us-ascii?Q?6/hw1LU4P4Yqnd35dfZa1eVSYjFOR74Ua4N1ku3RIJIEBWr9O+PUgGEu/FY1?=
 =?us-ascii?Q?xNKgKBJZ568ULwDsXjFZdSYfH2cxlXRVXQ/1zA0x1whJsa/hTWmjLaRkYuT0?=
 =?us-ascii?Q?schyYYqSrWt/lZarnEFoYpjZUkaqFozrXsCu3Z/KYT/NB7Q2EeJVhTqvjDy6?=
 =?us-ascii?Q?TGFh+s5aTxKa5T8G9FDm94c+X8fzyDFx3hQOVuaTiDNcj9xdwpL1s1L6+t/o?=
 =?us-ascii?Q?s5shcYZiVHA1RSabtqEsiguMxJDXHFXlMSZjMdVa23Yy1bdFPLpUiGNR1Vn6?=
 =?us-ascii?Q?Zo1GDtbL9N5SJYJz75SjY9JebMhpQwJFroeFSe880S0UE7eNq3pjO5b7D/MC?=
 =?us-ascii?Q?IbNqWNfTQ5CNV7y2wQwo4PuplNh47xx/zSvTHFQkQn+83P9wxTKDXFlQLDZe?=
 =?us-ascii?Q?I8rFqgLbXNoVe4QOd+2QB2Bc3ZeEKJbHr8TxTQssNYY1MSQytkiJtFEui1EE?=
 =?us-ascii?Q?VJR7cakovyI33nk14l+pwnawdHmMoj1zffWHpsMm+/xZGEAiMHaRcWhLZl2f?=
 =?us-ascii?Q?BeIQFToWaxVFjk+J0bo+8fy1V3iIemyFTiUqN27FEMdqbbVOxx25XN/viQu7?=
 =?us-ascii?Q?QD9JJovJ/JSpUH3wh5J7EO7MlUt7zCPBrIdflfR0Sj7HEnDr7j5IO3kpJbvF?=
 =?us-ascii?Q?UwAAIEFEgd8MB7T9wdC8fOq7pRx196SOgkY6Sx8bd3F56CjxdW3ir9L81ukf?=
 =?us-ascii?Q?DfuF/5ziAcAXnEEeYsofLI2I?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6257cc8b-ece4-46c4-234a-08d8dd0cb0e9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 23:49:45.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KiFdocX4p7WN/fON7c2hcleYqKJ5fJ/Xa5nlDLwZ1HmFftBIc8pFWioIHPUrOHWKmQ345JGuzJkUtkRD+/HpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5151
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

Jeff LaBundy (4):
  Input: touchscreen - move helper functions to core
  Input: touchscreen - broaden use-cases described in comments
  dt-bindings: input: Add bindings for Azoteq IQS626A
  Input: Add support for Azoteq IQS626A

 .../devicetree/bindings/input/iqs626a.yaml    |  843 ++++++++
 drivers/input/Makefile                        |    1 +
 drivers/input/misc/Kconfig                    |   11 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/iqs626a.c                  | 1838 +++++++++++++++++
 .../of_touchscreen.c => touchscreen.c}        |   13 +-
 drivers/input/touchscreen/Kconfig             |    4 -
 drivers/input/touchscreen/Makefile            |    1 -
 8 files changed, 2701 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml
 create mode 100644 drivers/input/misc/iqs626a.c
 rename drivers/input/{touchscreen/of_touchscreen.c => touchscreen.c} (93%)

--
2.17.1

