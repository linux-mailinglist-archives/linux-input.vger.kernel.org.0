Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746A63DDA18
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhHBOGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:06:10 -0400
Received: from mail-dm6nam11on2040.outbound.protection.outlook.com ([40.107.223.40]:12768
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237051AbhHBOEc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcYMu6Kr5E1zqmAaJQp+KhO889PrAj++6kPvV/M3IKi+3Sm4MDcW9QDzaFMGwNu5NEQGWImqsrW0kD43zCFF1UccUuBrZO1GlyejNVUTzkZyiJZe8UaL+PaDgqMXG3uA+yKJHH4p9mxgFkNz9160RMnHyQhibv6bA/pZXExuRV1kXMq1bLyFArlossRbFRJ38BieW9EssZ6tMK1UHydL925hRpgkXcukAkgBnF6iauvosHuJQeYX9lDIqxXo+fAxzpBk70Wc5VfWkPbpLZhxhjx5p1b/uTDaFpoze+/0Tnszy/+Dpxo2Ae9KzCFotdfEsJxkkQ7k7v+VUeSqlHSvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW7z/t/VyzGdnGF3Letdgeol3ZkPolcfK+rSZpH1iAc=;
 b=AQJROAl0N40U3uOgnrgt55Q9FLY10cuFVa34qEXLLDJXfiK4WI0Z0FyzHpLFRSuYq5XnkswU8DfFSnyuyEY2XjqS0lXoSI2rholaq3HDzgnz7q+Kzmf2jCH2TGmJ5nzOabN/1mOjrBYxxYKiOYSmnyp+NzspZdHKerHJ4Akj6kfrzTc+NQtIsZO6k7c0lN/Mb6HrCSe+JNYM/53616SdobZw33bvZ/jtcfgvo9TKmcYcPHCUTUuhY5r8rDJB+qTlxdul836Me3IhW06WhECx/3ETxjtQf6RYYEhPLTqSdbggi/3AxjI76yeYpMBPI4in6vcN0QZ8KcV9+eLGi7WwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW7z/t/VyzGdnGF3Letdgeol3ZkPolcfK+rSZpH1iAc=;
 b=iUO4jvIsOJN/Ce7+N66MzLaLPRmIkIKj8b4PKqXKvds3d+3pTIZZEw1TXV3nPfEPhjQ1RlNqhHgG46DrG6k0S62gvAihfHfPpKjPvnDqJ1X1ScC0H0QWMASb2mrJwK4JY5hcflsrAUkk4Nz8Cm2l7c6potgkbFxCvivyYyeD+mg=
Received: from DM5PR19CA0043.namprd19.prod.outlook.com (2603:10b6:3:9a::29) by
 MN2PR12MB4848.namprd12.prod.outlook.com (2603:10b6:208:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 14:04:20 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::91) by DM5PR19CA0043.outlook.office365.com
 (2603:10b6:3:9a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:19 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:17 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] amd_sfh:Add dyndbg prints for debugging
Date:   Mon, 2 Aug 2021 19:33:41 +0530
Message-ID: <20210802140341.901840-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
References: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d74118-d45f-40bf-be26-08d955be6c6d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4848:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4848D2D357E888203D0044B7E6EF9@MN2PR12MB4848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+sunlSttCD+rzlnB0phnKHKIKE9uWXYWBjgjsjqDBkkHx2xNT30PqYr6XRwFAA9lvLExSoYXBvsyvHERbLZ53szcGVEpVtMHYOavLaC8FlNVE6IUH6TCqQvH1D7qaBmgBVhqi5NihQCGC3+CSUfoR2EB9KFPjHX7NOv5POAZV1DjpfSusQloSMxfVtm+Wsgf3YsjL+UXISNH5WZ4HcAjSW45501Q8epe+ulDUoxPSLKSQT0ZYeox8bpnEkxufbKNlSlXhwIJ7Sm8tB8oRf9x5477iIoNuEz8exQMcvf/TaD3DITJAKYnuM1iiHOIvsDDqk8PBKrmDowMULBsr67kzB/HpD+pJ+Q0skBxmv+PXaLni0BZjhuey1fm4lZZqmJ541mivyUSTlujCX75dP5rqiuI7WHtDVp3SEbIW+Vr/4Wjc9pg9gDuFdd7j4XMjTJkXFrx2k0a2Dkl7xTtz5cLZq5cS2RXYsZp8+TSJ+Pg6Z4NdxdEz1LsEK/rtowdPvFeUm9iaym/Yje/CBjtQiHDfwGSHeGroHsLeIWcJ5wUjiFeB5jTwTuQzQpIXFYeAUW3z8e9BNcD6OGjAiy34aGsMny7NyeWep7teBn3o+JAh2yl+xflG6bOqF7rLHLjPyk3e4sNkP2fiT7kmtNu5aKHc4M9LRxrVgPmhJTBV6/akmmjFJPynqY3d/7bUrD1a1j2KBPBSCxwbqLN8phfiGxAos5FHVVHiRa7/g2BhMWerQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(82740400003)(36860700001)(110136005)(70206006)(54906003)(2906002)(83380400001)(81166007)(356005)(2616005)(336012)(316002)(86362001)(478600001)(6666004)(36756003)(4326008)(70586007)(5660300002)(8676002)(8936002)(1076003)(47076005)(186003)(426003)(82310400003)(7696005)(26005)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:19.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d74118-d45f-40bf-be26-08d955be6c6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4848
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add dynamic debug for debugging sensors states during
initialization, stop, suspend and resume.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 6 ++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 050df796aa2e..840fd075c56f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -218,9 +218,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
 				if (status != SENSOR_ENABLED)
 					cl_data->sensor_sts[i] = SENSOR_DISABLED;
+				dev_dbg(dev, "sid 0x%x status 0x%x\n",
+					cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 				goto cleanup;
 			}
 		}
+		dev_dbg(dev, "sid 0x%x status 0x%x\n",
+			cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
@@ -252,6 +256,8 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
 			if (status != SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+			dev_dbg(&privdata->pdev->dev, "stopping sid 0x%x status 0x%x\n",
+				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 		}
 	}
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index bdef47118c3d..79b138fd4261 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -282,6 +282,8 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 					(mp2, cl_data->sensor_idx[i], SENSOR_ENABLED);
 			if (status == SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_ENABLED;
+			dev_dbg(dev, "resume sid 0x%x status 0x%x\n",
+				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 		}
 	}
 
@@ -303,6 +305,8 @@ static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 					(mp2, cl_data->sensor_idx[i], SENSOR_DISABLED);
 			if (status != SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+			dev_dbg(dev, "suspend sid 0x%x status 0x%x\n",
+				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 		}
 	}
 
-- 
2.25.1

