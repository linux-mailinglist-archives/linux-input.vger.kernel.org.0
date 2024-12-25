Return-Path: <linux-input+bounces-8761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA59FC330
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 02:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D95D1883586
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 01:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE27817993;
	Wed, 25 Dec 2024 01:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="TciKl38c"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8F7482;
	Wed, 25 Dec 2024 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735091717; cv=none; b=HUgBGkCBDntcZfLPJsheuWwimKHb6o5NLf/fF0HX1BGnLfSxFgIdYW4E7JD1xAH0hyTQ4H0vyTfVNiY3PG9EG6xAn3wo2gXZaqgulqrCHmVRY8VbToBlxars/ReOE1E3jvRCOl2wZfNV9L7WIqBjnaY98/TH2yVypHP6g0kHPFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735091717; c=relaxed/simple;
	bh=S76vNiu6ARJHGknVeXGRTZ/OLm+B1oh4MZpAgpgp6M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJ+umFQQ1KiC/jQ9hepUpyVV83sxgoWqZ9PmoIkUDmQ+VHChTmoYtMTnNr3PRbsj6UGEfJMIC4OQ/HRwoM9+r8FFZDOLj59O8BCWdlAqdjDPU/kwtqf5K8/+AjrmOmJov6kaM1t28zpmHQCOf2WOpsDbsLOoxEdGSLeYioUq9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=TciKl38c; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=iInTeYEKtC4Om4Hn0gY8ZVbN7VBzdmOn9S/NqRdnkWU=; b=TciKl38cSwlpEuLd
	9nGv3lbDdZmE1QsRSCr31I8MjotG++WDp2h6ufWP1dRJTbirJFPypwQ/O3LK3CfIdtKbdKMpdtfon
	DjUZphLlzUXXnwoDvWIdffeMoKefY6e5rpfDn7AwiZK5Q4XOj0jxW7YUYLWC+WjI2awIS9pkAMTZA
	4WsO9WqE2eswpR9MqyoHGQ1QQPqIp+WK9n3xKhEYZC7Ku84kQJyeIDjnZAt2CmrLtxkvUDwYHoih0
	jG0sMw6h2GfoodI0mPFwEcGgPcjzXV1V86fSO+zz51stdnfVjRtAQrxqSJkZuyJd+EvLYITSMOc9r
	xfWOOykSmXGRFsMtzg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQGcA-0073l1-28;
	Wed, 25 Dec 2024 01:55:10 +0000
From: linux@treblig.org
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] HID: intel-ish-hid: deadcoding
Date: Wed, 25 Dec 2024 01:55:06 +0000
Message-ID: <20241225015509.458032-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hohoho!

Please find a small series of deadcode cleanups for functions
that were added many years ago but haven't been used.

Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  HID: intel-ish-hid: Remove unused ishtp_dev_state_str
  HID: intel-ish-hid: Remove unused ishtp_cl_tx_empty
  HID: intel-ish-hid: Remove unused ishtp_cl_get_tx_*

 .../hid/intel-ish-hid/ishtp/client-buffers.c  | 21 -------------
 drivers/hid/intel-ish-hid/ishtp/client.c      | 19 ------------
 drivers/hid/intel-ish-hid/ishtp/client.h      |  2 --
 drivers/hid/intel-ish-hid/ishtp/init.c        | 30 -------------------
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h   |  1 -
 include/linux/intel-ish-client-if.h           |  1 -
 6 files changed, 74 deletions(-)

-- 
2.47.1


