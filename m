Return-Path: <linux-input+bounces-6981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D698C510
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 20:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BC33B2305C
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 18:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BD41CC882;
	Tue,  1 Oct 2024 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gTEQyhS/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE6321D;
	Tue,  1 Oct 2024 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727806034; cv=none; b=Y+lFhQUDPARzhNwGyViWpI4s7F6IIjG6tasxXwSC+FB41vunvvotc5iINvS1bEMSYbPPlcbn5CBiq/pa5yRpo//hXx8/otsJ6tqk/klIZBzMoKmtJjf/sBU3Cr6CqVB3z6I5qLu82g4fjW1JY05EEvzkaseX+a5WiWXIZL1rah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727806034; c=relaxed/simple;
	bh=/uHOZMUTfO6ix86RVrqLE9ZnTVIM8qqG+TGKSbd1pCo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i3p1envh2QXatFshiNvycFIibLbLRUWeOIEvqrrRWH+3TYykZkcVZantkrx5ayegHZ9TTKtvLiFReF1Dc8s9L+ct6JWVy5duXBs7lGauIRofs/RnjJo3+Bjd0MT04l2ZoWBpcmIS4D1pOtjYJCJyADnzeSjOwYe3ubSc7shtWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=gTEQyhS/; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse.fritz.box (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0036A2FC0050;
	Tue,  1 Oct 2024 20:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727806024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/uHOZMUTfO6ix86RVrqLE9ZnTVIM8qqG+TGKSbd1pCo=;
	b=gTEQyhS/W2Xr6M9DZKIZQvVyVpa6hAU1rUWjFlRDI9E9wVUW8r4g41EZQORwO4n3s4W5Rv
	5V3lw7mf+YjefModJOCOQRPpXb1iT5jDvvOTCf07pFobM2fvzsGD5qeFKBVkezzUhLMiZk
	E5Af36dx1JSevtk/VQ32NwY+q3FTG7w=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: 
Cc: bentiss@kernel.org,
	dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com,
	jelle@vdwaa.nl,
	jikos@kernel.org,
	lee@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	onitake@gmail.com,
	pavel@ucw.cz,
	cs@tuxedo.de
Subject: [RFC PATCH v4 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04
Date: Tue,  1 Oct 2024 20:06:56 +0200
Message-Id: <20241001180658.76396-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just wanted to send my current state as previous version had a null pointer dereference.

On this toppic, why does hdev have a hdev->driver_data and a hdev->dev.driver_data which are not the same? I assume hdev->driver_data is for the ll_driver and hdev->dev.driver_data for the driver?



