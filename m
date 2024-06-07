Return-Path: <linux-input+bounces-4193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D88FFBCA
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 08:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D5DB24084
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 06:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061AD4204F;
	Fri,  7 Jun 2024 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5uC/7nJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042B10A24;
	Fri,  7 Jun 2024 06:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740173; cv=none; b=fIQxgA+tVdTbmnXoIntvMGzM07HfMpaaWY2nCU0Fe5eWMePWJxBVyVAuixs3OSyS4Pzyas5zLWUAAaAwWC6Hi/0sNq+Y420SDBCTqDYidjHD3nTx/Iyb2zMVl1P7JhRSkFhCEtlrRRmot6BebyQVyAHVYSpvDH29LAGpkH9T+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740173; c=relaxed/simple;
	bh=EujP3PnbV6FqVzZC96xOFn3xGF4iV3+dsvDRjo3amGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ex03IAbt3Oy2di5nii45CJ6eim2oJnTPqnpYqCIDir7bPSomn1qe3WFUqYjGYzQ8s6oFRYBwXIR8Rx+tK1qejS4S3olOP2P04Jr7dWv5oRs9He9H8OOeuScd2CI2TUHF4c3mz6rD8o4mesD4rllCsOhriHwIE8MG1TYCaKHlf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5uC/7nJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f68834bfdfso13750605ad.3;
        Thu, 06 Jun 2024 23:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717740171; x=1718344971; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13ye3x6bqI5GuYJbXMnGhJMerrpc/q1sn8LzmUGBC40=;
        b=m5uC/7nJ+doIJTwo9AhZKUP0NkQ7F9oxV29s/XAFCvb1m1dUCWLP8/WbR8lYNYD+pX
         WOdlgfLzN7tPU6DNyMXKGvFQYPUZMMl/w//GVLoChvcgdO1F9bTVwnQOTM6OBbWHAgsi
         oBiQP6ovErmNUiIX89ux8DpX1rArZkJuc+QC77AzNBqxGYGUqG2k7HqbbmjKqiuM5t2d
         7I+HN0Xk0ERDG5h1/+R7wD++CVNuy43tBmG6cdQMa6Cfi4+jMUUBD4393nfEfODacZ/l
         svq9mxF6Hx0zKjHgzATsRuTaUmEUpTFqRxA9AH8T16J3fqaSBQo7FxTQ16mPbd6DfxPk
         HhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717740171; x=1718344971;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13ye3x6bqI5GuYJbXMnGhJMerrpc/q1sn8LzmUGBC40=;
        b=fU/oe4eBMFTJ79UbPw6PPvFwOStXU3aih3juUWVSQ8vVfwTOt4Fb5C+n9h5K3Xugsa
         S1qWnWMvKuQE4PbOhfGgYg7qSUrgvadADD1qfGyl/ahAk/nuIH3KPSo0BGy3VGGgRfdN
         lJNwmrcDvv/kUaboRsZgC2cYsgagxIBbTUwhj4k9mYdDA3KiE7aMjTbmYUOrDM2zDcEn
         +mlisqIV1+KKvJGLLQRz5LpFeOrKRyVbACVTaiz6W3hy0cTTbd5HA0dXZ02yilkGnZGo
         0bOmfLMfeRhh6B06+3xxJIqIfAjQZHhWbG7B9RtbAZoQkIvcgiiu4Vr+8Y4gkN2JbszI
         oitQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGtGQmaFGE9XM6F5isdnCOFVXNy5vUYSw6H00ejoyK2ukRv0XEi/u4XdSWVWivELzo0aszL6yWhosZT80APRUlY4FVMYVBqV17ZGnJ
X-Gm-Message-State: AOJu0YxIKaSmJknPYk6yUTp3Xc+shzks2wPjo/X1p3XcJ2IJn+4UwY0+
	h9d3LBRl9mfKKWCwIpBCcyksg7rmZ4cYQk38BlCQR28phauYp+iKxdWuOQ==
X-Google-Smtp-Source: AGHT+IF33fvFZnqNV0Atrsg0E2iYegI8utdKOiEjEc0qXujyUtIuYtPN4EcLYXFLR3h4eEE9dZC4eA==
X-Received: by 2002:a17:903:2345:b0:1f6:74f3:ac0a with SMTP id d9443c01a7336-1f6d03d6ef3mr18466585ad.64.1717740171329;
        Thu, 06 Jun 2024 23:02:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7d2cb8sm26009695ad.140.2024.06.06.23.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 23:02:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 23:02:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: jingle.wu@emc.com.tw, josh.chen@emc.com.tw,
	Phoenix Huang <phoenix@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - do not leave interrupt disabled on suspend
 failure
Message-ID: <ZmKiiL-1wzKrhqBj@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make sure interrupts are not left disabled when we fail to suspend the
touch controller.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index c2aec5c360b3..ce96513b34f6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1356,6 +1356,8 @@ static int elan_suspend(struct device *dev)
 	}
 
 err:
+	if (ret)
+		enable_irq(client->irq);
 	mutex_unlock(&data->sysfs_mutex);
 	return ret;
 }
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
Dmitry

