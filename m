Return-Path: <linux-input+bounces-5336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536A9477E8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 11:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2052FB22F60
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 09:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D7C1474D7;
	Mon,  5 Aug 2024 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="UuVhgd82"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E87172F;
	Mon,  5 Aug 2024 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848672; cv=none; b=q8UAOL9+W+1TozJzmzEBiwiLPMyAuBnM2/DPwRtSsOT+ovSjjkJnS9U2GtRlVUIospL9p5MMEo7ywtLh9YdNiOMvIBQl6VWIQpyb1vb4uQmlnzH/DIl3coQN8TzjyiGrXkDb5EGaOwlTQkWz3q7bmN/jH8LjNNRpNAdQwoi3OKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848672; c=relaxed/simple;
	bh=w7ZHvS4p6u6IKx7Xwz/+vUcwktGexEc8pi672wxzw8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=spGPFuapIuXOQslGDj+FLYgRGCJakiqnciAxR0BdONWYnyDEPIzMxGqI882iddiMGPWjK4zTAcR8s2ydSB7skXzonJt+gAUA+E7FNOzMsBRsWOlY2YVfaYSHRhVM0O418Ss0dbu2Bbfh/d/ayQ0smt46ZQvoF3WyM052KdsvwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=UuVhgd82; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 54A6F2116D;
	Mon,  5 Aug 2024 10:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1722848135;
	bh=Q+o2Pu1MMLmQgwhuE2m9BRsFdFXuj/mOweDtXEz5VLI=; h=From:To:Subject;
	b=UuVhgd82nniAL9wAbo/mt2LZSpDgwZe0cOeYjuHUH/ySG3jauxB72+MZFeJJsrIaw
	 WKQNFlefm8JLcXuYNWAwZrhKCnMR9hvLHjgP40NvwTAPjhX0xHxSJI3gclQgyRbpW0
	 oFl269SyC+0bC6dXvJeZE765+je1FOXUd1kp+yzTC6LC41Dw9/hwtLjPwWdpFP8Qu9
	 hXI2X4N2nY6vcJQnVsKuWAOZ7mwwCEtEWK1gxm7BqVoW1Iy3oSoDcVYRVf7FB/8wEI
	 unPNaPA7xcVnYCXcLdwY5SrMVcQIVOeGawicsW+c85XdhHc2FSL/KMNtezoymXe/GC
	 VfOftIIfIb/Cg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Input: ilitek_ts_i2c - Fix spurious input events
Date: Mon,  5 Aug 2024 10:55:09 +0200
Message-Id: <20240805085511.43955-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

A couple of fixes to prevent spurious events when the data buffer is not the
expected one.

v4:
 - remove err_sync_frame label, return directly instead
 - removed reviewed-by
v3:
 - added reviewed-by and take over series from emanuele
v2:
 - initial series, sent by mistake as v2 instead of v1

Emanuele Ghidoli (2):
  Input: ilitek_ts_i2c - avoid wrong input subsystem sync
  Input: ilitek_ts_i2c - add report id message validation

 drivers/input/touchscreen/ilitek_ts_i2c.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.39.2


