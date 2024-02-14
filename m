Return-Path: <linux-input+bounces-1905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B666854BB9
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF155282708
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0535644D;
	Wed, 14 Feb 2024 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r6e5JHMj"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC85A0FB
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921738; cv=fail; b=QfCMt4yxWTKIBOswwmr9MIBkRSIopbQArLBFg95cGUymMiJwVg6TlDPRndKpcZ+lK7N6pomVqQaVpDDzq6DeZ4ys00GBgpnH6c+YUkm7IZgzIpz7kDqubR9razOZDNduwrdwoZka3KPpK1iLH1bv4uQl5UGDQfFy+SQXzIUtvTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921738; c=relaxed/simple;
	bh=6c9/j+dVSJS7WrUB0jP52vOtVLrxe3l60wN8WNYFNWo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOwZuWC4mCPd1L7CfT6KU9iW8s2u79QaUokQxsgw7e1QgyxLd030duRkoDJlcAgELcKDZWDjK6/6JJnYFmEch5D66aGgoZ7jg9rYvmN0u+V1+zkcuAfylImz1+HYhyXTtBDwBA9FnTc/0GB/bn+H0kjlhsKzapthyNlKMLwuEJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r6e5JHMj; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnwWccm0/3zFb0+LjfMKbtHgF8To35COa2RoTT8DZCsqTGgMaZ1kuQZ12M6oQWEstQHYQ+KI2ToQGSMDx4KKVTTR18fea9QLMylMg/qh4cG/FTP+SumSnvk7VS2TTy34brW0FmXaUexa90m5Pj78YtMQ+vO7AyhHu9qD54btKsCYjzx2llt2n8zraHcjwRCKA/T7PzLIjJWlw326vRVZ+KaucR5IADFFoBYbD5aqYaMuhOjZhhR0/wLyWqEnzwyXNxQxloQyPNMPRSYPQuhX6BMUp7UxJehCZ9yfgVJOYEnV8bSjfSrHo8e6aViQotiVBRSaJaoh7OiAk6TZpiXtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMLvjp2WrhCSYcOk4M1xKgO4/dPL49xMXmCmpbe6luo=;
 b=Zw7H9Gk3tIZc7YverqoejT5HSdaq3DoOPDHySJy2tRTr7mf1kj6N8Av5QWJQNk9wyYd+OoEXC391QaiROprRJv5VJ/8ilheuXU2UiQ/TjsLfircZRNhafU/kP1bW//Nefy95pjY1JkqaQv8KEqB8ZyiUiA5dBtQZnUM2d9R9dGNqmP8PfVObj4bQZOavegHjFxzF4U/FlsjXQxJvNDfZaE7nZOjkFApL9p+7IGuUk895AZ0wgrUMQ8p0MGbUJkAVXJckv2/BQQSym/0nlfaFvbp61d84qS0GplT4xTHu4w0j3958baj3aJjE0z1gs1Thx/vp8+nM1sQZJeSVxiyU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMLvjp2WrhCSYcOk4M1xKgO4/dPL49xMXmCmpbe6luo=;
 b=r6e5JHMjUVV1r67JQLoOTNZyb48BajE5ttp9u9Nj2rjus+dXDGk1ONvJwvFkXvTk4o7kQo+eZVo80HMazSTle9ZRv+XjLlJ/adM0kMGZsqr6ptCR21GuOHh7RBIugIH+8RNCTt30VCDeUSUJ+lRNi7p8vW3IRUYcknUYWgYrwwM=
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 14:42:11 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::a3) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:42:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:42:05 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/5] HID: amd_sfh: Improve boot time when SFH is available
Date: Wed, 14 Feb 2024 20:11:43 +0530
Message-ID: <20240214144144.682750-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
References: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 7671bc7b-8226-46cb-223f-08dc2d6b20ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HZnNGx54gyHcoBl+3h12k9/xR9mAaO+5duU5X9Wgfn65sOxtKTKklLhHJ6c9uVcZfEBCbxI31+YG75NXTYo+vxgYTqdN7Yff2PrAeX57UayIVWwy5U4r3DI1sRLAz6w5jnBxtrmfTv3bYpY3vo1iWgTcuqvsGfmbS9EZU6PwB4244D/5UELRV9vnXnGiSFooFMf0r6SDNbEz45KyLJE71L4wKWu3X+/lpMDU1BfZb0mK8seNHYT9we167+83Jsk7cDq9QIA4c5WoFVknAj82/gM5un20SwKFRrim3SBO3Ofp4eLkO3D3e3CLFETySg/vxwvp7qFGZpquH7pFgb0P7Hhyl64xMKYQxGOwfRabsTCKiqvcdERYZBnLXekYWzzv0cCclj4veWsNpcvA7ydKgdg65n3sICq6jPWzX/5jpifRrm8BPZm9tQFUAbC1qgDpsEPepVe+X0IsPKzv/fyxqM5Pudn49B5cAXvfOcy8oEGqZPEs6uyN9IJz6+0bktdqtkw7zGfmpvhm5+uEs0B/kkd7QjaSYstXjUdL43zHsC7rP3zsZUamsPpGc9RGg6F5WaedZBYewOX390cL2nCOl6EYdhCXIrhfXAUN6IxmuWw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(36756003)(86362001)(356005)(70206006)(70586007)(5660300002)(2906002)(4326008)(8676002)(8936002)(82740400003)(83380400001)(81166007)(110136005)(7696005)(478600001)(54906003)(6666004)(316002)(26005)(1076003)(41300700001)(16526019)(2616005)(336012)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:42:11.2025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7671bc7b-8226-46cb-223f-08dc2d6b20ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

AMD SFH load takes longer time in initialization. Hence split and defer
initialization code to improve SFH module load time and boot time of the
system when SFH is available.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h |  2 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 75 ++++++++++++++++++++----
 2 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index a1950bc6e6ce..ef5551c1eec5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -53,6 +53,8 @@ struct amd_mp2_dev {
 	/* mp2 active control status */
 	u32 mp2_acs;
 	struct sfh_dev_status dev_en;
+	struct work_struct work;
+	u8 init_done;
 };
 
 struct amd_mp2_ops {
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 8c1809c7d1f7..495ec1179ee5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmi.h>
 #include <linux/interrupt.h>
@@ -329,6 +330,48 @@ static const struct dmi_system_id dmi_nodevs[] = {
 	{ }
 };
 
+static void sfh1_1_init_work(struct work_struct *work)
+{
+	struct amd_mp2_dev *mp2 = container_of(work, struct amd_mp2_dev, work);
+	struct pci_dev *pdev = mp2->pdev;
+	int rc;
+
+	rc = mp2->sfh1_1_ops->init(mp2);
+	if (rc) {
+		dev_err(&pdev->dev, "sfh1_1_init failed err %d\n", rc);
+		return;
+	}
+
+	amd_sfh_clear_intr(mp2);
+	mp2->init_done = 1;
+}
+
+static void sfh_init_work(struct work_struct *work)
+{
+	struct amd_mp2_dev *mp2 = container_of(work, struct amd_mp2_dev, work);
+	struct pci_dev *pdev = mp2->pdev;
+	int rc;
+
+	rc = amd_sfh_hid_client_init(mp2);
+	if (rc) {
+		amd_sfh_clear_intr(mp2);
+		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed err %d\n", rc);
+		return;
+	}
+
+	amd_sfh_clear_intr(mp2);
+	mp2->init_done = 1;
+}
+
+static void amd_sfh_remove(struct pci_dev *pdev)
+{
+	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
+
+	flush_work(&mp2->work);
+	if (mp2->init_done)
+		mp2->mp2_ops->remove(mp2);
+}
+
 static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct amd_mp2_dev *privdata;
@@ -367,10 +410,12 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
 	if (privdata->sfh1_1_ops) {
-		rc = privdata->sfh1_1_ops->init(privdata);
+		rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh1_1_init_work);
 		if (rc)
 			return rc;
-		goto init_done;
+
+		schedule_work(&privdata->work);
+		return 0;
 	}
 
 	mp2_select_ops(privdata);
@@ -381,33 +426,34 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		return rc;
 	}
 
-	rc = amd_sfh_hid_client_init(privdata);
+	rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh_init_work);
 	if (rc) {
 		amd_sfh_clear_intr(privdata);
-		if (rc != -EOPNOTSUPP)
-			dev_err(&pdev->dev, "amd_sfh_hid_client_init failed\n");
 		return rc;
 	}
 
-init_done:
-	amd_sfh_clear_intr(privdata);
-
-	return devm_add_action_or_reset(&pdev->dev, privdata->mp2_ops->remove, privdata);
+	schedule_work(&privdata->work);
+	return 0;
 }
 
 static void amd_sfh_shutdown(struct pci_dev *pdev)
 {
 	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
 
-	if (mp2 && mp2->mp2_ops)
-		mp2->mp2_ops->stop_all(mp2);
+	if (mp2) {
+		flush_work(&mp2->work);
+		if (mp2->init_done)
+			mp2->mp2_ops->stop_all(mp2);
+	}
 }
 
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 {
 	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
 
-	mp2->mp2_ops->resume(mp2);
+	flush_work(&mp2->work);
+	if (mp2->init_done)
+		mp2->mp2_ops->resume(mp2);
 
 	return 0;
 }
@@ -416,7 +462,9 @@ static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 {
 	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
 
-	mp2->mp2_ops->suspend(mp2);
+	flush_work(&mp2->work);
+	if (mp2->init_done)
+		mp2->mp2_ops->suspend(mp2);
 
 	return 0;
 }
@@ -438,6 +486,7 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.probe		= amd_mp2_pci_probe,
 	.driver.pm	= &amd_mp2_pm_ops,
 	.shutdown	= amd_sfh_shutdown,
+	.remove		= amd_sfh_remove,
 };
 module_pci_driver(amd_mp2_pci_driver);
 
-- 
2.25.1


