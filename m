Return-Path: <linux-input+bounces-3815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A28CE4D1
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 13:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF412281B13
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 11:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F3684FB1;
	Fri, 24 May 2024 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnU0hhI+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE753E31;
	Fri, 24 May 2024 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716549970; cv=none; b=CIVK03fPh5bzZCN5SsHN30NG8pSAp50YzLErs8yFRvIZ5oM8hotiKsJRwIIzTslqtbrl7JZ0W7c7Ni02V522OPz6q9/H+TDBH56GTaYngwF+s3HiiM88Mlaxh3fWis5exziPYei8Q0KxST/uyWIk+pgr3m4Rx+XSxztG90a0K9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716549970; c=relaxed/simple;
	bh=chq7EQ2+N5GBDGrjB34I7CsZYFkntwpUqQDfAk4iO+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PmmvNCDRl8UjWX2Fbww6S2R4rYNcLHH1Mv0QHIjyRtYjdH3X8wKvKzvTogX7BYoag8NohZ5aICyFEJxEnaZwC2Q4N0Zu4QQKP92DGpb4HIixo1KlpPKwkYJJFQdu+HEtI/ehc6u+0Re1X/sy1mXBwEu6F4qtZh/qp6iM3637yVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnU0hhI+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-354f14bd80cso1884444f8f.1;
        Fri, 24 May 2024 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716549968; x=1717154768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aZoOItPaWh/FTfJm1KDX5/f3D9ILbruFWVPhvGVXeg=;
        b=jnU0hhI+wLpYw1N4fVCaBM+BoR6Nm1LYWsBrHhqu1r5xCrZQXk3WW6mVQ1TAOExU28
         xUkI9PUmKr30ywwm8CIG9r0lyWgOiLdYD8NSkR9c4rQXBMfBYXk+J9hDX5nb/TIDLaO8
         nSpikJHt2d635xbLmXE2TnNjFbCvoB3E0aDU0DPzrvjvRTqJWZ7Fqdk/oKy6PqQi/w+L
         v8bsPBb1xzHokxuX87TQHZQiqyeeQHMNMm5bvD8ut4th+1N0TJw0lrcW3GM3DQHlXhV8
         CCIykPt6bIEJPx8VU6ovz4/D40L94QlrUOtNbntNWzsMJdhT1TQROs2qDNJXER3z+070
         /7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716549968; x=1717154768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aZoOItPaWh/FTfJm1KDX5/f3D9ILbruFWVPhvGVXeg=;
        b=qjoeXiil3x1kdni8l1kbqWWmRrFN7EKEMQJpDekJx/sd/w7dB8wF3qkdWcnE4K8QdJ
         9zaL4DQGbH5oz8mYbQ6MLU542GESFQdVdfC58TeTI45tdmt5Nnybd9r7/TdHfE57XdKH
         Q2SAsdBCt/OCHsmATBUvOwhOKejdkpaI/k0bcZXtg/RDhB76TSQKjWbgLPQsLKFusPJF
         o7BMrhTmVXTUqDK5th97qtnBoNjhPixtX48xPaTaMlHo+efGsgL+lrigtdNAZY78Njus
         s2Is0zswWWpE2KcfBed+GxgwJE6bTHckK0fURSMkZG10IRJ4vMZBNGdlAGuRj1t3wTMr
         Gv0g==
X-Forwarded-Encrypted: i=1; AJvYcCV1Z5Z0/KeiXb0LBb9G+rANz9sF6AgAUhEsMxPp+2HgC68Se/mnN27NqYxkvApPOw+ZV0gd03pUZa0VwXRk1DMrVEZA/Y4ROfTxHx+p8b6r2srgWCkoaQYeeTjzLd0L+eaAU623NXlglTw=
X-Gm-Message-State: AOJu0Yz6/ppIb/vS8ro8DmVb8IaFBQ0NkjpU/J1AXaQqw+ZFJwsiDxgw
	s1iMKczyrIP/IOwPKcGPPNFuN2ODkjzBYxU41g03POWlbGVb0hQvvQQh1Q==
X-Google-Smtp-Source: AGHT+IFr4UYrx0iw+dpdFzaLsMeajqiae+/o3HGAreqKudhsYshrFQFFGijaJYavX3fCRQYkpU7ecQ==
X-Received: by 2002:a5d:4607:0:b0:346:14d2:fef6 with SMTP id ffacd0b85a97d-3552fe021camr1187915f8f.62.1716549967478;
        Fri, 24 May 2024 04:26:07 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c936esm1369907f8f.83.2024.05.24.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:26:06 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 0/2] Improve HUION Kamvas Pro 24 support
Date: Fri, 24 May 2024 13:21:34 +0200
Message-ID: <20240524112554.166746-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series includes 2 patches to improve support for the HUION Kamvas
Pro 24. See [1] and [2] for additional context.

[1] https://gitlab.freedesktop.org/libinput/libinput/-/issues/989
[2] https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/989

José Expósito (2):
  HID: uclogic: Support HUION devices with up to 20 buttons
  HID: uclogic: Use Rx and Ry for touch strips

 drivers/hid/hid-uclogic-rdesc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.45.1


