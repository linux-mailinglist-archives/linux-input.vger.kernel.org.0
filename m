Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974C774C679
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 19:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjGIRGq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 13:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGIRGp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 13:06:45 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E428A4;
        Sun,  9 Jul 2023 10:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig5U73BE9FF9hh3WG378ZsKiYeecWvem4/xtgpou+Ajg8zt04NQUCIj39C8Qsz/zVAQsVXjaMvCoEWAiVM8Mgn5ABnEU8u/PmMJl34XCiE2tgdDZbVnT33HH9WzAutunHby2tavCInx27bjc2/Ve7sQT5QpU8MAtV1qpmS0pyIZrVsQMICwJH4ylsBfiZLL20IfzR9ikN84GmOMrCQFV3duzD/Z23xm3ZvoPmetM62TxIlIYWhLZdtsV+UoTN28HFTG18mCY32d18Lvl5sLxoZXcHp27U2QBQCR4bptdjZm4p+eDasItTol3b5cE0GCg17CubUBVQ21Q7cCQ1nF2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3zQcwDrCTThyLlfJ12rElR4LlqTxCUd9ibe/BKneTw=;
 b=SjST4oItpZBPRTiYoiWldyhsrnad+QZQh8aA2upqHZI4bjZ+zAsoRJurEIhuEywFEcSFQHbPFGme8VyGqorXZ0MZ3nOcS2JtJDNbq6H/hWQqPiSuZFFqiik+n41Vny5tlg2hLirxakuOQ8/GB2cVp2wOnZfhxn05hbdcg9lg8bTem3l3hXxre9yF/dylkupow2caWvUtsDCXrRJA5sic7au9dEpUfuJI24b6RArl3pN5Yuid9eTuqj9cPGjaGb5XQ3flgMfJdZy6Y8LR0ZTYNrhP4wMbO31LLJ69fmZvpZJyXJMpqynnm3IA6o20F6Fffo0qliDFlC3RVgDJRyJ2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3zQcwDrCTThyLlfJ12rElR4LlqTxCUd9ibe/BKneTw=;
 b=rB4pp3iBSntSe+AyL9bKFaoWgjnD02oOX9iv4QJ9HLNGyL5ltAYjY7AIrgZP1dbNzGypglbuayuxbl5aT2XwlUBFJw8ytjBE4MVZD94JfzM/BJlHUqvdHE5MUDeCSVUKypQYghnEe2LW/xF6Mw5uL895vrYKfRPWOowKeJt0tTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7020.namprd08.prod.outlook.com
 (2603:10b6:510:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 17:06:39 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae%5]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 17:06:39 +0000
Date:   Sun, 9 Jul 2023 12:06:37 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 1/4] Input: iqs7222 - configure power mode before
 triggering ATI
Message-ID: <ZKrpHc2Ji9qR25r2@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKrotyhz7eueujys@nixie71>
References: <ZKrotyhz7eueujys@nixie71>
X-ClientProxiedBy: SA0PR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:806:6f::30) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 960df375-f4e4-4e41-d991-08db809edc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUfH+5ZmPZUf9uI3egbY8sN4O4bWumvdep/ZEXDnUZ3snmqhEATm7sm78sBgtdmmpqObQMkUdBdUVvzu9IebfIevl4RL4hatOlJ1OwQT2ZHNFd2NcFjbBPsgvY6jrxegm/khVRgrdHVBAOmKjop1kAh9ON8/ZqcYsN2P6puYhxaWyPUvu8j3GX2aHFVfAfwDZceG6RMLUmmZ8QmBJYEIu0F93oNNzC527YWmmY+bKkHRpX+SO/S/Czh3LsGFB8+Z2VSma6IegHwYzYx3sKcY9u9AOYE86M8M5Lrotu5aD5ixs9wV6Bns4KV/QugxJghQeD7cHDYM2GMR4OIhfD/etLHXGyJ352VNgIGPxJscSivui4DCD9p/1ofYW9a03Seo8zuS0AnBS+Ige/1RUuRl0RFBpqUyc7upGvzLp/hvwTO7fS1k2iChFwM2Ux0rX+lcg+vly5Z/B93Z855GxjReD2xU/mopqbC3tasizrfTQC77x7GD3vE4Bh4qqtCeQXJurArby5BU4CEYQOvUIBP9sEdpBIM9rTPMF/12k0/GT+Qll3dyTmXk9FFSd6uStN+n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(451199021)(86362001)(38100700002)(6486002)(33716001)(107886003)(26005)(6506007)(9686003)(186003)(6512007)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vtEma8Syjs9TivK5PYJE+f6zkUWnENJOY57m3LvUZGiOrTCtAZGJ6lgZfFeV?=
 =?us-ascii?Q?GzsvWhhB9qAceZvnFHc/6M70pJ6g6J2tX2MzQhd0vII2x0jaHbkBliiG27hR?=
 =?us-ascii?Q?PZ5tq0Dbp6how+0EN1cYB5DI9z7gVmOQMcmnNXWXAqVsRN5ph6w+iSodAVKJ?=
 =?us-ascii?Q?IqPtiaFj5IzJnxch0esk/U+nn8lJVc79q5QstaeLMMiVHPf2OWdiLmfprnKn?=
 =?us-ascii?Q?SUy1NwxyfXpVuPMx4A2p5x8tX5m82jL5xSwKquzp98jY65Zh0Z3L+25nxvVa?=
 =?us-ascii?Q?TMSXR2KRvppaWd3ok6YPXwHr1pn4iBYWQ88v7JcysAt7c3Aerv7vw/k1biy4?=
 =?us-ascii?Q?uGY4+ktns4VfahagSorW+EjvQqsWYyrDLz7mxO460yVE7Ao5vy7UA4DJJRQi?=
 =?us-ascii?Q?ny0KYMkCqLR8++6uBECjqrmsGrQxudc2Nlg8a1xkDOw+AU9cAyxtOnUcpa5/?=
 =?us-ascii?Q?wTad+thET9vCYclKySQAS+aCWcRXW4ELJnU74w7r9SdzqpRJL3qmALqneqgN?=
 =?us-ascii?Q?UA/RJ/nuAcIgtJImdUBA97yqbmF3Ol2WSec4SyAtKyVY3hNZLE5K6VN2Fevy?=
 =?us-ascii?Q?o2wvTHhGFeyufn4XdJFGT3YP3hNSRrhMfIOOgQ6mfc7bHwRNGeU6ZlPtHZ8U?=
 =?us-ascii?Q?7f6qJ+u6BRKXcApTcIFOHazSfA4Mch6RPsTCLTiBGGNFxivshETJQrl9ztdc?=
 =?us-ascii?Q?R0hiFYHZFSudjPVaaRxWh7E2q8z1f6VOFaYBGXlBBzQsgS+D7OmjTY71k4Ph?=
 =?us-ascii?Q?xZ1/urz1elQF6IsanV5T1k+bR1ppz7a5gDdfcQNo51WpsK4yVvdAHVvhMjCc?=
 =?us-ascii?Q?bFw/NtwXGXryWCC3UifmLwWq83GTtqDHofTvMQ8efeB1SlzW08BJ4WnO9h+O?=
 =?us-ascii?Q?p90k6KD6t/Nb+tq3ONlsO8iMAvIgEKK/hHGvTToql9PFDpCUQfChLWToqNn8?=
 =?us-ascii?Q?3AcmnA/tlB7o2OaAQseRMROTQT5yvvq2Kh14RaffXztZBXCN+OKcL6zNBFrm?=
 =?us-ascii?Q?tpj/I131azDgjLHM50ZuSvxE4uafAYrowsz24V58LD0b7Vla/B4bL36QIAtI?=
 =?us-ascii?Q?ubQowot5uu/AOKjXptC1OnxZECNYQ009RErTVMPnUWlkUFZzFXjukeH9NmJu?=
 =?us-ascii?Q?M9NGefnb1ptiSab0TXvgj1zn7jCJYE/PYJ9JkEDLshZqK9sH1WWMLEjkIpRH?=
 =?us-ascii?Q?ecnkcJgQQ8MFVZ3hNUt2qG4S01OdKr5jLhL3bm4w1vhhfopqMBEu7Y7lIQl+?=
 =?us-ascii?Q?6GweE6E0/WO28QZED9Co1H8DEL5j/lDrDWSWdZWnqPOFnJNgWLcJRWSjJhMI?=
 =?us-ascii?Q?a9nMG4pUQVHZyVUa8pf8fSlwW25dPQ2L0gSO6xs/5Fci4lGqp9s6WAjrAHx1?=
 =?us-ascii?Q?xVTHOjyEyE8rMdVnCyhz31RRYcXK4yZ4DC7IYV5rmZTHqlZ1iDGu7zDzjYxE?=
 =?us-ascii?Q?qciK6gbaZspbmWHe6T/Iun/iqPWxKR/pcYoaO5zZLov0NAH2nZpexa5lRuF1?=
 =?us-ascii?Q?ftZtzyZ0/K1Gg/C9+ZZ2Ty+kUrP9prC8wloMexZnBM7oehdl7udoViTMXc6H?=
 =?us-ascii?Q?1Vru5+GYVQWay3NL/RZN3f78GuKnmS0acsUqrM+g?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960df375-f4e4-4e41-d991-08db809edc64
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 17:06:39.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+93ahavhbcpw9fsIdvnBLlFB6Qo7lmcYDqRq6Bk2akWlYypGd0sRgu3trdazX+X36Y/qwr5vyMNmEXPIbZ1xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device drops into ultra-low-power mode before being placed
into normal-power mode as part of ATI being triggered, the device
does not assert any interrupts until the ATI routine is restarted
two seconds later.

Solve this problem by adopting the vendor's recommendation, which
calls for the device to be placed into normal-power mode prior to
being configured and ATI being triggered.

The original implementation followed this sequence, but the order
was inadvertently changed as part of the resolution of a separate
erratum.

Fixes: 1e4189d8af27 ("Input: iqs7222 - protect volatile registers")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 096b0925f41b..acb95048e823 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1381,9 +1381,6 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 	if (error)
 		return error;
 
-	sys_setup &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
-	sys_setup &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
-
 	for (i = 0; i < IQS7222_NUM_RETRIES; i++) {
 		/*
 		 * Trigger ATI from streaming and normal-power modes so that
@@ -1561,8 +1558,11 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 			return error;
 	}
 
-	if (dir == READ)
+	if (dir == READ) {
+		iqs7222->sys_setup[0] &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
+		iqs7222->sys_setup[0] &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
 		return 0;
+	}
 
 	return iqs7222_ati_trigger(iqs7222);
 }
-- 
2.34.1

