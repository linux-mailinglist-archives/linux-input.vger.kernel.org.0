Return-Path: <linux-input+bounces-7507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF79A26E7
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 17:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6F01C248AC
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 15:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC421DF75B;
	Thu, 17 Oct 2024 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMiqjhkP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94541DF757;
	Thu, 17 Oct 2024 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179352; cv=none; b=KQ0bourvlPpeCyMVOvdI8KnhAmTpKm1DBznS1b8m0JrBWq3zK0DMwtJZfzIqCu71bYIJMyWcnH6XiaFYS7Zrltass+D0l6RxQ6LWDJkvX3AIYErx5GAOVGv/rAyfaSqQeZyGVrCM3jrfVSBrrWPEM2vCda1F/mFYL1P93GCp+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179352; c=relaxed/simple;
	bh=tRNtYUEMupFO5autUe8ti9lEvib7Toh+MFRBeqXw2wA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LjRrPxSZRq6LodfDT5Hm1KBGSZztdUDILuBw3xCo8JyhB5jsTdb7viVw3saA41C4YTwhb0sOblCGa1UOIWus//rM8jx2wQ/xJyVCtRVETIYQrEcaYjjgWy7ugdsykdFDuTfVjHd4eiWy23gc4WfCa0kHqYOciUmBZcwjxwftLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMiqjhkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C88C4CEC3;
	Thu, 17 Oct 2024 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179351;
	bh=tRNtYUEMupFO5autUe8ti9lEvib7Toh+MFRBeqXw2wA=;
	h=From:Subject:Date:To:Cc:From;
	b=OMiqjhkPvNCTjQHhUChmF0pupSAcPLf61tDR9g/TC+h8p1XxO8a71J8Hgp38X8+iu
	 fbHmHpypBbYOQ2koAlog9S5ELZrtjA6hAD+S4DhIv4cwGK87/7aEtbum0RtzH6cu8I
	 BkQeMeIFyx5IFs6NpRgFcAgPyMoNdRdEAByni5JfLHN17wjFU3TnuryQ814stbQUhx
	 0a7m8Hh6+DIghCfa7BOAHdfQ02bnQ4XLp4lsWYrRkTB25ckAZB2eXahOeuCaPWzsIX
	 KgdgTEweQfDpqxAqzQ/7T491yW9QLuRzNZs3u77k0CcDjxuUjm0SPUGF3zmCFOtiBi
	 6nmQOOaPIjGeg==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH 0/2] HID: bpf: add a couple of HID-BPF device fixes
Date: Thu, 17 Oct 2024 17:35:39 +0200
Message-Id: <20241017-import_bpf_6-13-v1-0-197d882ade37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsuEWcC/x3MQQqAIBBA0avErBOcioquEiGpY80iE40IpLsnL
 d/i/wyJIlOCqcoQ6ebEpy/AugKzr34jwbYYGtl0KHEQfIQzXkoHp3qBrZCWjBxRD85ZKFWI5Pj
 5j/Pyvh/sL0dEYQAAAA==
X-Change-ID: 20241017-import_bpf_6-13-0dec081b7ffd
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729179350; l=711;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=tRNtYUEMupFO5autUe8ti9lEvib7Toh+MFRBeqXw2wA=;
 b=YcKjwI9jo+R2og2ZNkM/ws8xjXvKbmNHUxH54LTm7IJ5HewTUoaGuP1cdg5BTfX5XjmJV4jFc
 5sRjhhdB0ZyBnz5KS2iOescTJqYqRoc+F2GU51ptFvPlOpnlYY1Ixdu
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Both files have been in udev-hid-bpf for too long.
Both files are actually simple report descriptor fixups, so
there is not a lot to explain here :)

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Benjamin Tissoires (2):
      HID: bpf: Fix NKRO on Mistel MD770
      HID: bpf: Fix Rapoo M50 Plus Silent side buttons

 drivers/hid/bpf/progs/Mistel__MD770.bpf.c          | 154 +++++++++++++++++++++
 drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c | 148 ++++++++++++++++++++
 2 files changed, 302 insertions(+)
---
base-commit: 6485cf5ea253d40d507cd71253c9568c5470cd27
change-id: 20241017-import_bpf_6-13-0dec081b7ffd

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


