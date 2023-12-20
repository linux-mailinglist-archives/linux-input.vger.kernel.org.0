Return-Path: <linux-input+bounces-896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC58198E8
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 08:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D15DB217CA
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 07:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8284168B2;
	Wed, 20 Dec 2023 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L8aI3fg1"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C35168A5
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNEVtenjHdWDtcgovyUYIr2JXQCELJfO28VtcVVyClOLSPadlpGC/DPxP6ixvCMgS2JWNXtTxNiVguqX2JDUeOBJZEDjNd/HmGh5mG3qudgZIQVCBuCDe/sDJz7pCSRm6A7XcJ+ozmqsn7I29nKZuPKnwA9TXSjRUCIxbIaFIsY5Kaw27h1a1MPnnjA56wQ+qdaQvlbCc4x1PQap8S7cuBZcI7MAazsQmyKaYkayPzbtdCbSklxBcPYu01En93hNJ+F4NQh05yTbRzP3KMr+dTZEgnSuzG0DX59dEnQaZNKvEgpw0m58s7OHTIEH2kWC9iD8AXOBHnQc9SlsQ9fkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRF+4ilsi/kVYkD6PWFo+q50soYum2jx87MQ/yEBK7U=;
 b=PLClAL1khq7Ktibc9gCwSxUQQQp0NAqyGUcAKob6rDf8Oy4OIfbrYd7XnihwXFw9OcF/0R/kZN/DgpHpnxlUAh/LDs6vRBVZa1uiotXVn7cp1Sn8RKbmnz75CsIskeu3iD5aj3u1xfRRp/VH/p82JmQDtrzbATCYHFOkFIFqPz4y04iLoEvaPZRWBrW3bqU7z8s7NWpnfIfysS9c7J/WfmL8H8u9G4SHsDGg+go02PhWJQZmbFSjaOLmpES8e+ut+bLKYSUTZx2EgvVsG7Dio193LnaswA3hrWBFvXbMxJHXXMjNHsEAS6tC2Xw2VTa8ox3yTthPgf9OGwcNfXKRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRF+4ilsi/kVYkD6PWFo+q50soYum2jx87MQ/yEBK7U=;
 b=L8aI3fg19dLqGCiJKKjyrum12zUf2BIz9rAenwMfq0ANHn5WhRzYCtqqFqKwsB8xeH6p5rOuqSgqt7Mb5SVbeqZyLmZHxftdBOT2nbkvqcWN3baLJagqlf4H8Q6y+oWAargXoXzV4c2uUJxFb3MG3C9OgQVzp3q6pyeNyPkZNMc=
Received: from DM6PR18CA0034.namprd18.prod.outlook.com (2603:10b6:5:15b::47)
 by BN9PR12MB5113.namprd12.prod.outlook.com (2603:10b6:408:136::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 07:01:12 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::67) by DM6PR18CA0034.outlook.office365.com
 (2603:10b6:5:15b::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 07:01:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 07:01:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 01:01:09 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] Add new SFH interfaces 
Date: Wed, 20 Dec 2023 12:30:39 +0530
Message-ID: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BN9PR12MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d9c9c6-4509-4ef4-017e-08dc0129736a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9vtg0xGj7MePq3RlynkFWRMn8bmYcbYUvhIOSdJ3UKvXsjagzyyusfvWsU/89hzvwfXvXvUhXt9I+pO1Gdf1sTOisHXfyxVvdndAmgauNOAsSq5vkwDRwqmkCihpqWf6E7YsS9U85OjsTv2+N6mLPj3lemXAWdSu+gqCguPyLPonZ1Z56kNz7Ca3LEcIpFrgv38hULhEMgRMryYKPi+BCeIDx88eMzhsF1WTTxMxd42YIggSqc3FLqblRFgqRg2/1NvJUWbpplqOurZX+RG1neD/TfqY3QNdvbKW2p+1SeCOveBPITAwY4ZPV3m37GSqgT/Ij4vjco97d6cAUFKIBHLSVIbyltKFOX+XHvb0+CZ2pznYWI9XyK408YUaXEbVPml3oufv7hh8i41oz2S5/6mc3lUvPMqXAS40k4Igd5wdMknZGsiPqamu/Fa5MoUnAJHDbWh/H8En4xAjbpRv/e/1hltMZzJY1Skkc/udY9mRfRqz7OHcKuPCU8r2+DPkAUwiv6nRInzCcacpeitGh+kOtMUPmT8wHbRMLXsdfDfMIDJoMJ8usdqZU4Jz+0tX+JJ0l66T/oYjgv0zgVQhMUpy5i2DU7OxEtoLlvwzwl5Dnutv9DCaXZWHlWUynqZMPEMv3L43y+1j4ERUIG2qluixvkfUhcobQLdNd94q/0AQNtT7bLSO78sRNnFF7v5SQwwdZ6Gn83zJxdf+orSBi2fociJGTMESQpsyCrb5rLE8BN2qeTKoD2mIucdN03bldYIXhiTOfFqvFggM1MVYEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(36756003)(40460700003)(70586007)(7696005)(70206006)(356005)(81166007)(26005)(6666004)(426003)(336012)(16526019)(4743002)(2616005)(316002)(47076005)(41300700001)(83380400001)(5660300002)(8676002)(4744005)(966005)(478600001)(1076003)(110136005)(8936002)(2906002)(36860700001)(4326008)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 07:01:12.0600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d9c9c6-4509-4ef4-017e-08dc0129736a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5113

This series adds new interfaces to export User presence information and
Ambient light to other drivers within the kernel.

Link: https://lore.kernel.org/all/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/

Basavaraj Natikar (3):
  HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
  HID: amd_sfh: Add a new interface for exporting HPD data
  HID: amd_sfh: Add a new interface for exporting ALS data

 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  6 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 28 +++++----
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 20 +++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 59 +++++++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  2 +
 include/linux/amd-pmf-io.h                    | 50 ++++++++++++++++
 6 files changed, 152 insertions(+), 13 deletions(-)
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1


