Return-Path: <linux-input+bounces-15619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECECEBF212C
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 17:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C00C018A33E0
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 15:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07260266581;
	Mon, 20 Oct 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHWUxWmZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BD265623;
	Mon, 20 Oct 2025 15:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973814; cv=none; b=oqS460sUAroOyfzgcWte8dN5klE1qMgY3mIzbbZxm3STBoZpwydhjXtayri6WNGGEXi0XMciffc2b6bU8ZKr56xIsMAM2q1/cS1OJvPUe9zxXr4XsOHZqlTkXwecyB0PPPkevVVNKXvG2qtSi4Az3H+OFtw03O/ce5Vfciv5bsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973814; c=relaxed/simple;
	bh=KQzmSRLR4RxsZ1lriusRZsCbqnxL0Gc4qoTBJ287psU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIWM5prElzywnoCH14uD2V57PUatBuHL8OKirNhY3PA2/Pgxk5ARLL5ynKdNA9jCOO+NWqw5yxtoFZ5kCLbY9QkZbVcK1+FTzF7oLwhAjanVTuLW29qgljX7CEvfC9K2No1c92o0SUWmEDzwZ+XGOfEBFFHiFmq+mblzekVFo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHWUxWmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191A9C4CEF9;
	Mon, 20 Oct 2025 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760973814;
	bh=KQzmSRLR4RxsZ1lriusRZsCbqnxL0Gc4qoTBJ287psU=;
	h=From:To:Cc:Subject:Date:From;
	b=pHWUxWmZIqF+Ll9g010kRrKxgRR59/wyrnvvYii8MdlNNuYQmXSWQETyT6tmXQ9NR
	 DUXq+HHAQ98+vaHvC+1AQATP2dh9jXHkYXeCXJ9dz6saccUJuLvN4jA2sOFD7MBR1Q
	 0LNvFH32egkrv6d7tOL13TotirFFkOAqmg3wkuyNdMYL0OrI0kceFwnOIw3k1fKXJz
	 WIocZqPV67VLoRdPRsRVmwcal5YX62Ltv43K70SLcw6tIcR7nSno/rgGfJfPG7pbrM
	 gWY8aLQOxk+TTx4S3UlC78t00HvN03XGDgjJ2z1s4pTApV+Ej3Muue5VoZ1O8ByZ2G
	 EFgXFswFlbnLg==
From: Hans de Goede <hansg@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Input: Add keycodes for electronic privacy screen on/off an use these in dell-wmi
Date: Mon, 20 Oct 2025 17:23:29 +0200
Message-ID: <20251020152331.52870-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is a patch series for adding support for the electronic privacy screen
on/off events send on e.g. Dell Latitude 7300 models.

On these laptops the firmware does not allow querying the presence nor
the status of the eprivacy screen at boot. This makes it impossible to
implement the drm connector eprivacy properties API (1) since drm objects
do not allow adding new properties after creation and the presence of
the eprivacy cannot be detected at boot.

So instead this series adds 2 evdev keycodes for eprivacy screen on + off
and modifies the dell-wmi driver to use these, so that we can still
propagate these events to userspace for e.g. a DE to show an OSD.

Dmitry, can we get your ack for the addition of the 2 new keycodes?
I think it will be easiest if Ilpo merges the entire series through
the pdx86 tree with your ack for the keycodes.

Regards,

Hans


1) https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties


Hans de Goede (2):
  Input: Add keycodes for electronic privacy screen on/off hotkeys
  platform/x86: dell-wmi-base: Handle electronic privacy screen on/off
    events

 drivers/platform/x86/dell/dell-wmi-base.c | 12 ++++++++++++
 include/uapi/linux/input-event-codes.h    | 12 ++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.51.0


