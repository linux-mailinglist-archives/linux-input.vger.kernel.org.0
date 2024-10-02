Return-Path: <linux-input+bounces-7008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04898D1B9
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C02BC1C22062
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0911EBFFD;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftK8kNfP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769EF1E766E
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866312; cv=none; b=KfSJpSXtsurNYpAXX1TTa4eCegAOehh9vT+SHTFnlzdaaEEOgs9QY6B3mN35SQFdyAF9F6hHY1xt+K0MXAZaGgXq2WLl7/eKO7/9H3FMnNApWMe+9MnsnG2ZsZOzLYqqj30+WthDWaheNJWnMAFpHwCI/ZEI6BOZZfd/TcibRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866312; c=relaxed/simple;
	bh=Yh1n+IyXFeGoq0Rey8jtPpnhyiu8CFDzwyDYipT9LSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PvecoW5SDUVZq/wGun9CzBcJGTC9m817jrgGhrkOi62+3aMPvswnIq8zhiucr3y8UlZ0xJT/oBvlhZEmLFWN7Xl2+sWylHvbr9xllhAvb114bZWk/glUJaux+sHMH5k4Gvfoara9gtiGbkINfaKu42ddL0sS1JGW9DntG27SuQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftK8kNfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 181DCC4CEC5;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866312;
	bh=Yh1n+IyXFeGoq0Rey8jtPpnhyiu8CFDzwyDYipT9LSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ftK8kNfPavpPmP/Hruw04uix1AFoBzznHrsstVP94kgOUs6aU2/QWRXpRy0HDZh9O
	 JLqrXBc1UW+s6My2G0Yqgkg72t0gqj3V4eK1FSwnYEQxat+xqrp8oPFnOwFDTF4f6c
	 4x0rkGUWqJdc2Uqnba4AwVrio0mvi+SGzxVb2+90GK3QBwZfoh4pcbUgfca6Ukhsj5
	 /q6n9jjTow+ysSM8cYrCzj97keplm66p15yend8o6dcpYYiJ4xpGIa7tBllddfZcXl
	 hZaI70vn8fF5jeXEY4O3k1yPob7O5Czj8Vi/4bhOhYpQ4Y5OnrrYkn5Oo0ksgZNa6C
	 b0NNMy3IPXtjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D71CF31A2;
	Wed,  2 Oct 2024 10:51:52 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/4] Input: adp5588-keys: refactor adp5588_read()
Date: Wed, 02 Oct 2024 12:51:49 +0200
Message-Id: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMUl/WYC/x2MQQqAMAwEvyI5G6jFSvAr4iG0qeai0ooI4t8NX
 gaGYfeBKkWlwtg8UOTSqvtm0rUNxJW3RVCTOXjn+845j1lv5HSEQIRFOBkyx3MvyBQiEefeDR5
 sf1jR+/+e5vf9AMKkss1rAAAA
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727866310; l=923;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Yh1n+IyXFeGoq0Rey8jtPpnhyiu8CFDzwyDYipT9LSE=;
 b=nmuQuFkUGdTvt0zytS9JIXPB4T5Oi8sX2RdFiFtfn01vGElhdYPuJ0Qe/0Ie9SUGmAFLC0OEV
 fvUq03Fq+hlDCzfaQM3GZsGefHnS7JOri556dp2Wai06ccBYSmXyiZz
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Hi Dmitry,

As suggested by you in [1], here it goes a small series to make sure we
check for error codes in adp5588_read() plus a following patch
refactoring the function.

In addition a couple more commits doing a simple conversion to
dev_err_probe() and a sanity check for IRQ presence (when the keymap is
to be used).

[1]: https://lore.kernel.org/linux-input/Zu0vq0ogr2HzXWv7@google.com/

---
Nuno Sa (4):
      Input: adp5588-keys: bail on returned error
      Input: adp5588-keys: refactor adp5589_read()
      Input: adp5588-keys: error out if no IRQ is given
      Input: adp5588-keys: make use of dev_err_probe()

 drivers/input/keyboard/adp5588-keys.c | 151 +++++++++++++++++++---------------
 1 file changed, 86 insertions(+), 65 deletions(-)
---
base-commit: c684771630e64bc39bddffeb65dd8a6612a6b249
change-id: 20241002-fix-adp5588-read-refactor-a85c88af4062
--

Thanks!
- Nuno Sá



