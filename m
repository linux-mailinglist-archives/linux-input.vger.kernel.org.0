Return-Path: <linux-input+bounces-13569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA57B07CDC
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 20:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF1716D46C
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 18:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DE0299AB1;
	Wed, 16 Jul 2025 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="iSI+ss6z"
X-Original-To: linux-input@vger.kernel.org
Received: from silver.cherry.relay.mailchannels.net (silver.cherry.relay.mailchannels.net [23.83.223.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4827EFE7;
	Wed, 16 Jul 2025 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690254; cv=pass; b=PKukAXAZsK6b6hwVe4Z8hSZfU+WJ9+BLPPenawCVW+hsM9BQtUQyFzi/TLYuLvolaunSiuEpGr7QFEArrUPpBD1MxM7nQc7wveyqhIlYUYN6s1D3is5zvaaP3Vm7Yu6Y15cNOzykltDX9+2MZPoud84/jTeCJtd2Zjf+GHhbvXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690254; c=relaxed/simple;
	bh=Qmt52f8/2LwAYjUUXxSr5QUHtvrdlC+AIEn/M3eHj6A=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date; b=h62+iEfylgLh26mU1B84PSHUsEreBcqNdnpMUqfD838CSmJRb1HAm3S0i/AFv+vQ22RlDc/8Mk6MyfU40fBhTPphy9wxJhV/7nLDPkuljoyJY5YmxBlvM6GlCDqiVi93339t5zjkO8TMzIn+Aev+HtWk1tm1ejrO0UOEdYYMucs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=iSI+ss6z; arc=pass smtp.client-ip=23.83.223.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 02ED68A33A2;
	Wed, 16 Jul 2025 17:44:47 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-blue-5.trex.outbound.svc.cluster.local [100.120.203.220])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E72DE8A47BC;
	Wed, 16 Jul 2025 17:44:45 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1752687886; a=rsa-sha256;
	cv=none;
	b=CTwgrtC/r2COz2baFj1hpQb8aDto+AsYYXLLXz4L1KLxre8nftjHf2d8a9hlMqmCJjHzra
	FGSR5maH0sGSqcN8Wk7oHs1FdvSHheLTga/Niqcs7a38UpGERB+Pl+chSjKnHQcLbhIUTi
	8BIaEfvAV36fTbL5p8otkZ0Dq/zDJgJTAE15ukiOO2++D+bVVrSXfOu2e57KRLKRkB8Jxr
	S48GlkOYcQVoFKTIycK+CIlPvHJOXAu35XeAvW9d5ig/bYuHNcT/2Y7vYv0U8hNRjEG5cu
	U46UYHB618KTisiZ7QNA7EAzdt7PcAx4b80u6hkNOZRaYv0/vJ2OTyO/hijZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1752687886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=GlX3hB3FvSNa7llX9TkDQGn9lDzE4VQESKNVIVhRQIA=;
	b=rypdO+OmMHJfMqUH6gMrouDKprQ3O1gIBEfifA4XI0OiJsaOm/jL4lfecO9kqnXJwyj/q1
	88o1eWcbeiCsEE2b4Iu6wAC7f6fDuJdRR5mLpirmQ8Pq6MvUl+qIoX6Ei+vvpYzGN8l8uJ
	/p3O3BlT/I4VI6ng1DWAQ40Jl/hIIKNS/4hPVDlSTTK77vO91YXXUixqJpJgPPTvM66BwY
	9M4DB6YwhhJaBQN2P+kYlXV24IvvurrkE2HxAcltGX1HWVW2b1NTYXB0OVxEorJJJirF3T
	T+C7p3/bhztnWuww0aaoX8wr5gMKU7djceRcCUm45G7bn99OZ9wVDNaMZKBCoQ==
ARC-Authentication-Results: i=1;
	rspamd-57f6596c64-h2sh4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Ruddy-Decisive: 0a0ad1b23dda1374_1752687886909_4056919767
X-MC-Loop-Signature: 1752687886909:3143730403
X-MC-Ingress-Time: 1752687886909
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.203.220 (trex/7.1.3);
	Wed, 16 Jul 2025 17:44:46 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:e8b0:7f05:ab28:ab3])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bj3NC5Yswz4dDjZ;
	Wed, 16 Jul 2025 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1752687883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlX3hB3FvSNa7llX9TkDQGn9lDzE4VQESKNVIVhRQIA=;
	b=iSI+ss6z3OAo4CFilTxB1e0uvRCB8Ay0dmYtyE5wKx8QlrBPQE+4XWl5n/Qxv8iwcdf2sn
	+O2HMUPVaVYqGDn3iXOSpp2V7HQYE8ud+FSZzDPomolaXAm4cGDznZPfRsHyTWx0Mv1Cbf
	zPd9PWG/qnb4bRbloqa+sY0amt3gk09l8ovxbfviIvgIKFh9i1DRN9ubeJrr2W+/iPQ1mi
	HwSnIL+b3kT620KQvUGWLAq6Jip9eRWFAOwgA09yGJSvia8+hFygQvQDke0wZ5juB358eP
	TwRTM5kR4g786rLkAT3kpxJcutjXGIyKEuclE4Z3x8AWyxNE8cCl0DihYPxvuw==
From: michael.opdenacker@rootcommit.com
To: anshulusr@gmail.com,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/2] Input: adafruit-seesaw: fix "flat" value to avoid drifting
Message-ID: <20250716174422.860500-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716174422.860500-1-michael.opdenacker@rootcommit.com>
References: <20250716174422.860500-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 16 Jul 2025 17:44:43 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=6877e50b a=73ergSEiYqifmUh+pZZJJw==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=zP-fLRyayCjw1eh9aOgA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfO6jovlNKzIM4XcILRHEyN9euk5wFBXL4B+4YTU23x7DqjfAOzZS1CWJkhSXTmeiVujAKhJix6c9Pmlh2YdUpXoAvJems1H0sj1MldaJocfJe23XRO8M wKGiGOQwyGiYzViUEke6nHsSpRnAF7X/zXzrkgP/W+OJ/v/dDHFVKQlEldpkYyNjWLQ2a9gBlwunQ8EBiEtTwH3iqbDZsDxYjWKNvyBgsOgWs/5xeC08QTIV pRUGItpHjFv7co/0HRy4j9A41YnkHYpe6E7S4Td/eT2a7ZtcDPzw0m8syzfgM8+Nv3Xgj154bAcptmwXdMmpEYLgAFE93SwQOMMmXlu+nenGpTGJkBNY6mln ILnRWL54DqSnQrJ9jNUj7RwgocVX7NS2b0eluUzUyFnve4gqx5YL3Ozovjqdvixtoqyrf13BdSb7GQhV6O+XVc2rvhsEfozfXQVXYM6xuB7dcx3r5fk=
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Tests on 9 Adafruit Mini I2C Gamepad devices have shown that
the center X and Y values (when the joystick is left at its center position)
deviate from 511, which is the center of the [0, 1023] value range:

Device     Center X   Vs. Expected (511) Center Y   Vs. Expected (511)
1          519        8                  493        -18
2          524        13                 518        7     Not very stable data!
3          508        -3                 531        20
4          531        20                 508        -3
5          505        -6                 521        10
6          519        8                  477        -34   Big outlier, ignored!
7          519        8                  524        13
8          524        13                 510        -1
9          517        6                  511        0

This change causes any X and Y value that is withing a [-20, +20]
interval around 511, to be reported as centered. This avoids
unwanted drifting (towards left, right, top or bottom)
and makes playing with this device easier.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 drivers/input/joystick/adafruit-seesaw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/adafruit-seesaw.c b/drivers/input/joystick/adafruit-seesaw.c
index 2b18451a0953..03eb181d5aef 100644
--- a/drivers/input/joystick/adafruit-seesaw.c
+++ b/drivers/input/joystick/adafruit-seesaw.c
@@ -50,7 +50,7 @@
 
 #define SEESAW_JOYSTICK_MAX_AXIS	1023
 #define SEESAW_JOYSTICK_FUZZ		2
-#define SEESAW_JOYSTICK_FLAT		4
+#define SEESAW_JOYSTICK_FLAT		20
 
 #define SEESAW_GAMEPAD_POLL_INTERVAL_MS	16
 #define SEESAW_GAMEPAD_POLL_MIN		8

