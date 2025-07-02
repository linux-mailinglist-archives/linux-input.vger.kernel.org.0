Return-Path: <linux-input+bounces-13324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E2AF098C
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 06:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B2EA7ABFA4
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 04:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E741DEFDD;
	Wed,  2 Jul 2025 04:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="M2NtWW1c"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7C14B950
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 04:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428936; cv=none; b=RFUouaDNaRHLKis1TmGt4qD/cSytM3/jt9YOdgVVofolNPU/niHFPdsPPHNXjdfBNYgfnmag6fb+trar3jO3xxhKm6eCXESmpjS2KGL+CH3XX3+PJ2tpzeXhy6YmN7ch1BkcMuGf5Pp65hyFpzq0bz7QZcBkxRaFxfa7tecSipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428936; c=relaxed/simple;
	bh=Hh5yZozxLaIWWTjo6gRlVe6BF0sYLw/QRxuytbvJrNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdbImBjYZJOcSntKNioApa+uqu//ZNgGS92YjaagYXNGUHC+4JbEUow/xKcGaekE45cx7OfJKY2twZ0hJE5fqLMQAWLyrmDy/oJc9xnKG34eWbteUCVtEs9Uq1ce1m1TLnXi8tVQ0SELu2RRgAJhg6Nvm2t+wNiBTwBhvoFPZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=M2NtWW1c; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428934; bh=Hh5yZozxLaIWWTjo6gRlVe6BF0sYLw/QRxuytbvJrNU=;
	h=From:To:Cc:Subject:Date:From;
	b=M2NtWW1ccm5XIbt+kM0lIN/Fyvp5DflgyYsokv+VpXsD3iZMGuAf87Pr/deyuMWR/
	 oRbFcINwkzXOpc/ONavt7sE6v1VMieyQRi2nNCV4a2eMWUVip9q5Sh2S51Qvtwdjvg
	 FZ6N4vRt6bhOXKQ5d1X2Yn+23dgs7uQ/3gmvj37hgIsB39gMACAPjpMlC5uRikZ7kj
	 qNA6/0a5uLBMbHmCMAWwoCgqh6kV/zs2kROGZmshfzqg0C/fRoaKzgG9unYOdNAs8V
	 ZFl7YL/+4N2e1CVG7/+CdxIsGrpVnzbC6DDjJEYDJtmh6my9ShVUytc1eyrkV74Mqu
	 yK4QrnexidKWg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 16108A01E;
	Tue,  1 Jul 2025 21:02:14 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 0/3] Input: Add BTN_GRIP*
Date: Tue,  1 Jul 2025 21:00:59 -0700
Message-ID: <20250702040102.125432-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many controllers these days have started including grip buttons. As there has
been no particular assigned BTN_* constants for these, they've been
hapharzardly assigned to BTN_TRIGGER_HAPPY*. Unfortunately, the assignemnt of
these has varied significantly between drivers.

This series adds, documents, and uses those buttons in the xpad and hid-steam
drivers. The only other driver I was able to find that supports grip buttons
was the BPF patch for the Xbox Elite 2 controller. Unfortunately, I'm not sure
how to clean that up and add support in HID descriptor parsing, so I'll have
to leave that to Benjamin.

Vicki Pfau (3):
  Input: Add and document BTN_GRIP*
  Input - xpad: Use new BTN_GRIP* buttons
  HID: hid-steam: Use new BTN_GRIP* buttons

 Documentation/input/gamepad.rst        | 13 ++++++++++
 drivers/hid/hid-debug.c                |  2 ++
 drivers/hid/hid-steam.c                | 24 ++++++++---------
 drivers/input/joystick/xpad.c          | 36 +++++++++++++-------------
 include/uapi/linux/input-event-codes.h |  5 ++++
 5 files changed, 50 insertions(+), 30 deletions(-)

-- 
2.49.0


