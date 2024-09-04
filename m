Return-Path: <linux-input+bounces-6144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21D96B017
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26F50B2464A
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8725E823AC;
	Wed,  4 Sep 2024 04:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evVIMEWc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003B382866;
	Wed,  4 Sep 2024 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425299; cv=none; b=JC531pwypra/zqnzpB06TTA30LZUpjg6eGKbwPguCBfMBqLiipTf+mW5B4P8hrJ7ws4IL1A7YORgl/Kg0zYKeeh85T1DeQP7Q0B+N+2nuGctYeOTcYOBOFFrpt8fB3w7m81yU6K1aswXHmFFAJkww4JOWiUMnxUvoIvetsNIVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425299; c=relaxed/simple;
	bh=FflQ4qz5JVnnnMDPwm8UqfGtcO0cKx77kcMuOsvE81o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgr8B4KxM5XQtLlg9pefj1RWG1Jyna3PUp7bj8BcfuwEfeIQW8jC5PcwhW9NitBB8nsy0GInQ5S3mTfJXWMgOPOTRoZu0Vt3zTvU8hMEPuaDAYj7XqihJ/hD9+n5GSCLvTGVWwgmNygf7Iib7XXZN1/UcdSVqWJmXSf8LOAyS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evVIMEWc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2053a0bd0a6so39132415ad.3;
        Tue, 03 Sep 2024 21:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425297; x=1726030097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lENcgYQuI00iy6j6bXO670dW3Fp3O318OXfbMbYxm2E=;
        b=evVIMEWckj+gOOwtKaRFyGmYXMCLOuUYeJM0tPraN0TzudcmQ6PnMCdR9TWCifOnSP
         Uxao94QzFJPb4jD5Vy0HstywraP/3j5/Wk6dWf+12kwwd9zDsLUUVFP4GWBstS71kaUV
         c3tTNxVx6VxhRKUWqEFany6/J5l6stncqdnoZ2r9rOxoK8ghd/J+N31RMyNEmgq/qKpA
         S+YbVr8IJwx9hveneyyCKTwkaJcEVXf1+J4OKdX2jcA4PwP4feSBtFKWLR9T6TlPFNhN
         TM4/Ss8tVPuWWD3gUICrgq8xIMSeVEtBYMFUhKmoV608JCqCK3PgreRq0wN1R+dPXFEm
         8cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425297; x=1726030097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lENcgYQuI00iy6j6bXO670dW3Fp3O318OXfbMbYxm2E=;
        b=lLNDeNLPpEB0wPOx9b24Ere/ZqBzHsss1RvuEorCxBXgJTG1SfNxRop5hw1qa/M3VG
         poa4BR/D59KTlDWN7ERaVb5TKUbIMBeQVXy+JZxByA5LD+KOZc37Ol2w6mmLNk+sLBFa
         Vhcx5Mn+ACjQQmx5dUX/hBCy4ozSdKnLsj1yWErWJPMKoQztriu5iSgsFMVnqKh5gn9E
         kSJYMjkffVr0zjWxKJKlubEy5yoBgTbE9I+vF0QoHqQUHHSqriH/DgB0mw2dYyzXNdsK
         QDMlW3dcJofVhXXr610fxZq/VWobdl1i+GZxrUeDUoxTVMIJPjsfWjrdm9vGjlc5QFWn
         1mbw==
X-Forwarded-Encrypted: i=1; AJvYcCWx8H8nTOaR0Jke2SjYo7SAiOY8rjsZO5zUMpZOvUSXL2n6vY0Z+WFMjp3o5UNcvvglh67E93YVUnDfrpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUPzCc5XfeiOioNouMAgiGM/Z2ImZiKyhClx61uh8tH22SLTS
	ofHHPx3zelr1Gp6WtyQlz6loNgHu7IIeKANbxs5y2R+tmcU0agHXg0jUuw==
X-Google-Smtp-Source: AGHT+IExTTRLClg9mGxPiOHjn8IlhbjvIT9ij/VL2ZI/6vUhFmjWuz4edhNiyUuSgZ9BZBXgpFFYpQ==
X-Received: by 2002:a17:90b:3812:b0:2c9:6aa9:1d76 with SMTP id 98e67ed59e1d1-2da62fde7efmr5017176a91.18.1725425296793;
        Tue, 03 Sep 2024 21:48:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0fe266sm12320014a91.11.2024.09.03.21.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:48:16 -0700 (PDT)
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
Subject: [PATCH 14/22] Input: iqs626a - use cleanup facility for fwnodes
Date: Tue,  3 Sep 2024 21:48:13 -0700
Message-ID: <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/iqs626a.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 0dab54d3a060..7a6e6927f331 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
-	struct fwnode_handle *ev_node;
 	const char *ev_name;
 	u8 *thresh, *hyst;
 	unsigned int val;
@@ -501,6 +500,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 		if (!iqs626_channels[ch_id].events[i])
 			continue;
 
+		struct fwnode_handle *ev_node __free(fwnode_handle) = NULL;
 		if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3) {
 			/*
 			 * Trackpad touch events are simply described under the
@@ -530,7 +530,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 					dev_err(&client->dev,
 						"Invalid input type: %u\n",
 						val);
-					fwnode_handle_put(ev_node);
 					return -EINVAL;
 				}
 
@@ -545,7 +544,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s channel hysteresis: %u\n",
 					fwnode_get_name(ch_node), val);
-				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -566,7 +564,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s channel threshold: %u\n",
 					fwnode_get_name(ch_node), val);
-				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -575,8 +572,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 			else
 				*(thresh + iqs626_events[i].th_offs) = val;
 		}
-
-		fwnode_handle_put(ev_node);
 	}
 
 	return 0;
@@ -774,12 +769,12 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
 		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
 		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
-		struct fwnode_handle *tc_node;
 		char tc_name[10];
 
 		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
 
-		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
+		struct fwnode_handle *tc_node __free(fwnode_handle) =
+				fwnode_get_named_child_node(ch_node, tc_name);
 		if (!tc_node)
 			continue;
 
@@ -790,7 +785,6 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s %s ATI base: %u\n",
 					fwnode_get_name(ch_node), tc_name, val);
-				fwnode_handle_put(tc_node);
 				return -EINVAL;
 			}
 
@@ -803,14 +797,11 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s %s threshold: %u\n",
 					fwnode_get_name(ch_node), tc_name, val);
-				fwnode_handle_put(tc_node);
 				return -EINVAL;
 			}
 
 			*thresh = val;
 		}
-
-		fwnode_handle_put(tc_node);
 	}
 
 	if (!fwnode_property_present(ch_node, "linux,keycodes"))
@@ -1233,7 +1224,6 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
-	struct fwnode_handle *ch_node;
 	unsigned int val;
 	int error, i;
 	u16 general;
@@ -1375,13 +1365,13 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
 	sys_reg->active = 0;
 
 	for (i = 0; i < ARRAY_SIZE(iqs626_channels); i++) {
-		ch_node = device_get_named_child_node(&client->dev,
-						      iqs626_channels[i].name);
+		struct fwnode_handle *ch_node __free(fwnode_handle) =
+			device_get_named_child_node(&client->dev,
+						    iqs626_channels[i].name);
 		if (!ch_node)
 			continue;
 
 		error = iqs626_parse_channel(iqs626, ch_node, i);
-		fwnode_handle_put(ch_node);
 		if (error)
 			return error;
 
-- 
2.46.0.469.g59c65b2a67-goog


