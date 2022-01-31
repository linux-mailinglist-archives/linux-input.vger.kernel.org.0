Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799504A4CFB
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 18:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379130AbiAaRS4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 12:18:56 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:29280
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241643AbiAaRSy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 12:18:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS4v3qFhBS7xLnO1fUyrbvwm3rl/i9YbBIFKWnJcQwKG6N19KIj+KFVviguIzQ9oyA8TkthZuSxFpawtGvoCY26iZypAze2qa5aXMiDhy2Gez17QxAk92r+0ucg7CEPNeAfw+nT887WMmXgj5seJW+2fLRVh1zXVesE6dwGN/Lh/lFVvyusFRxDtW4YFXNCP2yEYaK+aysKVT615vqdTUkU9KIgyehlKIhqjuwxaAc0I4GPyDFPJp4afqHmNmygmp0XpxQzGVYJDz5n+uf4+Ljt7nsCFJz+mfqibuxp3Tbe9/iLVsXrLx4CEPTcpgN7DlJnmYeqWKJYaGBzZorS9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1SqSq5k6hJMju0DFgEUcfAOXsMYmnKQLCyMaSwXOzo=;
 b=kzvsY2sciteXavapYv+2zt9+3zrPTPeEnuJOyDPzzuJ1Pv1/CTYHEa5WO24ddxgNZr20MA8m1k1negIxwaQRK8QHnHA0l29LettRJWrRoE2FvzxXeEmJzm8yNxAeUXnHeghlB/OKGX31WhdYeamYxJnUI6AEfVnImZU1JabOc5is7YoG0r2I7+TQe8/vkadV03SXnhEC1dQApJROmnQJuET/rWRK7onaEt1Eq3jl2OiopEupfTRkI4XfmsYoJZbAQhZt+voeDyil0DtTXGyUkHI44wNM3hwVexARcq0ETRyI2QOaJJsttdLQ0rwT3o0Jz0Yo09ye83szFxPc1aUqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1SqSq5k6hJMju0DFgEUcfAOXsMYmnKQLCyMaSwXOzo=;
 b=Ayrr4tktGf/won8HKMYOtgBnYp6hVzPNngk0TI7Wqajc4uJyrRLa38bLXTqvtPAKsopONv8ZgYkcviFIsNKATbpRdKRyUZqpPEk/cr/IYY0Tf2DwcpIsdsd29nVvLy/5cVs4GoBGsjUIbHEZ55oEavT3P1oagDuY8t0ibEamvT8=
Received: from BN6PR22CA0051.namprd22.prod.outlook.com (2603:10b6:404:ca::13)
 by MN2PR12MB4640.namprd12.prod.outlook.com (2603:10b6:208:38::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 17:18:51 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::b9) by BN6PR22CA0051.outlook.office365.com
 (2603:10b6:404:ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Mon, 31 Jan 2022 17:18:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 17:18:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 11:18:49 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Fixes to amd_sfh driver 
Date:   Mon, 31 Jan 2022 22:48:31 +0530
Message-ID: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5235933c-873e-4635-0558-08d9e4ddc06d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4640:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB46404919850231A9C0BF9FBEE6259@MN2PR12MB4640.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/wGoB2WRxdL9WvVMmH5Tb8fUaiCEgW9cTi4281at9oSjxkwbw+E8yINBlzyrVdKGtkp8jzH2a+1wOZaLRcVmPfp+M25OmZX3NWeRpUFayrx6uk8j+OpWNuSoq3kopTbIAxKJO+u1idN5ekNw9rSzzcxyrxLOQr5ecqTt8c8mw+WlgxXXvtbEcVGQl9l+V5E2N+P/S4lgF4hObTfPpgoRUMBYoZlDNC2uwMUDFqzf2Ifq68Gj2pXFWRA7lQ5tQOiKKplRn7QMdLz31rBIn3KLfAomdTuedwKZgcJPpZ8FBXLFX3wtPUq7jAue7xCqn8Jyd2/HM87XKzbEAfO3Z7sP2vJNZBd4wzJEJPzusbILHH7r0U2bCtZ0RGR4o1yiQBulRPcuaaYDBcKsvRGPHexktytuh8+WG/PmjU8azkk3VzXPYX2XMs1QpnukqH3ZQ3s8ZLqichTxZUU5NHoUEEklbGjWVDqVmS88ZkkYnjn1qtRfZKs57NE/1F76cX8cyNJCo+z8mMvl81eocPEfhmwzP2uKakWLRIs5qg7JFzJnVzOZocEkwGtm7/39Ysx9hXIp/NsNDT4pykFRR1LwJvBJvorNXwr4PzfXjNxdbsikin3fPQJ21CjsCn/7QtBYmMtOIkWjxQgpXJBt8iuD717L/0ArNWNR8VX/xFAji6NanY0CK33j9kd+MfiJkBqlWK3ciCob6jDNJlt1ZWv3vlRJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6636002)(8936002)(8676002)(110136005)(5660300002)(36860700001)(82310400004)(356005)(47076005)(6666004)(81166007)(4326008)(40460700003)(83380400001)(2906002)(4743002)(336012)(426003)(86362001)(7696005)(16526019)(186003)(1076003)(26005)(36756003)(508600001)(316002)(2616005)(70206006)(70586007)(4744005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:18:51.5505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5235933c-873e-4635-0558-08d9e4ddc06d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4640
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes include increasing sensor command timeout and
adding illuminance mask value.

Basavaraj Natikar (2):
  amd_sfh: Increase sensor command timeout
  amd_sfh: Add illuminance mask to limit ALS max value

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c                    | 4 ++--
 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

