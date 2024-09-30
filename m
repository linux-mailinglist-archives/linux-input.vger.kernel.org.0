Return-Path: <linux-input+bounces-6901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E27989D10
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 10:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927021F23F71
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE634184539;
	Mon, 30 Sep 2024 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="OfFvgxab"
X-Original-To: linux-input@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B33E181334;
	Mon, 30 Sep 2024 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685713; cv=none; b=ACfZzhqWskG95gMHKA9I8LG5aDGJqRD/ASAgU6ksTVoXbgA9Q+2mvfu4gqREDYfcr5w6aqQsqrvffw74W8yABTjLRht664/GXoInxkN4U0nUzvZZu4UYAaTBWJ9Ir03aUx06zZ58w5B6EyzaCgN/pLeRijbr0x63Re0t3u5L0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685713; c=relaxed/simple;
	bh=kk/hgYJKzfrSyEZ63RX3OFjZ+ojTIwIQixIFkUGn+HY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=i2MAJH/XxPUpD9recsINTmQejBfzjlNh86WJeX2bgICfwFr9WaX1y6AxKCRRUq+zPrOsOIA4Gg20Jc+rjF1nvVov6kpf3E64j1JgDxVTZoh9Y9lI1Jxtyuc9wPkHG7sV2/Q5CIqN8uHsEtMKEXMCoy4UchKIJehOAXMrvm/ee0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=OfFvgxab; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1173)
	id 634A320C8C66; Mon, 30 Sep 2024 01:41:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 634A320C8C66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1727685712;
	bh=6uy2HCfWrjzOK/GPEwENb235RVQzwbIIz+wXrMpaUeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfFvgxabXFT3sT4UkGtOZKIm83ucDqKCoHWvCW0VjhdIMGhoHrIKdovekX9i3SVge
	 FU21XiNIWZz1keSN8v2ACV5tiuPsM1ACe96s7k65CwEI8Zvc86KZ8AMBwzyOjOYRhw
	 wSy4YgOArqdewAvA5BsQa5+TO/kKCgwbZ8/5YShw=
From: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	mikelley@microsoft.com,
	linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ernis@microsoft.com,
	Erni Sri Satya Vennela <ernis@linux.microsoft.com>
Subject: [PATCH v3 3/3] Revert "HID: hyperv: register as a wakeup source"
Date: Mon, 30 Sep 2024 01:41:48 -0700
Message-Id: <1727685708-3524-4-git-send-email-ernis@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727685708-3524-1-git-send-email-ernis@linux.microsoft.com>
References: <1727685708-3524-1-git-send-email-ernis@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

This reverts commit f1210455e78a610c7b316389b31c162c371d888c.

Remove mouse as wakeup source since Suspend-To-Idle feature
is disabled.

Signed-off-by: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
---
 drivers/hid/hid-hyperv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
index f33485d83d24..b6d0f7db4c93 100644
--- a/drivers/hid/hid-hyperv.c
+++ b/drivers/hid/hid-hyperv.c
@@ -293,9 +293,6 @@ static void mousevsc_on_receive(struct hv_device *device,
 		memcpy(input_dev->input_buf, input_report->buffer, len);
 		hid_input_report(input_dev->hid_device, HID_INPUT_REPORT,
 				 input_dev->input_buf, len, 1);
-
-		pm_wakeup_hard_event(&input_dev->device->device);
-
 		break;
 	default:
 		pr_err("unsupported hid msg type - type %d len %d\n",
@@ -502,8 +499,6 @@ static int mousevsc_probe(struct hv_device *device,
 		goto probe_err2;
 	}
 
-	device_init_wakeup(&device->device, true);
-
 	input_dev->connected = true;
 	input_dev->init_complete = true;
 
@@ -526,7 +521,6 @@ static void mousevsc_remove(struct hv_device *dev)
 {
 	struct mousevsc_dev *input_dev = hv_get_drvdata(dev);
 
-	device_init_wakeup(&dev->device, false);
 	vmbus_close(dev->channel);
 	hid_hw_stop(input_dev->hid_device);
 	hid_destroy_device(input_dev->hid_device);
-- 
2.34.1


