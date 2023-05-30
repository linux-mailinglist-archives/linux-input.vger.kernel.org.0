Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB7F715292
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 02:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjE3AcX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 May 2023 20:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3AcX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 May 2023 20:32:23 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58773AD;
        Mon, 29 May 2023 17:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I04mPE9GfabITUfHZ0Y/5yYfykov9TQx81sNKcO9mp7ojJ2I7I7eCK+g/LZ79vtmiDk9u3WmmwZGnYyBVv8LDbEwkwq6sXVAEUH/AEyckDMFxWQ8CldiKaUDh8F4ndMAwQPP98t16wIV/H4nxqZ8sNZbsDyyMVsEqw2XJCEupEYpv+Hig3uBVADacQJekiFEyX8bKNv9HyAJYDF2CARfnuP8fV+ShZwMUDRYxHEfDIMxBVcJjC8eOt8v3Ol6VVy1Vxjh7oZMn1QXrT/gy5TJrEIA1Zbd8N7C3nkDDPwpJDRizFsT1cNNLnA2qwtgWteXvhS62m1jqtAY+nZw5tmkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMec78EDEA2elB1Pn/LbIeFc6WOcU3LzHXoZ2sCGRxw=;
 b=LzkEkp82xDSEkWvhtmYXobxu3DKVFUPQE/cWLIRbVpcd/pM5CpEwN5nIjwsTOMz3o4XlETTmC7IVhEKTJweNkDoc0l8DaOuVK9ddf+9Px+xVSPwHDgTbgLoUN+uXdb17KqAkKK6PfLZHXa3lnfuIDEt/9M2kE2n2xLNpi0u0f2NjT3dch4fHqcl6Th+JY9neUfIWm6axYyBRNNlQniqmG0XXUfbhc56kJbKey6trCoHeT7sC1a1BGsmmZjcShVI8eR+KsveRmAlongYGh8pc4ez8RBdzQ+ZdrP5TouPXpP/e0V6bFemvZCK16XOirTkM4A2RNiLNIgARDqSkNNEEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMec78EDEA2elB1Pn/LbIeFc6WOcU3LzHXoZ2sCGRxw=;
 b=zREzgSRaEQHC8su658ekb8mDtLdzZB5S/WNn4yec1gGvPPkxrow/nyfinXqKlFArQa2h8FRs9fKGh2HdHy9br86zm8qZ6cYSm5OrYZVTveZkPlIBSjdv4ezS4jNc/2a57JY9fYm8mVvABv3/jM6M+eKIHmsTctkmxx8CBui84MA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ2PR08MB8477.namprd08.prod.outlook.com
 (2603:10b6:a03:4f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 00:32:15 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:32:15 +0000
Date:   Mon, 29 May 2023 19:31:59 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 0/2] Add support for Azoteq IQS7210A/7211A/E
Message-ID: <ZHVD/9OgRTAwBhqx@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA0PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:806:6f::26) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ2PR08MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef3fe7b-9980-4d71-2dea-08db60a55137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KnRVJQN32iUZgPpJ/WQrSv3bX9rXpwd+Jxd/c+QIJBVd2mIolxsmJz0CLXOeVjO9XODe+XbNi3Kndv3TQR1p+qy0n3uy4OHwQRm6+ZitKufKTLCE5yx/gqgarabccA/74r3aHIjanx9H/LALvgqVw5NfIa7l89iTqRuovDiYKRQRScfJYeqb46odWIZd6fNKsAnzfhRxogcfpzOqgXMRZWsZhHuTYO/N82q5R554PypStcqhy7AmfLwZjbh+XporN4sQ4z94aXR47Lw4plFb1h8NCfQEDGgNWyenJ8+n0DvE2VyUPMy0M4TL2errLjuvLFkxEgsQUBL93tWLVEH4uRTcnUxJRMkZh184jbnd8rspsvZyD1X0EA9gfDK1cVl+iDhYwHNgwo2v9nX9e5Wy1FliUdixQ3oiZ6MKDtIwx9tX8yXat9Tyqy0gaWBl0u6ktuqVn7S5ARvSGjZcvLT8STAoE9tKREDVFFRrvRlvplOqb487IlQuLzdkkXwz2KaL9VaGqQ3tOQ1N/aF3OfyI68JWMGWKdGDYmmjs39KE28=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(366004)(39830400003)(396003)(376002)(136003)(451199021)(38100700002)(41300700001)(316002)(6666004)(6512007)(4326008)(86362001)(8936002)(2906002)(8676002)(6486002)(66946007)(107886003)(9686003)(66476007)(66556008)(6506007)(26005)(966005)(478600001)(33716001)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1sczrK67ok4UHj5F6CvJZ1+cLGNgM7nB5djad4PPh0Bhlqa6oCNZz2Z5G2e?=
 =?us-ascii?Q?P6h5IyEQQ7atrwJlHArqCrwZFEb8vLf7F6+IiP1MtFwNXhoXk4zJlkDdUINd?=
 =?us-ascii?Q?8yvGBIhfsHGviNoXvqwiwyLsqdmFdVQITUcvDrlyO9JMdCH8nnVf7H1ixbRf?=
 =?us-ascii?Q?yQ0C0affVS4xykG0io+MD3NAoolUPJNGtqOc1mvRkF9Y00Fu+j9+8MntVI5O?=
 =?us-ascii?Q?7omvoO5lnFef31qbrfyYV4sKoSDHcN1Px4uJmc0OepoXg8PDOHIHwK7s53LD?=
 =?us-ascii?Q?NC6QDKYFnSUHAHzNT/okUYA8tLF+nXjoWCmyLf87yXMfxfai/FTbIFrnfv2Q?=
 =?us-ascii?Q?MF+mWauvKLPqaKYEfx41FoH2kh/uI1prCaU3NsZNzVbmp3cW4c92l4kR3Y80?=
 =?us-ascii?Q?B2iv9ABXvqVs8+Fjkv90kM6Sw7eXCTUo8VROhn/J+DaJJIrxer9Xx5rxXukn?=
 =?us-ascii?Q?z5uKoyQ+UiXb7BJMmHSnlPuO3pQ5o1bzvuW0mvc+yTCWpdKO7GfPXekVxQKo?=
 =?us-ascii?Q?d2crjb52d8WTj7E4AabYRG28u8uWHRpeCqCvAGGR3ZgjVIp+jYzU6JvLRCLC?=
 =?us-ascii?Q?edIOUtrUsz24lgI46No83iqw/Y1Y8jrbX4Z/8ZLAdIz50DfVBxDsKS1CjLur?=
 =?us-ascii?Q?UIoh8JuSmgj5Td2iAGxqT5KX0yaINQ40FFiqTABsL2bwcr4mt1v/FLE0DSqL?=
 =?us-ascii?Q?3fMu8o3/5W2KIwaHi1hn9cI4q9wSWMSpt7APVT0+CpcO03khRuzyCBHnZtkJ?=
 =?us-ascii?Q?LdgL4z5hDF2hdBfc11WVh1LKQvfjonMHjKFcRuml6C69ARX16ILMuh5iIyCD?=
 =?us-ascii?Q?50nSY8Wr+k7ETwzwFi63DknLCKoGvmjyUNZGE0A4MP2DpOv07CyhO0CHb0in?=
 =?us-ascii?Q?GLXF+QBA0oxvVdY1p/6hHm9qX7UwfYZEbaM2C2ApWDGUy2iGgFMmAveGcMlY?=
 =?us-ascii?Q?OwSCn7cY3hqXzKkgoIKL/NTKUfUXfTHPeVhdJbx6QB0+uTX+Olt6CSukFBaV?=
 =?us-ascii?Q?zh1z76r8obc93apy/7vRa/5xrnwjJkM2CxUZJD4nbYJ0fOOhUpZWt6vPTr3/?=
 =?us-ascii?Q?pBSABbUtSjAhEQF9qBDQAC4JDWurkSf7GfB53Q5qhs+Po6by2aeANqe9ldoD?=
 =?us-ascii?Q?GhFhgSPWIUCBtdppBpn9v2G17/xyn0iJtCGptYrvk/z1dYKm/I38P8GyEJY3?=
 =?us-ascii?Q?WrlesWPYO07uqPLV9AMwAljG0MTlRYB6ya/x2PhiKN2wUJaIIGiWUe8W9syU?=
 =?us-ascii?Q?7ewzx7/CMBUJvnq6oV2+ah9HRFrxlA9KQx0VhCFM14xjt8e63Hvf67tnWyUB?=
 =?us-ascii?Q?nwQtgSrO4nZqbw4X8xbQf8mB6S3SIxdpnE9GK4Yw749r6POVX9biNz/1rnr1?=
 =?us-ascii?Q?IMle46AoGChFb8FYA76OtxEFTBacKRSCOUpUqt/cVajg8iiVXbrpX90LXcAi?=
 =?us-ascii?Q?8WOH0g0t27d0vt3kHYIhEtl67ShQ7DAZ2DPCpC6oBW3D6WfzQM6tZRZw28uU?=
 =?us-ascii?Q?L6KG7wy+xv1mvlm3oamB7yeCtfePUfXv83m+XgCq9tkIcF7dCG99h55oMjjn?=
 =?us-ascii?Q?m79kmLuSY+xuUnhQKgVUACv3B5OSVFDfXqXPjslL?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef3fe7b-9980-4d71-2dea-08db60a55137
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:32:15.2988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp3QxLsjFbSxuyqjN+HJIdbAIgpUIzth19LuXdGeu19Mms2MOteaGymQ+oWUPl54+8xhqt+n3icj05TOVrLMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR08MB8477
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS7210A, IQS7211A and
IQS7211E trackpad/touchscreen controllers. Optimized for wearable
applications, these devices track up to two contacts and are capable
of reporting an array of gestures.

The IQS7210A includes an additional channel to support an inductive
or capacitive button, while the IQS7211E adds an advanced assortment
of gestures. All three devices are demonstrated in [1].

These devices can be configured during production using OTP memory,
or over I2C using the device tree. For the latter case, the binding
covers all major parameters called out by the vendor in [2].

[1] https://youtu.be/RjB8rNkzQJQ
[2] https://www.azoteq.com/images/stories/pdf/azd123_iqs721xy_trackpad_userguide.pdf

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS7210A/7211A/E
  Input: add support for Azoteq IQS7210A/7211A/E

 .../input/touchscreen/azoteq,iqs7211.yaml     |  769 +++++
 drivers/input/touchscreen/Kconfig             |   10 +
 drivers/input/touchscreen/Makefile            |    1 +
 drivers/input/touchscreen/iqs7211.c           | 2569 +++++++++++++++++
 4 files changed, 3349 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
 create mode 100644 drivers/input/touchscreen/iqs7211.c

-- 
2.34.1

