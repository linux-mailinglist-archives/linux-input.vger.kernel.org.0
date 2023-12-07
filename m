Return-Path: <linux-input+bounces-579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4F8080F5
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 07:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0370B1C20A6C
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 06:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFAB134C4;
	Thu,  7 Dec 2023 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="ECM8Lje4"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD6910C6
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 22:44:01 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 3D895A25D;
	Wed,  6 Dec 2023 22:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1701930868; bh=ru1OeP4vywI9h+Km5a8LlXCQiUJtpJ54xOkg5MWtqkM=;
	h=From:To:Cc:Subject:Date:From;
	b=ECM8Lje4c0Tt3bP/kbqmv7X4RcErqOEJkDr/T6QUljxotxyaOFA/RIRP4BDMW+jPf
	 k1cwUw4AiJ2nTlJ7fZcZxNIWbLhlTgrfYzkvN+2d99r+LwDA3AG4LOr5ldo7+/MiOc
	 tMXsq0Ta5sZ0U7xOmK/pT+hF6HJgBTJs4ebF9uVW+J6MW1eTS++mjb9imunrFE7T5r
	 mMjEH1TtIIBJFPBlIYRzwTfxQoFu7/YsPrskqCnAixdjOYoyA8J4F0CGUtx9FD4ncL
	 meKHtfGfP4ugBptvm8B8XK+EtydAJzGFOT06+v6KVnPwfF9HBX3fDAwBOP3XvDZ4/f
	 6HCX9Fd4KVwfA==
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 0/2] Input: uinput - Multiple concurrency fixes in ff request handling
Date: Wed,  6 Dec 2023 22:34:04 -0800
Message-ID: <20231207063406.556770-1-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While investigating a report of a process hanging on submitting ff data to a
uinput-derived evdev handle I uncovered several issues regarding cross-thread
concurrency.

The first fix is simply making waiting on the completion object interruptible.
Without this, the submitting process cannot be interrupted, meaning it has to
either wait for the uinput-controlling process to read the data, or the timeout
being reached. While this is the usual flow, it being uninterruptible means
that if the uinput-controlling process is misbehaving, the submitting process
cannot be killed, suspended, or otherwise interrupted until the timeout is
reached, which could take an annoyingly long time for users.

The second fix is probably more controversial, and I'm unsure if it's really
the best way to solve this issue. Namely, there exists a small, but
reproducible window where closing a uinput device on the uinput side and
uploading ff data via an evdev handle in a separate process will lead to a
deadlock: the uinput ioctl will claim the mutex, flush requests, then try to
close the input device, which then tries to claim the evdev mutex. However,
when uploading the ff data, the evdev mutex will be claimed, try to claim the
uinput mutex, and hang indefinitely, leading to a deadlock. Since it can never
claim the uinput mutex, it doesn't notice that it should exit early, but since
it can't get the mutex at all, it can't release the evdev mutex.

My approach to solving this involves temporarily releasing the mutex after
flushing requests, allowing the upload to claim the mutex, then closing the
input device without the mutex being held, and finally reclaim the mutex to
rebalance the mutex_unlock later on.

I spent quite a while investigating other approaches while trying to come up
with the least hacky and simplest way to fix this. However, a proper fix might
be more involved and have to touch other subsystems, namely evdev, in which
case I would defer to Dmitry for a better fix, as he's a lot more familiar with
these subsystems.

I also suspect that there's a race condition with uinput_dev_event, as most
call sites are protected by the uinput device mutex, but not all of them.
Namely, it can be called via the input device's event function pointer, which
has no idea that the uinput mutex exists.  However, I haven't demonstrated that
there is actually an issue here, so I haven't attempted to fix it.

Vicki Pfau (2):
  Input: uinput - Allow uinput_request_submit wait interrupting
  Input: uinput - Release mutex while unregistering input device

 drivers/input/misc/uinput.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.43.0


