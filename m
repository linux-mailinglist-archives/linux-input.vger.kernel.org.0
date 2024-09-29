Return-Path: <linux-input+bounces-6861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73109893F4
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882022856A3
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E578144D0C;
	Sun, 29 Sep 2024 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="QGjj/vIb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IWnf0EXu"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F07143894;
	Sun, 29 Sep 2024 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600913; cv=none; b=UQ1EaFSbdK3KUfW+MNJoiIOsOYkORlE/i/cUMLfbUSSuXFQeLqwcEPi4jiKmsFbRi6aGPra+qKAb6HNScZVyQJ3nBh7l7koBuXNQCdLzTqsgIR23ohHGOU9cQ4XdTTi8yp2gxLc9WziZAs23ILd4Om08ohx4qO2oBm1JcJhMUj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600913; c=relaxed/simple;
	bh=F5nsnUF/LLwYv5OebTo/vk+KTkqsA+0WiBF9qachlAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spfW6TAF+Hfwtpt6MwXcd0SoK9+NyDiUA1fMygdtdJOd2XsMFfRK2LVbklKqHW4Twy2kK7bVE2ixWCIG8ybeVV3eyQDjJqEI8rLm3MmoCx995A+ZwG83jj1+MId9P51G7VfaDFB2TeydW5e+wkxD2gMJqPE1pWHG4VWOqTDY6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=QGjj/vIb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IWnf0EXu; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 25E4A11402AE;
	Sun, 29 Sep 2024 05:08:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 05:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600911; x=
	1727687311; bh=8G22bI9F/1QDb/B0ZgWZNzwOEjpuSyGQlONf6x/zq7Y=; b=Q
	Gjj/vIbCiE2kmEJ5CX86yyceRmWu+6BUuKsfKRXZAqZwjwCn7fUBPDygaGx5KF6/
	SWtSLli1UNRyPjo0iekrgfHsrQ9egRoCMHIHwZyViGilMXdrAexrRjkRr9+E4qsq
	6Pj2Uk8OwCPXiOWW+zJ2xcpaBlVW97z+qm9YTJXzolIIIREIuw5o57mzpZ86IMxI
	G+Km0N5FABpmsk9Bc3WqNrJqoZYjFHLD09K8aIytuGgIPL85Cqp31WsEUeaD1ACa
	o307KImEeMffJCnQU1nGTOXAyaegnHh5soS0xIxj7C5u4d53i9Nh3gqyG28i9yVx
	B9Png+Jk5vIJp84KZNPPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600911; x=
	1727687311; bh=8G22bI9F/1QDb/B0ZgWZNzwOEjpuSyGQlONf6x/zq7Y=; b=I
	Wnf0EXu354phc7t7/4wVqgVqdZwPt8feVsWnSheNh8KCkIrtIJX6byjma0gyogwn
	Ygg6lwvTSVP/fnVcxvzcfe2x3Rzp/VzAHl6AqiwTCfH7SzKcUAJnno9fGtX8Ujq9
	flxhKrg6k2Q+fs0STxNZkYhRxikNrX2qR/8oEyXp8xL6LsJuaEQcFbQvZJ+bw/Kq
	n6s3Pm9VgyrgocZeRGy1KHLqYufxcCuDDQ2qcE3mGx33OWmsJGbMtxzVwVk1kgU0
	4clX5Z3MqC1nm5Pzfoe8b6dcXonefkHYdkHzH3xYNkqOoe9kzEsKi0d76LCWLXy2
	IzlUwI5ASu8155O6UrhCQ==
X-ME-Sender: <xms:Dhn5ZnbVAzs5ZsBgE0JBTj7gxe6bgDKBFHE_i_641TCQa6oGSnf-JQ>
    <xme:Dhn5ZmYDKPdIXtBJFYGdW7RjX1rgZwuEm7ZVa-8R2dWJKhdTBL4qodb0AMS0xYecW
    cclncfX9zCtdJ1LvHA>
X-ME-Received: <xmr:Dhn5Zp9uf7zqgXFnzFEWlRcv5W7LsbzC8uB8U-iwj_Dv6UjpaEsabGMPlz-ebA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Dhn5ZtpfHOH5ZTipyV_nbsn3PdXsRmy7MsqZJk1GdTsPuxiIbQbxLw>
    <xmx:Dhn5ZipwbvzaBoU9_emkVz5flQfNmSdBhXIUX5IeTO9C6ITDODzqSQ>
    <xmx:Dhn5ZjQaagdZD20GgOLhoDnXA_uDBZDSW-VeVSPlS_mfJcuTM9b0Wg>
    <xmx:Dhn5ZqpxRS4Cl8vfwhDtDWsrxr62x1TVTWNUGCnUUR0ALJ2FpFFmlw>
    <xmx:Dxn5Zh0r0azB4JvtDaEXnLMNmOF-yyIJmuIykVkKmKBgXxk7XvP6J2jp>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:27 -0400 (EDT)
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
Subject: [PATCH v5 2/9] hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
Date: Sun, 29 Sep 2024 22:08:06 +1300
Message-ID: <20240929090813.7888-3-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929090813.7888-1-luke@ljones.dev>
References: <20240929090813.7888-1-luke@ljones.dev>
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


