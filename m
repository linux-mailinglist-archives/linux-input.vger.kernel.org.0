Return-Path: <linux-input+bounces-3837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAA8CF11F
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 21:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1271C20A28
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 19:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DDF127B7E;
	Sat, 25 May 2024 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRjmkuSi"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E6127B65
	for <linux-input@vger.kernel.org>; Sat, 25 May 2024 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716665947; cv=none; b=ddxM0V5PAJvAiajm7MJGqhf6nKXRnAoh5aprp+LEePfAxIgrLZqVJB3mzTJncTDJwJDcdwiJrmbQxaqcHZUP361MLH9hisibVdy7g9a6DEIaDFBsMOoGOKtTojGlJ7qusZVXa4/O0XJTkbxiqFNCATI/jXD8PPBQ0fzbSSxz6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716665947; c=relaxed/simple;
	bh=OSNW2roLMfiUSA87R4pPRPVYZcVL7aMGo6pv3vq94MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J71RE4oRZSKpc2dm+g0afo9AJJgmvQPVK2uRolHLL6kagouT7DpoIUwPX8zIYjucFynwmfCjPAaMQKtdoflXZyyFRFqicN5ezHjRMklwfB0cCCu/ZBnOJOpDjSWmO33DI7vQFONErWzSX+JOVO3wRfkFdZAgni+xFQnWrPBM6ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRjmkuSi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716665945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DzMdNhGLyb4+fTr0O7p7PfknaZkUc8mWopOF7BZ5LKY=;
	b=VRjmkuSiJ9aSsBk1KiIAyJ6xZKxNAuYnLVMmd+thDlSZIki/vTYBNSSxzqjCVgBHw3/TSA
	MDSrDvRNttC+t/nHr31wvoxyKpllG2baVAlkJjhKzCRlGPkaskt+qk60DEeVjRdB/CFVF8
	w3XROZPXIjzvVZpuoByAgKjNRCS2sPg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-t75SzW66Nv-5obuJwYj81g-1; Sat,
 25 May 2024 15:39:01 -0400
X-MC-Unique: t75SzW66Nv-5obuJwYj81g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8C2B29AA399;
	Sat, 25 May 2024 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB0EF7414;
	Sat, 25 May 2024 19:38:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Input: silead - Always support 10 fingers
Date: Sat, 25 May 2024 21:38:52 +0200
Message-ID: <20240525193854.39130-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi all,

The first patch in this series stops making the maximum number of supported
fingers in silead_ts configurable, replacing this with simply hardcoding it
to 10.

The main reason for doing so is to avoid the need to have a boiler-plate
"silead,max-fingers=10" property in each silead touchscreen config.
The second patch removes this boilerplate from all silead touchscreen
configs in touchscreen_dmi.c .

Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
best to merge the 2 patches separately. As long as I know that patch 1/2
is queued for merging for say 6.11 then I can merge patch 2/2 independently
for the same cycle.

Regards,

Hans


Hans de Goede (2):
  Input: silead - Always support 10 fingers
  platform/x86: touchscreen_dmi: Drop "silead,max-fingers" property

 drivers/input/touchscreen/silead.c     | 19 +++------
 drivers/platform/x86/touchscreen_dmi.c | 56 --------------------------
 2 files changed, 5 insertions(+), 70 deletions(-)

-- 
2.45.1


