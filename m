Return-Path: <linux-input+bounces-7941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ECF9BFEDF
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E32F2B22267
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB181D5153;
	Thu,  7 Nov 2024 07:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXuJQPPN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FB19AA5A;
	Thu,  7 Nov 2024 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963754; cv=none; b=B8/Z38E7YLgda0dRU+fv65H4ES5TEYLUANaJ37n1juJ4fQosJl1coP/+kBC3HqNbuPjjAPAQTOGpHqqjeY4eo/3VzRt8Ih8ThVVkD5rs34iWA0/H7WZ1ZLhIFc4eazx2ZsT2VOJDPYWHDT79fHEuHlqGRUFXEl+ZSvvzc5DHhRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963754; c=relaxed/simple;
	bh=Zo+DCnBbhJWA7vbbTjsU0Jb9DpzWBeiWzax+BwZ6J7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGRgZ5/IrBtdS9xbBq3atXCrsrrqq29DcdDT0m6D5wu2+CYPHvLmFX9KMiN1r/jhoVgjtU+GwWS/fuc0YPhcSDxOqgEcjSLsuUaaRnY4bqhUo7yMdxGHf4H3b5Ak7Uflx9ZBAWa92K1ZfJ7X+pUP0/+kpy/folPynMDnSADHjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXuJQPPN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20caccadbeeso6683815ad.2;
        Wed, 06 Nov 2024 23:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963752; x=1731568552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVeVcpnNjSF95a/7QE2hgZhSNWlJ65lfFAfOVSCa8so=;
        b=JXuJQPPNtEi7zoD0yDM8FDPDCr91rZLaIaiexoZzU7eho3PFoL1CVdmMjKOBaECCzJ
         V3Ox1nfZJluxYwEthFJwgoGnb+5V/qy1kcyxD+IPDSgXcYjE3lN2/RvJIx+k/l37plO4
         f0zBO+4N6aIyup995aed9VSa+mQqL+vurnNz4QNnCedXRWJ9ImAUwbGQI9kOtqyxbpVj
         Tgle7j+uwQpVo/zQWB2wPcAkaZodozlOOauaienb+65EnZUNC12oRx9UhkRjD55WIU9x
         EkTW/rs9hF5H/dN0I6MNJvGHV6H4Wpcwv+5x/XrfCUTA6Z5nybrjdNEVz6TIDkTr3mx/
         Ultw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963752; x=1731568552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVeVcpnNjSF95a/7QE2hgZhSNWlJ65lfFAfOVSCa8so=;
        b=bHjiQzzAdLrYZwP03JHMyqiKYndjVwhpCKWJ6BEYPKA5iTkut8mraZ6slrCEPfcfph
         8T/N0YM7If4nxBRV02+Xjw/gByr+i0N4idwO65o/pVdElG5xfO+OZ3RFuVlvSwb02fXX
         qx0Cr7gl2BexX04n5IltEWrJBqKNGNYNKRYbzhVRvgJpripQEF7I3UKLr7fwZ0rM3swK
         gWWL/BbyH9IOgrChgEIYRjLcInWVKFbVzo6ZqKedn2ltDwPnVQ5kw29eza1EWnH8s6E0
         OypuEjNH/BJUIhus4/NXUItWmigBuT/WyzGwncB+idodFC2RHEasqPrEuQJO4ykTFMXg
         C1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVvRC7ypgpTadhZchc/q0kMylWjsSpUXsDs2SVO4qkNGRHI60jG3bU3o5XyoPB2IG6PtMeZLiHilaMy5SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh87TcaD7TH8WaUbrfM7QHKCTpV8ml3cqVzgXr14socPZojtGx
	/ESUjMYKUmmNUFrQsbN/Lv6OaTD6liKtKVwWtHU6pKI1wvbCWNEs
X-Google-Smtp-Source: AGHT+IFqKqQl/w+0kFYF09MRNz+yRZxuS63o0llDmhcnB8VJ5lyKqVdrLlwXBaGVz0/nqswJkvBCSw==
X-Received: by 2002:a17:902:ce91:b0:20c:7720:59b8 with SMTP id d9443c01a7336-2117d20d025mr481805ad.6.1730963752114;
        Wed, 06 Nov 2024 23:15:52 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:51 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] Input: ff-memless - make use of __free() cleanup facility
Date: Wed,  6 Nov 2024 23:15:31 -0800
Message-ID: <20241107071538.195340-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate allocated memory with __free(kfree) to simplify the code and
make sure memory is released appropriately.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/ff-memless.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index ec99c070a97c..0bbeceb35545 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -503,12 +503,11 @@ static void ml_ff_destroy(struct ff_device *ff)
 int input_ff_create_memless(struct input_dev *dev, void *data,
 		int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
 {
-	struct ml_device *ml;
 	struct ff_device *ff;
 	int error;
 	int i;
 
-	ml = kzalloc(sizeof(struct ml_device), GFP_KERNEL);
+	struct ml_device *ml __free(kfree) = kzalloc(sizeof(*ml), GFP_KERNEL);
 	if (!ml)
 		return -ENOMEM;
 
@@ -521,13 +520,11 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
 	set_bit(FF_GAIN, dev->ffbit);
 
 	error = input_ff_create(dev, FF_MEMLESS_EFFECTS);
-	if (error) {
-		kfree(ml);
+	if (error)
 		return error;
-	}
 
 	ff = dev->ff;
-	ff->private = ml;
+	ff->private = no_free_ptr(ml);
 	ff->upload = ml_ff_upload;
 	ff->playback = ml_ff_playback;
 	ff->set_gain = ml_ff_set_gain;
-- 
2.47.0.277.g8800431eea-goog


