Return-Path: <linux-input+bounces-6145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6196B019
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611481F21776
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AB583A06;
	Wed,  4 Sep 2024 04:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjGVOujk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D1823A9;
	Wed,  4 Sep 2024 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425310; cv=none; b=azTMgqmCvLirIoPq2TXSPYtrF9TdhR6Lh5rEbxjtWpd0HV1jBi1av6FMSB14EKxgVNHpJoBiEzj7EXQm93Mpms4WAyDO5zYol4jlyxrgVdW595umY0Kgh/3Q63Aw/dom3LnrHueygAWrB/175pNThblK1bMw5/5mCjZ4NxSxmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425310; c=relaxed/simple;
	bh=4f0a7RMGVEaFLLMDvCfdgQS4qMzwfU5Zv9nYxQhpP7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ftwq9pRPoGoaehUf1npAuYIfcSE3BlTkT3eL/qmcU/kPGG/MV9/y2l7K45Qh7W6cpWP9TKQu/ih0OGXPhu/V2qonH1VzjNUapixbzEo2iPvCGc0uxYyj3yB6wkhrFk8UygQaTz3uH9heC6cMtD+CVBQSjHMMtaGGHe1Fzsnv7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjGVOujk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7141285db14so5198042b3a.1;
        Tue, 03 Sep 2024 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425308; x=1726030108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWAIKnqWBa9v7wl3AMunuiCdn7/Enw0Y7rIDLTFVb+s=;
        b=OjGVOujkDm4gTGN3w5cldh0IVVz/1+edjAu02TWfUysHR4tWo9MbheDnuIG2ffHDRh
         ljWmLBc7a5+sJ1N+LXw4uen8xgMYRzyJFmVAVLIx5/jnwrO+V13t0L0GLjSkVJpOEvHV
         lrZcPkOt9AkWYRW6fC68So2WDzh4HWGaV1dRCVdxK4gqJGNVd28zgIumneoIG2rNF3t0
         M219KDK0PANUrwDpAd6xGMjjoK6riGqo1W19WgnqmxepIastlgWI3vb5cjj+p0ii/39d
         FAa8CS+AGIfIcbw5haNnqkwgMQnxl1W7BB1kC3M7ctCJy8yIipsFABOzh+pZsvezZdr9
         8etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425308; x=1726030108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWAIKnqWBa9v7wl3AMunuiCdn7/Enw0Y7rIDLTFVb+s=;
        b=nZnWLA+hmcFGUED9hEO7zlPDaak6kbCdw+oK+PUBUZ0oD31dQpQctGAkUiE1VJKVbY
         m25sTGUW3hrdi57U5p1ZOxkAroEqEqERYa0llzGbmTcgO4nzzkhRgFla0Qw4xw7SoP66
         AiWllufHQQyav21OJKEPJUKs85NV0VDaxLAEiDSQAbE/jbnC6jl6ssZKv3d1FAjp3jdb
         +3UkcZ+Uz5GiUQohx/6YxQYYFZEpOqX4zoiT1T1qxQQSAoB5CqlG48IKyYuExC4gpcie
         fU5o7Eub9PhC1fAxsM9HaGZI/bmS46F1HDpS2mUe56t/ENYYP/rGuB2YJN/mjzOyvFAb
         i/cA==
X-Forwarded-Encrypted: i=1; AJvYcCUQZfZrWrZuuihLSB+ikn8kYOHtkrgJEUsQDLlf3LVTLZcUxanDQncp+e+OXSoHH5NgQeEqqkT9H/9w+/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXfeZFhum3cUEGhV2to2utVC0Z4MwfrQykALnrbzQiZSnTZLGx
	h1dHCdIGmQJ021DsK1EwmaV3fT+Ck0j/feoom7a5XqP0oJ+9IDNC4xI6ew==
X-Google-Smtp-Source: AGHT+IGn79LEbWhdhwOTPZBdO2a4PuoJ5GJDvJEIEIgvNDAAVpfZNV2plGXAtZezzDnZm8lhPqng/Q==
X-Received: by 2002:a05:6a00:22c6:b0:706:74be:686e with SMTP id d2e1a72fcca58-7173b6b6229mr16457733b3a.26.1725425307569;
        Tue, 03 Sep 2024 21:48:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e66sm717098b3a.21.2024.09.03.21.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:48:27 -0700 (PDT)
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
Subject: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
Date: Tue,  3 Sep 2024 21:48:25 -0700
Message-ID: <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 9ca5a743f19f..d9b87606ff7a 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2385,9 +2385,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 	for (i = 0; i < ARRAY_SIZE(iqs7222_kp_events); i++) {
 		const char *event_name = iqs7222_kp_events[i].name;
 		u16 event_enable = iqs7222_kp_events[i].enable;
-		struct fwnode_handle *event_node;
 
-		event_node = fwnode_get_named_child_node(chan_node, event_name);
+		struct fwnode_handle *event_node __free(fwnode_handle) =
+			fwnode_get_named_child_node(chan_node, event_name);
 		if (!event_node)
 			continue;
 
@@ -2408,7 +2408,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 				dev_err(&client->dev,
 					"Invalid %s press timeout: %u\n",
 					fwnode_get_name(event_node), val);
-				fwnode_handle_put(event_node);
 				return -EINVAL;
 			}
 
@@ -2418,7 +2417,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 			dev_err(&client->dev,
 				"Failed to read %s press timeout: %d\n",
 				fwnode_get_name(event_node), error);
-			fwnode_handle_put(event_node);
 			return error;
 		}
 
@@ -2429,7 +2427,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 					    dev_desc->touch_link - (i ? 0 : 2),
 					    &iqs7222->kp_type[chan_index][i],
 					    &iqs7222->kp_code[chan_index][i]);
-		fwnode_handle_put(event_node);
 		if (error)
 			return error;
 
@@ -2604,10 +2601,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 
 	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
 		const char *event_name = iqs7222_sl_events[i].name;
-		struct fwnode_handle *event_node;
 		enum iqs7222_reg_key_id reg_key;
 
-		event_node = fwnode_get_named_child_node(sldr_node, event_name);
+		struct fwnode_handle *event_node __free(fwnode_handle) =
+			fwnode_get_named_child_node(sldr_node, event_name);
 		if (!event_node)
 			continue;
 
@@ -2639,7 +2636,6 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 					      : sldr_setup[4 + reg_offset],
 					    NULL,
 					    &iqs7222->sl_code[sldr_index][i]);
-		fwnode_handle_put(event_node);
 		if (error)
 			return error;
 
@@ -2742,9 +2738,9 @@ static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
 
 	for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++) {
 		const char *event_name = iqs7222_tp_events[i].name;
-		struct fwnode_handle *event_node;
 
-		event_node = fwnode_get_named_child_node(tpad_node, event_name);
+		struct fwnode_handle *event_node __free(fwnode_handle) =
+			fwnode_get_named_child_node(tpad_node, event_name);
 		if (!event_node)
 			continue;
 
@@ -2760,7 +2756,6 @@ static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
 					    iqs7222_tp_events[i].link, 1566,
 					    NULL,
 					    &iqs7222->tp_code[i]);
-		fwnode_handle_put(event_node);
 		if (error)
 			return error;
 
@@ -2818,9 +2813,9 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
 				 int reg_grp_index)
 {
 	struct i2c_client *client = iqs7222->client;
-	struct fwnode_handle *reg_grp_node;
 	int error;
 
+	struct fwnode_handle *reg_grp_node __free(fwnode_handle) = NULL;
 	if (iqs7222_reg_grp_names[reg_grp]) {
 		char reg_grp_name[16];
 
@@ -2838,14 +2833,17 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
 
 	error = iqs7222_parse_props(iqs7222, reg_grp_node, reg_grp_index,
 				    reg_grp, IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
 
-	if (!error && iqs7222_parse_extra[reg_grp])
+	if (iqs7222_parse_extra[reg_grp]) {
 		error = iqs7222_parse_extra[reg_grp](iqs7222, reg_grp_node,
 						     reg_grp_index);
+		if (error)
+			return error;
+	}
 
-	fwnode_handle_put(reg_grp_node);
-
-	return error;
+	return 0;
 }
 
 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
-- 
2.46.0.469.g59c65b2a67-goog


