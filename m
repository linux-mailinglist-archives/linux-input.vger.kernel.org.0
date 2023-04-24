Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5836ED1F6
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 18:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbjDXQFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 12:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjDXQFN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 12:05:13 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC516A69
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 09:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbC0IvUed3guFNrebjoJhHwKKPoAxDUNN1zgnWGgw8OTNrxwAgo31zqei8ho15x3eKX7GvpvBMsCjR2HwqV0leSwcSW7sx6BWN75mL2BGasA8MumLTwODVXWFOY9B9O+uCTs0PWy6jvdBZgBY5oMLfUeD8JcQKo97fYfz6V6lQ+MTqxooZ/msaebaY+xuJWjSSO+g33b/y++guwtO2o6kZKzbQKvPfYpRAzYCifNTgzFeevzLuzRdtz/pbl2h0LvHMmBfB332Oqx0DDxeAxZARO1/2ErASdp6tt5JMR7TmXtIetA/T1F0Ck3FSP/tHnGr9B8wkGqNJkvCVUz93cF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCiedEGUVZ7KSZuDnlpqnVeF7teJSDiI6/4FilXjHlg=;
 b=mBvVHbgVUXgJOL//lPY4sNm/u0tegnjEiQltzAR3IV0HMUge5lUiNT7roYbNg5uNyF/q1VuUNfeOrH12191f41rFDnjfeg09SjHsulRQ+iIpyUFavEH/gC8NDAeIKXTgrQhU9YRNiyZNcmjmYGJy14iJvwRMvsr34bYTWRWL20vj17IWK29ePNbZoQf2MsZ9mCFW5YXfeP2Ih75JriE8UR+af9zye2ny0oMkATUzfWGPbWh8I2AqoKxQ+UBcv3SyC12Bd3wfqmKezcXWtfIMg7kZuAfJCzwp94yvqrrVfvUZfLdGTRk8J0jXaiXmYLOFUqhGpDTw3EzfA1Vrbo+gCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCiedEGUVZ7KSZuDnlpqnVeF7teJSDiI6/4FilXjHlg=;
 b=Z/jIVdF9emUSlKixrqJ4eUWOQpz5O7/zKiPTEzdFwG72TlekijzisqPXiccx+fE17M1kFA7e250B2Kw6QyJQYK0vSuClR/grO0UV+8RBuHTu+xnywE+B3jjg+NpHaicKxfTKML4b1lI1Ilpkw3hgZn+9vZqbB8Q1B1JnSbiB/TE=
Received: from BN8PR16CA0017.namprd16.prod.outlook.com (2603:10b6:408:4c::30)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 16:05:10 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::c6) by BN8PR16CA0017.outlook.office365.com
 (2603:10b6:408:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 16:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 16:05:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 11:05:08 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH linux-next] HID: amd_sfh: Fix max supported HID devices
Date:   Mon, 24 Apr 2023 21:34:06 +0530
Message-ID: <20230424160406.2579888-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT027:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d890c7-0619-43f9-7e0b-08db44ddadc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnG2NTNiCQ7os2QXfSCku1GOo0uMmrd6AyKzYwtUlaOLmvYhTTOYw1ZQu84VDA9JF30GxFTKJGsApmcHjTvtoCbOnLVzSDzBRWAkIUxICcUZ0YXBdIKguA8Izsw9oWbiQ8fyD6WU3FuvR/qmH+GpUsaomoBH5Lf0+Y9HKWd2UGlQf7mfL2QFx7oGtbj6WUe50IhDahOu25zw5FNH5/LKkVJ1ibNm9M4C6BYhQ9t9Bz5UUR6OPrNdYj9VoafEzB1+yDwvwn0AXaYfFtDiB5ppvuwConUPC6kGbYVLzzVncjaolerCotGvO679xFxaFnnPnH9t8tX6+Ng+SsN2sKz5DU7zDkdOXPiCXLNisOmVzIxEtMtb8HVFdpiL6tPx/lAQ6GWfV63QqyQuv1HprBQbplfuiC1QUmayRFuwC0vFzlw9aQRjmwQ/0Tz8EH46YKgtO6KNJWvaiVMz2R/8C7N/fvsKCFVWwuzlSvJpXStA+xgYBAarycdo9IeQkiFRWV8mIOIYJiU8HC2jXqTiZzjM6Vww2zgwdRL8Edr8vbKQVe02nes+WZOgIsoG9OXP5A/gGGp7wjWzG7FgoHXMhoXFX2iRhVCJQz3DRq+cnTLe+MbjcAiq6ocnQfYC2eu/rfYQB9PPLtDPxC/DXxUDQWSIAHutSwfcEecbigCGrc01kDTdqIJ/pg5OYIjbov9U+Qs/lrZ/JSHeOEVvKYOIW4g1ObffLJ6EK5NVyPrkgx41eXo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(7696005)(966005)(2616005)(16526019)(1076003)(26005)(186003)(40480700001)(70586007)(70206006)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(110136005)(82740400003)(356005)(81166007)(82310400005)(36756003)(86362001)(40460700003)(36860700001)(47076005)(426003)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:05:09.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d890c7-0619-43f9-7e0b-08db44ddadc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

commit 4bd763568dbd ("HID: amd_sfh: Support for additional light sensor")
adds additional sensor devices, but forgets to add the number of HID
devices to match. Thus, the number of HID devices does not match the
actual number of sensors.

In order to prevent corruption and system hangs when more than the
allowed number of HID devices are accessed, the number of HID devices is
increased accordingly.

Fixes: 4bd763568dbd ("HID: amd_sfh: Support for additional light sensor")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217354
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 528036892c9d..97296f587bc7 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -11,7 +11,7 @@
 #ifndef AMDSFH_HID_H
 #define AMDSFH_HID_H
 
-#define MAX_HID_DEVICES		5
+#define MAX_HID_DEVICES		6
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
-- 
2.25.1

