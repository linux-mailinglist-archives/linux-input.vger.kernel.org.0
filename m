Return-Path: <linux-input+bounces-15953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D350C434BE
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 22:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 996F534876B
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 21:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AC2171C9;
	Sat,  8 Nov 2025 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoQ3HoMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NresGyWB"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84752270542
	for <linux-input@vger.kernel.org>; Sat,  8 Nov 2025 21:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762635808; cv=none; b=i8Kl4jY53rQ4uljXKyi67uypMYe5zgMxqIeLhCr3GC1xSkSfPyRzWncH4JEY20tRm8Wprlh3fkdN5T5xy5AmCbNX7ZKU/iEaJ8BLyWqH0NjH9zrF2YDbxFNHTio4CLyJymiUuTk39us8ncUMCJmN6N21K6UlvHcYLWTiX+yTSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762635808; c=relaxed/simple;
	bh=eceA4q0+8UWhjiAnR4gmchfDkq8DipIUUMQcZOMuDqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WM/SoVLqnzSGOW/qPhlTfpFsK9Ba2Kl7YvhOIXwaKqi6NmZcjUT4xOnxWTNrgKX3LuJUa46PMT0gjkyImDmpnAtuXGKxxUYZS7vBsBclzSEKKtrEQbv5ZiG4Xeyg2dzL1IZJtw2qS9/QnohqBLJ8Ri1XMSXnIUn8MfdJpVkKfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoQ3HoMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NresGyWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8Fc8d92161277
	for <linux-input@vger.kernel.org>; Sat, 8 Nov 2025 21:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YbDa+qttUI5
	Hc6TJg8DCNSYOjvf1mBNLU1fiqiuNgnE=; b=hoQ3HoMkSF2XQcS1clcajFWbbXw
	9ivr7mq7RXVSOC7XtTQFtXDcpaoEU4mLdTueyfCKMupJvpuWDRNLYMQR0c3gdtTY
	xf7jugmySJ3CoWHppqHvWu/ttngulSioOEUhbKEdfVyJvVLpFhZYDl3Q2bquDIzD
	jenkEbCTTPFqRw38K/v4ltRJ3RmEX5eP7MUzMhBGtCjgQn1NHiP31lH72a4yZB92
	r68pY67HnZmRvVaMAr7/3zQhNdRYMBgadN/iUg81FDiDey9bG5R3jt0W04ul75bO
	YPK6EE3Sxy1Wj5nZkO663ptaJ727/ukOXTqZa4A99zkGIPp+q94cBfWkpaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu9s5qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 21:03:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8824292911cso9287756d6.1
        for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 13:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762635804; x=1763240604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbDa+qttUI5Hc6TJg8DCNSYOjvf1mBNLU1fiqiuNgnE=;
        b=NresGyWBAFnrrNQS5+cJ/vmQk0D+bpUQ/jYbzzUF+7dCVhleaYRvPgNV9Z4xfCs2uH
         KwMOnf7Nkh/WL/6DotrBy+I1kB+Hinz0rd2BImIFhCneiY9PrY8dcnI2KukvrUSufKx8
         o3zTUTDhf+eOF1CSnsSDi9w/6Pc4iMM6uCk35dUomJYFiZHilrnCuKSPLKBP3f4U7VV2
         QmqhcSg/GqFeAuPM6I5lEjUipfvf9ply1zJDQ/XHnO8JSzzbfpi0Py1d1+bG2goWt26D
         gTiw8TEv+2962+rt+iQ5b2NwLwu2r7gED+Z8AtYCo3vzJAZkdcoHV6Gem2Wsv/nDo7hG
         1YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635804; x=1763240604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbDa+qttUI5Hc6TJg8DCNSYOjvf1mBNLU1fiqiuNgnE=;
        b=s7bb8fDkRH3CXOvitzC4mrvG+cCkukNY6FwywWBhFcAs9oNnNitBT2oqYQexGuZicQ
         PS1sF8HrfZLiHZahNqE56HURchnrf73dCMrBq+wvLu4mwQFxhwS/cVTHFwDcg0mMsKaJ
         lqscE4KFaAX9TGeyrHXfoOYBZZ2oe4dM559JGvsnzLaALtgs1XD8UlshNrzcQ5dIMTos
         qmZLDkUG6yB9k0guIhZW9ZE+ttG1bo5ewXjh9TvFK8+acIMSUeasDEATEP15BiP8XJ3w
         pYG8FMKbwh2z2AnQ9XEu2dWuLoIhKPIaZtae5OMlJbb+YsPVErWrh9Khn0Dv/yooVHmQ
         wKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY4W1ouBwWdgJGVApOmWfH7nlZcrTlCoi4JAcmpWPvKKfyx8twh8oXUHPslCANxvPR9sKoCcPYRsdETQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMpHCOdVGYLmEHkDzxaP8JvF/tT5f+OHvd/EjuL2ro7G7TBl3/
	12Lv1XdAs9yA9RA6DPRfNd0lq14WF/j6WhvFHU793Igr2OkMbZfBXVW0zZ0kXEHalQUuKLacqG9
	i7z+Lmu+cUrfmUYd2HrD/+Am3eHPwBHIVaNa5355eZ+e/ZUimNaWA+/5BgBqox/Msjw==
X-Gm-Gg: ASbGncvhp7RTnZrM4Jm/9Jh8mhpXzSJGfjPeTWMIBnwc0edR8e0Cd9oCimTzpPfIP+e
	Sx1lG4hT0zMI0ViF+Q1dB0+D0o877n59tklUaOo4M+d0SNGZQJ5mpO307xJlYPfc3lXrzixadxu
	bLgFxVei5YrEDCEZ+mtpuBB4Fooz1JUMhgL/gjlD+Tsx51EHwXwuLUxL5Zp+2YnIjhqKbf06Iji
	sUqtmjUhdsvWg66JcJFgAvQijGWJuo7vssejd8WSu6pKR30NYq/mZkf8kBY+exuih/jOC7IVKMB
	aZVqdgzqQd6itymdzV8Fq1XU7JJ99FCUiFMleQPoltvDmjy09FV7+YfC4tNaBkyaZDZN5FoPyc8
	vqFEfcv5SoD2kpL7S/rFnXCvUfx7mZ1JB7wc8jUT6q9GQWTQpPPmTDo9C+mFCv8frGJqw1fLjgw
	Q=
X-Received: by 2002:ac8:521a:0:b0:4ed:9a2b:a906 with SMTP id d75a77b69052e-4ed9a2ba992mr50525961cf.5.1762635804451;
        Sat, 08 Nov 2025 13:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBlUNis28oSRgQR49mP/h7zkgeHwVHW5+coX+Dvuz7EvQJRTupd9aSl7Qxr6HyAqpaHN4kCQ==
X-Received: by 2002:ac8:521a:0:b0:4ed:9a2b:a906 with SMTP id d75a77b69052e-4ed9a2ba992mr50525771cf.5.1762635804049;
        Sat, 08 Nov 2025 13:03:24 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm643857366b.39.2025.11.08.13.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 13:03:22 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/2] HID: logitech-dj: Fix probe failure when used with KVM
Date: Sat,  8 Nov 2025 22:03:19 +0100
Message-ID: <20251108210319.7125-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108210319.7125-1-johannes.goede@oss.qualcomm.com>
References: <20251108210319.7125-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8iuxox6LejmH9BPFmpW-mc4OFTEgJlj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE3MiBTYWx0ZWRfX7pjYf47EreuT
 UH3SuA+IhlLTdfRvoTaGDrdxiRe4sP8qWHMe1T1Rv4MTIGgZ3Q3/0e/TiavV3aY0xbi61eXpgs+
 X7ALYSjeocFU9SkRjB0AZGGECB0s4lmKQQXu0zyOWmy6hXlSmfWZeAqCqlp1hwEaTtxrF4rwzM7
 TIoZqPrRF4hTQNMjkqcN8LAELLpq+hLMTp8qInKj3LG2XNspZB0ycPqXUIY3YM8O4Q92x8HF452
 1KA1Yk9YxHQ1j8DZUSwMe7nQY7MmZeCXJn9zS+1/VZuwdpi72YBxuQYf+rAeSocChDD9uMSSQnn
 kKzpS/2Pd1AqraRmZme39xv2BjJKx3bE3NEMOfpuvg1VyE75+ebuPjL6EbVlvNdaTMsRQSSr7u7
 CZrOBcv7yilW1wBVKVotoiOFznvwRw==
X-Authority-Analysis: v=2.4 cv=ZPXaWH7b c=1 sm=1 tr=0 ts=690fb01d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UrnqHec9oVvvnmx1FIgA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 8iuxox6LejmH9BPFmpW-mc4OFTEgJlj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080172

Since commit 6f20d3261265 ("HID: logitech-dj: Fix error handling in
logi_dj_recv_switch_to_dj_mode()") logi_dj_recv_switch_to_dj_mode()
will return an error when the hid_hw_raw_request() call to enable
[dis]connect events fails.

This can happen when used with a KVM like the Aten CS1784a and the PC
does not have the KVM focus when probe() runs, which causes probe() to
fail after which the receiver will simply not work.

The logi_dj_recv_query_paired_devices() call done at the end of probe()
already ignores any errors for the KVM without focus case. When focus is
restored and an input report is received this will trigger
logi_dj_recv_queue_unknown_work() which retries the query_paired_devices()
call from a workqueue.

To fix the probe() failure let it ignore logi_dj_recv_switch_to_dj_mode()
errors too, track if a successful logi_dj_recv_switch_to_dj_mode() was
done and retry if necessary from logi_dj_recv_queue_unknown_work().

Queurying paired devices while not in dj-mode is not useful and this
will be redone after the unknown work has retried setting dj-mode,
so skip queurying paired devices when not in dj-mode yet.

The new bool to track successful setting of the dj-mode will also cause
setting dj-mode to be retried from the unknown work, if setting dj-mode
failed after a reset_resume.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/hid/hid-logitech-dj.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 58a848ed248d..16a97fae8c40 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -149,6 +149,7 @@ struct dj_receiver_dev {
 	struct kfifo notif_fifo;
 	unsigned long last_query; /* in jiffies */
 	bool ready;
+	bool dj_mode;
 	enum recvr_type type;
 	unsigned int unnumbered_application;
 	spinlock_t lock;
@@ -641,6 +642,8 @@ static const u8 hid_reportid_size_map[NUMBER_OF_HID_REPORTS] = {
 static const struct hid_ll_driver logi_dj_ll_driver;
 
 static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev);
+static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
+					  unsigned int timeout);
 static void delayedwork_callback(struct work_struct *work);
 
 static LIST_HEAD(dj_hdev_list);
@@ -925,6 +928,9 @@ static void delayedwork_callback(struct work_struct *work)
 		logi_dj_recv_destroy_djhid_device(djrcv_dev, &workitem);
 		break;
 	case WORKITEM_TYPE_UNKNOWN:
+		if (!djrcv_dev->dj_mode)
+			logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
+
 		logi_dj_recv_query_paired_devices(djrcv_dev);
 		break;
 	case WORKITEM_TYPE_EMPTY:
@@ -1318,6 +1324,9 @@ static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
 
 	djrcv_dev->last_query = jiffies;
 
+	if (!djrcv_dev->dj_mode)
+		return 0;
+
 	if (djrcv_dev->type != recvr_type_dj) {
 		retval = logi_dj_recv_query_hidpp_devices(djrcv_dev);
 		goto out;
@@ -1401,6 +1410,7 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
 	if (retval < 0)
 		hid_err(hdev, "%s error:%d\n", __func__, retval);
 
+	djrcv_dev->dj_mode = retval >= 0;
 	return retval;
 }
 
@@ -1937,9 +1947,11 @@ static int logi_dj_probe(struct hid_device *hdev,
 	}
 
 	if (has_hidpp) {
-		retval = logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
-		if (retval < 0)
-			goto switch_to_dj_mode_fail;
+		/*
+		 * This can fail with a KVM. Ignore errors to let the probe
+		 * succeed, logi_dj_recv_queue_unknown_work will retry later.
+		 */
+		logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
 	}
 
 	/* This is enabling the polling urb on the IN endpoint */
@@ -1957,17 +1969,13 @@ static int logi_dj_probe(struct hid_device *hdev,
 		spin_lock_irqsave(&djrcv_dev->lock, flags);
 		djrcv_dev->ready = true;
 		spin_unlock_irqrestore(&djrcv_dev->lock, flags);
-		/*
-		 * This can fail with a KVM. Ignore errors to let the probe
-		 * succeed, logi_dj_recv_queue_unknown_work will retry later.
-		 */
+		/* This too can fail with a KVM, ignore errors. */
 		logi_dj_recv_query_paired_devices(djrcv_dev);
 	}
 
 	return 0;
 
 llopen_failed:
-switch_to_dj_mode_fail:
 	hid_hw_stop(hdev);
 
 hid_hw_start_fail:
-- 
2.51.1


