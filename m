Return-Path: <linux-input+bounces-7641-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5CA9AC8E4
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 13:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797931F21848
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAEC1AA7AE;
	Wed, 23 Oct 2024 11:28:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A119E960;
	Wed, 23 Oct 2024 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682913; cv=none; b=LaAmeit0fwlA+Mdiw+PGvIsrDXRYsgqor9f64kSBFwIcCIK9cy4Me1dMa6dfF0JXR/maVpiU9G3j7hzyGZ+Pn8DA4V2H3BApJgkEUK3VVQMlLAeCb5QjzkYU3DflHReHBMM8N/ZC6MFo4nHlIy/YyQu3RnVeKcD+a89JkkUEYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682913; c=relaxed/simple;
	bh=kblpFkkPM50WA7eEp8/v5meAcxpMSE5EAiJ71d6ip+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjXVIc5o2T7ehfpoOaUbd1cda1g38VJS3OfbS7lO5mn51lqbJRSlNEdZisoJVFuQyPL9mYF1TRVXX+xafcRQYG9Jegf45DVrta/KYVa6fdh1f/PH9DUBAxSGPQzNHP1Bo02iKc08o4JRcO2pVy6toqROZVizT+4Mch3rBoDW+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42D5C0005;
	Wed, 23 Oct 2024 11:28:28 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 0/2] HID: steelseries: Bug fixes
Date: Wed, 23 Oct 2024 13:24:36 +0200
Message-ID: <20241023112828.320157-1-hadess@hadess.net>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

A couple of bug fixes for the battery reporting for the Steelseries
Arctis 1 after using the feature for a while.

Bastien Nocera (2):
  HID: steelseries: Fix battery requests stopping after some time
  HID: steelseries: Add capacity_level mapping

 drivers/hid/hid-steelseries.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

-- 
2.47.0


