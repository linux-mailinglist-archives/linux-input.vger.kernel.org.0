Return-Path: <linux-input+bounces-11759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B46A8935E
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 07:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B963AF6A0
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 05:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2CA2741AC;
	Tue, 15 Apr 2025 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Aap5Z13x"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2924C67A;
	Tue, 15 Apr 2025 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694877; cv=none; b=UJnwgJGdoWobdWnt7E+1p5xPlwA1hoBYf43xr2iWQA8S4dEe0bsF/W2ALpB3yORLlqS0KZiB8J3Ph/X9IS4jJi3Rgv6ldAebKFaf79wtvC3sq2dKlQjLseYd400UKjS2CfnQ5gkwiooyF4Dck4XJuvIuq6GbCIUjsrQs7/OgtzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694877; c=relaxed/simple;
	bh=GmWBW+f/luY62YqPGnQis1uDV16nDrQ2m3plRoAVeCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odpqrKLQD5b7iXzlC6Kea/W5g38Ys8RknaZ56+ouQOVW3zS8Q0ZWBbnvUypAidnz1gPy2/hxE9D8bchnmbsaFE7oWTXxVpz+/6+pEVtzvedVaO52H4X2jxFUvDOLq1Dpd3fXM4D0n891h0/2OIHI5bmsfdKo3zWyomV2jobE14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Aap5Z13x; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744694734;
	bh=ExqqTddKbfRBKLynAmSixO1VnWzyolDH80X+MNF3H6k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Aap5Z13xSbySM3E79BWeiHV73w2H9bvogefelHFZ1D17TaS5Qj5m/98WfIKDItLWr
	 l03uUnMf4lA11dXBxGvaU/32fYsQDwRJNF9x2W4Q8zEHF3/q+MEfCnwEtb91E3Lt/Z
	 NM5XnMnEwA3sc2LA6l7RUNS3orYLcUhYB0S/CB6Y=
X-QQ-mid: zesmtpip4t1744694721tad383a9a
X-QQ-Originating-IP: p4OQ8CJQP7O7PKTJSiyj2RGbhiBJ7XJmTAkr/7zSvI8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 13:25:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17417611640228889567
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: dmitry.torokhov@gmail.com
Cc: javier.carrasco.cruz@gmail.com,
	wens@csie.org,
	wangyuli@uniontech.com,
	u.kleine-koenig@baylibre.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@nuts.ninka.net,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH] Input: sparcspkr - Avoid unannotated fall-through
Date: Tue, 15 Apr 2025 13:24:39 +0800
Message-ID: <6730E40353C76908+20250415052439.155051-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NHsHeYamdwz3/jAh2vjTsrVz1ks9Xf3RXwHFa5dp/SVCt1FiY+6VUpqf
	MOyRlPSfM7WnbFPgUXypm0lfDk//epW3iqaWJxKKDWAHtUtU9I42p9k7c0rlJfpwNt0JUfw
	Wfi66wMyVBzCaLtxN5304L43dmDZJd+zAGad9L0Ypf3oghJWQI6cXs0CSCq1YhMuHC5OCTK
	fr+dxHIFSuF+rrVppugaPMBXKwBY/tRmvBDyaC8dK/sG7a1/K3gg7L1s9UfnGUdNiVrR7HV
	Tz9lwH6fgYaSHyV8hMRGm7kGVlK9I0PX/LvQDEeH3FU2id6R7ll6SAA5cgVIV5oMZUTRqQL
	AtdrCyRfreMC+Gk+KwqNfDr4P01qYNsuh7y23FwlmiKlT6w0+r8+zb+giFIWK4G0Ml0gvNF
	ni7jvgqc453/TTRZdK2UDDbicoVzfTR3PYuqh7RzMsNeVUBexSoErPGAyGkeHDyI4QGMY+U
	0JzLVQdrFUJ59vVMdcTcOLivslItuw1DuNED0pLEKoEqM218vYhHWYGPv4woAGhjOmCWUz5
	kfoqkXN6SeUidwEW25q5bRBsXfem1WEXxtRoJjjmG7/TF6Y7+LAUe5eeoDPRX+q3EYh3l8j
	E70bVTlM3txEGlwy3gmvBZp2c4NJtQYWD3tdC/G7as8+iQiCiq5r40uQI8AOp4sRVX2DDDN
	vwk+bDMP1C3Ozh8VfhUsarlUxMmoiYyEhM/uCCMW1XH6/O26Szb5zNMVBUzRGq0eEciMmuT
	mZUiUz3nl1vh+YCzx1nBtQPzL3//aVr51nPaBfPNYX/HMN1ze+BOjpY03T78SUWOGlKd+jl
	gB0yqzEc1o5E5PNqtUyRH9+G1XuxubI2uNbAr+MnxW0iTjP7uE/SYJx/2gS9i/PnyJvTuXW
	E1kvUiQ+BAir7FM5qxaKrr26lI5aOQLOCZCqXKdv+NnxN7b52ez0CIGVb4temITjKFF7DY2
	3a4eTu4zhFeCuRCHmL/dGtYlSKWNjMJmd4GmHd8PUb+tyqati8QCgtviHkpEpEX7wir2M5V
	zaFqC1Pwt/oDVw3dYtpUsSMSTIAtOZN5vPn+xRZiS5OgjtDc4F
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

1. Fix follow warnings with clang-21:
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
2. Reformat this code block to enhance readability.

Fixes: 215ea853a9 ("[INPUT]: Add EBUS/ISA speaker input driver for Sparc.")  #In history tree
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/input/misc/sparcspkr.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index 8d7303fc13bc..1cfadd73829f 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -74,9 +74,14 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
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
@@ -109,9 +114,14 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
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
2.49.0


