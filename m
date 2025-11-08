Return-Path: <linux-input+bounces-15952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBAC434B8
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 22:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268A6188CC89
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 21:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8392E2701CB;
	Sat,  8 Nov 2025 21:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6aAd2kY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVUWYrRT"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24DA171C9
	for <linux-input@vger.kernel.org>; Sat,  8 Nov 2025 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762635806; cv=none; b=gOqBj/68MprX0hJdnA2BjRMPuZLoW36A8F/B+PYeTWwqKoxpypDjI/xOyNq1RVCx38jPQMJ/6CKDIJ0pa55wB16XMVIb7Xf+ZBrXRJrlsYHXIBJwc9kWeLHkL72ycxo+6ZQwln22y+9GDN/kKyFQjQ8puiRzHOXZOKgy/qlOab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762635806; c=relaxed/simple;
	bh=BARYIVhtgUAR08Cfw2/Weku3xD1qPmHhXL0mSQWnz2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nggzgNpK7GD8knPkaZBEjrj6VQrZKxF8oXpDmFn2WDx3qctF8GoHjgUnYpJrBY8eHpeX5JOJNk4G61nwlVzTJr6r0u0RG1ysNOQ/5ExAHUhBxjh76q1LYSVDuzahHyH39mEsjxXU6/EnkUlNxovFm7RKU2yIMrmkdqxX18PvuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6aAd2kY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVUWYrRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8CBVHw1752030
	for <linux-input@vger.kernel.org>; Sat, 8 Nov 2025 21:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zjoQofdHzwryYLq8AZSB9ifk28kjitNPYlS
	YTWb3RNw=; b=P6aAd2kYhir3N4GiTB32cb4NMUZES/SMcV8T3OsIjOvY5iaTBkv
	E7R1wtmRnc7ZKG3C6r1kP11XV30OYbU2BJl0QGiCJBvAqp6lgjw86c2K2o1iESXF
	GTNE7/BDQZrWWJKroSYOFIzpQTcYUkFhhJSkz1PuBXqiRcSCMVj/+CGk7iw+MKbv
	owfh2xPtx7H7CjOJhmRBJcVBS81ov2wp6hEjeWtdVDI4thFkavHhwnD3+CUEcvkS
	DZDYBunvJcKksRckVkaqCMwktae3ElegSdeBPsyJch1xk62ys3hTtZ6luEgA9EKA
	+uxr05cxATNt8ikLJ5zVFxZkAp2bR6ZBjDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw595y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 21:03:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88c912928so51045861cf.0
        for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 13:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762635803; x=1763240603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjoQofdHzwryYLq8AZSB9ifk28kjitNPYlSYTWb3RNw=;
        b=dVUWYrRTfE1OIhS25nni2rEBsF63w1BAg26ItRLcFeodcea0DnvS/RxKGMtJ2f/Fyj
         LV7vTY3C1RlTi2C0hQ34WhjbEzyqdq72xUbBqH66y3HIhjSuntINODnanlUgey/F6qlT
         5W6FqeLDkL/2fJeupnzFgd/V1W2Lk/o04lh6XgeiiPH4HC/LIiDo/EQBvO+y9g2I/5QG
         N/RliAQHlJEyUhkjeqYV19SkBV6YNdTIGOo3EoiGiHtHUNqsCR5uQvtGEzPYRVdj3KU1
         dS9a8inHKQgSMJZGC8b/W8qUrq3NhOtudFsOTUVWquuH8Mq/OWAFFnhkZQGsHXz7WaAr
         5N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635803; x=1763240603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjoQofdHzwryYLq8AZSB9ifk28kjitNPYlSYTWb3RNw=;
        b=o2Hyf6k36CyCbswag7peWmvQD9qZOtoCj/JG0g1WZu8T1NjWo+bvXJHoqkqRWwAB5j
         xF0axBEri3B9Jb46Jm4zdKQPrMIEz2rPBcR92DkQEBH2QypUi3x4/AVRpYEJoouNHsl3
         /W0sKRY3VRGHWkLzhTpgqukx/6LsNxfuik6FwtkNcfO5UhDMDz+c65ZVOUrNiu9we+63
         TKcxyiJGB3AkAHeu1jORdLNvjb1DvdumFCf20A3R/x5KghyXhqgrfeLRFJ2JJfs5anh1
         IgsAth8kGXZkKirgwg5ENSfwG9HGb3cZ2LrWGwtBn96czVqMgZzK+vXhZvwdspJ0BQgh
         /6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwbGnFDxS/L/WXsUiPJ7G6NVCFe904vzAniIjHmogUE+DmL1c+u7L98qEJkqJz2k4JHnWakB7+IlUwPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybYPNeWgDNcvYHjdQblBtnx8LS5+imtibUoTmUjc7kMIBxG4KA
	GA7jebxol1zobedllavaOHLwer5MeGMQ+sPKgT0P8uWFJdbLGkV2Gs/8qtn5B8Za9uElC7U1YXT
	vwc3t07iJNGzlb5ATml+cx9NdksmlxgW/5uSUwEyNDOjjCP9+P29TlskucQ5wFbic6g==
X-Gm-Gg: ASbGncvO6XGoEQ5Ybj++hDLRxBjBWFK9Zjy6IRBJZ1nfD1tERx8wVhKiP5juGFbzMH4
	ujPioYtypcDiruFqeRHv5dgC6ZPZG+b9VoM9QshL8KTYklTEyxkJhRDHb9v70Fpla443JSvTj+R
	ukP0oKqdVbz3UVj/ooTHn5G59yU/8TwnszTa4ZvdHCmHyswIA89DgLI1o+VyMQaI/2lLkKitH/E
	Q90wxWrqu9jtXRhDom45WluJMNC2IxMhQD8PTtsAK+q24Vf8XQGFXkGPDM54aUyMsqDEKO+8GNO
	HcBGwooTTL/PS9BHrh3XhcKUk3ZCc7pzaIxzMZRy7dJ9VoYfn8L7kjagwQohzImol5ISggLVNmG
	XWu6TZVbrUEM/RGXeo5rA64/xSlGP1KZlKCGgju7fMp8/N2jVuFL8kCVVuvcoYU+sf3zGzj1V0X
	w=
X-Received: by 2002:ac8:7f4f:0:b0:4ed:aeaa:ec63 with SMTP id d75a77b69052e-4edaeaaf1b8mr23187411cf.30.1762635802864;
        Sat, 08 Nov 2025 13:03:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfOpWg6ll+BB/4owqVfNKUDXw4Hk39dZ7yCIlWJqjaROrSDFTHCKnpvdD/Kn7s4BI9G2YWzQ==
X-Received: by 2002:ac8:7f4f:0:b0:4ed:aeaa:ec63 with SMTP id d75a77b69052e-4edaeaaf1b8mr23186921cf.30.1762635802410;
        Sat, 08 Nov 2025 13:03:22 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm643857366b.39.2025.11.08.13.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 13:03:21 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] HID: logitech-dj: Remove duplicate error logging
Date: Sat,  8 Nov 2025 22:03:18 +0100
Message-ID: <20251108210319.7125-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DNtLWu4g-kRptrD5Z6xrq6FbKf6VOO-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE3MiBTYWx0ZWRfXyl8cjWiPlBtB
 Vx3HIWgHoXaVZsrle0mWKiSQYU55ln8wlhwom0OQhTzzRFrMrwnx3ijPhBq+96QkWrdSdvihqcw
 VI1o1BdOirmPgGWK252N38Xi1bQ/MiifOhMGiE2qsFh4Soy1TfylADtiYttUp5LZLwSoid6NgjZ
 mGaqUNYlH3WAbYLGdLG/mwRyQXw5S/WnXXD1y3pQSpApv9y2QcKCnPDoLAHc2CWrXsew3UcKaeP
 FBhAQMD0s+FA/IS/c8VSB06GG5E9jLPhWoQzLKPGJA+ZKFUPHjG4N8pXZg7sXxeqIWo8R0YZ+L/
 /XPGVt9A7Acy/wvmfcNXZbXkeycxmsPyXQtAO6GE6S627PIbDK97sqakPdgG9BovT0LOrR2AiZk
 596BfJoYTdiIw41mjtIdiIhJjc1Enw==
X-Proofpoint-GUID: DNtLWu4g-kRptrD5Z6xrq6FbKf6VOO-M
X-Authority-Analysis: v=2.4 cv=FoQIPmrq c=1 sm=1 tr=0 ts=690fb01b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=H7pvUbIZiovSmf_0QoAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080172

logi_dj_recv_query_paired_devices() and logi_dj_recv_switch_to_dj_mode()
both have 2 callers which all log an error if the function fails. Move
the error logging to inside these 2 functions to remove the duplicated
error logging in the callers.

While at it also move the logi_dj_recv_send_report() call error handling
in logi_dj_recv_switch_to_dj_mode() to directly after the call. That call
only fails if the report cannot be found and in that case it does nothing,
so the msleep() is not necessary on failures.

Fixes: 6f20d3261265 ("HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/hid/hid-logitech-dj.c | 56 ++++++++++++++---------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index d66f4807311a..58a848ed248d 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -889,7 +889,6 @@ static void delayedwork_callback(struct work_struct *work)
 	struct dj_workitem workitem;
 	unsigned long flags;
 	int count;
-	int retval;
 
 	dbg_hid("%s\n", __func__);
 
@@ -926,11 +925,7 @@ static void delayedwork_callback(struct work_struct *work)
 		logi_dj_recv_destroy_djhid_device(djrcv_dev, &workitem);
 		break;
 	case WORKITEM_TYPE_UNKNOWN:
-		retval = logi_dj_recv_query_paired_devices(djrcv_dev);
-		if (retval) {
-			hid_err(djrcv_dev->hidpp, "%s: logi_dj_recv_query_paired_devices error: %d\n",
-				__func__, retval);
-		}
+		logi_dj_recv_query_paired_devices(djrcv_dev);
 		break;
 	case WORKITEM_TYPE_EMPTY:
 		dbg_hid("%s: device list is empty\n", __func__);
@@ -1323,8 +1318,10 @@ static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
 
 	djrcv_dev->last_query = jiffies;
 
-	if (djrcv_dev->type != recvr_type_dj)
-		return logi_dj_recv_query_hidpp_devices(djrcv_dev);
+	if (djrcv_dev->type != recvr_type_dj) {
+		retval = logi_dj_recv_query_hidpp_devices(djrcv_dev);
+		goto out;
+	}
 
 	dj_report = kzalloc(sizeof(struct dj_report), GFP_KERNEL);
 	if (!dj_report)
@@ -1334,6 +1331,10 @@ static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
 	dj_report->report_type = REPORT_TYPE_CMD_GET_PAIRED_DEVICES;
 	retval = logi_dj_recv_send_report(djrcv_dev, dj_report);
 	kfree(dj_report);
+out:
+	if (retval < 0)
+		hid_err(djrcv_dev->hidpp, "%s error:%d\n", __func__, retval);
+
 	return retval;
 }
 
@@ -1359,6 +1360,8 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
 								(u8)timeout;
 
 		retval = logi_dj_recv_send_report(djrcv_dev, dj_report);
+		if (retval)
+			goto out;
 
 		/*
 		 * Ugly sleep to work around a USB 3.0 bug when the receiver is
@@ -1367,11 +1370,6 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
 		 * 50 msec should gives enough time to the receiver to be ready.
 		 */
 		msleep(50);
-
-		if (retval) {
-			kfree(dj_report);
-			return retval;
-		}
 	}
 
 	/*
@@ -1397,7 +1395,12 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
 			HIDPP_REPORT_SHORT_LENGTH, HID_OUTPUT_REPORT,
 			HID_REQ_SET_REPORT);
 
+out:
 	kfree(dj_report);
+
+	if (retval < 0)
+		hid_err(hdev, "%s error:%d\n", __func__, retval);
+
 	return retval;
 }
 
@@ -1935,11 +1938,8 @@ static int logi_dj_probe(struct hid_device *hdev,
 
 	if (has_hidpp) {
 		retval = logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
-		if (retval < 0) {
-			hid_err(hdev, "%s: logi_dj_recv_switch_to_dj_mode returned error:%d\n",
-				__func__, retval);
+		if (retval < 0)
 			goto switch_to_dj_mode_fail;
-		}
 	}
 
 	/* This is enabling the polling urb on the IN endpoint */
@@ -1957,15 +1957,11 @@ static int logi_dj_probe(struct hid_device *hdev,
 		spin_lock_irqsave(&djrcv_dev->lock, flags);
 		djrcv_dev->ready = true;
 		spin_unlock_irqrestore(&djrcv_dev->lock, flags);
-		retval = logi_dj_recv_query_paired_devices(djrcv_dev);
-		if (retval < 0) {
-			hid_err(hdev, "%s: logi_dj_recv_query_paired_devices error:%d\n",
-				__func__, retval);
-			/*
-			 * This can happen with a KVM, let the probe succeed,
-			 * logi_dj_recv_queue_unknown_work will retry later.
-			 */
-		}
+		/*
+		 * This can fail with a KVM. Ignore errors to let the probe
+		 * succeed, logi_dj_recv_queue_unknown_work will retry later.
+		 */
+		logi_dj_recv_query_paired_devices(djrcv_dev);
 	}
 
 	return 0;
@@ -1982,18 +1978,12 @@ static int logi_dj_probe(struct hid_device *hdev,
 #ifdef CONFIG_PM
 static int logi_dj_reset_resume(struct hid_device *hdev)
 {
-	int retval;
 	struct dj_receiver_dev *djrcv_dev = hid_get_drvdata(hdev);
 
 	if (!djrcv_dev || djrcv_dev->hidpp != hdev)
 		return 0;
 
-	retval = logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
-	if (retval < 0) {
-		hid_err(hdev, "%s: logi_dj_recv_switch_to_dj_mode returned error:%d\n",
-			__func__, retval);
-	}
-
+	logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
 	return 0;
 }
 #endif
-- 
2.51.1


