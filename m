Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F0B27E56B
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 11:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3Jm4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 05:42:56 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:26975
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728169AbgI3Jm4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 05:42:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lox455orh66GhBlkADNFM5ZWzqFS5nbAn54+pZllsKLj/ptKB6XC3/l/mYTY5dyHnffbVoRCotrN6QNeuat8RXKvzVqocISx3pg5sSejhPab1LHNSCdLlTUB96XW/pkmgZrLGVAJjgUDJOVduoQYZo1WJb14wvFPkceiSXveLZABBZ798cB0wjrGsRRCgH6eBpugJam0PeuvqPI7Qukixh+c8/MemV0QJ/RqqkYi4EQJnAU/CGNU7PXIQ8/MyXnG4rWd7OBmJk8umnzJUM/tDfu5MwZnLWHKHUqGaLBTL/+RUmXSdy78s5Ji3oN7oghXz8TEUWnpbBi8qxQ4z+3DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUEPLJ8SdwlTT6VK9LWpgsEbDIcrBWUQbXqvbu+GcDw=;
 b=HVTjkHVHw1Q/UYUSxx9S2ag8lD8vF3+XBQaq81b4d35N7ru04vCVZTj9XMICBYfteiOTXGyFQkmqc4TWFC5SZ36hwac3U7CUJWj2QerNB9nG+JblU7J/k9/s5t6wE0Q+eFQ9szj0wnJFzN4OCLf/aJzQz0N8puPCCPKf/7AWXa/trxZ8h4KJGVRm0sQV5lg8flnJ/3CA02KPDVYUVlB6xG+527cVRYVUEWmIcbU3OfSiw3NQ67zXQS7o2wdHZ2jLVYe99zF4fLlGaXOXYIlRDNROlVopJbcv8y/Du9du2mrEy7N1n+g1z/OcN/o7nlyMFqfiintqvBWgvo8CUOr+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUEPLJ8SdwlTT6VK9LWpgsEbDIcrBWUQbXqvbu+GcDw=;
 b=EiNnPlsI9ZCH1tpikMQ9agB+TmhhC13ECwrNIpGwXNBQ9fvwCnAtBBzdB8xTPPAGXZBG77vcRx1LNEo5jnV6Evk/WNw+O/0HPKvkkGXNcbP/leZdP2eJdBA+Q3QVYRpdGukUV22Fu65134gyu71fviyDl7KLaWMFefzKCjmF8TE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN2PR03MB2173.namprd03.prod.outlook.com (2603:10b6:804:d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 09:42:52 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3433.035; Wed, 30 Sep 2020
 09:42:52 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: [PATCH v3 0/2] Add support for F3A
Date:   Wed, 30 Sep 2020 17:41:45 +0800
Message-Id: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR06CA0020.apcprd06.prod.outlook.com (2603:1096:202:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 09:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10e16f93-95fd-4720-dbf2-08d865253313
X-MS-TrafficTypeDiagnostic: SN2PR03MB2173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB21738DBE7631BB6E79C9FEC0D6330@SN2PR03MB2173.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQzYIa71zgeSwoFuI/vN3kN0idQ06Nx0L7RsbQMEM83BZQW5TSmOAb8XoVdiMfOT8e7xcslpP8k0PbIjhwVuTp+lZ3dxE47ZP1s4xXEwJ3pJ13z/fuojrZaAHYdUE3DsepkNYabDJDiLK2n+sH38c+ZxjFos1Fzr3RSE0ezoF0CAqjTnhTEKJ71yoXgXncLc7sB9HuAjEOrZ2sBFqaHYRewC5+fKY2Y75gmcmMO6JKHyL6d9niXY/M9l9KR6uEaPL1cC18BOTqGmQWflqrK38ujSWs2u7BdhSGU4qmCmczLTwjTsij7g7+yAVliQS/sQzEEVfuP4hkqvbsbNWH7tow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(396003)(346002)(376002)(8676002)(4326008)(6512007)(107886003)(2906002)(83380400001)(6486002)(8936002)(2616005)(956004)(44832011)(478600001)(316002)(86362001)(54906003)(16526019)(26005)(186003)(6506007)(6666004)(52116002)(5660300002)(4744005)(66946007)(66556008)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: u6wza4H57Ud81qpq2oOgY/fkZOUguqXqljQ/Ljqzknh/WMGvFK6QhPb3M/I7os8Pd3pvouwfLMbdbl4kZ3dQS/0+BmAPGTUd92ghZtDzDSCh4BMWYsJiZ3rnUpT5NBxqbKqc+T9NbVWGcAf0nRR/nNrp5E9Eq+dvy3DSf2Mf1sj1AuxZD1RzLcYretFz1ACYdphLia8wpFFY1B6KdLbRTdU94FGK8V9QQ4TQ9kTivAdk0+kSq04D2Y4bfr4EFwtjtjO9flB9zsau9O4YI5aVJ+2g72eFED+AfMUbL5SJcL81HQTtNfZifIOWD+ErF7EGzqVvABkQRH/HIe5fWFHdLmJ72EMMv4HakyesvFJ/tsyAWu2ct6lNdiUZOusFb+/V/kGUWRoDuP9N3IiHoFcwHlEJR/+Rp/5eKEs0dJQacgEeJqWB0eW7t+4kSjgRJ4C7L9Lx7A/W4kzx600WiXEeny6IL/8CfNGd2g1dSYWqaOu1BRlYVlm8U5qHBtH8vlItu/PzUOKWkMM2tgpbcd6kRcrxQiCkk9mB6F8y9Hw2itL0c+0zdOhxsmgqZynJSwrs0DkYrOJCTLTlc0iDxiHcSej9reraWaHaFGDTnv5fLLvco/AGM+PvnbitvWeozw3s5GAn8ejIQghCh3LeVuAvLw==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e16f93-95fd-4720-dbf2-08d865253313
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 09:42:52.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J6D+xK6ojAh3Kzv38+901vLIKsbM+fw2k5UnI57ogLGfDdHgmL5/wFiwE5oBfJGXN0V9Dr7lQgWdwIq1LnPdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2173
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

RMI4 F3A supports the touchpad GPIO function, it's designed to support
more GPIOs and used on newer touchpads. The patches add support of
touchpad buttons and rename f30_data to avoid confusion.

Changes in v2:
- Combined patch 1 and 2 of v1 to fix bisectability.

Changes in v3:
- Fix indentations pointed out by Lyude Paul.

Vincent Huang (2):
  Input: synaptics-rmi4 - rename f30_data to gpio_data
  Input: synaptics-rmi4 - add support for F3A

 drivers/hid/hid-rmi.c           |   2 +-
 drivers/input/mouse/synaptics.c |   2 +-
 drivers/input/rmi4/Kconfig      |   8 ++
 drivers/input/rmi4/Makefile     |   1 +
 drivers/input/rmi4/rmi_bus.c    |   3 +
 drivers/input/rmi4/rmi_driver.h |   1 +
 drivers/input/rmi4/rmi_f30.c    |  14 +-
 drivers/input/rmi4/rmi_f3a.c    | 240 ++++++++++++++++++++++++++++++++
 include/linux/rmi.h             |  11 +-
 9 files changed, 268 insertions(+), 14 deletions(-)
 create mode 100644 drivers/input/rmi4/rmi_f3a.c

-- 
2.25.1

