Return-Path: <linux-input+bounces-7222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A98997085
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE5482821C5
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C840F1E1031;
	Wed,  9 Oct 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KtGo64TP"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4731D359E;
	Wed,  9 Oct 2024 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488680; cv=none; b=HaNXgnrkddWhGJNfBsfRRbEg6oEEyS45Q3Vg42Mf8byAR/pL4elbCGoaWaFzrCFRS0/pk17ctb7ubbsUN0XZK0KMhJccbiXeGHfDc1cKpEjGdOYikkvUnGLsdkjwhW38xs5mhGM+1dYTqJnR+J9ooA877RNlvz57suupuJgC0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488680; c=relaxed/simple;
	bh=hNNoS3Kj/B2bKaituE7QLZaNM10cqzDk5p7c7ApO2GM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cj+dOfOsQb0esGNrbXKOb5yEqlwo3BYn0LWT6jrxshcA0vlDhZSvnkTppnkyJfrBbJPXbv/oxrUNQYis9wP97d0gnxov8MJ8my4Z08hX3vygJJm9tqJHDTeSBVrYobZ0QbuM9MMCkblTNk5idnoBgrxolygEvGltwIyJrkp9/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KtGo64TP; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994USGe019251;
	Wed, 9 Oct 2024 10:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=v7D5OK1F2vkHYZzM
	H/wqdmPxU26UrCk9Ppqj2hXcn04=; b=KtGo64TPhd6HATbmfUoaITaKMmcUZiC6
	bGDp/tt3uQ8MRSklnTNXNdFXocoEkz3E582IucWGIWtlE3hspd2zlQb7kixWusHY
	0Lyx26Nqme6U0x7MRqW4tjAbmYFU7zvyhp7NzNh3wFetf7qZtN9+GAJm0amYrRFo
	6qGAcT2Vb+hx3N4r37cuqg+3I3cP6wAzgejoHNnQ2XIqx/KQJjZVS9YB7NNCn6cD
	izjuqMLZYeSIkV0x3Rqosj4rASskGE7Il17DQxGp8+x7u954GSM5gjKr9DiMFGNh
	vqO3r4B8zjSZNx+x9LMOufnecNQjpAZmUH3AAaEehXd6eQ2Anp+4hg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vhwgnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:40:56 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:40:55 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:40:55 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C911782024A;
	Wed,  9 Oct 2024 15:40:53 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 0/6] Separate notions of max concurrent playbacks and
Date: Wed, 9 Oct 2024 15:40:40 +0000
Message-ID: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1780pHll5wWSikdqtcLcr0dCJOhKld3S
X-Proofpoint-ORIG-GUID: 1780pHll5wWSikdqtcLcr0dCJOhKld3S
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


