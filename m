Return-Path: <linux-input+bounces-3988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA18D66CF
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 18:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F15528CB90
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 16:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF1158D90;
	Fri, 31 May 2024 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCGLo0ze"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B4645016;
	Fri, 31 May 2024 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172927; cv=none; b=mZJjj03NpACrDwpjT8NVXHC/SXMvpszR1WwHBKOtZnJi64mNqqNRzqGa4VeVF4dLQx8KFo3SJXTdQzxedgn9CIHy8Jfzngp/89mYvZwkTYD/FT/qh0Ahz6AIm7HCll+ynAv3p99OixDC+MT+hxQkCo7rRxCU9NdsFjz2C8eTPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172927; c=relaxed/simple;
	bh=12332fJP6tlJByBDZMAch3+QeR97jfaHw70RX1lYe7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RxbrhILXuMEtewNjJKU6fBfw+c/TCrE3usEH9Z+/PFYaxOONjR25Ctrgmvzn3OxhiZ/0AVrbV0FvPq1cBSY73oFFC+H0x8XZs6MPzkE8k6lwAgN1OV1sykRutZV3MsoHjsvhTATWMBs9AR5EpsRyYSduKClYv8lxwZ91pGRlFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCGLo0ze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52128C116B1;
	Fri, 31 May 2024 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717172926;
	bh=12332fJP6tlJByBDZMAch3+QeR97jfaHw70RX1lYe7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=pCGLo0zeLFJa6rFXbBIADFMpljFW93IF45aWsSdIZWLxyUl778ct4mf09kZBwfLJi
	 Jf2m0y0t/o6/WumqvrP3SFu8kydC8/w4s/0Yasdtvfex+cm60Kh/kDJw2iwWmAWl2K
	 uG7Xi7fdSffKaSRQAt58k9E2fMRTUxTR9ZmrtaPqr8uqrvN7jYrNHekeWT1z8xYqTg
	 X9I4EZLBZ6HdA8A7kXTlLqi6zoTF5PRK0vbpbjBzCbGi/riAG2xS1IYIb5mY2qjNIL
	 7zyuZQCJY9/Z0+eTM2etPAVRfVzdDR/p4Nu38uKzI7NFV7i7VHXXTJ6xesMql4PGyW
	 MS4GaoJTqyeWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Date: Fri, 31 May 2024 18:28:17 +0200
Message-Id: <20240531162836.157891-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

drivers/hid/intel-ish-hid/ishtp/loader.h:41:23: error: invalid bitfield specifier for type restricted __le32.
drivers/hid/intel-ish-hid/ishtp/loader.h:42:27: error: invalid bitfield specifier for type restricted __le32.
drivers/hid/intel-ish-hid/ishtp/loader.h:43:24: error: invalid bitfield specifier for type restricted __le32.
drivers/hid/intel-ish-hid/ishtp/loader.h:44:24: error: invalid bitfield specifier for type restricted __le32.
drivers/hid/intel-ish-hid/ishtp/loader.h:45:22: error: invalid bitfield specifier for type restricted __le32.
drivers/hid/intel-ish-hid/ishtp/loader.c:172:33: warning: restricted __le32 degrades to integer
drivers/hid/intel-ish-hid/ishtp/loader.c:178:50: warning: incorrect type in assignment (different base types)
drivers/hid/intel-ish-hid/ishtp/loader.c:178:50:    expected restricted __le32 [usertype] length
drivers/hid/intel-ish-hid/ishtp/loader.c:178:50:    got unsigned long
drivers/hid/intel-ish-hid/ishtp/loader.c:179:50: warning: incorrect type in assignment (different base types)
drivers/hid/intel-ish-hid/ishtp/loader.c:179:50:    expected restricted __le32 [usertype] fw_off
drivers/hid/intel-ish-hid/ishtp/loader.c:179:50:    got unsigned int [usertype] offset
drivers/hid/intel-ish-hid/ishtp/loader.c:180:17: warning: cast from restricted __le32
drivers/hid/intel-ish-hid/ishtp/loader.c:183:24: warning: invalid assignment: +=
drivers/hid/intel-ish-hid/ishtp/loader.c:183:24:    left side has type unsigned int
drivers/hid/intel-ish-hid/ishtp/loader.c:183:24:    right side has type restricted __le32

Add the necessary conversions and use temporary variables where appropriate
to avoid converting back.

Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from host feature")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
 - fix minor issues introduced in rebasing
 - rebase again on linux-next without the cache management patch
 - fix up changelog text
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 68 +++++++++++++-----------
 drivers/hid/intel-ish-hid/ishtp/loader.h | 33 +++++++-----
 2 files changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index 2785b04a2f5a..d2ebf63d0b3e 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -84,8 +84,8 @@ static int loader_write_message(struct ishtp_device *dev, void *buf, int len)
 static int loader_xfer_cmd(struct ishtp_device *dev, void *req, int req_len,
 			   void *resp, int resp_len)
 {
-	struct loader_msg_header *req_hdr = req;
-	struct loader_msg_header *resp_hdr = resp;
+	union loader_msg_header req_hdr;
+	union loader_msg_header resp_hdr;
 	struct device *devc = dev->devc;
 	int rv;
 
@@ -93,34 +93,37 @@ static int loader_xfer_cmd(struct ishtp_device *dev, void *req, int req_len,
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
 
@@ -163,24 +166,26 @@ static void release_dma_bufs(struct ishtp_device *dev,
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
 
-	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
+	for (i = 0; i < fragment_count && offset < ish_fw->size; i++) {
 		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, &dma_addr, GFP_KERNEL);
 		if (!dma_bufs[i])
 			return -ENOMEM;
 
 		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
-		fragment->fragment_tbl[i].length = clamp(ish_fw->size - offset, 0, fragment_size);
-		fragment->fragment_tbl[i].fw_off = offset;
-		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);
+		length = clamp(ish_fw->size - offset, 0, fragment_size);
+		fragment->fragment_tbl[i].length = cpu_to_le32(length);
+		fragment->fragment_tbl[i].fw_off = cpu_to_le32(offset);
+		memcpy(dma_bufs[i], ish_fw->data + offset, length);
 		clflush_cache_range(dma_bufs[i], fragment_size);
 
-		offset += fragment->fragment_tbl[i].length;
+		offset += length;
 	}
 
 	return 0;
@@ -208,17 +213,17 @@ void ishtp_loader_work(struct work_struct *work)
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
 
@@ -228,23 +233,24 @@ void ishtp_loader_work(struct work_struct *work)
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
@@ -257,7 +263,7 @@ void ishtp_loader_work(struct work_struct *work)
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


