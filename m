Return-Path: <linux-input+bounces-3302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A401D8B6669
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2024 01:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BFB5B22C7F
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 23:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71297194C69;
	Mon, 29 Apr 2024 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="GntLG5WU"
X-Original-To: linux-input@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950781836D1
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 23:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433994; cv=none; b=ZlC+Cg6e44QlygneUdHmKYc/pWmw4cckSR2ml2yJPAQDliDEWdXJ93xnvMN9796thn4sdctf11mvsumXJY4K6RdxTrPDADwWHpd1HgXq+AGc2e4V82zX08uAjV5U1Q9F/u/HHBR70ESvxdXk2bd7otbQLsoO11oon2cJHVHFb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433994; c=relaxed/simple;
	bh=Y7MgXOGlVLSsruR66RDz0IenAw3Zic8P5DPuYKlA2zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rmi8HXVEIZtfiwIMAuh8pVrKKk9KEesrTi9+MhccgNcQUt2PO2Qu9iq0/AuUTAbt/u8GKJ1TvVVwzvciDTZ+OCEJk9ZrMQvqy8mvtgHLlRQvIvi3KC1bRgfG9xkyTY+goqHpOQ62Kq8M0jShviwUXG5uGUoU38vsulPcXX83W9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=GntLG5WU; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1714433990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y7MgXOGlVLSsruR66RDz0IenAw3Zic8P5DPuYKlA2zs=;
	b=GntLG5WU9G8fjuihI2/3E0+kZcpvbOcLU18obq99uFSk9GQh0bPHBGrpB+1DCup/7uHTvW
	ipsdy5wJBmDw/Gh27VbmnYROtS8GpeM2gUY2rL4wfb5pjxoampsQMYoZmiKjwEhVO/D8/P
	+FxSeq/pUzZ9p9QxUXQVfrsYpA6l/35l4XkkKF6MAcSfnzYAQZ5WZv84t6Td4ZuE7xwr0P
	R34o93lu/QzSq6w8esw7wQ0L97Q395BcXOv9PzKJEzqWNQbgMemAgKYU07igkeoOsK1Gmk
	yo7quLl8vvxmhFfXKaGryrYqY2b1fCwLYdzcisMwlzj/2J31yQ6Tj70+URTE7w==
From: Kenny Levinsen <kl@kl.wtf>
To: Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dtor@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radoslaw Biernacki <rad@chromium.org>,
	Lukasz Majczak <lma@chromium.org>
Cc: Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH 0/2] HID: i2c-hid: Unify device wake-up logic
Date: Tue, 30 Apr 2024 01:33:13 +0200
Message-ID: <20240429233924.6453-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Third time was not the charm[0]. After Dmitry's comment[1], and after
looking some more at the I2C drivers, I have given up on removing the
smbus probe for now. We can always revisit this later if the situation
improves enough, but there are more important things to fix.

Instead, go all in on the address probe with retry and use it for both
initial probe and resume, replacing the previous retry on power on
commands. This gives us consistency and a single place to update and
document.

[0]: https://lore.kernel.org/all/20240426225739.2166-1-kl@kl.wtf/
[1]: https://lore.kernel.org/all/ZixvUNooESC02cJK@google.com/


