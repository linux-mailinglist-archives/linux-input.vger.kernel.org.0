Return-Path: <linux-input+bounces-5227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8307942C18
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 12:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259361C22D12
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 10:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88201AAE20;
	Wed, 31 Jul 2024 10:38:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA11AC437;
	Wed, 31 Jul 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422287; cv=none; b=e+MD93oc0CFOT8yP318KIMGvKXv43G57SQRxRVrwikbAz6F0Fl32xwsQ1BD4bTMHeYM7ytftpD9juM397NVc15IhpPGn0v6elxKk9+iNL+VMK3N/eY3peociyOdlcqlshp/wH9qvIwUkHuxDTK+m0GScxbZ62J8sn0NIluNgj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422287; c=relaxed/simple;
	bh=I0yiiKdG8uu0A5nkhiVeRJO16oolJGWz/B3KCOfMjs8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kjRtmFJpGrWsaod+UdAKIgb0/LxT9IoFEPEgLlHZAWUw/dDJsSa07TmoQSiGJE4D7FkQTpIUQutt+SkwoDoIJFF8C+jhBLhfjTrQ+hbKcVd9gtJHCqftAp1tEHfUZagQ5yUOAxrV9MaM25kP8Pjxh7UNS7B2I1mJlUSc0IWWDNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WYpMf5W0pzyN22;
	Wed, 31 Jul 2024 18:33:02 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D593180AE3;
	Wed, 31 Jul 2024 18:38:01 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 31 Jul
 2024 18:38:00 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <basavaraj.natikar@amd.com>, <jikos@kernel.org>, <bentiss@kernel.org>,
	<yuehaibing@huawei.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH resend -next] HID: amd_sfh: Remove unused declarations
Date: Wed, 31 Jul 2024 18:35:45 +0800
Message-ID: <20240731103545.2014741-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500002.china.huawei.com (7.185.36.57)

Commit 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor
Fusion Hub (SFH)") declared but never implemented them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 97296f587bc7..1c91be8daedd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -73,8 +73,6 @@ struct amdtp_hid_data {
 };
 
 /* Interface functions between HID LL driver and AMD SFH client */
-void hid_amdtp_set_feature(struct hid_device *hid, char *buf, u32 len, int report_id);
-void hid_amdtp_get_report(struct hid_device *hid, int report_id, int report_type);
 int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data);
 void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
 int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);
-- 
2.34.1


