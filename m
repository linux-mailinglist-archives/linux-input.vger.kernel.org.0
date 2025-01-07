Return-Path: <linux-input+bounces-9010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A0A04A34
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7845D161A60
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40541F4E55;
	Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvZJtSkR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156E1F4E57
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278121; cv=none; b=cKcr7Z6TW0DiErMPbh7DIMUS9Wu8hXYAvtyR8YBmwZhIDfbofjWSs2mBqxi8kW2NwuN2Hvg7BpTzUcHIYKvchvjbrEapjkuX3Erlrl0h/DG/J18mbWrkKnnraFF9HyCY2GJhvb1TWm9+GRuhgA6m85rGCl/RLtw6xE9pnYX+j9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278121; c=relaxed/simple;
	bh=PYkpndLghyIqImLV4tfMkW2YDKNk+7UerwgGFbcgWgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQPdhaQ0JSHAiaPMvT3pkOsAbi+tbZb7olrikPv7aWKDyysibbdtF2flRr+jMmgVtSen5CPVpkNAWdL/4f+NpivlfAQQn2AHljJUUYgDl3M+AmyvfGeboZaFuJ9TWJC4nf2LEntbVfMDviMKg4h+nYrb3A4L3SC9kIPhX+MkY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvZJtSkR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862d6d5765so9344150f8f.3
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278117; x=1736882917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYLpdHh4E3mL3Yn0cu92Bsjy+0bTJ73f3oV0tyORGVM=;
        b=CvZJtSkRkcC01ffL4xS1iwtEqXvVMgbadwke+D2laK7os2IRgv6eNUjXF/mB9u9T/k
         DPx1EpFTfXI79duLlR7K6clpBg68Cr7bw8/RPAmBbyqtwt+PpT3F8SGjpfq5XLrxThAm
         +oxqZbTleP9FVj7d/iQEn9WdQHj2JzPsxMS5tRTe05oE1NvGP/1vpflZ+Mv5XNf/ewLl
         5J5WGNw2lVoh++f/EdiiZijtDzcs1ddl7SpxHCe6W89roUlfJdF+yz4oMYnPZKP71hWb
         lew8YzFq4b3ws8t375ccbj89R7a0mYoN1SAPrK+dB73mSq/TrGMkiupKL5BuAFd8Hjik
         d2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278117; x=1736882917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYLpdHh4E3mL3Yn0cu92Bsjy+0bTJ73f3oV0tyORGVM=;
        b=SulkFDfLNQXrG5ORgcUYm/F6qRRIKMZUlDi/WyNqcwgN+NEBL+UM+mboRDhy7A/OLk
         J8cbTG1UPkVnlJqzEHPbyYx1gOAUqdTVYhp18ut/jDcwBwkALZrgb4bHm6yK3pSfKh6c
         mRdvJINqn+bBznH1zTVxeBqVP6ZdJLbEnNv4OO8XJDLQNvJSKvMB/WGQlhdLNZHup66L
         23j1GGDOguUqG9cMDympgTpTSkFONdwM4wne0svsZI7B1CsZfYRZMpeGRwZMdOuSub93
         2r2KOtXBkOUyUS2jSKgTCo/Aln8T1KqEIaTopFu7WKhzo7nLXl4qFgSQCogiwCRZ7dO6
         671g==
X-Gm-Message-State: AOJu0YwgO1szmI+k6mddM0eynel84OAItXrtCGTKAO/Xe4ULlLp2iEXX
	5Ss/+vByNMFohr05ayWytEBkdSv/sLDq4HB50gmxEvKG/d1g1sURf450g15Dh9tcNg==
X-Gm-Gg: ASbGncvGI46QXV0pSHwmF+RFLFaos9O6iqN1hM+q+hgz9fVGVXhgBidmwu5uXUi/o3f
	6qaUdgGyrQDpmK6Tj+nctqv/pUaTt27h+0ovfdFtgWC++cLRC0DaJ2qD5Lfa3oeWcIux5sACQCU
	ab9MRatxOV2I+xgYopSFuxtAgcvTv5j64lg2B6RsRnEn63M2E06dJ4QHinNwZRZ6OzEHcmr8MY3
	OcCCPciN8i0YOhZSqwstn2PeZV8rl2KHKuPCR1ujhttj5WIHz27HHsgfWZCuV9TudQb
X-Google-Smtp-Source: AGHT+IGdom2JNjUfTk6/NBQlcckXeL3hX7o/R/LUVgKS/e7pgUEBI0L1z3ratUa7B0LGWxOQSvdMtw==
X-Received: by 2002:adf:c081:0:b0:38a:4184:1529 with SMTP id ffacd0b85a97d-38a418415ddmr24823122f8f.12.1736278116790;
        Tue, 07 Jan 2025 11:28:36 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:36 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jack Greiner <jack@emoss.org>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 02/11] Input: xpad - add support for wooting two he (arm)
Date: Tue,  7 Jan 2025 20:28:21 +0100
Message-ID: <20250107192830.414709-3-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Greiner <jack@emoss.org>

Signed-off-by: Jack Greiner <jack@emoss.org>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8a02b9a5ef79..ceb08c541b18 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -380,6 +380,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1220, "Wooting Two HE", 0, XTYPE_XBOX360 },
+	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
-- 
2.43.0


