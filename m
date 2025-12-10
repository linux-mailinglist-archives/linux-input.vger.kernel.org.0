Return-Path: <linux-input+bounces-16533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6638CB4095
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 22:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24D5A3009631
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 21:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A5F3019D8;
	Wed, 10 Dec 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlN/Um3C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BD2EBB9E
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401123; cv=none; b=Qm3xRK8Au0CtrlQKr8xRg62AarXQ5Wr7InwstxdFM6dbkqjTMxO1zo8dFNYES0NXpjT6o/qO+bvbjxKT7DEmhe0+TLX1Z214rn2PJrqYs75RA4hBXtS5GJPg2RRpmfrqSC/edhqz5KGtRw1OMOzQt0a6FcN3RHeo4ASAn+fBgsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401123; c=relaxed/simple;
	bh=rKyYWkvrYU9ysuyv8UfGnXxnuqYNPuL+rwsaQsrH4N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VV0AtppBsUcLIQSHPQzAiTogDIhUY2FBOaia3Eq+MfQGZjx1GcNNYTzPNvNrbb/JhMOBKm3PKZRpHhCd9NN0qvDWl5LvOv5iIckGny08E97YXIXsxmHZjVvkuzE5J+eCjxzzXI5V23XQR+jS1x6Mu6j7NTegXg+aveECHcKDxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlN/Um3C; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso7414425e9.0
        for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 13:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765401120; x=1766005920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXkfjEDfxcmN2wsxcxmPY/zV+YfLOJPrMQ34dquGAqo=;
        b=IlN/Um3C2CPV3R8b6Dx7DNwivAx1UwPe+ZEt/KYYbhD/A5KtsqNjMgap1Hw89Ta3wZ
         9C3SovDKvvINCOnDzLBFsLLsyiFa86q+fmogkQsaCDymLE/YVq1CeoRsrYyyFmCMaL8d
         S4ygs8RdberzoktZNHpbtTiE+yWRqhhtJmk/jkI5peoTyL8aYNBYwSCCpt+/ruyu8nBe
         df0b2qMxoR9k6KBSyvdeT7j9gYkk39WzY5+agenDUJ/34ltWCMcDJ+POwD+51Hp2/PbA
         oY1JevMA6RhqZ9x3LTem32bfmfz7o3fpgs6uMhGjxLNRjwPpNxY6aGvWZ5b5nMEeYxsI
         nK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401120; x=1766005920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXkfjEDfxcmN2wsxcxmPY/zV+YfLOJPrMQ34dquGAqo=;
        b=VSJIzmXP8psMKk6TiSc4tgx2mU3qnhM9fWXpNMf6NNnsOhcoykaDk1PYg1QGYjNYa3
         7ABZxrXioSgwGC4t+cZFJ10mKXbXVYOKm9AYnmQOVDeBvU6UWOwDk8Tr42NAe0PPwAjH
         CcAtHQnpRbtH9EUIQX4DRYAQqDFZejDH4aqnTMGu7cuCZNYghPId0twwUawLH0MQNKgK
         Vq+dokmK1aWrYQdMXUJs2QwsZyxP3jSHzYBCPwPXgrERzHZoqIr71FeO8kZvB7XWv9Jk
         GaD01lOO51r1J6GH94oBuOy8vKV+yRa6aHyNuBzUWQnYCdbnqUl4Ayqmo5GnbYNh8PJL
         6xmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIhB/2c9K1JldnI/MBwkWpIWVY2DYiyIWFJaW7c1mmU/0EsWiNAbZS9YS4vPpg3nk4K8825QrB9Rn6ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YymeukN3AmzG2HrRoND+64P+F2/TbOdhdIHReXFhVAnP/MZsWBY
	7b8xdNta2akiwzzPxE+kO3PiN2nH59KA5PiOC1T94I0YrxjPg31C2bTF
X-Gm-Gg: AY/fxX56NAtGrAjSBUJ37CmQ+koztAZkitH7drPgaYtS0W9hmqQz4FSs9VBM5TVZhQH
	PBBDxwvIC4l3aaabbskMWsbry3KpejRhvekgjfoSl23ksdnmUCc2ypuy2uV46xBks3M+X8kx1Cx
	y1GUW3ITOwl5ztRVz4lF4GKlaTXHdmT394+ZLvvA5KwuJ3r2j9T8qesgxIxdEiv5GRTfQ9eof5H
	iwVbtSGmWUYLVzSquAPtl46V+qC5anTcEBd6bJD3piNZSjAiOu473g3p55p84+OLq2YqLIj7RFy
	t4QznrT7rKdEEo7Fau6JkOSofQo0SBUS5/o6UJknnXPyCTMp53jlbE1KoJQn2wCDFS6c2V4/5q/
	sXCvsYWYoQaOKvIhxnBQXn7ulV1XpvSnFFQUAGBnBbRcw4QqQP+pfDtJjI4EZmrdYPiqh/vqW0J
	oVzqSdB7YdRjClgy39K7yhgoWGVYk9/R2m4Q==
X-Google-Smtp-Source: AGHT+IGU59M2IZuNdD+VbcGD2kdQ2sd7kW6LEthAF1ElUXBAqJvOvr9iCG6HcvR/D2vmIEyFYTJfaA==
X-Received: by 2002:a05:6000:1a8e:b0:429:cc35:7032 with SMTP id ffacd0b85a97d-42fa89f20a7mr839467f8f.23.1765401120272;
        Wed, 10 Dec 2025 13:12:00 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.249.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85feasm1115031f8f.27.2025.12.10.13.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:11:59 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	imx@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Date: Wed, 10 Dec 2025 21:11:41 +0000
Message-ID: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
*resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
fixes it.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/input/misc/pf1550-onkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb..0d1b570bbe47 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,7 +173,7 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
 			 pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
-- 
2.51.0


