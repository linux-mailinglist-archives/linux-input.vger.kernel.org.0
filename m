Return-Path: <linux-input+bounces-15128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A8BA452F
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 17:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D569F4A309C
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0A038DE1;
	Fri, 26 Sep 2025 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEw7wFL8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF971E51EC
	for <linux-input@vger.kernel.org>; Fri, 26 Sep 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898827; cv=none; b=iEOwvcWkdLTJBBISByTwIEjPrq0faDDar4gVZOwAw7ax8Zbhs1mVe7v76zETT02cupYNW8LfdQ0vTM+qeARrxq4caQAFu5BKQTxFgw56EOTJoI+8kidXDz+KAPe8Ub2XhKOZX7YQldInwIgU4Da5abPJq2d4tIaQeqtBKzXxz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898827; c=relaxed/simple;
	bh=9H4Iy5ZQioUbGAt3cq2QPsffBJRpfU6SmMhpX/U27b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcSg+Ld1n1aGb8znU33U/V8iUTYd08dfgN7q7gRwg02pRNEdNh9hAJZGpdkA1kqYRyPXWI+thkuCDBSHtkRtIUAM2fElN3JWA8dX0pUGKq3BQydPqGL+YHRlT7PWtU7VO6ZJNkjBu9jDtEF+jAfx4CCVLP5SyONhsPNoUWfZAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEw7wFL8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f605f22easo2072405b3a.2
        for <linux-input@vger.kernel.org>; Fri, 26 Sep 2025 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758898825; x=1759503625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6D/jsLcW0Gr7inyVqcSEs7jW1/FD06YYHLSEbTVz1zU=;
        b=cEw7wFL8+2j4xMfQ+E1CC3IDiOrfisilPHMZqnPAPxqD69kmWohV/If8RXAzMF5QgA
         2Rpt1p+A2ikL5Bs3BpRongP0FYAY+106iaJ3FjU2IzXtamS9o7qOet2I4q7+21YLsocr
         0nxcORBC0op0p/k5dBphwLg9PNFQ8I/kodwKZohlNoWz4GWiDgZBPH3jxejfGN78QBvH
         +BLgs3opXYD9qi9CBpI+W25pF9aVyFTDnkP3cIxCayBFi3m9SQuWmkdU1ukgBkFLF2ns
         MWSkS3kcJTRJDz+fDeZ3cYPD+61xIRAaODYkYM7EPodNvMctxxw2stVitD83aRt/sQdU
         UgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898825; x=1759503625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D/jsLcW0Gr7inyVqcSEs7jW1/FD06YYHLSEbTVz1zU=;
        b=S9gVOpjshCqsN5NPNqMpo/fR8QUkdZ6VMnIA3eFQQD9wXmNEosfbPGr+571Z219I0R
         FNowbZYFwMIOMpdKpvZW8q3gtyucyRGwmEkdWzdwXXkpDFzhxw3Zq7SFDsWfFjLEBmHt
         luDLqYCxJODdDLxgmxW5u8ERCOhW7U5bekQ1zRB5MWAsf9M2M264cUQO3g/ppdI4U8cK
         OnUIKpRcumciqYsNvrrB28S0S3pTkJq/UH/Ms/U4MNzXArUDotlwdwVDkxsK9/juo24V
         ZKH/HXrXMeE2dtuvK+GRGgpgLGx27mSn71PamrNty7fh16L1wdZbrnv9dtVjWwUfbPgp
         lb6w==
X-Gm-Message-State: AOJu0YylSjJH6gd4rn5fHQEutUS+j0G+ZIrO/fqSzE5RDh/VlygVpYla
	K5P7kdVFlCtWuK+rabMZW0+EZfbSlUdYgcilg65NqCQfE9BwrcK9sw9h
X-Gm-Gg: ASbGncvwkxc5CuwK2/Uz6DlP2tyD7GlaqbnYSaO1fWqbzdh1/yf0SxNUQCk3hG4XFKM
	5UW7TtCOFjBW6g3aTZ6Gx3BJ7Mhex2kU8CTgbWz8mOBg2Vup7BZgeIKGHvHhNnguDrzeZgqAnod
	5RipmcQfRSrHs+KPUJfYKW7HLRBxoD3FjiLETCDTeeiQMUc//EcGGjK9d+IEnnehyOiAIDLaxRD
	Zi5S6vEjUdW6xWL+nIi4HQQ0Ywqd0dDPbM8vi1FIJajPx/+ZapM5lYSzCvf+zgD9JP7w4jHhshT
	qy+7Hf15BdWdcOBfcp3nlWvpBQbfRvgkLhIgf7T80qUQ9y+qBn4mYPePPaFhPOJmTDwo8PgsJNI
	EpTbeXQj84CASPTZfxv6U9xRLuSf/yIHcrQpvKDU=
X-Google-Smtp-Source: AGHT+IE+iWzUhddIAroqnNSYAnKwkrlMRDpTbw935pYA9Du0mnB7k0yS2TSf6oe63ECHy0yPKHl+DA==
X-Received: by 2002:a05:6a00:2d06:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-780fcea2dc8mr7639643b3a.19.1758898824647;
        Fri, 26 Sep 2025 08:00:24 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm4586044b3a.88.2025.09.26.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:00:23 -0700 (PDT)
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
Subject: [PATCH v3] HID: cp2112: Add parameter validation to data length
Date: Fri, 26 Sep 2025 20:28:11 +0530
Message-ID: <20250926145811.273174-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
of parameter validation for the user input in I2C SMBUS ioctl in cp2112
driver

Add the parameter validation for the data->block[0] to be bounded by
I2C_SMBUS_BLOCK_MAX + the additional compatibility padding

Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
v3:
 - Fix the commit message to not include the changelog

v2:
 - Get rid of magic numbers
 - Improve the bounds check

v1:
 - Add bound checks on the input parameters at the driver

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


