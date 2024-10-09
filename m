Return-Path: <linux-input+bounces-7223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A82997088
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53D5DB252E5
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B111FBC86;
	Wed,  9 Oct 2024 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OetfuDyc"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41F1991CE;
	Wed,  9 Oct 2024 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488681; cv=none; b=jr3Tx57++bFj9C71J/mRtpH3CXMePyZJaxql6OBJkQ8TDJQ6vd8jpa9QMwiSPi1KL4GCySFco81N9vocDA+C2ybBw8G2OKHmuxWpImbjEbDAZNcmfqYnAvsY9i/b/clnS20c72j9jIwM8cIESafl0mDsmUmBljQGgk0Hm3DaEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488681; c=relaxed/simple;
	bh=U2CYGTxUaPJupOKjqGxiPCQvTOzqcdal4HO3jn/PbGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmVjVstJPpjfbADjqVQX+CCPvv7F+2Zv0A9yx9yOk/pqaptwoCxjmFRsmm4WiAQOZsgPf41jC5VWKQLcQ9sMOxBa+fJe7Rj+TnjaC6FRjnxf+xtUhbIkEQJ6muV/ctobz7ia8n3nSL3XZ4Mddcyv1ErIexm0BHrTN00BGT0585I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OetfuDyc; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994USGf019251;
	Wed, 9 Oct 2024 10:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9p38P5q18aNIzIGayOpW9J2z4hCzSUXeTTEplhYzGgc=; b=
	OetfuDycQRrIHW7MpMOfGdEv1qWWA9ZjpsB0G4ZY6iCpRgrDtynTFZlKLt21crys
	nX22PUSeM2yaipnuIfDcH3+g03KHB/QtTLiGMpUbYCQu3Zqm4bUknUmO+/+LXeTR
	sGI9xUfULTv/GjgQzSpMTPtKVgivIym0JMrI+sOXP01cwP6KGBHFhg9LrsjwIM32
	wmDaxQ5zdpROdIW1fSS3sfH3DHME71Cfnc+iLwvlNnU9NVnOwCeoQi9gLe6nbgvK
	cmqiu8LZMtR24a1xi1mn3vBk6N6eQFsWr7mdPG3xMzkrRlGuS/OCfXIEFgAh76/W
	FNMbh3BxhrnuIMQid2/EBw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vhwgnw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:40:57 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:40:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:40:56 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 47BE782024A;
	Wed,  9 Oct 2024 15:40:55 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 1/6] Input: Add variable to track maximum concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:41 +0000
Message-ID: <20241009154046.1011226-2-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
References: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: f3d5CUn4btAcD480GxIAp47MxzNOu8Yz
X-Proofpoint-ORIG-GUID: f3d5CUn4btAcD480GxIAp47MxzNOu8Yz
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


