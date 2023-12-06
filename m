Return-Path: <linux-input+bounces-567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A8807A41
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 22:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C01311F21972
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 21:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3532E6F62E;
	Wed,  6 Dec 2023 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sTgsF0JQ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F6DD5C;
	Wed,  6 Dec 2023 13:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElNEAslK/k29fP3QId0mqKFEkdtqji1iUaiN86yxzCUwELkzi3vfF3CHQssWl+MqpikSS38/KwbPQOPyBMrlEtTNNPldX10jn/0vOnaGz0vBq2/xO8TVK19x8T5VnsJKhysvL4TYKxXjo7gAwEX5UtreAQnnlliWzraTPjIMpU/1uMV1LrHQTn1OjkKQ3HQ9IkEE3ASQi8kaqeRKLeIo3iYOtJVCpwwGcpWv+N4ongIzlmZntKo7aaxSXUUDeNwotnUV5qmt5h0xuJr5HKKhnGadazTBQdzaadYc3Bn5ESJFZgs8LjKsrPaDIxIBBJgHTvPBOnXB62q4NS8fyTMqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVvv84fCwhp+OjJzJ0AEnSnAsmhYjC0YQRUMDk5O8O8=;
 b=hpKaetGwjzmaiwCno7n58J7a0rXS9Qhu7FX4012O1NdIJYAgn9KQcjxpr+lOuOrarDOuNKBbc7gW5s8VjyxQaUDnzpalhyPouTssIMWBZ4denrcBh/lnAANSbVzy8y/WlRLw4PDPM7KL4T6dNA5gaqTj/GFBUc+4F3SI8bNtIsnSnQ3UDpjFlHYKzMt+d0hNA4CTrNUC0oxW3shyxFkgH4Yu5NCIPa8U5PFCcnhNJijw8TTYC8emigohRVIO7qU5GavrecFpsZRnX5wzWdTGgKCuVuykVi4it3uy9KJbEydCblxwJA6HFyH3TUVap2YNrgLBSDniiqkqQLHjm9nIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVvv84fCwhp+OjJzJ0AEnSnAsmhYjC0YQRUMDk5O8O8=;
 b=sTgsF0JQSG9aHJkXdlCwOER3gGo14mEGsI3c5C8wf/3137RV1FCHqzMTN+V0rwDB7ikr57IloShnlHAy3TUwx4pgawMqeaaVNLxOA99h8t1mAUJlk9cu51AsCMQQ/7CyhwQFMsjFaZej/CGVJ+bcFUZR4+VDodVcT+U7NTBP3us=
Received: from DS7PR03CA0269.namprd03.prod.outlook.com (2603:10b6:5:3b3::34)
 by CY8PR12MB8297.namprd12.prod.outlook.com (2603:10b6:930:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Wed, 6 Dec
 2023 21:21:56 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::45) by DS7PR03CA0269.outlook.office365.com
 (2603:10b6:5:3b3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.26 via Frontend Transport; Wed, 6 Dec 2023 21:21:55 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 15:21:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rrameshbabu@nvidia.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 2/2] Input: i8042: Add a quirk for Framework 16" laptop
Date: Wed, 6 Dec 2023 15:21:40 -0600
Message-ID: <20231206212140.7458-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206212140.7458-1-mario.limonciello@amd.com>
References: <20231206212140.7458-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CY8PR12MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 131f00f8-2613-4dd8-f4f9-08dbf6a15f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yWM25TIHx6QJ+jUXl5grZnReXdnc7/6K9jtGWQ9iENd++op3LlWEj9BvxjgTV0xnmGbqwSiQ8xvLi/ttXnKRHY49SkOeuO4SbTyW9u35xQUdXOvbk3tQuPFqBW9sPeHVa75KPYJv8QAUs+3rmzIomgF8W+4RHYVB3R31nFwiWhIKC1GfCWSKl9T8njsnnr0DrRCz543lZubsNaXeVi8tI2kqcfVxlbolAvUjyytXJp/EVLg0c/E4KO75LvU2dlbwQKF93hcvs4wBlbmBO7t0As/dxhY2ca01BUTN+0LdRE9BiZmiMEg+/qzS3Qye1OEvCwS5CeWukRqRFL5GqRG+Rv7JrWFluif96ZoqRah5Ph9i6q9UlI6RO+I7W67k2jbs+8c3xKXNleTbW85kKkIjqM5Sgj4QkbYqaxbN0PCJtUPm31mUnVaQ2AUZNQPQvKOxnaZJy3z9dpd49Nh1VTdiA7zqv/OwsaoUYAANnZT7nDzQsV9hRoyX6l7zDQfEDl9sulb+gg8q3KWRm1p5ZWGbZ8Ntgfmqn3k1TgIoKSdYCS4DDNP7HNq2Nlv6i42mgxOiy0Tf6kVHiZx3W3s6sl7xNcPyKf6A8xmZd9i0h+GIMaPALSRAr0kzMjGGMn8W6ZWCZ9eJM/NW4aSJ7L5vnhOPjU71PNMsfxB8scZ79pSr6tW1wnyrOK2O7UOsPimPcrw7uzmIFcJhKwF0Pqd04z98x3DMEqZtxa6wNY0BkkFVKMTD5exfxOx8oFlUxztglwdpvRMbHdA7xffRL+9eOFS6wg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(1076003)(26005)(40480700001)(83380400001)(40460700003)(356005)(36860700001)(7696005)(2616005)(81166007)(82740400003)(47076005)(5660300002)(2906002)(336012)(16526019)(426003)(6666004)(36756003)(478600001)(8676002)(44832011)(316002)(70206006)(70586007)(41300700001)(86362001)(6916009)(4326008)(8936002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 21:21:55.6409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 131f00f8-2613-4dd8-f4f9-08dbf6a15f9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8297

The Framework 16" laptop doesn't have a PS/2 keyboard. At bootup the
following messages are emitted:

i8042: PNP: No PS/2 controller found.
i8042: PNP: Probing ports directly.
i8042: Can't read CTR while initializing i8042
i8042: probe of i8042 failed with error -5

There are no PNP devices as those listed in `pnp_kbd_devids` but
i8042_pnp_init() ignores this and still runs and will continue to
try to probe.

As there is no PS/2 keyboard or mouse in this laptop, set a quirk
to avoid this behavior.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 0fd88bbfaee1..6a71416057a3 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1310,6 +1310,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	/* Framework 16" laptop uses an internal USB keyboard */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 16"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOKBD | SERIO_QUIRK_NOAUX)
+	},
 	{ }
 };
 
-- 
2.34.1


