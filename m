Return-Path: <linux-input+bounces-3895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF18D1A76
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 13:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6271C228ED
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 11:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E4116C87E;
	Tue, 28 May 2024 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmxW9OSh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF264C97;
	Tue, 28 May 2024 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897501; cv=none; b=TMzuBWVG6PrkCNgzBslJNrCV8+ztARP//uUIcUQWhdAQrlzzWguZXK1qVEYZidjpuXuw8kwJdQlWLjy7Efvzpx6O6hFc2moDrL5c9LUDsmDIZpL8GvYqC0MMYi055jF8EQ0OnH8OVdy1ptZnJm4/jV/X9VQdg7iownbsZI8tT18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897501; c=relaxed/simple;
	bh=c1T9GJSdpVsPyNR5q+5dpGu0SwmxQdsjPWZ87hLF/3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XZMn2DD9Mt/chz3acec8E0IJGcShuaaI6F+d74gbnJfvxmVFZXrofnHNCX2s6GDzBAPgSSsAcrDLJkpIpqt+93P6PQ3rZkv1GjHbiNepHjuAPFaVetvNMtzAli7L88tf4Sp+Jw1iITgnwH7E59mAbnxvzIrSmV4UpF/SUbVJ/Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmxW9OSh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396C5C3277B;
	Tue, 28 May 2024 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716897500;
	bh=c1T9GJSdpVsPyNR5q+5dpGu0SwmxQdsjPWZ87hLF/3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmxW9OShLVwMPCTDL0C/+dYYEV7Z9UEPdJn4qMDbsZandgMnLSWszEB0Yq1URnZi6
	 ayOiGrcCyra6bWLrztk7j+M6Hnji6zbf9SE9gEDDFgkFNKeqlqrZhf1Cet3laja6ev
	 yezkYk2TLGxqBG1hnFPJgGl79Q/v5M7KLJOCa4vCZHOp/xrTeNYuAVt6PxRCt8TFHB
	 bSGH1iThQ2w8ZDsbpjN2vou/6IMz5E3zomgA0DF+ljxwgUcONPfhLr5gz1uB2mvuzG
	 8+9uDi44ykja6Ox6WHx8vbz74OaCK7V0t4UOdCwMD5oyfVimGwUVo03Mt8HWpEXxYL
	 M9TYMsIhpO1qg==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Date: Tue, 28 May 2024 13:57:54 +0200
Message-Id: <20240528115802.3122955-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528115802.3122955-1-arnd@kernel.org>
References: <20240528115802.3122955-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added file causes a ton of sparse warnings about the
incorrect use of __le32 and similar types:

drivers/hid/intel-ish-hid/ishtp/loader.c:179:17: warning: cast from restricted __le32
drivers/hid/intel-ish-hid/ishtp/loader.c:182:50: warning: incorrect type in assignment (different base types)
drivers/hid/intel-ish-hid/ishtp/loader.c:182:50:    expected restricted __le32 [usertype] length
drivers/hid/intel-ish-hid/ishtp/loader.c:182:50:    got restricted __le16 [usertype]
drivers/hid/intel-ish-hid/ishtp/loader.c:183:50: warning: incorrect type in assignment (different base types)
drivers/hid/intel-ish-hid/ishtp/loader.c:183:50:    expected restricted __le32 [usertype] fw_off
drivers/hid/intel-ish-hid/ishtp/loader.c:183:50:    got restricted __le16 [usertype]

Add the necessary conversions and use temporary variables where appropriate
to avoid converting back.

Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from host feature")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I noticed this one while looking at the bug that was fixed in
236049723826 ("HID: intel-ish-hid: Fix build error for COMPILE_TEST")
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 69 +++++++++++++-----------
 drivers/hid/intel-ish-hid/ishtp/loader.h | 33 +++++++-----
 2 files changed, 58 insertions(+), 44 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index 062d1b25eaa7..1d4cb99d2130 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -83,8 +83,8 @@ static int loader_write_message(struct ishtp_device *dev, void *buf, int len)
 static int loader_xfer_cmd(struct ishtp_device *dev, void *req, int req_len,
 			   void *resp, int resp_len)
 {
-	struct loader_msg_header *req_hdr = req;
-	struct loader_msg_header *resp_hdr = resp;
+	union loader_msg_header req_hdr;
+	union loader_msg_header resp_hdr;
 	struct device *devc = dev->devc;
 	int rv;
 
@@ -92,34 +92,37 @@ static int loader_xfer_cmd(struct ishtp_device *dev, void *req, int req_len,
 	dev->fw_loader_rx_size = resp_len;
 
 	rv = loader_write_message(dev, req, req_len);
+	req_hdr.val32 = le32_to_cpup(req);
+
 	if (rv < 0) {
-		dev_err(devc, "write cmd %u failed:%d\n", req_hdr->command, rv);
+		dev_err(devc, "write cmd %u failed:%d\n", req_hdr.command, rv);
 		return rv;
 	}
 
 	/* Wait the ACK */
 	wait_event_interruptible_timeout(dev->wait_loader_recvd_msg, dev->fw_loader_received,
 					 ISHTP_LOADER_TIMEOUT);
+	resp_hdr.val32 = le32_to_cpup(resp);
 	dev->fw_loader_rx_size = 0;
 	dev->fw_loader_rx_buf = NULL;
 	if (!dev->fw_loader_received) {
-		dev_err(devc, "wait response of cmd %u timeout\n", req_hdr->command);
+		dev_err(devc, "wait response of cmd %u timeout\n", req_hdr.command);
 		return -ETIMEDOUT;
 	}
 
-	if (!resp_hdr->is_response) {
-		dev_err(devc, "not a response for %u\n", req_hdr->command);
+	if (!resp_hdr.is_response) {
+		dev_err(devc, "not a response for %u\n", req_hdr.command);
 		return -EBADMSG;
 	}
 
-	if (req_hdr->command != resp_hdr->command) {
-		dev_err(devc, "unexpected cmd response %u:%u\n", req_hdr->command,
-			resp_hdr->command);
+	if (req_hdr.command != resp_hdr.command) {
+		dev_err(devc, "unexpected cmd response %u:%u\n", req_hdr.command,
+			resp_hdr.command);
 		return -EBADMSG;
 	}
 
-	if (resp_hdr->status) {
-		dev_err(devc, "cmd %u failed %u\n", req_hdr->command, resp_hdr->status);
+	if (resp_hdr.status) {
+		dev_err(devc, "cmd %u failed %u\n", req_hdr.command, resp_hdr.status);
 		return -EIO;
 	}
 
@@ -162,25 +165,30 @@ static void release_dma_bufs(struct ishtp_device *dev,
 static int prepare_dma_bufs(struct ishtp_device *dev,
 			    const struct firmware *ish_fw,
 			    struct loader_xfer_dma_fragment *fragment,
-			    void **dma_bufs, u32 fragment_size)
+			    void **dma_bufs, u32 fragment_size, u32 fragment_count)
 {
 	dma_addr_t dma_addr;
 	u32 offset = 0;
+	u32 length;
 	int i;
 
 	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
 		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, &dma_addr, GFP_KERNEL);
+		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size,
+						 &dma, GFP_KERNEL);
 		if (!dma_bufs[i])
 			return -ENOMEM;
 
 		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
 
-		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);
+		memcpy(dma_bufs[i], ish_fw->data + offset, le32_to_cpu(fragment->fragment_tbl[i].length));
 		dma_wmb();
-		fragment->fragment_tbl[i].length = clamp(ish_fw->size - offset, 0, fragment_size);
-		fragment->fragment_tbl[i].fw_off = offset;
+		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma);
+		length = clamp(ish_fw->size - offset, 0, fragment_size);
+		fragment->fragment_tbl[i].length = cpu_to_le32(length);
+		fragment->fragment_tbl[i].fw_off = cpu_to_le32(offset);
 
-		offset += fragment->fragment_tbl[i].length;
+		offset += length;
 	}
 
 	return 0;
@@ -208,17 +216,17 @@ void ishtp_loader_work(struct work_struct *work)
 {
 	DEFINE_RAW_FLEX(struct loader_xfer_dma_fragment, fragment, fragment_tbl, FRAGMENT_MAX_NUM);
 	struct ishtp_device *dev = container_of(work, struct ishtp_device, work_fw_loader);
-	struct loader_xfer_query query = {
-		.header.command = LOADER_CMD_XFER_QUERY,
-	};
-	struct loader_start start = {
-		.header.command = LOADER_CMD_START,
-	};
+	union loader_msg_header query_hdr = { .command = LOADER_CMD_XFER_QUERY, };
+	union loader_msg_header start_hdr = { .command = LOADER_CMD_START, };
+	union loader_msg_header fragment_hdr = { .command = LOADER_CMD_XFER_FRAGMENT, };
+	struct loader_xfer_query query = { .header = cpu_to_le32(query_hdr.val32), };
+	struct loader_start start = { .header = cpu_to_le32(start_hdr.val32), };
 	union loader_recv_message recv_msg;
 	char *filename = dev->driver_data->fw_filename;
 	const struct firmware *ish_fw;
 	void *dma_bufs[FRAGMENT_MAX_NUM] = {};
 	u32 fragment_size;
+	u32 fragment_count;
 	int retry = ISHTP_LOADER_RETRY_TIMES;
 	int rv;
 
@@ -228,23 +236,24 @@ void ishtp_loader_work(struct work_struct *work)
 		return;
 	}
 
-	fragment->fragment.header.command = LOADER_CMD_XFER_FRAGMENT;
-	fragment->fragment.xfer_mode = LOADER_XFER_MODE_DMA;
-	fragment->fragment.is_last = 1;
-	fragment->fragment.size = ish_fw->size;
+	fragment->fragment.header = cpu_to_le32(fragment_hdr.val32);;
+	fragment->fragment.xfer_mode = cpu_to_le32(LOADER_XFER_MODE_DMA);
+	fragment->fragment.is_last = cpu_to_le32(1);
+	fragment->fragment.size = cpu_to_le32(ish_fw->size);
 	/* Calculate the size of a single DMA fragment */
 	fragment_size = PFN_ALIGN(DIV_ROUND_UP(ish_fw->size, FRAGMENT_MAX_NUM));
 	/* Calculate the count of DMA fragments */
-	fragment->fragment_cnt = DIV_ROUND_UP(ish_fw->size, fragment_size);
+	fragment_count = DIV_ROUND_UP(ish_fw->size, fragment_size);
+	fragment->fragment_cnt = cpu_to_le32(fragment_count);
 
-	rv = prepare_dma_bufs(dev, ish_fw, fragment, dma_bufs, fragment_size);
+	rv = prepare_dma_bufs(dev, ish_fw, fragment, dma_bufs, fragment_size, fragment_count);
 	if (rv) {
 		dev_err(dev->devc, "prepare DMA buffer failed.\n");
 		goto out;
 	}
 
 	do {
-		query.image_size = ish_fw->size;
+		query.image_size = cpu_to_le32(ish_fw->size);
 		rv = loader_xfer_cmd(dev, &query, sizeof(query), recv_msg.raw_data,
 				     sizeof(struct loader_xfer_query_ack));
 		if (rv)
@@ -257,7 +266,7 @@ void ishtp_loader_work(struct work_struct *work)
 			recv_msg.query_ack.version_build);
 
 		rv = loader_xfer_cmd(dev, fragment,
-				     struct_size(fragment, fragment_tbl, fragment->fragment_cnt),
+				     struct_size(fragment, fragment_tbl, fragment_count),
 				     recv_msg.raw_data, sizeof(struct loader_xfer_fragment_ack));
 		if (rv)
 			continue; /* try again if failed */
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.h b/drivers/hid/intel-ish-hid/ishtp/loader.h
index 7aa45ebc3f7b..308b96085a4d 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.h
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.h
@@ -30,19 +30,23 @@ struct work_struct;
 #define LOADER_XFER_MODE_DMA BIT(0)
 
 /**
- * struct loader_msg_header - ISHTP firmware loader message header
+ * union loader_msg_header - ISHTP firmware loader message header
  * @command: Command type
  * @is_response: Indicates if the message is a response
  * @has_next: Indicates if there is a next message
  * @reserved: Reserved for future use
  * @status: Status of the message
- */
-struct loader_msg_header {
-	__le32 command:7;
-	__le32 is_response:1;
-	__le32 has_next:1;
-	__le32 reserved:15;
-	__le32 status:8;
+ * @val32: entire header as a 32-bit value
+ */
+union loader_msg_header {
+	struct {
+		__u32 command:7;
+		__u32 is_response:1;
+		__u32 has_next:1;
+		__u32 reserved:15;
+		__u32 status:8;
+	};
+	__u32 val32;
 };
 
 /**
@@ -51,7 +55,7 @@ struct loader_msg_header {
  * @image_size: Size of the image
  */
 struct loader_xfer_query {
-	struct loader_msg_header header;
+	__le32 header;
 	__le32 image_size;
 };
 
@@ -103,7 +107,7 @@ struct loader_capability {
  * @capability: Loader capability
  */
 struct loader_xfer_query_ack {
-	struct loader_msg_header header;
+	__le32 header;
 	__le16 version_major;
 	__le16 version_minor;
 	__le16 version_hotfix;
@@ -122,7 +126,7 @@ struct loader_xfer_query_ack {
  * @is_last: Is last
  */
 struct loader_xfer_fragment {
-	struct loader_msg_header header;
+	__le32 header;
 	__le32 xfer_mode;
 	__le32 offset;
 	__le32 size;
@@ -134,7 +138,7 @@ struct loader_xfer_fragment {
  * @header: Header of the message
  */
 struct loader_xfer_fragment_ack {
-	struct loader_msg_header header;
+	__le32 header;
 };
 
 /**
@@ -170,7 +174,7 @@ struct loader_xfer_dma_fragment {
  * @header: Header of the message
  */
 struct loader_start {
-	struct loader_msg_header header;
+	__le32 header;
 };
 
 /**
@@ -178,10 +182,11 @@ struct loader_start {
  * @header: Header of the message
  */
 struct loader_start_ack {
-	struct loader_msg_header header;
+	__le32 header;
 };
 
 union loader_recv_message {
+	__le32 header;
 	struct loader_xfer_query_ack query_ack;
 	struct loader_xfer_fragment_ack fragment_ack;
 	struct loader_start_ack start_ack;
-- 
2.39.2


