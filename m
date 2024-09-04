Return-Path: <linux-input+bounces-6141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6096B00F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74AA11F24C95
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E4D5381B;
	Wed,  4 Sep 2024 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNqDlc+O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C4635;
	Wed,  4 Sep 2024 04:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425263; cv=none; b=hGrIUUaALsEMa88kz3zMYRQYU1YltNsITsa5VIAnagemPHm5lDy8XWRtz5o/daN3gJbfaL7tEeenLzHTKu+QA71dN/itrz0nwIUYqMCxvFpKcPhTklshHoG5E+N4ojb25QNdwtEyI5bQgZ508e1d58ASG4y/a0g1vCwKE8bSKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425263; c=relaxed/simple;
	bh=UfoRdmNk/XYFtIzagaoRqPWgeFpbrTmSQZq4azm6Zc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMO8IPRodubiUGO55ANiP7E2DvxfGa3DtLRIAKlEg3Euyx3pw7tN+6POpfO1nkJkh4b7/QGNCcgqSczJU/9SlTlZYIqjGYDMyxZ3HUEp2X9G7EiXEvz2lxy9/mgDcdqUA8TF0FmvdStLIwghg/+SWnABEyJVlvBepC1nVMyme+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNqDlc+O; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71767ef16b3so1375589b3a.0;
        Tue, 03 Sep 2024 21:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425261; x=1726030061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaWnxQRR5EhXIyZCyKMArrzFlASuF/6sHrZCH/pRRu0=;
        b=TNqDlc+ObZ3cdqcnxZWJG9OHUuhbonCZcnkPWxk+OSnH6S1iraHTfyOumQPZxwGoUw
         V58vst6x2Nm6RPlbm0V5GMmJUMIGT3+eOfp4Qxh8nRK/ruA5CnO7Z1eXejNAmhgDDr4G
         Arty5MeHuODzg1ZWHrds145IJZrlwNgqMY8Ii4xDrtRDkXywPh9nFiRJRiW262cLwjdO
         SK3eld5xOr554p2v6Vd3l4An06BD3sw/O0c8Va5BghUdkEDQiSnMTpuP57bcbpbANOtU
         tjHmpAQP2Xo2/91rPphn7BuaUl08b01rEtvTvMwGlBEyJzcbfKOdyVWj1H14YDzEU5h+
         etTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425261; x=1726030061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaWnxQRR5EhXIyZCyKMArrzFlASuF/6sHrZCH/pRRu0=;
        b=Ba246QM2L+YpPLsK+ASu5GWihpJnFOcOeSSNuP3A3LA/EBcUwZ8hELygkwQ6QEzLgr
         c5ogeVRo+kpioH114CTEREAaonIW5OZQCCPf35hoB8Ippi6XE/54FX2d2nPU9YBLjrv8
         +V1NXozdwYFZvXAM5L+d9FzbdaggOSccykiTqRxHsaGTUbyd4grEqzeNRI2hnxL4pVbF
         WX+gHpBkaX9S13UmdmIUhvqKU/wdsf7A3cpyLRMT0QPHy4dzml6t/CeqhRjCqPmQa5Zv
         Q5PjHsN0DOxYXfmo4tYt07/VhNXa50gfQNroKCSemJxLrzL9WvSooWZFFDuimqq1CKtT
         r0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYdnQ6Dvnkwh5Ne9/aGITe2OUitFZ62+bTUQCvhQnRhTcJzLHbL0FI8iYtdAa/a/9tnpkJQN1H5ay4jtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZYX4OQPfGlOxpeHFukr4q/7vwS5ByLNE0mHRydP3oEoLQbWj
	Ex5GfaJQEx3pQ7a3igFumUCpvDM0gVq+evun5Fwyr+GdTlmRKv+SeGCuzA==
X-Google-Smtp-Source: AGHT+IH2CdS/UypR16T7AMe0GB1VgEku/dxvrySvQbIWqCHvxWedibg09mnGSR2Ofxaxr1UpmqTLnA==
X-Received: by 2002:a05:6a00:2e90:b0:713:f127:ad5c with SMTP id d2e1a72fcca58-717449c68demr10729173b3a.28.1725425260953;
        Tue, 03 Sep 2024 21:47:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785a70fdsm698350b3a.188.2024.09.03.21.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:47:40 -0700 (PDT)
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
Subject: [PATCH 11/22] Input: ibm-panel - use guard notation when acquiring spinlock
Date: Tue,  3 Sep 2024 21:47:33 -0700
Message-ID: <20240904044735.1047285-1-dmitry.torokhov@gmail.com>
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

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/ibm-panel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
index 867ac7aa10d2..aa48f62d7ea0 100644
--- a/drivers/input/misc/ibm-panel.c
+++ b/drivers/input/misc/ibm-panel.c
@@ -77,12 +77,11 @@ static void ibm_panel_process_command(struct ibm_panel *panel)
 static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
 				  enum i2c_slave_event event, u8 *val)
 {
-	unsigned long flags;
 	struct ibm_panel *panel = i2c_get_clientdata(client);
 
 	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
 
-	spin_lock_irqsave(&panel->lock, flags);
+	guard(spinlock_irqsave)(&panel->lock);
 
 	switch (event) {
 	case I2C_SLAVE_STOP:
@@ -114,8 +113,6 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
 		break;
 	}
 
-	spin_unlock_irqrestore(&panel->lock, flags);
-
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


