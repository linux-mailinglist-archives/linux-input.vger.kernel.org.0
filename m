Return-Path: <linux-input+bounces-11753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CEA88B65
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 20:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFEB53B4A9F
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 18:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD6829116D;
	Mon, 14 Apr 2025 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LciUnnjd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4704629117F;
	Mon, 14 Apr 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655598; cv=none; b=flXJIbqBOgm1zLVkn55le7YXKDQc1C36I7fary8EFINSnhjtHnzLafghmu5U4WOldpGb+KaKDRKsKoeJFmpPR5Z8oLgFCvGBSvNy3YWAgaixY4eFZOtw4XAhw8tpTFXD43LRd2DvglT9txRwk9vrNDrLglv+uKNmb914ocmW5e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655598; c=relaxed/simple;
	bh=QtL/w4oe2AwHzya7H0JfbA+6Ec/0JFqbbAqse2yJxyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eG5mSZvjpOSvMoAFIz3lU1PRFZ++Hl9HIxOKaWt6Ab+KDbUHQ7h+AAIsg1f+EIJKIS07+GhrJzAxF5UpiMlFDAidmOh/TF99tpxm6NrriLCUEJB+WRQHwvG8hSuS2ZjLJdMnC+1/1qmzgyJb3x/8FoxFSkQoCyVNTVaQiux6O9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LciUnnjd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso34096555e9.1;
        Mon, 14 Apr 2025 11:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744655593; x=1745260393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7nb0sWORaY1H71B4FGLUbrzKZyXaQvzFcr+AuEY1EM=;
        b=LciUnnjdkI1hDxdqhkadJWjLWeiO0g+nbHpQxyigZZtVMdpNBHBvGy/zXxaD9x9XrJ
         UPf8mHWPmCmaZteT0Gpj9S3nclzerLWD4zdZbm+n9vTCuzsZ0wrKwnXGKIZwau5eTbZN
         i9Q1KJDwNTR/5173ixWT4MYdFDsHogwif+cqOIfXFPdO8NpA74cT6PsVlay6nGvlz2Ks
         7nC19bhx5Hh6Inigv1kHSu6k888X8l/mLLrj7SnrhGvXvv4yJQAEr9aRXQEkNvwzq+Zd
         gV57koABaR1+PR5UA2gHOr1HfkJRaosRQRuDbDf09xKyaRYLWC1fVT2vhfbGpm+WM7Q4
         2j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655593; x=1745260393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7nb0sWORaY1H71B4FGLUbrzKZyXaQvzFcr+AuEY1EM=;
        b=oNmrBggZT1AwvxNEK31icNe0nY3v8HvoHt5hO4vPd0ISVtcjTqbCGeCysPnncj10xo
         yDKGoxg9TSmCEsuwf0cYTcvUccy/mr8cwSZfSlNwuFMwTVa+tf/3yBL+KzQnKtOssp9f
         9yWf8faeVdNpxQopo3yvaHbJbo1Nv1PcLONO74KkBph14YZDzmjtMLc3X48vp3zdK5vZ
         9qpT3tHVAO3Nl3ieitL/UIDxwt3e9MPQiRuNmqy7LHS9sHanmoAsZkXbD/sSiDhIWX/G
         toXUVfiJZ/YZ75Y2mrtOulNNZMLEum9kE6my2Gt5Z98WDhAtLsYmgkv7cjGIQejaYVPr
         BS2A==
X-Forwarded-Encrypted: i=1; AJvYcCV3e4rtIalvFN9zp3Ds0M89ww9aRp18MtXa6mg1KdZxCPFPK3IpGQZc6InDL0lXfHQtZjMLWKVu33OGBvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvRnvxdIPPj/fX2DchqP/XXb25aw0KQ2TPVtEmwvrzW6TnghNx
	K5mdu+iQQfXn722E211BpqzPc8bU/a04FigGZO5TH5sWcYz/OoDD
X-Gm-Gg: ASbGncv9Yw2SS/cSCFgyfJLh9wG3slFF5arB+yp7DSebc58z4Q7pwiNKMLhtVRqwyPO
	xEQ2eipOmlOFicv7lbba/VM5o0230cmn5AJltJzWi3YHPYrOgUtxZgenS77fRl4Rd0L0p7++5Jk
	9bFTBpNBfjjTFS9XQ2imTBEcUPba8UTz8hu4uKssQhCpLjP6U84efHUwwC7Wm5RjWqmYOu4TJyB
	91WILPl6M9fJdebiQiqDfDyXyUq91zan+184Iycx7KqTvxey8fz08Cib8u3onvksuU8yir3rdDJ
	d9Fp+Z8xR1HKgD/YrsU9IjuXCwJhu30ZBFY6rQcV9w==
X-Google-Smtp-Source: AGHT+IG4hC76gvJZzOnqQ/srsV+dUkXRPMxy8B5XOL3Vd/KWoCF67dr+dkWx3XIZak6dqgHbDsq2Fw==
X-Received: by 2002:a05:600c:5126:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-43f7de61a1emr5317235e9.32.1744655593318;
        Mon, 14 Apr 2025 11:33:13 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:2c4f:a30a:c7f7:acf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d6e8sm192754795e9.23.2025.04.14.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:33:12 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] HID: wacom: fix memory leak on size mismatch in wacom_wac_queue_flush()
Date: Mon, 14 Apr 2025 19:33:09 +0100
Message-Id: <20250414183309.11460-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In wacom_wac_queue_flush() the code allocates zero initialised
buffer which it uses as a storage buffer for copying data from
a fifo via kfifo_out(). The kfifo_out() function returns the
number of elements it has copied. The code checks if the number
of copied elements does not equal the size of the fifo record,
if it does not it simply skips the entry and continues to the
next iteration. However it does not release the storage buffer
leading to a memory leak.

Fix the memory leak by freeing the buffer on size mismatch.

Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 666b7eb0fdfe..3e4f823f8ee8 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -87,6 +87,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 			// to flush seems reasonable enough, however.
 			hid_warn(hdev, "%s: removed fifo entry with unexpected size\n",
 				 __func__);
+			kfree(buf);
 			continue;
 		}
 		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);
-- 
2.39.5


