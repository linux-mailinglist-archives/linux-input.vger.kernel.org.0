Return-Path: <linux-input+bounces-3842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB208CF461
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 15:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35051C20A28
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4943EE572;
	Sun, 26 May 2024 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q1CqiB1C"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04olkn2019.outbound.protection.outlook.com [40.92.73.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDA10A09;
	Sun, 26 May 2024 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.73.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716730400; cv=fail; b=dMD72PTXeX+qpiK4oVBql3vxNyi3aYNElkJ6mf0BdepQu+uUDj1VlWqzk8WGye/ru13B3OuXVaKzVqDuuPaLxYn4J61u5ptjBG/t7hg4yJ0wlS1YkDHSvAvgz8mqOVSlAb3Vw8UgTiB7vdAkS17mF962MT0effDJyrw3ZT2WzW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716730400; c=relaxed/simple;
	bh=0X4+b7gJPsMhtlxjCnQsBvv58rERrAv76/+8tXNVkjo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BhBmkJPobgOrgxDMU5NJZcHHkaOdkUcis6bHT2kOnmVwbZibqcjlleebw/kpusXa8G4WFiA3jRZ+ZAEUvtT2jBxJPW1gJCCVd+4/csm56ySjLI/1ze0cFoFhxst+lFo3SwSqycsWydKlYu6MMuQVvn3gTlGAyyMU4BNP0xGvbbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q1CqiB1C; arc=fail smtp.client-ip=40.92.73.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJwR5XlCe1C1cQvCl5ZOnpKZBkzPcbU7YP61WWEmET8FNXlFJd1OD6h6XuPe8wNJQg+kpw5dtqOJVhZCTf1jOA7h+mDOD6KqCUOZ0cyj4+r2AGKQ3NNFCJVwLHiuNAiFEEzAQqFUbmrg8iX2fdQE6OiWU2b7G9CtCxoix38MdWUy9P/CKjiYNMF9Yk7unVa3OjCp6l3gSt3AgyqOT0HLJ2yYAS8Hx+mNKSrf30OETX8S5QbHu84zwkgujIGlJhwCr9snwluaBiJU77f/XRnJ4dJYxEAjJweqH4CUOWKRlvd5SrJdnPSQMVvLm1xgrLCWsP58AHurkAYMRlUluiMINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pez/U9dGNEBcYtZBsy4mXtoiZ9wOOitXFVKt0cJB/SQ=;
 b=fqcEAAy4+orPN2B9Ju+XmJdtEQWNpVJlLNheSjJ99N153egcEcU/KWccrZzdya1leqYq55GqDCC7nQqE84QHTU+UJwYPtvz/GrMEay8Cr2xgGmnrIP1DLwTBzTX7qU7FXPCrB8E1qAyPgrKsDL6kKn/lBhLA5we+xUJQXNqvbPgN8noyfeo1//36IAm8Vetm2hlyagd9mb9IMRIw3E+hXI7l9PBJLq9UhjX3paoD/Z0+WSUY3WZlds8C7iJkOW88ChuruWGNdLHlAimlJeVa8X3+akD2Swj36+MmSxWB11njGI+gNDHQDXUbvpNIoO+PhKLzzA08pHP5GdEdx8YFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pez/U9dGNEBcYtZBsy4mXtoiZ9wOOitXFVKt0cJB/SQ=;
 b=q1CqiB1CZQtFGKcShoTLL7lZXLeIz0mL5qSS3FCWvqgqn3HcHJYXELP10yEYuexIe8+HEhCepmjZClrchkycOW4sTFIqndYeByPX+whXdb87n9c5yevDBbyNXkS9nTGGCPlK0tSgG8sUKsWLHQCG2JtQAchyhsaJDBUlh5y7fqmhGM4VX/RuCzjHFKR8BKwaOqQtBOYCKLVK60gKSHyFTd0c5al6L+e+ihLfBAOj/XchoCscYO53ueVN8BeXS+XiuSg0alGz7KBjVepEZr0GIfnwcyHYpf6tOPxuO4Pnn0k/zvobhYoERI5xNwesL2uU+vAfIms6nIzpNry/nvSBnw==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by VI1PR02MB10099.eurprd02.prod.outlook.com (2603:10a6:800:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Sun, 26 May
 2024 13:33:14 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 13:33:14 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC] HID: ishtp-hid-client: replace fake-flex arrays with flex-array members
Date: Sun, 26 May 2024 15:32:56 +0200
Message-ID:
 <AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [6PzjO13St5G8j+9Kug2OZ/SGPy6f6mLW]
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240526133256.4506-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|VI1PR02MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: efe418de-4a17-4c61-9ffb-08dc7d8863fb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|56899024|1710799017;
X-Microsoft-Antispam-Message-Info:
	NyglelKl4BlMQmi+1RYymQS9wf3uFbfzv4BgY6nyYLFkaofhsf1UvKBOSQ14vcNzpOecOaletsaQxhRV94UMft/g8kUBPtdG4KOWlqUU2KW+A5wY6anEnQVwW6pPrJt3w0MN5uIhRM3tlf+vHvgT1BGSgCuy9huZulp3nWJRMB87IaChXUV6ytip/n1Q/k2lToYM9Mv4LWsW2i9estg48t83rGfnEC+i0BaWhJnLUkENurHbn0G+ZPu/3ZT4+TtJyIgZ2mxEg7sFnPpDRBKiaw+n4ZEnggW/oV85O7mWDlX71zvfsa2HbIWv987eDzrmVWh1vI06XVkxU8BWGfdt4KDx4TStTruUN6n/uQ1gLGU4CuiLks75YoFL4gAqVLSZcdGM0R2fYoXhkb7EGdSREoR0uCwbzOUp29QakuXGeR9VyN3MSdK2AXbKjGaUmCUdzWSkG60nOiPU05FZ8Cb6hq/PuH0A/rSaQonLzgq7OcC4uUZeglYKiQb3QAK1uYilkgjur4sPiOlNvl3+OrnzgHls2NDd9tJyDkexTBtcQD11C6d/m6hn6UHP6lVUXyu1YOKXopScRRfbzd4KQ3IfRBFFcuJhTpiTiRjg04146Omk+XYNO5Y1O9rSO1Tx1CrMjpiQ+QbSMyR0rnoBnE68Ch3j59o8p0zQklAZ3/kn59t8ZixHp1ruv332yv/a3VkcW7WvyUR17HLUh+AXxd1unw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JLsuegBfB12QHKYAQTv2fEW/k9h7IVeNlGFPaB0LD9/SVyttUqFlI8JoIzrJ?=
 =?us-ascii?Q?UupvoHPMmyON5xvijDzMw0bDPQWqLDaiNjnYFc7rU8mdXwP1RiEbN/6NKKWo?=
 =?us-ascii?Q?BpmCTkkz+hIjlPVPZ263+Fu+hGw/am5Zsy1E8vkJ/Ocvfbuaq4u6ASRbjPIj?=
 =?us-ascii?Q?sSaVDOq34fKJdHh8f3v0AZFdojZgBXVbgp8UtWkfULYnZtD3et1a1URMM9AJ?=
 =?us-ascii?Q?Ib4lxzUhQlsOUh4Y/NXTlbEaTJshE/zHuL+xU9uilURoji9DHwfLz+frQyCs?=
 =?us-ascii?Q?dXNubn5nKsPApPoyXXlvOltBrKRlVRVTz72N6jVTwXSK22CKKpguJHHagDiA?=
 =?us-ascii?Q?9UmJ9xEvK0HDRuytwKqovK+qnFBalPblpwGPmyYxeyEYxzkX8VuPvu2w0Hbq?=
 =?us-ascii?Q?noH0r7rUatvdHb1zItpWAB+Oajwz1OV39Z8EoiyNwEJ/1IrOqEbBxEwVkAJ5?=
 =?us-ascii?Q?1R0/K6KirTyIlua25QA290cEyNDhfU8zrn/6dwQWDGkJ37yzkCtCgQ+KEAxw?=
 =?us-ascii?Q?DLEOT44tSTUgW6Qd7PVWuWqFqwEQce4sBV6fcJngodmJlzGlWhP320JTKgye?=
 =?us-ascii?Q?A1JzwgbjQVKg2X8yMtKof5NO1/KoJrjNqAatt0DE5w4Ex331yZBxVyOc1QwM?=
 =?us-ascii?Q?qlp6Rp0Uc8h9zu5vFXQ9dV1v9AoSAtKDhbZeLnb+h7xi5XGlVuL79BZZhBeB?=
 =?us-ascii?Q?ySmLPlS0ju3D/LzX8UZmt9+AAySdF3o11YPdrBjwkjngY7ogt2MK/ulILqwY?=
 =?us-ascii?Q?EgePOf/uMT9uLljvPUe9qF+nJxiKZzIe1x8e6pHyuP1c2yxi2THizbcC4Skd?=
 =?us-ascii?Q?JZve3E46P2bRgr4cdn21hxBMkwiNjsB8Qm4oczTD99vnksZUpF9mYc9trUnv?=
 =?us-ascii?Q?cVhw6NAk5cPwv4X+tB4+ybqf3AaigLsQ9H0wKLlkaPy+jJXsrkPCvxrMUHzU?=
 =?us-ascii?Q?E4Ap5HgPdm9F9y+MemvVDcHTSOtbnpvhNFQP6k0uSTdCXAiTK6xlsvtAe6X6?=
 =?us-ascii?Q?/nBVt/tsFl6ADLc0V7vA5KXXIWo5jKHK0VpmcZr6i/2KEuU/LhM2OWPs3Iqm?=
 =?us-ascii?Q?MDKCkormXYvkOg2LB2SInIJMycqDRNFjyS/8dfxaOezbx4d1mfVfblV8ft2a?=
 =?us-ascii?Q?gx2PL8OKaQ+AaflDm0sRC3/BoJJ/K8z+vEW1YIeSdLY0f3/qDhI09SzsSq9D?=
 =?us-ascii?Q?mFbh4qkxS5YW0sKOCjixaitUbzT7cQKRHvwjOOO6U7awFwnnchz18ifK1MmQ?=
 =?us-ascii?Q?ZhLZBqahLlNhu+kMPjyX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe418de-4a17-4c61-9ffb-08dc7d8863fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2024 13:33:14.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10099

One-element arrays as fake flex arrays are deprecated [1] and we are
moving towards adopting C99 flexible-array members, instead. This case
also has more complexity because it is a flexible array of flexible
arrays and this patch needs to be ready to enable the new compiler flag
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

Also, use "container_of()" whenever we need to retrieve a pointer to
the flexible structure, through which we can access the flexible array
if needed.

Moreover, refactor the code accordingly to use the new structures and
take advantage of this avoiding some pointer arithmetic and using the
"struct_size" helper when possible.

This way, the code is more readable and safer.

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-and-one-element-arrays [1]
Closes: https://github.com/KSPP/linux/issues/333
Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
Hi,

The idea behind this patch is extracted from the ones sent by Gustavo
A. R. Silva [1] but without the use of "struct_group_tagged()" helper
to separate the flexible array from the rest of the members in the
flexible structures.

Regarding adding the "__counted_by" attribute to the flexible arrays,
I can say that I have not dared. The reasons are:

1.- In both arrays there are a no direct assignment to the counter
    member. Only exists a cast from a raw stream of bytes to a pointer
    of a structure and this way the counter member has the value.

2.- The outer flexible array (in the struct report_list) has elements
    of different size. I believe that every report can have a different
    size, so I think the "__counted_by" will not work as expected.

Comments are welcome ;)

Regards,
Erick

[1] Here are some patches that use the same idea:
Link: https://lore.kernel.org/linux-hardening/cover.1709658886.git.gustavoars@kernel.org/
Link: https://lore.kernel.org/linux-hardening/ZgYWlkxdrrieDYIu@neat/
Link: https://lore.kernel.org/linux-hardening/ZgG8bbEzhmX5nGRE@neat/
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 27 ++++++++++----------
 drivers/hid/intel-ish-hid/ishtp-hid.h        | 11 +++++---
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fbd4f8ea1951..c0c8f4d7b0e3 100644
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
@@ -99,7 +99,7 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 		payload_len = recv_msg->hdr.size;
 
 		/* Sanity checks */
-		if (cur_pos + payload_len + sizeof(struct hostif_msg) >
+		if (cur_pos + struct_size(recv_msg, payload, payload_len) >
 				total_len) {
 			++client_data->bad_recv_cnt;
 			report_bad_packet(hid_ishtp_cl, recv_msg, cur_pos,
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
+		msg_len = struct_size(recv_msg, payload, payload_len);
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
2.25.1


