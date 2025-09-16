Return-Path: <linux-input+bounces-14757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750CBB58DBD
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 07:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E89048765A
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 05:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5DB264623;
	Tue, 16 Sep 2025 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9HdjQS1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E18262FE4
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 05:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757999578; cv=none; b=Vbpr4ZhDgZt/8ARrczSTCH6CyJIofl1VGBBhT9GIgUSKcUGCIs9FLlMGX6CipMcl9jUK2vVNbtI+fW1r1KpKztP/C6WKUabc9q9Uad9l6dl2fyNeGQk4i5xgm8eJzWhMXivZ3EjlRIfxO6QVOG7k8g7vDHxy7r/PTpiltkPl9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757999578; c=relaxed/simple;
	bh=YCagT15TJjexqc1Up8uabF4bbwgjLWA6JZqJVkY1Ick=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzFvu4IkhadZQppP1YjiAccuBUo9Bzgm4mVrqjwH4VAOUVskjMK+MHaVr2DVS4HPNj1ktD3l8ZfqGiysxu/9mjU0bgQ9+iHCQrgv18S6LTKhHPt3ES1A6AA2TnGLM0tUGGW7dkwPz5Fq840QXCTC+fwUrkpwxI7YZL+SrEgE1Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9HdjQS1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-25caef29325so43823485ad.2
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 22:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757999576; x=1758604376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBOq3NZ+rM2h9sy3fGHWYF48a38jqJCkuNGc5MxKF+A=;
        b=l9HdjQS12U4qnpW3qm+sVeeDpgaAqXXT7kyu9Y+UNv+E6HOgJ3PJjhBv4o/xI1zlAa
         tOBrrFwLyXa0j5PNKdIhpHGgMfeCh0e6xrr19Fg+lnyuiU3aKWVwWmPtW7DiN2/jtKdp
         vx5IXI/iUqXxh3fNSnP4uYZCOM2AdICJVrdZDYSPYB53xJEuoHxusBoqNXjUdgN5/Bbe
         uD7sra6ZYzf4GOxdA8/pTNiJWYBykDEXm0e9Xeh3leHV4xTxAgUm6a61CRwWyAmoN6QQ
         ly5nXNJYkS+YGJWHYnU8T1HFMbplQ2By/jQaLK/LjgmAQ5J0sIerHuPw3nLKHrHDw4fQ
         rYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757999576; x=1758604376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBOq3NZ+rM2h9sy3fGHWYF48a38jqJCkuNGc5MxKF+A=;
        b=Y8gUDvcSPjz8+eqyL/7RjZwVSl4r0/zo5Rz5eiagq3Kxofcl+fYGuNAE5ioo9/CDqh
         IuSeCDrZpM21zuW/rHXoaxRJhm+2nYTYdOD15MdIe7uS895Zk6/WItqjlElok/qyyIOb
         yg0JVbSupiRLixOrEhb1B417Hos3FGMoxTX8k9Ge+TTeG6ixFGS44pJObyJ+JDQnEmrR
         r3bViWTePTEoqH0JkmgqHnm7K9tcesbDwKp3IufBD+a2j/y7VUj90h9v5SPlQ5Cz7DVx
         qlUV6L0h750XJ2eaYhSZqC85sViU04ZlZMcunbyoemul31E0wSBoLzxg09ZB/FbcfFQN
         47Ng==
X-Gm-Message-State: AOJu0Yy9mWyu80BPozO7W78GTYEDe876EF1QSGip+fPp16PiQRqmC1dg
	UXlBGyukWYnaKXznyIqTQsG9QnZguoHdget0UQBoQJyroefB55aJxHPT
X-Gm-Gg: ASbGnctgy+9XQXy4w52cvEQWiYoh5QVXV5dubQwZEqi5OPxIr63EErISzql4Bb6+2I/
	u29AMgZOe2Wc5bd1ksCXK053iB+vK8gqYtK/Q5qG2dnpo5W/QhY6OFxsl1qio6JcZ5esTRElujS
	rQFMzY4TONPOAuzMlKw0k34Kr8mjRKoeCeIGIqCZR10aptHVc01pPEr+E28tY2PwDvDBOi3BXtC
	IKhXil1a2uhldkzE1wUWS/fSWXMYpAW274PPF4UZJBJ4r+0nLGEa2LzcBVGztlaWsyhw1oWDYEY
	PgEf5mW4OQfvRWgTQM07w3oNGr3JmQ29P/y/UD+bs2nhFt9XZGPanPxMrplWwZ2bT1P8izl5Qfy
	SnO/ZYbByVOLcR7XFZR2w7AlMPHYTLeQcV/kEi6Y=
X-Google-Smtp-Source: AGHT+IE7OBjzV/92I2FhRFhRyz0p6Dc1x8NjHMGdKfNgjrPBrsrB5BEKW/jgDKL3ClaLwqWrxBdTgQ==
X-Received: by 2002:a17:903:2f08:b0:24a:f79e:e5eb with SMTP id d9443c01a7336-25d26e455a4mr180824495ad.49.1757999575963;
        Mon, 15 Sep 2025 22:12:55 -0700 (PDT)
Received: from cortexauth ([2402:e280:2313:10b:d917:bfec:531b:9193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26295996ff6sm80994095ad.64.2025.09.15.22.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:12:55 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: jikos@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Subject: [PATCH v2] HID: cp2112: Add parameter validation to data length
Date: Tue, 16 Sep 2025 10:40:55 +0530
Message-ID: <20250916051055.317581-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 for the earlier patch, where a few bounds check were
unnecessarily strict. This patch also removes the use of magic numbers

Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
of parameter validation for the user input in I2C SMBUS ioctl codeflow
in the report

I2C device drivers are "responsible for checking all the parameters that
come from user-space for validity" as specified at Documentation/i2c/dev-interface

Add the parameter validation for the data->block[0] to be bounded by
I2C_SMBUS_BLOCK_MAX + the additional compatibility padding

Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 drivers/hid/hid-cp2112.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 482f62a78c41..13dcd2470d92 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -689,7 +689,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 			count = cp2112_write_read_req(buf, addr, read_length,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			/* Copy starts from data->block[1] so the length can
+			 * be at max I2C_SMBUS_CLOCK_MAX + 1
+			 */
+			
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block + 1,
 						 data->block[0]);
 		}
@@ -700,7 +707,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 						      I2C_SMBUS_BLOCK_MAX,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			/* data_length here is data->block[0] + 1
+			 * so make sure that the data->block[0] is
+			 * less than or equals I2C_SMBUS_BLOCK_MAX + 1
+			*/
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block,
 						 data->block[0] + 1);
 		}
@@ -709,7 +723,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 		size = I2C_SMBUS_BLOCK_DATA;
 		read_write = I2C_SMBUS_READ;
 
-		count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
+		/* data_length is data->block[0] + 1, so 
+		 * so data->block[0] should be less than or
+		 * equal to the I2C_SMBUS_BLOCK_MAX + 1
+		*/
+		if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+			count = -EINVAL;
+		else
+			count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
 					      command, data->block,
 					      data->block[0] + 1);
 		break;
-- 
2.51.0


