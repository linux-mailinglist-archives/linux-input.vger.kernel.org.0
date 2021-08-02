Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2054E3DD9F3
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbhHBOFU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:05:20 -0400
Received: from mail-dm6nam12on2062.outbound.protection.outlook.com ([40.107.243.62]:26389
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236654AbhHBOER (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exQR8Qu33r3qCAPVVtcpsOoUbQ1h9TKy0EbDKOtJjIsvcqNVbUt/7Oe6imLclv6vH+10IQ04PjgCG8okKXrVGk8cI05UEfWJl2pQhyjhKE14UYI7kpMH9VpY4/OJJRnWFswYYONvPrRmSkBThytJUhHAF+wgTmspgfYQWpXy7rzfgQoplcZnAKLqWd9LyUnxhzqfd5lioLrqOBFd7XCPpSjIeLAD1LHu41oePpwuvRz7cWjslh9sahy7q4uyB/pdnQy0K7k1+d6E76KNOCqcWC37KQ3nQHut5EjJ8dhHd/4UQ17Uct/sO7VwUd2JzgXMPX7kDnYcA9drSK0spqRoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDTrwh+5/OWB2ELLhMbuzS0m0U8GqftjgEcjI9F2UvE=;
 b=Uj1bGFFGK+9QFhVy3WwveIdlmexSisvykfP0++Q7uKsrwkcp1acsjSdfixfrALGueefY5M52hXk8KoVTqaWhis0r0Q0nek5Mjqd2ubTNXFPmus94CAz7rmDi9WK2uKXta2aXbPuR5yXyhmWmnYVZpNKHpvuYLQvL9nMgaX68r2cD2n5vssY7F741x84jQSi8y7mXs8bQSSkcaoThAVwhhwmOn4z8iYLt87vz/o8bopprFugTKgLlTfTkXUkHPydgHH4Kw4toFPZYhz78V+EgEXP/cJsyEr7oNYOHLxiBKYoEPzC7RvQmGw7prDcQ1JZsKbycvLlAgYjo8g6Xx4i6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDTrwh+5/OWB2ELLhMbuzS0m0U8GqftjgEcjI9F2UvE=;
 b=5ESN2EHMo6JQG4/KiExxQ6tsgEjTpASO/LTeBzo5wOceC+5BDyjD7twy6hi2iPuYH/KJJh0xXQZl+1Sp29p0FNbJl6Oh9hyb96KtAG2sstZFunlBxFDleXfdh2YCH9XkOpABVXmxQrjx4ohkLxsWbZxoC3B6OhUukl9SK36o8uM=
Received: from DM6PR07CA0070.namprd07.prod.outlook.com (2603:10b6:5:74::47) by
 CY4PR12MB1462.namprd12.prod.outlook.com (2603:10b6:910:8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.26; Mon, 2 Aug 2021 14:04:03 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::f9) by DM6PR07CA0070.outlook.office365.com
 (2603:10b6:5:74::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:03 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:00 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/5] Updates to amd-sfh driver 
Date:   Mon, 2 Aug 2021 19:33:36 +0530
Message-ID: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ed9f12-86d7-4242-e66a-08d955be6258
X-MS-TrafficTypeDiagnostic: CY4PR12MB1462:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1462DE2614989BF4C99403EDE6EF9@CY4PR12MB1462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PifseCjoEPK/CvB4HXK9Wn5Jr1h4DjXoo6DMsqXucnEqEvaMGncPvLFu6o2PtFuh9UEcHlL/Es4bz0PSrcY/Jcs8ho04WNX22SN61SMqfXR1LLnF/yoygvIBZG5w56Nk1Y71TPUIydgq9JiRS1/Fdo9ckiDbu2suboVGpK3x/khws4+rus8GLp8MLpcbSqxpXFdXqim1+kAXHxKnZUhmWw7IG/6PlF3BTz0FtW26Jiyb9VVbiUkghkMxP3IGCtTHMvx4YLtumgvhrxJcIg5HJ9LbxV556TS8xZSIw058Hx/F6EYr8XjxrBtGstKLDMc1NfvI3sBAxHKzjwdjfnAedQSQExS3tDWpukMSNKQKSe7+wbrweoWxGphnHuhajdcohdmWGocxMTosQacupxtqpQxLkFjSD45OWUYiY8YRuGhSbVl83QGJ8hUY4+e6sZA4Z/QMlGvuAE8+YbkFk++0DRTW7t7kjpWAdFA3II997SMD8p3mSBniXjhg0FjrBE1LNRKIh88Bhxexyq36CL4KwyXgAXmYT8eGWHDCLp0o/JpO0rOFUFTLRwE6afww91jtIyIksH0Vr+tb/1pupSfIdBySQlVAyptf0x0ZVUhS/mXHj/5LSkaWhOma1de/8K3M/MBXIkYTGY+oWIQZ0HPyxahsZnIlrrBZ7mC2p7OyB1rByHTcID/HZKW1w+RqLEe78ljBmxWT2iCKx7ATQpe1MN1RSINf7zatTcZayzAoQec=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(4744005)(2616005)(82310400003)(8936002)(426003)(86362001)(83380400001)(5660300002)(36756003)(356005)(1076003)(82740400003)(8676002)(110136005)(54906003)(81166007)(316002)(336012)(6666004)(2906002)(26005)(186003)(16526019)(70206006)(70586007)(47076005)(478600001)(4743002)(4326008)(36860700001)(15650500001)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:03.0776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ed9f12-86d7-4242-e66a-08d955be6258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1462
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes include updates to the existing FW reporting mechanism, MP2 FW
status checks, adding power management routines and couple of other
minor fixes to the existing driver.

Basavaraj Natikar (5):
  amd_sfh:Fix period data field to enable sensor
  amd_sfh:Add command response to check command status
  amd_sfh:Move hid probe after sensor is enabled
  amd_sfh:Add support for PM suspend and resume
  amd_sfh:Add dyndbg prints for debugging

 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 62 +++++++++++++++------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 69 ++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 23 ++++++++
 3 files changed, 139 insertions(+), 15 deletions(-)

-- 
2.25.1

