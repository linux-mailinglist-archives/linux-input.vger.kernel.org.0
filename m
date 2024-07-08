Return-Path: <linux-input+bounces-4897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302392A041
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 12:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389BC1F21029
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BA723774;
	Mon,  8 Jul 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="natQ6exY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEF1DA303
	for <linux-input@vger.kernel.org>; Mon,  8 Jul 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434657; cv=none; b=s+tX0+AaODSya9R3i6hWO855vyDH4OTeQekjqVuta8EaVZpADydlba0+boukOoCzG2tbHp6rB1+n//vQ7JUvCLPAIyoHlgbt4m2e3bTgVsMS6YuMiG2T1lSVFBTv+xeQlx0uYn9gU9NvePUl8gBaKwJdxsMqmxN1vhwPDc6Q//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434657; c=relaxed/simple;
	bh=lCG9CeElXZ4KD1gJBe5RJNyTFUAmulOjf0Xo60adpBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rcL1tusjOw6tzjQnEQNrPHvEYsLnmHFQaebrCWmFKqqxojNJitlUKfC+J9xj0ilr1ngSpa78g6PSX640JHRhe0VqYadFAa2XxyrMaU6zKYQ3haEEs16GiM5X69yfnHB/2069psWjOY6C3F0chu0o4tLhDXlSzLHFpCPOLfioXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=natQ6exY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58bac81f419so4952920a12.0
        for <linux-input@vger.kernel.org>; Mon, 08 Jul 2024 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720434654; x=1721039454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCG9CeElXZ4KD1gJBe5RJNyTFUAmulOjf0Xo60adpBo=;
        b=natQ6exYZRs9zv2KtDFnsWN289h6kAemfKB58Femoxk9vuRV+Qcgi3iyUZo0d/Q3eI
         RnOpCvzHQNOuJXZzLhBeZKzpt2cWmrQNjLqqhY1Q8x1lE6PbthrWrzBTK75UQESh36gw
         J+7acM/cUVyghvODuMMpzFsbDJ+rWsWGwwGnTTjDsnhHGYXt9OOJdK0nfBEttesFbPdT
         +tR0zm8k4kE/tTvLK+534lzirEi1MH9ezaLPiH5LD9p4wYWvL4mwqnp9yDUyExlbASVK
         rspm2apwGFxdq4GvJQPabnZPcyskrcN5YVxpYAgzY3og+qt3Gydixv6nF5WG2CISdxK7
         S2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434654; x=1721039454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCG9CeElXZ4KD1gJBe5RJNyTFUAmulOjf0Xo60adpBo=;
        b=I7f1KVL1b762n3/7xpgLpfeH8Qkr8oVShwOo83x950byiryixWh55b0z5tTw4Kik/0
         QetvyUZ4y72cb5hIPtD6Isf76XDKXA2+3ShZ+WwavkTubsP67uqH8QE0RGbRMjZMvUDc
         MfMSu9McdacXld52ubLbSoxP85E/AGP+TybiXXXYGMhSe9dreDZgUhyPIzynmYJLopPU
         hWQ0aQ+yV1N/+p/k8D21lUjNt/G0g8PW6tPh5Eurdo16GMqynykt+eFOhF9R4r19+BnC
         SFq7hN+JVFStwMbMQn1h5jdhrixs56xIi6zordHzroDduDFzYIK8s3SRpqAX1pUVJfrD
         6TzA==
X-Forwarded-Encrypted: i=1; AJvYcCV/l+jY4VVbGQexsefpPYyKmxPse40axJCjMAMCPeVGpsQZODHfEmPa0F2WVtCNIRthWHuOPHtj0CrgRTMSPjfATMSMFmAld0LX3mk=
X-Gm-Message-State: AOJu0YwkTyD9/+VUnssINdpTnf59z1WK+nxv4qJPeIlx4GPcpUS7DDQj
	xULEcPgcfT2KN7882ImyCUza9C0ld7sodnk5uyeo9ASi0KKjychmGqj5om3H
X-Google-Smtp-Source: AGHT+IEBcxQB85XelqWveL2Mopkbyk5W7xgUCmDJmFGs7YEl7zEnyTwtiXCU7/havlD7ucHi7K/WSA==
X-Received: by 2002:a05:6402:1bc4:b0:58f:90e0:a1d0 with SMTP id 4fb4d7f45d1cf-58f90e0a305mr4523932a12.39.1720434654119;
        Mon, 08 Jul 2024 03:30:54 -0700 (PDT)
Received: from laptok.lan (89-64-31-171.dynamic.chello.pl. [89.64.31.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58e268be940sm5265359a12.87.2024.07.08.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:30:53 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: bentiss@kernel.org,
	benjamin.tissoires@redhat.com,
	jikos@jikos.cz,
	linux-input@vger.kernel.org,
	michal@nozomi.space,
	tomasz.pakula.oficjalny@gmail.com
Subject: Re: [PATCH] Input: increase max button number to 0x3ff
Date: Mon,  8 Jul 2024 12:30:50 +0200
Message-ID: <20240708103050.541066-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ww7ozt6alknc763c34gnvi22zmqsm6uzjkkcmhvvjx4ejx5g5b@6t7za6f5iwiw>
References: <ww7ozt6alknc763c34gnvi22zmqsm6uzjkkcmhvvjx4ejx5g5b@6t7za6f5iwiw>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This would be be really helpful in making linux even better for gaming.
It's weird that Valve didn't catch this already :)

Do you have any guess as to where this old value came from?

