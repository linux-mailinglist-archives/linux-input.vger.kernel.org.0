Return-Path: <linux-input+bounces-12806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEDAD51CE
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 12:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBCCF3AA33C
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01182261362;
	Wed, 11 Jun 2025 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rPk5yyln"
X-Original-To: linux-input@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729326058B
	for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637632; cv=none; b=PbAAE/5m05MTcvQRLIcSUtuKXi/xwL6dyJq6zWIQJLIuxupvttakdFsY0W+uAgnAAImuaSmLI+tRRHbcYVgUnx53h+gHNDTsJQoeODA56pZxj4bdR5BSnPQ5+SulmoyFEhkB8z20zOUQ+iDyyyxw3IU15Wjp9tEGabkwluIDJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637632; c=relaxed/simple;
	bh=YDKBYYu849iIXfL5c4C3GRvkDm2y+bnNYAipGdWLp3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ACqAJb9+lu7KCTIBpBAPxZeTG+LREAKhRjp9Lnb8BIUSfpVfPgaZFCXolZ+1R1PO4RtuAOeK6ZBAs7Ljbg9m2uWOVvU98qPlje0DbII7iO3RkAO7gs0hEzVKAqN0F6aQMnh78UFuIxxJ/q7sbh9E4Jeq5/sU0uN8kjpbbsmZPMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rPk5yyln; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55BAQwRA2385655, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1749637618; bh=SD1op1cqiemY8PV9sTrQl6xAi4oxyOaVlfCmVQctnzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=rPk5yylnAy/V3sTyhe3nsRtodMI6ZG81CmYvzMCo3KwI6qqwJZvrE4HXl0xE+GM9b
	 BKDWrLYo+EVMWMpk41Q7IqKMkfVQaDPatXSjNIr3JrxoIRjgtOzNpl/KD/31qgObNh
	 jJ7rNSDzzYq8su3kyErGmlqq9sI0Z8TLcTP9arDC2bj6cpbpvpC+tMvQ0uipuQDqz7
	 NFF6F89fmwtZJzZx0jX6U9u8LSlyV9wUjnrZbhhVpqDVLdpAUoV9tyfQlZ9yAvXgiD
	 /okJ712VJw+jC89RR24iYHuW5uwCzfoTMVW1P+3NkyPvGcmRsTwuHVUukD4vpMdbVY
	 X4xnKvObh8yEg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55BAQwRA2385655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 18:26:58 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 18:26:59 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 11 Jun 2025 18:26:59 +0800
From: <shumingf@realtek.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <broonie@kernel.org>
CC: <linux-input@vger.kernel.org>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        <bard.liao@intel.com>
Subject: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Date: Wed, 11 Jun 2025 18:26:50 +0800
Message-ID: <20250611102650.563137-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Charles Keepax <ckeepax@opensource.cirrus.com>

SDCA (SoundWire Device Class for Audio) uses HID to convey
input events from peripheral devices. Add a bus define for the
SoundWire bus to prepare support for this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/hid/hid-core.c     | 3 +++
 include/uapi/linux/input.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314..b419e31005b8 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2294,6 +2294,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SDW:
+		bus = "SOUNDWIRE";
+		break;
 	case BUS_VIRTUAL:
 		bus = "VIRTUAL";
 		break;
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 2557eb7b0561..127119c287cf 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -275,6 +275,7 @@ struct input_mask {
 #define BUS_CEC			0x1E
 #define BUS_INTEL_ISHTP		0x1F
 #define BUS_AMD_SFH		0x20
+#define BUS_SDW			0x21
 
 /*
  * MT_TOOL types
-- 
2.34.1


