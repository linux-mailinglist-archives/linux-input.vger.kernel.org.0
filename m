Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B313DD9FA
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235560AbhHBOF1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:05:27 -0400
Received: from mail-dm6nam11on2068.outbound.protection.outlook.com ([40.107.223.68]:3520
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236722AbhHBOET (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzLnwg7gZK9AxuLVFO45FdFmc12BEMmrfkUqLozlxiJy7ZQf0uFBiTYQoAbj+tgMi/ABnBpv3BiPReNUBMxatX0uyR04AY+D/qdfHUNRlA4C96pkNB6ZZ/55mE38GTN2pP2xr7rbcjyijKg9NyedbDdCd2gC2K9n+Ri/qNWao7+1/PMrcGn4ZLyWDptEJ9g7vc7of/hc1+O4OhO1GSQwJONOQkxys25wakHLkW6+0zlwTK9XMvkXlBn/uvs0MUi96DoewZZIQ7blhrfRaWi2qCG0X81a6bykyiXFRDRpRLwER7nPJgbtH2L0Vw38FJMGP/cXNs82nrAxCb3hGZQc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KHwWLqx+hJJXsEdCA04KYdSCDv4kyRH21BeXiIX19E=;
 b=cCAyvdqRNwxnaahB9C5+kjbVnzrfkFORJMOQK6z5TWUBDqorL4uRojdg9G1zU5z3xuWK+SnFjhXz2F6LsaGT7S3UxuYNr2DLiZNXaTGy9fxn7GnKuJWvx5cRtqNYKHwDjN7Kb3wHHfvCenvSo2iwi3eqxt81DV0I6fLnbZV4DCDLgzMTW2LSi30uR/zm3Z69O2db8VelSjeE7xOd5NUtE6egiN8OAFGP33n0+s3VcclmxAIMEz2QUn9aeMBAIDP2NPB/rnxlcJvgQgjBn6DSf8W6dPwfh/BNRNedIjkC2vDTGsBowk+iCUdzaUKhOzTVUUix8twlxUvmiiVULvxgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KHwWLqx+hJJXsEdCA04KYdSCDv4kyRH21BeXiIX19E=;
 b=GrID8bZ3i0uHFwvJE1ih0Kb+GLJn2/Rd3EHX0tWYXWZiAvPFxJOaCTUs0jqQk/FVw3vsXWEwzEqlCff6c41Cqj9JZEfaDNu1FRCs2ZOPYPQloI5daCZ4+7F1xPMLEHnwwpr71YIo4jgxsUf4kIggew804rK8/JH37OG1ziLJbmU=
Received: from DM6PR02CA0128.namprd02.prod.outlook.com (2603:10b6:5:1b4::30)
 by CY4PR12MB1479.namprd12.prod.outlook.com (2603:10b6:910:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Mon, 2 Aug
 2021 14:04:07 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::28) by DM6PR02CA0128.outlook.office365.com
 (2603:10b6:5:1b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:07 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:04 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] amd_sfh:Fix period data field to enable sensor
Date:   Mon, 2 Aug 2021 19:33:37 +0530
Message-ID: <20210802140341.901840-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 12f98b8b-a082-4cdc-4197-08d955be650d
X-MS-TrafficTypeDiagnostic: CY4PR12MB1479:
X-Microsoft-Antispam-PRVS: <CY4PR12MB147978DDC98C98D42E91D757E6EF9@CY4PR12MB1479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+bkVyjMDWS9oyqsHFq7r5+C68THWMywPd5yEBWS7bqpALNvQOSI/7QekfTK13QfbRfJrjF4lKepNyYzv0+BJFwPyVpwMu9MH38aZJAVjJwMm6R+3N+gI9B9KZ2uk0ZNw7IqAkGd0VVUpCgeYrkoFlWTLIt5dmvvTXEHXBCP8h6Vf6TtqqojmhUJN6r6rpTOgtn36J36vhI6/ffN1sSK+yYbSSwk7FxKlNfrxsSpljFaASzFbou7KYp4rScfcGeGViP5pwAPJfW14LODXYc/8NafTNKhVhTwHlok9V+sGM7afdNo9E8VKbIqJn1Xy6cT7sGmYXG3pW0nbEgY2xIfxDY73HidsDiISyUAywDPUOZ7GQClVPC2vWcnBi4+MhBSlsfRvuTax0+QtAYja8X5jiSoFto1PADAK2hSTh9RgzIMpSMEoEoNQSUjk0i13STro7LBrOoYQTo+e5JhkQ6Zg+3o60PfUK0Dnc6OLsStjtKOgKIGcn/1Me6mI5j6A7nLPi2MvGfl9t2g4ShxXZTULQliINvfDIBmeDXzfUl0p+NGAlmi4j8t3IoiWlzzM4AGh4Fu1CFRrYIL5mSNMdoChCCnaXAT3S8t0RV16TxfZ8jEtmTTKo+dK3u+W2X62CBMpoGPo4UEmqSi6841aobstWbTyofOF3gWreJXLIptBGl2BHUqFio/DWED0M0XuSDC6Ll8r7OchHExGaRl2/xeAwdCUyi7UrTBr1sdsnr9IHc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(70206006)(81166007)(426003)(26005)(356005)(4326008)(5660300002)(2906002)(36756003)(82740400003)(70586007)(7696005)(6666004)(2616005)(86362001)(316002)(16526019)(8936002)(82310400003)(186003)(336012)(36860700001)(4744005)(110136005)(1076003)(83380400001)(478600001)(8676002)(54906003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:07.6111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f98b8b-a082-4cdc-4197-08d955be650d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1479
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Existing amd-sfh driver is programming the MP2 firmware period field in
units of jiffies, but the MP2 firmware expects in milliseconds unit.

Changing it to milliseconds.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index efb849411d25..4710b9aa24a5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -184,7 +184,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -ENOMEM;
 			goto cleanup;
 		}
-		info.period = msecs_to_jiffies(AMD_SFH_IDLE_LOOP);
+		info.period = AMD_SFH_IDLE_LOOP;
 		info.sensor_idx = cl_idx;
 		info.dma_address = cl_data->sensor_dma_addr[i];
 
-- 
2.25.1

