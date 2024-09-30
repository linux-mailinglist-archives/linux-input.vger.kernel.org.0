Return-Path: <linux-input+bounces-6877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6898988B
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130BF1F215FB
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D8B15CD49;
	Mon, 30 Sep 2024 00:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Hc2i/2C6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nP6vNVzk"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D020E3;
	Mon, 30 Sep 2024 00:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654466; cv=none; b=T+OCtJfVD4xTBChISz0L5hK3uJnZuORCvnrT+TgmnG9+EXle2cwEmttSdpFr0DAmMkXIvyfn2eXKIsi0N49cwIxRJ3kvnzdFtiGrE7JCKqA60MF8+b8d4+gUhGOpOwwmoSNITxKsIonMG1mseb3nOoSK5zJzsGV5bwFwImIJMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654466; c=relaxed/simple;
	bh=F5nsnUF/LLwYv5OebTo/vk+KTkqsA+0WiBF9qachlAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxzgnnJdnYYLrlxLKYSwIvM02TWi0ODaGjYAfARuNAW1OajY+vnHtPGtE+BWIybqYeK227E70PDBr6azslgcTP3kM59rErZGT5Z7gcDbQvWwhBbDjDZOOy4+R8Vc4zkmbj4U9lu+GhJZpg/mwKndPztZ0UokG1c64t8udfac+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Hc2i/2C6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nP6vNVzk; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C2095114013C;
	Sun, 29 Sep 2024 20:01:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 29 Sep 2024 20:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654463; x=
	1727740863; bh=8G22bI9F/1QDb/B0ZgWZNzwOEjpuSyGQlONf6x/zq7Y=; b=H
	c2i/2C67zEvRvfgPnvGoXN4rBgEbs1yVJxh8BT2aUAFqoYLk+dMwvzAQ5Dlo0u6I
	/b6f4zTgiJLZf7B+c7VgLG3JCYB1seOPKu+RnPDqQ1HzLHbf5Xt3poCF1MBi6QO1
	Lz2sPtn+uOKmMWJJL9XzCOG4+onXi8d9bVQtGqvqane9tHCuvbLRHGEhGhZ2xMMv
	wTjbW9YV3guwrWMxr8/tVaIIYaTyMSpIpjnA02y8qytbbccq2ryu4l5wDEIwhKYa
	WRFWmFG6qH2Cecy6pFwPslh0SP0iXnfN4V0GQpbbQykHusAauTvOiLR6oJkYU0Zm
	Rh5b+A2yZSH6xsMSNUR7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654463; x=
	1727740863; bh=8G22bI9F/1QDb/B0ZgWZNzwOEjpuSyGQlONf6x/zq7Y=; b=n
	P6vNVzkwjItU4FQttsTSLAOtTlCq9Wjusr9Wk6mmuSMJ+mALKitbPx5R+QdUsWYP
	WfJ7/b5zpME5R8Iwn3xcgt45EtUlbXuvxo4/cwoGlkC2Z6xWr9uR+VgaMx+gyawc
	xK9NzgxJ+Dki11HbTOVd5ATLjMh762l3A8fmdHHa6G0KjePxrCK+dVjKGZpOBgWk
	btx1vyZUA2AlsOz6PVb5XTwx00iiu3T3CDC5ZX42KsYSRFjShsqMNXeVB8CRgi/x
	Y8M6o9nWflmQ6j92nXemdjJoz2/fUPY7Ce9G00Ivh13YNDbhNrJxv3qJibB6Bkd9
	GyndTNHIMHh0qKbN2ynQQ==
X-ME-Sender: <xms:P-r5Zmci2m57uVizP3lqIyLsn_lKAPIh0LtKjbtPd-zSPIHNYGe_cw>
    <xme:P-r5ZgNMs34aKkGuksu5WDLC1T2-Lk-No220yKe3nS6glyxLZxRzkUNDivaARhNRA
    5Rox2tdj_6gcxums7M>
X-ME-Received: <xmr:P-r5Znhnxqy1Opy4ZPu7bHMIkqfyx_v8QBIovoSRks6504bFSnoGVXeNI2E1mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthho
    pedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnh
    eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgv
    ughhrghtrdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:P-r5Zj9K84iwcnOA-nz_06B4FfdEEY-56FWYet7wEbJ-M7z36d333A>
    <xmx:P-r5Ziv7ojRjnO7HibQ5b-BDwzbbU0elV9JxOwKJMnaKMhyiJiqaVw>
    <xmx:P-r5ZqEvmC2xaqbav6fgVve0TlKUJOL6i1RgMwj2NQK99_dYF2dc3A>
    <xmx:P-r5ZhN_oB0AI0R-BntxOx_uEme8R7wkjmpI3noxtxnkZqZY5EywJg>
    <xmx:P-r5ZsJ4-w0vcSMUGJJz4qI2FDILbZr0-1lGp3Zme8tv1hXLlo4UniWY>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:00:59 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v6 2/9] hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
Date: Mon, 30 Sep 2024 13:00:39 +1300
Message-ID: <20240930000046.51388-3-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240930000046.51388-1-luke@ljones.dev>
References: <20240930000046.51388-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small change to asus_wmi_evaluate_method() was introduced during
asus-armoury driver development to put the exports behind a namespace.

Import that namespace here.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-asus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a4b47319ad8e..9540e3e19cce 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1301,4 +1301,5 @@ static struct hid_driver asus_driver = {
 };
 module_hid_driver(asus_driver);
 
+MODULE_IMPORT_NS(ASUS_WMI);
 MODULE_LICENSE("GPL");
-- 
2.46.1


