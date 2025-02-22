Return-Path: <linux-input+bounces-10224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C13A40A25
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 17:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36FA31721B2
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 16:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B6B200138;
	Sat, 22 Feb 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HguWFOoX"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FA13C81B;
	Sat, 22 Feb 2025 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242610; cv=none; b=hDho9NodL5Z4kA1DORG6/q2qnpPYjejXavvEAlXic3fl6hn5IF34TspQVEwC/Oe7HT6m57oqZJ8kgRv/KL12IJ6gooj+dJIA2uBgByhKpIxz3aDgE7yh9lZr4BroZqMoCMBOHwav6dJsspqxFA4A3basJT3bnyZuLefcIxI1cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242610; c=relaxed/simple;
	bh=L1mZNeCIvfsn418CJpCBd3oaduHwwkogqa54kPF2PjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9WfaU8UVft94Z220bA28EtetTuytQzZGWo+TVS1IOhrcaIfGgVxqcPpEcvwOxRoWFJvFNwBJMo+iBnJYPT51zxYqlFyBYO5F6SiXmZSkIXI0HBx7v2pihzApzutstv8Lzn5Ex3F1mOsieO3wx8+MUkff1ErLS1mP+rXFDiAkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HguWFOoX; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 36E962E08EC1;
	Sat, 22 Feb 2025 18:43:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740242606;
	bh=R34snHbWvdFAPt2gGr+NDVYXXncXippn9g9TO+/e1Ok=; h=From:To:Subject;
	b=HguWFOoXcVlboMy1+IpohjqhqnYAOIkUA02wy4BZ0LcQHkHUs1g5t5OoWdNSRRlQR
	 64/qa5rmQlwS/hkNTfBySw0zznghp+yIXZdDEHdYehf2lvezRcc8jaSWL79bHqXuni
	 Gq+3HmjzQys4+74dWxvei56E/GHQE+F2V4GbjLSI=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 0/5] drm: panel-orientation-quirks: Add 2024 OneXPlayer line &
 ZOTAC Zone orientation quirks
Date: Sat, 22 Feb 2025 17:43:16 +0100
Message-ID: <20250222164321.181340-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024260593.17001.10533932745276244185@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

A number of OneXPlayer handhelds have come out with portrait panels.
Specifically, those are the X1 AMD and Intel variants, X1 Mini, and F1 Pro.
For X1 specifically, they also have spurious battery reporting within their
digitizer. The Zotac Gaming Zone also has a portrait OLED panel, so add
that as well.

Antheas Kapenekakis (5):
  drm: panel-orientation-quirks: Add OneXPlayer X1 AMD and Intel quirk
  drm: panel-orientation-quirks: Add OneXPlayer X1 Mini (AMD) quirk
  drm: panel-orientation-quirks: Add OneXPlayer F1Pro quirk
  HID: Add quirk to ignore the touchscreen battery on OneXPlayer X1
  drm: panel-orientation-quirks: Add Zotac Gaming Zone quirk

 .../gpu/drm/drm_panel_orientation_quirks.c    | 42 +++++++++++++++++++
 drivers/hid/hid-ids.h                         |  1 +
 drivers/hid/hid-input.c                       |  2 +
 3 files changed, 45 insertions(+)

-- 
2.48.1


