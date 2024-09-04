Return-Path: <linux-input+bounces-6143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4C96B013
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B07A1C2378F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A0181ACA;
	Wed,  4 Sep 2024 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ9riGPe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C881AC6;
	Wed,  4 Sep 2024 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425290; cv=none; b=VFFFH6Kpxx2+5tIcn/MHytjNvHYtllQY/ak68PHCcy10ZXKdWlIUNGlv6p3VF3Axk2lIhF/VnB1fit5rLRX+sJIsA4ZmLYoWt2UPRwEeps6gjPhC3LRtNoW08MeCbg+wHsymdx74lCgYTg81ZiFaimwJh8xYjjkbgfdDjeJjnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425290; c=relaxed/simple;
	bh=MX5l2245cWCFyuhSmKfBVeeYOzs0rOpu1V+s5MOaWJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/IKFRwaBR9mDT2lQ9brT0NKibiphB0kUYP6I7c3vrcHvPoVw+Sm3FJTeRxPWJLYNnc8exD3ZLjRx2GGTC1XtRhwhlmEQUI81JDTW6Zi0VwdH96LKciiww/7463N2pftoPgEt64c2FMxg5o9VI+cNYwYqyurp5zjHHyIFKfDsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ9riGPe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-204d391f53bso43382765ad.2;
        Tue, 03 Sep 2024 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425288; x=1726030088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnxH3T+Ol4TDlhRgYhMY4wGMLL57Q4XBAJGggFJOTOY=;
        b=QQ9riGPe9dSB05xRIWsoMSxZE0Y2fbqHf+9jfkU5WCXL43ag/+yKhFy52l38pwPJZk
         WuQLvBMVko+ah/y1hLo/1XUoHZoy8TwvEubzw1LWihkO0jRr5HG+Qgy46sFGPKc9JM+P
         3Kw+bCGe4SwcR0K8RfVRTJDa16CpnXZLv1z8Ak9dn8JybCFDthBEicRJm3h4S3eXuOMo
         g7GB0XbBqp6LxJ/mQSRxhDPTNvhHEVMGpCn5vVuydFZYPEX5Zuh+wNbcz6yRTitJCSoo
         IU89o9n708lASq69vS4EciI2z9e5Zh3jQnL6gk+9fjmkFBdQ5OL78yvuUpPsmLsNbZRd
         QBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425288; x=1726030088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnxH3T+Ol4TDlhRgYhMY4wGMLL57Q4XBAJGggFJOTOY=;
        b=S9izdsxo9zNK9+WPKqzfhSiSv4YL1JOM/POZ1Qi47SbEF0Qd3tQcySwU/j0qSTtKCD
         W+Zs694Fity53yZuRBCVeryan10cG/bu45SpU+hNBnFpPNT7zcYvZAfAbvPrIT8B4+LA
         bnJi3ORRp2oQUOw8BW+zPJW9YpZ+Kj7gBvLBB0dpgCOLclOUM/PtKUnT4689VYOwoJQF
         4/1zxCw3YH9D3NqO8+P2Y0DPCzh6cMIhkQrOVgJjP9ORZS4xTFu4MD4TYncyuZaPGspj
         8kc1Ta280W0piylgJYO99XhqhequXZ7/Rm2OuMOgCzRsx5rGntYbbdWcBkSVnFjv3yaS
         cDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbe5Znt6XvqUSFyb9cda3W0aB7PphUQVUadbCTjX9Ie6E56VXEMxfo1QYV3nQMKN7RCx4nbyDZvNMFxQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWj4vhFwRu+rx/m9EXUsd0zm6WUhPKSBEF6jnd8NVVOW0KX7V/
	j60ICPvg1jatzWvw9RpyVWKFjPtqE8cZEYxAaOJLlsxnF0PTJK1Ea2UPKw==
X-Google-Smtp-Source: AGHT+IGCNNDATluGCJQMVRn/XlNKlVLUKMJL9/RA/MWvy83Qu6cCSjryl1F2mI6VPQlSSd31efn2kQ==
X-Received: by 2002:a17:902:d58f:b0:1fd:aac9:a72e with SMTP id d9443c01a7336-205476430bcmr128155175ad.43.1725425288242;
        Tue, 03 Sep 2024 21:48:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9131dbsm5769765ad.62.2024.09.03.21.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:48:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/22] Input: iqs269a - use cleanup facility for fwnodes
Date: Tue,  3 Sep 2024 21:48:05 -0700
Message-ID: <20240904044806.1047847-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __free(fwnode_handle) cleanup facility to ensure that references to
acquired fwnodes are dropped at appropriate times automatically.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/iqs269a.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index c34d847fa4af..1851848e2cd3 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -550,7 +550,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 			     const struct fwnode_handle *ch_node)
 {
 	struct i2c_client *client = iqs269->client;
-	struct fwnode_handle *ev_node;
 	struct iqs269_ch_reg *ch_reg;
 	u16 engine_a, engine_b;
 	unsigned int reg, val;
@@ -727,8 +726,9 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(iqs269_events); i++) {
-		ev_node = fwnode_get_named_child_node(ch_node,
-						      iqs269_events[i].name);
+		struct fwnode_handle *ev_node __free(fwnode_handle) =
+			fwnode_get_named_child_node(ch_node,
+						    iqs269_events[i].name);
 		if (!ev_node)
 			continue;
 
@@ -737,7 +737,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u threshold: %u\n",
 					reg, val);
-				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -751,7 +750,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u hysteresis: %u\n",
 					reg, val);
-				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -767,7 +765,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 		}
 
 		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
-		fwnode_handle_put(ev_node);
 		if (error == -EINVAL) {
 			continue;
 		} else if (error) {
-- 
2.46.0.469.g59c65b2a67-goog


