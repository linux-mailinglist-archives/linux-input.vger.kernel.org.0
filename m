Return-Path: <linux-input+bounces-4990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D692F4E8
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5121283058
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE75A29CE7;
	Fri, 12 Jul 2024 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiRjYevi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720A1C6B8;
	Fri, 12 Jul 2024 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761545; cv=none; b=D85WzU+j5Q/LuX/ofCDRgDwj9FPqf12dP6JMVHBOoYsAACQ4mrc1UYRjcPB8oBu/CJT1MCqSvesRNd/Gzkn7TujsrUEh7J6BCbg+3ip6VbzzPRUTjzqDeTNOAyzsRqsbHbKJehwr18+qCi8xI/kxp60oCP/9oUb8/mWs8nS6Pq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761545; c=relaxed/simple;
	bh=OfvzZ4ZcastGPD/9Ob1NcvP68fwZtVzP/4KXUpknVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1xWFObyGs1YMidqD9sFuSyOTcxZI1rkFwYwVWr/jvib5t+lECkzqD5+pgOoqBmMHauURjkp1S66/tNcqUDAEaGJXgqN20cQSYT9/6RxsCyVIYFe10KaHZKJiEsA5HVAx1eYN9pJGxnXUTIKvnsDgngjHdLnjuouX7REqOE66CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiRjYevi; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d9c487b2b5so1022514b6e.3;
        Thu, 11 Jul 2024 22:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761543; x=1721366343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C178lbLP9Z6sYBeFHv9cLHvCMTkB/9SjHNFleSx05uM=;
        b=DiRjYevih+W5bWnLItlXDFQZsykzCnbdDP0b05m+O/O0vTjy1ZE/6euXaYT3UwNmxB
         hZBVM3n8CMuFsDRi6UBUgeWv1+m7tOcHk1+w8qHjOG1KObAjxSsflH/0HTYnzPEKklBr
         hIksFW7swgup8GJnbLvju+VI8z9dsRPy4dsrtKPDypUyv6nj0Aq9tmFDMTdrm8o+p233
         auA+6eHRMYcR/3CRF9cDlZqcIYx3iOqqxlMlIn7noaP6p2ib6OuYGRnofP0dvgio5vHf
         QhIPxEdu/RZDmxRdHXrKzrAeCCwAtRmdXjyA34yrqzWkij89/1dzYC1zc9JQxJEkwejA
         Hwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761543; x=1721366343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C178lbLP9Z6sYBeFHv9cLHvCMTkB/9SjHNFleSx05uM=;
        b=pA7yhsFGqR7YeAl7Ce2EdbQy978vRNHg/6XGnqq8YCJN0Wjt+9/m4fFonFGvN01ck1
         hSxtgowFRxvZ4JHw4tvTowIqCLPz1WlPBlcRYaWRtyhKJA9+aZY2HJOJtHY816i2Whhu
         Yu9wKfQxG1jCz8d5NUVyXn+T3/YHiAuulB9vpZo1CDO7KGDVgl5rvmr5H9kKVOF6+MWK
         C1cLzum6y5aKJzYVVaaDRDuM5WJ6VC8qVwH4VZTeUtA5EYFKRKBIrKiPt0GSBlOOEGno
         sUaO4sP33zSm6BiLidwz29seih9n4mvO6L8s5CIQVUdlkRxc7V9D+BMj6N3wg57QODxv
         rg8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxoQOMKt9+97vv5Dobcgh6+bx9GuRRT9zsL/fgsUVY5gH0SBuUbuotBXjLgx/ZEjvnCHm00Dl4oLKXI5QJ2Kd5ekGyc7H1f3xayI7Q
X-Gm-Message-State: AOJu0YynHy8i6JkMdsbLWOU7LraLTDthYEwpTSy6qZzGTRNYJEYum+hm
	Fr+HDeZnSkfndm8LHVwW4Qt9o9vhsK2VhObZoKn4NQtlthqjqFYEdKGHUA==
X-Google-Smtp-Source: AGHT+IEdy1fHTEIepg81ny0OLI+jgG6W8qmuyy2JNuXUFd+uy28+EJCK64IVPBtAlsxGM1IWGWmICA==
X-Received: by 2002:a54:4014:0:b0:3d9:80d8:2fc5 with SMTP id 5614622812f47-3d980d8356dmr8508884b6e.51.1720761543224;
        Thu, 11 Jul 2024 22:19:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] Input: usbtouchscreen - constify usbtouch_dev_info table
Date: Thu, 11 Jul 2024 22:18:47 -0700
Message-ID: <20240712051851.3463657-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data in this table is shared between all instances of the
touchscreens so it should not be modified.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index f8a67834a695..813a04ba75a2 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -92,7 +92,7 @@ struct usbtouch_usb {
 	struct urb *irq;
 	struct usb_interface *interface;
 	struct input_dev *input;
-	struct usbtouch_device_info *type;
+	const struct usbtouch_device_info *type;
 	struct mutex pm_mutex;  /* serialize access to open/suspend */
 	bool is_open;
 	char name[128];
@@ -130,7 +130,7 @@ enum {
 	DEVTYPE_ETOUCH,
 };
 
-static struct usbtouch_device_info usbtouch_dev_info[];
+static const struct usbtouch_device_info usbtouch_dev_info[];
 
 /*****************************************************************************
  * e2i Part
@@ -960,13 +960,11 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
 	if (ret)
 		dev_warn(dev, "Failed to submit ACK URB: %d\n", ret);
 
-	if (!usbtouch->type->max_xc) {
-		usbtouch->type->max_xc = 2 * x_len;
+	if (!input_abs_get_max(usbtouch->input, ABS_X)) {
 		input_set_abs_params(usbtouch->input, ABS_X,
-				     0, usbtouch->type->max_xc, 0, 0);
-		usbtouch->type->max_yc = 2 * y_len;
+				     0, 2 * x_len, 0, 0);
 		input_set_abs_params(usbtouch->input, ABS_Y,
-				     0, usbtouch->type->max_yc, 0, 0);
+				     0, 2 * y_len, 0, 0);
 	}
 	/*
 	 * The device reports state of IR sensors on X and Y axes.
@@ -1045,7 +1043,7 @@ static int elo_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 /*****************************************************************************
  * the different device descriptors
  */
-static struct usbtouch_device_info usbtouch_dev_info[] = {
+static const struct usbtouch_device_info usbtouch_dev_info[] = {
 #ifdef CONFIG_TOUCHSCREEN_USB_ELO
 	[DEVTYPE_ELO] = {
 		.min_xc		= 0x0,
@@ -1273,10 +1271,10 @@ static struct usbtouch_device_info usbtouch_dev_info[] = {
 static void usbtouch_process_pkt(struct usbtouch_usb *usbtouch,
                                  unsigned char *pkt, int len)
 {
-	struct usbtouch_device_info *type = usbtouch->type;
+	const struct usbtouch_device_info *type = usbtouch->type;
 
 	if (!type->read_data(usbtouch, pkt))
-			return;
+		return;
 
 	input_report_key(usbtouch->input, BTN_TOUCH, usbtouch->touch);
 
@@ -1538,7 +1536,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 	struct input_dev *input_dev;
 	struct usb_endpoint_descriptor *endpoint;
 	struct usb_device *udev = interface_to_usbdev(intf);
-	struct usbtouch_device_info *type;
+	const struct usbtouch_device_info *type;
 	int err = -ENOMEM;
 
 	/* some devices are ignored */
-- 
2.45.2.993.g49e7a77208-goog


