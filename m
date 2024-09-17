Return-Path: <linux-input+bounces-6582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFF97B5A2
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B27F7282B37
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACC915B987;
	Tue, 17 Sep 2024 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e4aqrLKx"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5B45008;
	Tue, 17 Sep 2024 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611359; cv=none; b=L5xt7gz8aJcyYqsNUzkN2jbrgbYx8ogf80qnQYzanqktfeBc+w/4M4DK8PzG7gKSKYpK92GWbp7vxPhSaUlgn1nYgFheH1BNp5k1hx1qkFwkk1Q0LmJ17whiPOHtqx48BjdTnmXOvFd8JARQAgrCAAhQzIKhjhsDq/3htzCkakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611359; c=relaxed/simple;
	bh=hNNoS3Kj/B2bKaituE7QLZaNM10cqzDk5p7c7ApO2GM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LiuKdVNrfJ28grHCpomyidpwnyswFIukjowG/b5cvt6dWb90y+EdQG/avFz4jg/10odZ3W0uAJyyo3YkfqZRifCcNXVanFZZ74k7mHn/ghnzSRcALIwrB2CwwykhdmktnDq2jxcyvrxgJ4iPQ4VzjBhMwtOiczj9sp/mIvCZvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e4aqrLKx; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5vDc0008726;
	Tue, 17 Sep 2024 17:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=v7D5OK1F2vkHYZzM
	H/wqdmPxU26UrCk9Ppqj2hXcn04=; b=e4aqrLKxVwNoTRHhj1O697Dy2NqQKkX2
	d05Q5Q4jRIVXUGUmLrtRqacEEBUCiHmtZkeXpAuPtkP0CCkTzdxH1M3drqDXaD/v
	AGUOwET/xjXLRjMlxo6nBNvQGFfsn8JbSK9pp3VsJaMnDgIPBTia7mV6TDejs3YJ
	UeGOmRq5ub3f70dFGbg9UqsYR1IYwgA1lAbMwTlp+iQ+mCtwetqbir1K/pJnfh3F
	5UrShmMpTNInSULNmQg5KFsWjFgPTqCh0Hd+cGW2OKpog+hVcPof+Rs21WrGwm1k
	ENSxwT1ccyDjkXVm1wsNjHjk3fg8wYK9F1CjYcxu4fqiRfrqstzgbw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41n7vy498w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:39 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:39 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5B712820244;
	Tue, 17 Sep 2024 22:15:38 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 0/6] Separate notions of max concurrent playbacks and
Date: Tue, 17 Sep 2024 22:14:06 +0000
Message-ID: <20240917221412.1003718-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YxDUFC2tu-UPWBgc7L6ZU_CgxiFRDt93
X-Proofpoint-GUID: YxDUFC2tu-UPWBgc7L6ZU_CgxiFRDt93
X-Proofpoint-Spam-Reason: safe

Currently the notion of maximum number of effects a device can
keep in its memory is tied to the number of effects a device
can play at the same time. The same value that EVIOCGEFFECTS
ioctl reports also acts as a ceiling on the number of effects
that can be uploaded.

In order to support devices with the ability to store a
different number of effects than can be simultaneously played,
it appears necessary to separate these notions.

James Ogletree (6):
  Input: Add variable to track maximum concurrent playbacks
  HID: logitech-hidpp: Assign max concurrent playbacks
  HID: pidff: Assign max concurrent playbacks
  Input: cs40l50 - Assign max concurrent playbacks
  Input: da7280 - Assign max concurrent playbacks
  Input: uinput - Assign max concurrent playbacks

 drivers/hid/hid-logitech-hidpp.c   | 1 +
 drivers/hid/usbhid/hid-pidff.c     | 1 +
 drivers/input/evdev.c              | 2 +-
 drivers/input/misc/cs40l50-vibra.c | 3 ++-
 drivers/input/misc/da7280.c        | 1 +
 drivers/input/misc/uinput.c        | 1 +
 include/linux/input.h              | 2 ++
 7 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0


