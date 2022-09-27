Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9B75EBFB9
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 12:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbiI0K2H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 06:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiI0K1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 06:27:55 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF57FCA56
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 03:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGe0lwHAmhy3EZAS5Jjhmb49R3nNo4hmjcqs+4YeqZaW60mCjQz0jI1BUqRbRXxuwGW5idTJMAlzwMxAkc/WMb2F2RZ7x9LnS9Z3DkqoELmifYCSw32acKN+ZijWBwSjNTVTvh58snNiRQjuRyb1VWS0DHW6xdIdbhJ9KQ7P2zUDLfxRl8JqyDsdzXjdei0ZTzYmuD45niqvE81WN33ElpMI+DU7Ei6ZMjd4Jys8dQvopA3QSiKUevfYlBf0U+r6E2gjvoIoryDuXQIvG8IEtBh2Xe5PkOi0epF8GR9JLxE4zZFobKadXeuo2Cek+gO2R57i8OLEsYASm8GFEo/lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P10Xx+oDz6dPccuJAh/o1xYJ6i+1KSnPwDX7r61vUA=;
 b=RxlTKOGP+OngsSFI1JbbOgnxXZqIj+O4aJgP9oHYE7op9yHlMoam1IvVD3pXuKSouF92uM/JXpjHaI92hkxT6R0dN+maR873K2mLkYOa29o44vRlxQvxVvqZukCZVc7gGvSXajmIP5iG4irQSs84IlnOcN9Ucbhp0IftO+zNBCaxfXT/q3GT9dMz13cZlQA4G2QLzcOzS04ylUKE1sgF8dRPj8Rrad4AqSRCvyXH8DjqSfVmHRcUaVudqvauBOEZhc0VgcWHG+2r8AGWzSHtQHSqUU/LoyUzjY5RvpFU85xvvCbJbXoCMrEyEIUpeBczWs6MFgOHoMYJRJg4Ce0JJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P10Xx+oDz6dPccuJAh/o1xYJ6i+1KSnPwDX7r61vUA=;
 b=zaIZUda1Lvz2G0XMUigZRQH10dzLxjcsNkH6J7FNvyy7Bdp2yPBAciURCwoVUzSUwI/xC0UbgMDqALXDBJEciKn2VzS5luS83+63VqcLlirdgDn6J98Z29+SECQV9V+beevGLxkEi72WsItKI5/e7l6BKOBFfnkzwmSuF3bY18Q=
Received: from DS7PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:2a::15) by
 CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Tue, 27 Sep 2022 10:27:46 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::3e) by DS7PR06CA0008.outlook.office365.com
 (2603:10b6:8:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 10:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:27:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 05:27:44 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/2] HID: amd_sfh: Handle condition of "no sensors" for SFH1.1
Date:   Tue, 27 Sep 2022 15:57:26 +0530
Message-ID: <20220927102726.1599178-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
References: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: b228da9e-27d5-4e9b-a802-08daa072eb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hm0dj6e3HWNfOsg+JwrHmMXtJUGVsn9grmkpHRnRLNdmb9w9xARPcVO1WccQfZ4RR8M9MYPGFH3NBOnBAA4EDYbAoif6iUJi0Oo7oaU3lp2dBny1I4bFN70nHOeQSwKQF/vtWonYpHpA4MZaL7baHCwvXujlJ89qsVmjfXBsNoxuoMD6/nih6/aSKwCX5C1pj8Ygr8HF82kkhh1ctavyfVYlAIBCbl9RwagkO8d2bCY0jmf2rqDCci8WrAGlwQrY+etLWlveiEK+WcZPvtENgOlkosTyPVwAEJl5FYxIHSh7NBoUMbO3AWcqP/vPwqe3AVBDI304/0Mg4i/Husa8IIvDRkBkyt9Eu/VnyOs/csUrowU6CJDxUUOU6PJoY05SMXd2NiZbWNiCiLYc+epdVSJRiz9SmrNXYV1LJqk521Dr+kDtU38doR9Y8Cl7M/fQRNGKsB+IsOeRrl6qRHOw5B3Qa7yFPtl3zpiDlcleNWoo4m+Ip9WkhqapyC0DMx1DX4c//bbhhLtDAWYHz1XMOooBbyiFk+m8fd7EgdwPp2eT9DZ8GiHmkVFxNfS4sHO4EnSgL3eBTTFBAIjdZr87aTMwPl6DmrqxKEeS1EtLr3arTfdxqmu1efrvY5yTFWe65IFqAAZXxfz+lQjI88+mXlbMAR9PbzX4oMW9y3oi/ZGoHJfd/+hSHUNmrRhOPdIbMEh2Q8kOUyhGxUhm6d/0lZ2k9Wf6zTJzBTnQpW0D5Xz3vSSobl9GypY0Em3zrS6SS/KPIm9a2uXLtTmEm6NJ0Yr+Zsb0BSIOdyBoErVb5fJ2Cth24vlhsg7WkA038W+4
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(82310400005)(478600001)(186003)(16526019)(40480700001)(82740400003)(336012)(2616005)(36756003)(426003)(1076003)(8676002)(41300700001)(356005)(40460700003)(70206006)(4326008)(81166007)(70586007)(6666004)(2906002)(47076005)(8936002)(26005)(316002)(110136005)(7696005)(5660300002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:27:46.3963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b228da9e-27d5-4e9b-a802-08daa072eb8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Based on num_hid_devices, each sensor device registers to HID. If
"no sensors" then amd_sfh work initialization and scheduling
doesn’t make sense and return ENODEV to stop driver probe.
Hence add a check for num_hid_devices to handle special
case in the situation of "no sensors" for SFH1.1.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index d840efb4a2e2..4da2f9f62aba 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -110,6 +110,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	amd_sfh1_1_set_desc_ops(mp2_ops);
 
 	cl_data->num_hid_devices = amd_sfh_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
+	if (cl_data->num_hid_devices == 0)
+		return -ENODEV;
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
-- 
2.25.1

