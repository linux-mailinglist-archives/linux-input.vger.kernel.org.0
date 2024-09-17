Return-Path: <linux-input+bounces-6585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445097B5A7
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1751C282B37
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC83192B73;
	Tue, 17 Sep 2024 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ezLvFGfZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A74A176ACA;
	Tue, 17 Sep 2024 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611361; cv=none; b=E6zBjEYI+b2hu0zJqRuDRPFWhtmt4dYlrBL9emS7V2kn68qxq1JSWFK6b8kSyK/3O18KdOXGRo+lgBI03ye29so1Wg1w00i0PrvUcaRJnOBYf/5YFxTa1NjbcR1NCB+HUlZXvkh/Shgs0ABqHV4vPr8pTEFPJvA/mYV7/m1SRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611361; c=relaxed/simple;
	bh=U2CYGTxUaPJupOKjqGxiPCQvTOzqcdal4HO3jn/PbGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgJ58RT/SiGWBHTLl75oy7UtneKv9V9nYZIZs0X09/4uSJQMfnLtT+7IFnsgOGjLHMujw8j/pQ8SUasgmqzc6cg7Df9MxEHs1Ygo8lSstx89BaEO3ou5WSP0tv9ObH0mEaFQx86ll74cJCaZFIrgVMnG2v1J3eMiqaZToJlv2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ezLvFGfZ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5jtAT024984;
	Tue, 17 Sep 2024 17:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9p38P5q18aNIzIGayOpW9J2z4hCzSUXeTTEplhYzGgc=; b=
	ezLvFGfZ8r1daQc4UJZg0WiqRzwoDYYVP97w4boHDD6S11lkJB/M8FrRrkUq3uVN
	m2+1kY+DHWIA4VrC5sN8o1CeRN7/u7flvbn3Cc3LxS+S388vLbqFNiwt4IxpvR98
	Br4D4Ki0yKC5kPsRy5BJ8Qdo45YyVgWdJyAxpbZeBRMnWk/tTGnL9DOkYs2KAdW7
	3o2ZusVFL9cFJa7gBxjPemmhcWIZNvoIhM9cHgbbzVnzsj+fpQq0tbZ3SZUzAbQC
	B9NInY2V1CdT9k4VB+wd7laFslWOWfmArt0wyXQDwKifcdwHZDWs05osvBfWSiLa
	o7StEpVVxVneTd8BL9gy8A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41n7vy498x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:43 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:41 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CE3AD820244;
	Tue, 17 Sep 2024 22:15:39 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 1/6] Input: Add variable to track maximum concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:07 +0000
Message-ID: <20240917221412.1003718-2-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917221412.1003718-1-jogletre@opensource.cirrus.com>
References: <20240917221412.1003718-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3aogr52BPCsQWa5YmJW-rXyVpi2ZZLRn
X-Proofpoint-GUID: 3aogr52BPCsQWa5YmJW-rXyVpi2ZZLRn
X-Proofpoint-Spam-Reason: safe

Add max_concurrent_playbacks to ff_device which contains
the maximum number of concurrent playbacks allowed by the
device.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/input/evdev.c | 2 +-
 include/linux/input.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index a8ce3d140722..42b55e03696b 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1069,7 +1069,7 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 
 	case EVIOCGEFFECTS:
 		i = test_bit(EV_FF, dev->evbit) ?
-				dev->ff->max_effects : 0;
+				dev->ff->max_concurrent_playbacks : 0;
 		if (put_user(i, ip))
 			return -EFAULT;
 		return 0;
diff --git a/include/linux/input.h b/include/linux/input.h
index 89a0be6ee0e2..6d6e450e2231 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -531,6 +531,7 @@ extern const struct class input_class;
  *	device (not emulated like ones in input_dev->ffbit)
  * @mutex: mutex for serializing access to the device
  * @max_effects: maximum number of effects supported by device
+ * @max_concurrent_playbacks: maximum number of concurrent playbacks
  * @effects: pointer to an array of effects currently loaded into device
  * @effect_owners: array of effect owners; when file handle owning
  *	an effect gets closed the effect is automatically erased
@@ -562,6 +563,7 @@ struct ff_device {
 	struct mutex mutex;
 
 	int max_effects;
+	int max_concurrent_playbacks;
 	struct ff_effect *effects;
 	struct file *effect_owners[] __counted_by(max_effects);
 };
-- 
2.43.0


