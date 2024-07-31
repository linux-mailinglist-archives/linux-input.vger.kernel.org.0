Return-Path: <linux-input+bounces-5226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888D942BFB
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 12:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A262837D3
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 10:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2071AB51C;
	Wed, 31 Jul 2024 10:34:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691B18E03B;
	Wed, 31 Jul 2024 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422043; cv=none; b=Q2OxtAxipv244IwI0PBVrFKZ0V0oOoCwYeOuXwnVOg/zNhCxd7PQ+yBoM2SRwkg53botAJ0+hmDw7lor22ln5Ahf2PTJthYfsGNJO6gPC9H64AbXCv+cPRK9mcL6gQuldA3ndli1g8DQo3IbuwmuyzcKzea4m6ASVy3YBFR2lUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422043; c=relaxed/simple;
	bh=nWd3xPosnnPIytJ1qSs1EqUnaJCpd6EPdT1IEIHghK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jE6WnSqHeiCcsXRJoE+Poejj0UQjH3LXyDm9V4G5xDgpgv46luv8m9Qs8t4lTMc5OkzXPxZNzE8XEMkYklOMSK8BXjX7LQF2z2nLxgT2rDLis9s/x+GXYUXMroYUx4Jhqwk0rSYYW/MIa7OebOwyy9fwlEURxgI9SNJ8V1dQJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WYpHS6M3Rz1S6wS;
	Wed, 31 Jul 2024 18:29:24 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 3154214037C;
	Wed, 31 Jul 2024 18:33:59 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 31 Jul
 2024 18:33:58 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <srinivas.pandruvada@linux.intel.com>, <jikos@kernel.org>,
	<bentiss@kernel.org>, <yuehaibing@huawei.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH resend -next] HID: intel-ish-hid: Remove unused declarations
Date: Wed, 31 Jul 2024 18:31:22 +0800
Message-ID: <20240731103122.1897331-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)

Commit 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
declared ishtp_remove_all_clients()/ishtp_can_client_connect()
but never implemented them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.h    | 1 -
 drivers/hid/intel-ish-hid/ishtp/client.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.h b/drivers/hid/intel-ish-hid/ishtp/bus.h
index 5bb85c932e4c..53645ac89ee8 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.h
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.h
@@ -46,7 +46,6 @@ struct ishtp_cl_device {
 };
 
 int	ishtp_bus_new_client(struct ishtp_device *dev);
-void	ishtp_remove_all_clients(struct ishtp_device *dev);
 int	ishtp_cl_device_bind(struct ishtp_cl *cl);
 void	ishtp_cl_bus_rx_event(struct ishtp_cl_device *device);
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/client.h b/drivers/hid/intel-ish-hid/ishtp/client.h
index fc62dd1495da..d9d398fadcf7 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.h
+++ b/drivers/hid/intel-ish-hid/ishtp/client.h
@@ -109,7 +109,6 @@ struct ishtp_cl {
 };
 
 /* Client connection managenment internal functions */
-int ishtp_can_client_connect(struct ishtp_device *ishtp_dev, guid_t *uuid);
 int ishtp_fw_cl_by_id(struct ishtp_device *dev, uint8_t client_id);
 void ishtp_cl_send_msg(struct ishtp_device *dev, struct ishtp_cl *cl);
 void recv_ishtp_cl_msg(struct ishtp_device *dev,
-- 
2.34.1


