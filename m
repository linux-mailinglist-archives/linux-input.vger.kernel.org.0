Return-Path: <linux-input+bounces-16835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701ECFE956
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C25BD30274C4
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14EC34C80D;
	Wed,  7 Jan 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5aalhyb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83034B1A3
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799348; cv=none; b=Pvnux9IeSVCT5MaoHqCo81F/G7/EmSY1lekAzRbUS6khcJ+T09dVbAJHidjHXld+1Th96YQlCIRbxJgxmaulOhbSOGoaOCIgZoFVDlzA2CZzC35HSf0Taiga8xeTcQIlooAs5QJA23FTwJQ8Pm1tHWKV6EQ83caRwl0DrtG5fTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799348; c=relaxed/simple;
	bh=TNIw7idB9f8vqNAo1codFH1r9kYlRtD5HtAhCcHhGdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrBT3mnihqWzFVJsNan1xqCwnaS17oSTtzVl5/Tf+qlvHd8ptN6fHqOuVFki14dUlFPvQkKzyz+U0wUkmOz7esmwO1P6Mn11+EqCjc/FJyC1fl6R9MzQHjfpS7mf4EohxKmV5uNKQt9z58WZmOIgL1PcdKHN/AzBVaOrZ8QNQjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5aalhyb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so4495375e9.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799345; x=1768404145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVaJRCzTZZTAjHpNsxUAqwAiKKlV7lFUL6ciZVsebV0=;
        b=j5aalhybN9i1OzRj9va6jb82HurBMESGr9skMfQNBjhMKzNESJmCQiLchh7ZpyPEy6
         qDgaCmW6rOIf+qWWHyuzt0pcc+S+bcZEZU/iV4WqE4hfz4a4fqRPTaeBdjZDvKUvRVO8
         J+HYYW10ryg5Y52BqQvw4HvT62EbWs6dA789ShcpplGYeIggzGbxDBzlIPn3Tcm7gyge
         2+mz2XAnICoxmVkD28vZjNmTEhh36uq9oM6aUeauStujA72UpR6hOKWl41bwzmj0rJlc
         /mQrX9MNqCfwYcc6pnz6RNUaDXtiAW8FRq7WkinZj7wsQCUs3ytjO72Mc0W4CK/CLPKJ
         /FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799345; x=1768404145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVaJRCzTZZTAjHpNsxUAqwAiKKlV7lFUL6ciZVsebV0=;
        b=I1xxwpy2kFZxEkxSqEgVFsQ95tKqX5GRpe96C8HHzxvfs3hjHMPRB+p10xgr8r9261
         P5IsO9d4YVUnIILnUtNyPcLCpLGpj9YmWCnhnQe9HmK+AiQYTJJ/Lt7aeNvNJo4ATB5M
         BhZzNFH7YBWvAy4hZsk/lFT+1xJ34Q5FfeMkWVoxe7QcCsZVrpBEQjFku2DdFm8L5vFu
         Cn+NWcPQ2G+uzqrAh4q/aOYQXG3y9y0mRAc7ga5wUBoyt4CQg76VY6rYUWSOrjC59hIq
         bvLRJ8+NSN6zg/K1aRGxliv93shdy3HCUCDnangutYdmcB+aDjBIIGtuWCb4CovYvcCP
         3GnA==
X-Forwarded-Encrypted: i=1; AJvYcCWUGJ2FaqHCip8dX9EC3S7BwUKj+RTPuZHW50QLKZ4HEbetxm9YBq4nqhC4qKCAhisEyPkXoHPnpwdA+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1rM+/K99teN2XiqkJ5FX+mdjfbny41e/wp5NK9K1V96ANJZB
	Nj6PjU+y47zHFU7ZFl2LmaPU+oDIXx8D7Ud8t9HFEFFDpteh8G6COv3x
X-Gm-Gg: AY/fxX5gs3yocQ2wCzYwVk2mBnF3CiQdJ9GRi/TE5DJpW+Ptw9k/z8gZWe1M+Qaqq18
	iFsdX4BP/ld8A3E8E7BFFVFw2B3KlUg1ifRyykD5EUfJKLxbWnKl2p/+qBK7G7XabKNDBf2XfL1
	UQ/cYEL6Ou3QTHazFUUs+SJcV7kGGflQqEJ64brbhRfjPasCXU3NXM/NogUzYpVNGVrZ1KAkP5k
	Jqtv8FX30xQ2L/Rhb/qeGSzOV38xGYZBJT16PkpBSZLpeJh1SOuSgHODP3KmFl2gopEk7oDmhP0
	33xfe8yQCSDkrlm4oJ5ESlUNGHNiJkOw5YfVXybBgKJnQeEIaGW5rtpLeCNAi8CMpQN5KgmoV1V
	gDD5KZsZhQKAPlhaknvmXSvcGcPSZY5/mqirqxTRHQByDGTkB86HlSMekKCGdPiccZidz/fBcv3
	sv/X8p5/hnHrC/TyS7dSBhBbZVg9arxiP3i2jQ7kQ=
X-Google-Smtp-Source: AGHT+IE5Ck64NUBjWIexM4nnRTKNnugE/RCZRKXw6KvBDscQBu8DpmpfjSexdf51x/mYNguJEWG27w==
X-Received: by 2002:a05:600c:3ba9:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47d847d0f30mr41715775e9.0.1767799344902;
        Wed, 07 Jan 2026 07:22:24 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm112064125e9.1.2026.01.07.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:22:24 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v3 0/4] HID: asus: Add Fn+F5 fan control key support for ROG laptops
Date: Wed,  7 Jan 2026 17:22:10 +0200
Message-ID: <20260107152213.143247-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

This series adds support for the Fn+F5 fan control key on Asus ROG
laptops and addresses spurious HID vendor codes that cause kernel log
spam on these devices.

The series introduces:
1. Code cleanup by replacing a magic number with an existing constant
2. Filtering of spurious HID vendor usage codes on ROG laptops
3. Infrastructure for HID-to-WMI communication with proper build guards
4. Fn+F5 fan control key handler with userspace fallback support

The Fn+F5 key handler attempts to forward events to asus-wmi when
available. If asus-wmi is unavailable or fails, the event is passed
to userspace via evdev, allowing userspace fan control implementations.

Tested on Asus ROG series laptops.

Changes in v3:
- Added IS_REACHABLE(CONFIG_ASUS_WMI) conditional compilation guards
  to prevent build failures when asus-wmi is not compiled (patch 3)
- Modified Fn+F5 handler to pass events to userspace when asus-wmi is
  unavailable or fails, enabling userspace fan control (patch 4)
- Updated comments and commit message to reflect that spurious codes
  affect all ROG laptops, not just G14/G15, and occur during normal
  operation, not just on keypresses (patch 2)
- Simplified commit message for WMI infrastructure patch (patch 3)
- Added Reviewed-by tag from Denis Benato
- Removed Change-Id tags

Changes in v2:
- Split the original patch into a logical series of 4 patches
- Improved code organization and commit messages

Ionut Nechita (4):
  HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
  HID: asus: Filter spurious HID vendor codes on ROG laptops
  HID: asus: Add WMI communication infrastructure
  HID: asus: Implement Fn+F5 fan control key handler

 drivers/hid/hid-asus.c                     | 80 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

--
2.52.0


