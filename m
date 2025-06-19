Return-Path: <linux-input+bounces-12961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D713ADFE32
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 08:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 054571892894
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 06:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A045725F988;
	Thu, 19 Jun 2025 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ohcmyJYq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828F25C810;
	Thu, 19 Jun 2025 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316087; cv=none; b=BNGpEflwoEUIiuTANp+WubcZSeqzQcm/z6K6PlBQSK8O1lCc2d/Pj10O4VvbVEwO1xow6GC1icnFPgmbCQ+nDUekeDg08nn6R0CUdkWJZgzaBUVUbyhPj1waaFI8oLLMTgr7YfFfeZaY5k+iVoQzWGmiw26dfCKcZ4qQjyX/lB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316087; c=relaxed/simple;
	bh=DKIWEFD7IuiHQJbuY8wGd57bhJyvqmxIfitMGqJ6ZdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCY80gSriuQlbJXBn3sr0DdHRky15NnK8jN8mPQs/KD/YRreJD7dy3YycFd9wGKZQYk8aRcQ92vLtgI06IU8PJkR+k/ojUF5B2UAbaK436pvE8fTPd8109thHHNG/IsYZmQPz706sPUgPvb0ctDEGJfWhVTzhTQ/E4pBRv3fgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ohcmyJYq; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1750315985;
	bh=wCgFcf8S1qz6TsKVSV0g1x9/rKEOEW9D85QGwXQvK74=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ohcmyJYq6nNEquCCKhkprx2Ku2LULev9JfWxpj4W+tS7VN109dWRqKQ6g0vSI0Ah+
	 vPRQvm282gTOpC9S9dh9fn1IsviucXJZ8DeSNZmX3mfdoZ7492kM0+/d7oijh/RmM8
	 YVVjbe/1JY07+FCvSHIVITEeZULA0rjzh+/ymYn0=
X-QQ-mid: zesmtpip4t1750315979t3e7fd250
X-QQ-Originating-IP: HY7OJzCHKvNXxA3FIXoKz/JEr+i4hyX3SN3hoQqaFSs=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Jun 2025 14:52:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11116470041164547082
EX-QQ-RecipientCnt: 10
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	javier.carrasco.cruz@gmail.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org,
	wangyuli@uniontech.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.4~6.12] Input: sparcspkr - avoid unannotated fall-through
Date: Thu, 19 Jun 2025 14:52:41 +0800
Message-ID: <5C0E9B30D2B39A0D+20250619065241.37834-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MRY6qckr/MVJEExJqnp1BH/QKQK1atcuSH4z4HyTlpzMJrsp7E/BS5My
	osjEk+ik/E+EJiXyG39h8jI5q5PZuq3ybxBqLnTr31gADAFdhAeZGgcQkOteg4FzGrqkjV6
	8tYOk8/3qjzBuIhZbh36YNPyqhjIn21ka4egylx4GOwJk1NredqdchNB78u0yicRw78dFyA
	LAotO4U/Wq0xiMOhFEHpHMMD9SHpQkACwI4KaAm3z8Db22eOUbT21mIBvhX0sHXUQs+ywKz
	GRtL6g0t4Or1lVv9acEkGIF8G5RoCe1yFtepCw4VRBPfGcKqk0kgd/5c/cmraTn+ryA2Q+q
	laXOobUEnobvpRkYBI2l/m6+iNNn0Bwm9pF395DBIhjdw4FiiqgykESVzeqbP4pmZd53HrA
	1T9kMvaM0MTYIRRW7XuM9xy6tn6PYbNhUJRRNtzeHkKsWHsEy3+ONacDymlCe4N8eTCCUHR
	KQk+GCvx+cWXwwo1EaqLoMOCrA0XVg9CB4ANRF3PwvRfuwlsxTniA+5i9ZiwKmGNi4ZUj9y
	7KDXmA69gmIMmPg1tpEUtRBLFpxrRVhMB+nn4aBDawztNHpMLxIly8Wa/1CsCLrtyEIdfHD
	JtitWzwVsodGDGGb4oYPNXo7rjXg/xPIrkyTwBnBi2KH3nnE4VK1GuSRfcislbaAMjkHxzc
	uUvWMlQoJtAo9xp+QBZ5wPrVK0755fp6zDnCAHNokRQrDI24kPjdIYinHmPgB/Ndtpjxc/I
	7ZrAbmwj40ttBME+VOXvY1O8i2dlMty2d5ezwViyfdaQwdK0PnSxigVWBpwQbkZgMva6AFS
	fbfzQdE/o6vBrC79t7hW2rRxbOBqgvsoGnpd5UcAv04A0JJSygEXgge/JQFY5TzX+XnRnf9
	neZC9xMpLWKn8m/H/eIuObVgBrtdLSwIqWtVjT2WnSCwLoKijCbO9qb5nXf1UCYCUmAPfwW
	yb9hzWOfVt4qpWLN+4RY+IYoW1/yTu8qKK/cWPQZQKf6kMdxgcD0cipU7LdwfUuuh4VX7KV
	5V7/2Syw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

[ Upstream commit 8b1d858cbd4e1800e9336404ba7892b5a721230d ]

Fix follow warnings with clang-21i (and reformat for clarity):
  drivers/input/misc/sparcspkr.c:78:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     78 |                 case SND_TONE: break;
        |                 ^
  drivers/input/misc/sparcspkr.c:78:3: note: insert 'break;' to avoid fall-through
     78 |                 case SND_TONE: break;
        |                 ^
        |                 break;
  drivers/input/misc/sparcspkr.c:113:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    113 |                 case SND_TONE: break;
        |                 ^
  drivers/input/misc/sparcspkr.c:113:3: note: insert 'break;' to avoid fall-through
    113 |                 case SND_TONE: break;
        |                 ^
        |                 break;
  2 warnings generated.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Link: https://lore.kernel.org/r/6730E40353C76908+20250415052439.155051-1-wangyuli@uniontech.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index 20020cbc0752..a94699f2bbc6 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -75,9 +75,14 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
 		return -1;
 
 	switch (code) {
-		case SND_BELL: if (value) value = 1000;
-		case SND_TONE: break;
-		default: return -1;
+	case SND_BELL:
+		if (value)
+			value = 1000;
+		break;
+	case SND_TONE:
+		break;
+	default:
+		return -1;
 	}
 
 	if (value > 20 && value < 32767)
@@ -113,9 +118,14 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
 		return -1;
 
 	switch (code) {
-		case SND_BELL: if (value) value = 1000;
-		case SND_TONE: break;
-		default: return -1;
+	case SND_BELL:
+		if (value)
+			value = 1000;
+		break;
+	case SND_TONE:
+		break;
+	default:
+		return -1;
 	}
 
 	if (value > 20 && value < 32767)
-- 
2.50.0


