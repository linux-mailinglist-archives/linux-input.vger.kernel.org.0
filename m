Return-Path: <linux-input+bounces-1493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE783DE51
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 17:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5972830AE
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63C01D693;
	Fri, 26 Jan 2024 16:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUSv6nxD"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC511D549
	for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285272; cv=none; b=jJFQ8vUup7pCG+DRmQgDJKFccoXIhY81YPV6L/IwhWh1nGFVDOUqnUJXPW+XdhEyusOQDKal/OQwSBWNUzZSlG9YkLSR0o4XepHKSV16eg6A0cLoUgoU+0pEoJCpFOR6yi/JqMWXCc43i0HlIYsOOwpIICR1js1+MC7npEjiFWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285272; c=relaxed/simple;
	bh=QLzE2hpRyW8DoByE/9wbYQ4lv7nm7j+d3RY4gAx49vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAKA/uKV/mRAOqGIVxKcHxeUwPH+3N03JcHDQjyPtVlooNxPUNx0jjRzrfMif2O72qcBVKXO7KW81MrVsXOgDkJ+JZhZr+Wy8yW+M7KX+SIbcsznxpypdEqDDHai3PaG5nTAwbVIPl5M6jUA3MI5KnchbTMtEOUCHXN1v8C4/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUSv6nxD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706285268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NPy0I/VjRhhghgFbZW3b/ggnxs9qBb/RGRTO++KBrsQ=;
	b=dUSv6nxDa75FvZrkOgdLDYUIkJzwVW8byRGiH8sIHU59OxQUuQQHDxqagEIxcZHIyWW4K4
	kkLiY7R0cNwmQMIu4iEfeq/KpHy/KBmgX5zKXev0tD+7HlEjhVEgANQGWEdzP8xqdbAbLL
	ihT6JQ9m5/tBzsq4ihs8Oh8kpS6XnNY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-Sz-dz4OEO9m5b0JD4JmAYw-1; Fri,
 26 Jan 2024 11:07:44 -0500
X-MC-Unique: Sz-dz4OEO9m5b0JD4JmAYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147A43C1E9D4;
	Fri, 26 Jan 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F05E91121306;
	Fri, 26 Jan 2024 16:07:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH regression fix 0/2] Input: atkbd - Fix Dell XPS 13 line suspend/resume regression
Date: Fri, 26 Jan 2024 17:07:22 +0100
Message-ID: <20240126160724.13278-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hi Dmitry,

There have been multiple reports that the keyboard on
Dell XPS 13 9350 / 9360 / 9370 models has stopped working after
a suspend/resume after the merging of commit 936e4d49ecbc ("Input:
atkbd - skip ATKBD_CMD_GETID in translated mode").

See the 4 closes tags in the first patch for 4 reports of this.

I have been working with the first reporter on resolving this
and testing on his Dell XPS 13 9360 confirms that these patches
fix things.

Unfortunately the commit causing the issue has also been picked
up by multiple stable kernel series now. Can you please send
these fixes to Linus ASAP, so that they can also be backported
to the stable series ASAP ?

Alternatively we could revert the commit causing this, but that
commit is know to fix issues on a whole bunch of other laptops
so I would rather not revert it.

Regards,

Hans


Hans de Goede (2):
  Input: atkbd - Skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
  Input: atkbd - Do not skip atkbd_deactivate() when skipping
    ATKBD_CMD_GETID

 drivers/input/keyboard/atkbd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.43.0


