Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56776FBFCB
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbjEIHAC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 03:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbjEIG7m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:42 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::604])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B896187
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhW5pHUht5roX6hMuazUR/r3KmECBcUzNR1K2azEf/dgnWBzn1hNM1uY5wochNh1ZCKKbLjfaEaIJY/MxKHXfFl2Ouko2iswhw/YN+ZEoLVEJmE6VBd3xG42GJjS81fx9mNhwxbyFWBzzZn/nYlbUJjzeBzV8dgU1zw/JG7JT//lEZW5d7zYNg1UbzsRqUa5zTX6y+r1KHsvP/pNT3m54WxMcMQV99qo/T/fIIFzaoLbGdV9eCj2IHN129AlRJSV7Qkfx6HXqepnkfeaHHXcW2cIgxQd0YSbc+YZkAZGEMJylKjaJyIlzj8jMbk8Zb95YjW+Eq3XNAwEUGAWnYLbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxfaxF6tIBXhpeLPJkS6zlj3HKNnd1hkcf2hhIfGHZo=;
 b=M4zZAEn4J8PuJfS7RWCpuDNDYzHbAjxiMDQNd30rUF9X5lpBCiTTPJYhZV6J6ghLsBydta/j9Z6cTnTbSNx4tIOmOZI08eVAPQYJoM2jTCMouc4yDwCO3CBrkOUxHgkBf8+CSftN9mFEE8gIHQ4imeojAvP3kGssUq1xNBeTFXopIbpPykFtzvIfs8ay3W6oBnxIK7Gb1qtkICykH9O+/j8Wg7hDgVt+zkREjTTV4qIzPR50w9JSIeGYsCBHaF4tvSOuBqiOqH8odSMpl7z1JHU55ZhIK38pkJYVMk/J1ZbWO0PBraC9avoj0MsGTgcG1dKNI6aWP+09uUWo9HPhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxfaxF6tIBXhpeLPJkS6zlj3HKNnd1hkcf2hhIfGHZo=;
 b=U8AxAtqc21tIPHdTb28vCvgqS4a1QzPkd3HeyDWzvA8XNzSmXHaR0qQ9OCdSgGBnfke7olS4E6RfC+jkekW4HACkGjl85msl0G6RubTcmKuOHcIGzFQym44Gn5nJ3JAr6dKP2ZQLaTWi2a5MDy+WDzveneT7pKLgJz9Rf2yRsLM=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by DM6PR12MB4944.namprd12.prod.outlook.com (2603:10b6:5:1ba::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 06:59:34 +0000
Received: from CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::7f) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32 via Frontend
 Transport; Tue, 9 May 2023 06:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT116.mail.protection.outlook.com (10.13.174.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 06:59:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:30 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/5] HID: amd_sfh: Remove unnecessary log
Date:   Tue, 9 May 2023 12:28:53 +0530
Message-ID: <20230509065857.4170013-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
References: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT116:EE_|DM6PR12MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 1643886f-4ad7-46ee-13e9-08db505af1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4VyNeb7eQXXMgpeb7ScvD27EUJ9mfZ20KiQ9XR4vv7u7xZubJ00de35+jyenGUfVCAek5RYoBHQYi4dkXFzruC7pATVdxEPkkMckhsv6s74Spo0AcGAQRxYjKZ3L3eiW83md6KHylnVz73NzvREByKr4IqFFS6hpeNumTNmjS0oHcrqcbjg9k4Qx/9kRnRYIt/Nwxhh0FttGy3uDXrwZbcSZoEhK0f2SdmZb6Qd/cXa6w7ahnfkb8ByHiU9ezqzKyxsUkfAuREsy4L+Ox3+GbwKG3pme9Cj5JnDKGWhiStfvaDIPn3CNS/fFqAtp/vXquZKhvKJ0tJjmVzhaQLxIEneGWKG1WwN0Hdv53//yNeO7xABwZVfnJZVOwVNZhGmPnHobFSZ5YJFURMWV4VC6OG8+qAkIiDbEounzHuKpmw0TXm5tHKOCqxlifQpu/UaA6HbzLeXowg+Wm2jq1QhpRZ+iSnO1cbHO2cuXiTwke8ysmi57vhiqk7pKOQyCX18oC3K2Z9+WSF4IIUpvLH6ToB9JIQ5TIgeKrAV0PekBLJYlFqeaD611EpY2CDr2zY8NvgtEFdTTCgzt44zuOQFzFk58KUEueOKXeU5www1hF75LoS+WKL16iL4YggDg62soBWJgZF5ZCsT8dM6hOb8gfW6+eYLjrHEIBBdI2666J0l58ci7VBIoexFZzFwtLHVnb/XJDFtSgano7pHU/mq9LnD2+aL4rMHzrHwH1ANDEE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(4744005)(4326008)(2906002)(8936002)(478600001)(316002)(5660300002)(8676002)(41300700001)(16526019)(110136005)(6666004)(70586007)(70206006)(7696005)(1076003)(26005)(186003)(82740400003)(47076005)(40460700003)(2616005)(36756003)(36860700001)(426003)(336012)(83380400001)(40480700001)(82310400005)(86362001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:33.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1643886f-4ad7-46ee-13e9-08db505af1e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4944
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a duplicate log message that is not necessary. Hence remove
unnecessary log message.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index d9b7b01900b5..7e4a3b6c0ac7 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -306,10 +306,6 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			}
 		} else {
 			cl_data->sensor_sts[i] = SENSOR_DISABLED;
-			dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
-				cl_data->sensor_idx[i],
-				get_sensor_name(cl_data->sensor_idx[i]),
-				cl_data->sensor_sts[i]);
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
-- 
2.25.1

