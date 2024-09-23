Return-Path: <linux-input+bounces-6640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82F97E44E
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 02:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA89AB20C1A
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 00:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6661915D1;
	Mon, 23 Sep 2024 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5iqCmKX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB88366;
	Mon, 23 Sep 2024 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727050980; cv=none; b=D1ARo4vyvjAfiP1NCpA7Mtg3GgRvpp16ieISO3Vj8S0MM5AYtHRTQi2H+4Rr003WSGt6fS80lCmspPjZaOH4uEjKDA19q67CpCySIa6Win+HI4M6w/2dRzfuDG0zXbVSkLkLyyCDkZ67IA6OYazmz8q2jE5uQsC0hduuz48jIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727050980; c=relaxed/simple;
	bh=8DJo0Bvq/UTnLxHUyehI+leQhE80jTAy3dOZGuZqjUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q6nDIBcxL482r+qrDEN5tUK9xi5aSau/Tnowi4S78re6FTUXwpXmC45aRE31WsHJsb6292O3axPj2dprgGlWnDkOudAX15kZ72xstWYJXT6RnrOVqo9Lur69+BwhPB1HjMHJwDfkVzcQsIHBj3MoaJBdX7ZlV1/vXSpOEfZYhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5iqCmKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0B9C4CEC3;
	Mon, 23 Sep 2024 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727050979;
	bh=8DJo0Bvq/UTnLxHUyehI+leQhE80jTAy3dOZGuZqjUc=;
	h=From:To:Cc:Subject:Date:From;
	b=A5iqCmKXWX1KQpuxaK7a7m4vnXWIUwymf6PxkDKcfc7yfDb/oIU2328ISO/qDk9WA
	 fV2usyVNrbed9Wib4IkhI8i0t8F0/lIUqgbuX5Ap0/Fc1R81U7ZL2GrmKGro1SaonT
	 5S6XM0iVeaG8K+ISOEXFiTCqeJxVQaVlxC1mrtRvDJcJessLhXBEflosW5/ST93Kcm
	 LQ0Vl8HbZ2+/9/xg4f3OAWDoCf/5T+LQ33E8m745k/7A8hAO6epxP2xXn9yUKTceb9
	 w2zzr0AOGJkwHqHH13RvfwlCmG1AbsS5nNbuY3R4JlrJI75tSxAV93F2F+59nQAide
	 CcqnGBTYE5gCw==
From: Kees Cook <kees@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] HID: ishtp-hid-client: replace fake-flex arrays with flex-array members
Date: Sun, 22 Sep 2024 17:22:53 -0700
Message-Id: <20240923002249.it.617-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5499; i=kees@kernel.org; h=from:subject:message-id; bh=uL5+LkE+LDdHqSXx5n9OqqD94O15ptLIfs0dSMtn5ZQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDGkfttzhK9uWcjD7nH7SvLtnk7XCJ2ycUlOpxeRqzGtcI RGfrS/UUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJFH0YwM5/e8Div13XzgTH/N 52kLwpmkhT2Yt87bVuN+RHxSAFOEJsP/Evl9hnF9+VysnC4TLmTN44s5cnrpZf3XSxhTNC09myW 4AA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

From: Erick Archer <erick.archer@outlook.com>

One-element arrays as fake flex arrays are deprecated[1] as the kernel
has switched to C99 flexible-array members instead. This case, however,
has more complexity because it is a flexible array of flexible arrays
and this patch needs to be ready to enable the new compiler flag
-Wflex-array-member-not-at-end (coming in GCC-14) globally.

So, define a new struct type for the single reports:

struct report {
	uint16_t size;
	struct hostif_msg_hdr msg;
} __packed;

but without the payload (flex array) in it. And add this payload to the
"hostif_msg" structure. This way, in the "report_list" structure we can
declare a flex array of single reports which now do not contain another
flex array.

struct report_list {
	[...]
        struct report reports[];
} __packed;

Therefore, the "struct hostif_msg" is now made up of a header and a
payload. And the "struct report" uses only the "hostif_msg" header.
The perfect solution would be for the "report" structure to use the
whole "hostif_msg" structure but this is not possible due to nested
flexible arrays. Anyway, the end result is equivalent since this patch
does attempt to change the behaviour of the code.

Now as well, we have more clarity after the cast from the raw bytes to
the new structures. Refactor the code accordingly to use the new
structures.

Also, use "container_of()" whenever we need to retrieve a pointer to
the flexible structure, through which we can access the flexible array
if needed.

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-and-one-element-arrays [1]
Closes: https://github.com/KSPP/linux/issues/333
Signed-off-by: Erick Archer <erick.archer@outlook.com>
Link: https://lore.kernel.org/r/AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com
[kees: tweaked commit log and dropped struct_size() uses]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: - update based on feedback
 rfc: https://lore.kernel.org/lkml/AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com/
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 25 ++++++++++----------
 drivers/hid/intel-ish-hid/ishtp-hid.h        | 11 +++++----
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fbd4f8ea1951..cb04cd1d980b 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -70,10 +70,10 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 	unsigned char *payload;
 	struct device_info *dev_info;
 	int i, j;
-	size_t	payload_len, total_len, cur_pos, raw_len;
+	size_t	payload_len, total_len, cur_pos, raw_len, msg_len;
 	int report_type;
 	struct report_list *reports_list;
-	char *reports;
+	struct report *report;
 	size_t report_len;
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
 	int curr_hid_dev = client_data->cur_hid_dev;
@@ -280,14 +280,13 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 		case HOSTIF_PUBLISH_INPUT_REPORT_LIST:
 			report_type = HID_INPUT_REPORT;
 			reports_list = (struct report_list *)payload;
-			reports = (char *)reports_list->reports;
+			report = reports_list->reports;
 
 			for (j = 0; j < reports_list->num_of_reports; j++) {
-				recv_msg = (struct hostif_msg *)(reports +
-					sizeof(uint16_t));
-				report_len = *(uint16_t *)reports;
-				payload = reports + sizeof(uint16_t) +
-					sizeof(struct hostif_msg_hdr);
+				recv_msg = container_of(&report->msg,
+							struct hostif_msg, hdr);
+				report_len = report->size;
+				payload = recv_msg->payload;
 				payload_len = report_len -
 					sizeof(struct hostif_msg_hdr);
 
@@ -304,7 +303,7 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 						0);
 					}
 
-				reports += sizeof(uint16_t) + report_len;
+				report += sizeof(*report) + payload_len;
 			}
 			break;
 		default:
@@ -316,12 +315,12 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 
 		}
 
-		if (!cur_pos && cur_pos + payload_len +
-				sizeof(struct hostif_msg) < total_len)
+		msg_len = payload_len + sizeof(struct hostif_msg);
+		if (!cur_pos && cur_pos + msg_len < total_len)
 			++client_data->multi_packet_cnt;
 
-		cur_pos += payload_len + sizeof(struct hostif_msg);
-		payload += payload_len + sizeof(struct hostif_msg);
+		cur_pos += msg_len;
+		payload += msg_len;
 
 	} while (cur_pos < total_len);
 }
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.h b/drivers/hid/intel-ish-hid/ishtp-hid.h
index 35dddc5015b3..2bc19e8ba13e 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.h
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.h
@@ -31,6 +31,7 @@ struct hostif_msg_hdr {
 
 struct hostif_msg {
 	struct hostif_msg_hdr	hdr;
+	uint8_t payload[];
 } __packed;
 
 struct hostif_msg_to_sensor {
@@ -52,15 +53,17 @@ struct ishtp_version {
 	uint16_t build;
 } __packed;
 
+struct report {
+	uint16_t size;
+	struct hostif_msg_hdr msg;
+} __packed;
+
 /* struct for ISHTP aggregated input data */
 struct report_list {
 	uint16_t total_size;
 	uint8_t	num_of_reports;
 	uint8_t	flags;
-	struct {
-		uint16_t	size_of_report;
-		uint8_t report[1];
-	} __packed reports[1];
+	struct report reports[];
 } __packed;
 
 /* HOSTIF commands */
-- 
2.34.1


