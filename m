Return-Path: <linux-input+bounces-4479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A741D90F854
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 23:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA24F1C23759
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 21:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA1A15B12D;
	Wed, 19 Jun 2024 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8+Y88Xk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E64315ADA8;
	Wed, 19 Jun 2024 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831608; cv=none; b=PbNJ5TmGp86lXxfg0ZRS+rxRJwx8R37nOKBM4AmBbTKRgP/hwfgFoY2dqo3+HDIiVFJj3h7oRp7lw/mkU60B+q61rkOSliis8WM9OggtpuaedqdVkplKh9OXf6oEzZRkas8tNVrih1XQOcd+yjOyD4NdESnBdJ4bynctw4HLeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831608; c=relaxed/simple;
	bh=gG9I/Gsh49CIPQvMglV2ZnyNyJaG7wM9ILUCWVTBeeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eku1tI5Z7j8Z5ZCgeOI14dlBT9E/UApOU2e4tTeXmjBHgxSUpM28XApGhAXihRxMkbaAZfeI4cpiK0tUvxob+MQSvYDZWRngf4rlAYvELwziGIJFXCexiySd3XNok8DwMDBMadeSzf1PxmvyUPJgEdpcMlYTJUzF8yJZ4d6J8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8+Y88Xk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f8ebbd268so220667566b.0;
        Wed, 19 Jun 2024 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718831605; x=1719436405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfVpNHjUV0TtgdvG+QQDBY42rggSqXwAK3gauBJ316w=;
        b=M8+Y88XkgaXNBvVUuXD8iyIy0CbXbOZ3BwWWqxBBf/rdHTi5C+clANLrdC8wxzyL8d
         vUeGWO4767hcHV+r83JKEh2M2wogVyOWj5FJ3MUKt1jHk1iJ4RKQRR8lr7rYfZ0cWF9M
         v7SdtJDesW+UcEN7gdIcincMCcw49z9CmPZwucGAx4QqbLI7zQ9dddOSH7FnzGmuxhCk
         XdwO3FaEuZubfNM3YaohDJ1rFiXEOP2mVr0O9uw+Ievh1UelinY5Iuwn8+K3LC+NOP5D
         BI4fU0DWcB207mI9+45BrMbVBqqprPxyVdu15vIkeU0ConKTaKV/3OF1oOOs28oruYrD
         0zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718831605; x=1719436405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfVpNHjUV0TtgdvG+QQDBY42rggSqXwAK3gauBJ316w=;
        b=LstyXPPE4/vuw66QSsstMpYtaj3cwck4rV9/BMtUhVKY5/MGLa/90BJINOItRgokQa
         cF4xK30CS+rI7NgZ1oCIZmQgMKsQbM/ZMrTAHwflMcuxZ/dcvOmVwvKAC6eE0KktRq2j
         sfjuCVxrq04cYjunahHF/fpzYmablVwOOL2i/cgdQbd9TEw0oXtvxrHhdvjQywA9UU0t
         Mm56zPe9QTpx5+sOQZ9ybX9invL3DqpWLZHHLEEg3GialYUxzut0Cz0l+M6lZtx6Z8Qj
         EzT8RGso3OT/BDBCTol3TZKQd3OR3pUA/3FnF18NW/gYJoEbvbhG7M6p5JL0furbR80G
         vHCw==
X-Forwarded-Encrypted: i=1; AJvYcCWw98L28ORCWdtXqxRj7BjPm6EMxDXzaC+5XB++8wRBzY9qJE4QQtVZjCLNsWRNyocFCRz8GVT8lVlZ6AKY9e0CEWIMJlCTp0XCgQ/ftR+lpPrEKYukTZSCl98QBn/FQ/ZjiFWSlabPlW5ykwRJ
X-Gm-Message-State: AOJu0YyK5gG1BS1Oe+6lUS4vNd3OyNoShexOSTFzjXkb+mw0CTDFLXOY
	DupAyIsCCc6mmHbf94491aCPYLVqtDZpwZ1nAg9IEbIKpGafpq03
X-Google-Smtp-Source: AGHT+IF+56sJmYEqv/32TxLOkRFtuaDn5p6L9otwa0u9lmVzDX4hrsTFIAjhv3QPZ3LNGOZ+3DIotw==
X-Received: by 2002:a17:907:d506:b0:a6f:7b39:b5d2 with SMTP id a640c23a62f3a-a6fa40d42d5mr266308966b.5.1718831605406;
        Wed, 19 Jun 2024 14:13:25 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41700sm698738166b.152.2024.06.19.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 14:13:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 19 Jun 2024 23:13:22 +0200
Subject: [PATCH 2/2] Input: ims-pcu - drop repeated "input" in error
 message
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-ims-pcu-counted_by-v1-2-3ee0ead2e57d@gmail.com>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
In-Reply-To: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718831601; l=810;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=gG9I/Gsh49CIPQvMglV2ZnyNyJaG7wM9ILUCWVTBeeg=;
 b=gQjyttIvK8mYipELAqFm9OOZ+AVontpNNMqw6E0rlA9GgdohlHaJbgzAoc4rp46HGPPzqk2KD
 bXzNVeH0tVwDNn/IXmZ0f5WRisuwZvavONpNffiQGHmI2NjZX8FplVf
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This case of the common error message upon failure of
input_allocate_device() repeats the word "input".

Drop one "input" from the error message.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 91f8ad826238..a8c474de01ad 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -207,8 +207,7 @@ static int ims_pcu_setup_buttons(struct ims_pcu *pcu,
 
 	input = input_allocate_device();
 	if (!input) {
-		dev_err(pcu->dev,
-			"Not enough memory for input input device\n");
+		dev_err(pcu->dev, "Not enough memory for input device\n");
 		return -ENOMEM;
 	}
 

-- 
2.40.1


