Return-Path: <linux-input+bounces-15126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB5BA40C9
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 16:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC1A3B849C
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 14:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484DD1C860B;
	Fri, 26 Sep 2025 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqSNXsCb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6838189
	for <linux-input@vger.kernel.org>; Fri, 26 Sep 2025 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758895786; cv=none; b=AV5PA52dsJWWeKCll3bRZ2XYXPXyuZqvrWzOlMqv0b3cjFFD+DCgKUDsGvu+bnSwrxb0a9J0LFKU09mR33RWHYwCXq7ABjjNAl+QaCbdnb1WyTfDFRmZdiXfvQu9eeI5Z9YJUNgpsYyfx0c2SkB/+TI/TS7oO67iYNkKkXEkUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758895786; c=relaxed/simple;
	bh=I6/9jdTp8/1MngmdCZph5ifXgKWMK/EdqCPinxqQuNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6OVSsZzbQAY77IyY5WGNJjhxWTgTrrxDrq8kRtzEX6e4wHVkYh0q9h4uDPGpO4AEmCY2eruLqfhJHs9qNx5nMp6agP1dBI+La7IYbrT//n8bGeaZWwcc3k3BhNoBWwVtKlUqoD0JYExXQpwi/lU8LtstyniuSqX+q1FmSs3MU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqSNXsCb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b551b040930so1500365a12.2
        for <linux-input@vger.kernel.org>; Fri, 26 Sep 2025 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758895784; x=1759500584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdZW0ftr/OUszuEc5uNz8JRSH+vp4e+yPjDngAenyY=;
        b=AqSNXsCbxdbLkfIyg3MOP0DlOw3VUic+0NBNnTWjvQbMICHqWbpdiwRwlmOE/cRLCw
         VTDL8Q+ies44se3+wr20Rk++TEgZeht9sP4Yl0Y9x3R2Uwjn4MN47HRHbQO56vu3Xfz6
         a6uZaGm7DiBC5w3CXxSpH0pa2EeVJFAeP6i1pqrTY/v9vAtY1tUyXHlL3LOLTE7zLYZJ
         QZzfbDR8C00c73Wh/kFroNhSdG+mlVhtLUwQ5JyAai6NVEpJBnLCQP1k1BFBxydyeOLX
         a8tJN5mNJkC63qB4lU0P7lAhJlPzRqSx4sglSzaAdKCyFY+WC8s4jp3HH0Ls2UQn3RU6
         g88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895784; x=1759500584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKdZW0ftr/OUszuEc5uNz8JRSH+vp4e+yPjDngAenyY=;
        b=khsGIdg2D5Dxcrnbkb0SDvNe7YL+RCr+HNwJv5sE3j2VPOXRFCA3ODZkWREmZckSGL
         Tnp+Srvpsj/dXDATw6QqgEmNKTxj1TPVdI8KbuT5mYEq0Y8e92Y+b5cjA9fnO0VtC6CL
         D0Fa7NgR3/Hd/cdQHXwTgsSwW+fOVPaxNukIQIa/7VBJsYsbeu0YSZT1kpBSv5LSP97H
         ISV0iR2rsS3QdfqzhVA+fIA+x/U47p8gcP93SEIrzdACJNSPUD0W/9vlmoVmNyz8UZ5t
         8CEa4RfQ+PlmN7Gijk05vGUM192gI00ZaQbSx3bBZPrMx5CyuZnfmHQIpjPCB7VEB5/1
         qMug==
X-Gm-Message-State: AOJu0Yx1rW609Csldx9LJnlhT5ltPdWUILHKS+mxPOHRJxqyoERgDkg5
	JA3nDPrYKmJ3D2dhXB2Gby17efaeRzKvuQw/P9gWI/iosx4TJgAjNSVG/wrRdUQjXLs=
X-Gm-Gg: ASbGncsRMDK6qO2YYrYq+QWB1QyGkbsEWxwXfXcblB5OBGxOS7l0Nfo+ZUnAY5bXpuz
	Raa43lgDQbO4uDFresdmbh5qLmPWrWxlDFsXrfswS1nU7ry3cALCjF1JMRIm99i0RqVByznXW4Q
	Ta9L9oBb9Q/DQrCBSjeszKlzHD4NcYHwxy1uhTxUXPJivL9kbXiwLhwdSu7u7oq1vD68K+jzHDi
	GEnMl782V5Iz/Z55A3OaaCIcRInF+KEteSMt+/lSAB2VAhwVolsTb5Vp9n2tss8+vCAgCNDkAGJ
	1ydqpKEmv9niqET2Gc6oFbvxOBBVP+0Am94gI3CBo0qXbeukktSNqMxlEuTF0UnihtqdWCz///X
	ZPJsqM/rmP/bAUhXzzcN14LHAT32S7tvrzdgpLszBFirnD4at1XMNhXZnc6Sj
X-Google-Smtp-Source: AGHT+IFkJc22u8I/AG9PpYdgB1qjcf+eKead7izUDftEMVWslMjY/E8jHFiu8jtsc2e7QyFDi6xRHg==
X-Received: by 2002:a17:903:1a2d:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-27ed4a4bbaamr80629225ad.45.1758895783883;
        Fri, 26 Sep 2025 07:09:43 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm54797165ad.136.2025.09.26.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:09:43 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Subject: [PATCH RESEND v2] HID: cp2112: Add parameter validation to data length
Date: Fri, 26 Sep 2025 19:37:29 +0530
Message-ID: <20250926140729.267766-1-deepak.sharma.472935@gmail.com>
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
Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
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


