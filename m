Return-Path: <linux-input+bounces-3927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6657E8D29F4
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A481C230E0
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B262315A862;
	Wed, 29 May 2024 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Lg/nZYQq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M4ruKhwf"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB01E86E;
	Wed, 29 May 2024 01:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946118; cv=none; b=jJaQw7WFui/8GgaXhN2s4n0nCAiG2hFrvBX2dS5A9ZGwsRpQ/3yl8cJfKyiTmqFxNuP/UVikHsB2Rj/V1KztMqL2CHWybCRH6wNx66HKxiEv3CLn6DyXi178Nfzo5JNjc6F+MOkygP5jrqa95ePBn4bh8AbV5ovt/pAh9+UZh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946118; c=relaxed/simple;
	bh=ZWosJ0fbkD48d2sZzTj9+El9CMbzfLfzV5S6oJTU+XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oxp9V09TsEbh2pbECetCfzbCykujTq2Mjn1jMahl0vHfokV4+8mngMTIXL8k1BIQEgmstXmgFcuDfPUTG1Smai2uYXTno0bs1cqC4+zUn7d8DSC2wZGG2pJWmJ9+uH6AT/cq541omfTOx32CNIyqvbNge/AClx4V+IFvsdi8BQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Lg/nZYQq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M4ruKhwf; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 130A51C0018C;
	Tue, 28 May 2024 21:28:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 May 2024 21:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1716946115; x=1717032515; bh=B7nzPoEheZ64prYro48RW
	JsH3qkc1hldm9XfgJ9HjO8=; b=Lg/nZYQq9v661uPB/359R44VKEGPu4UggDeaa
	fyT2x4Vtgq7coGZgU/3Ty2iG1bszgedefVdQeE65AC3L2rMyAQgNpZwktmpiWX8W
	Zy+2WewWGbNa58fRFQdf4gPsoY3GfsgSji8zV8jaIr+QKbDXSx/FvvJCCgAV5WZc
	MVGV6rcO20U/+w20c/DtXni+lMtLx+9TJHNddG81NGQ/WFPquIl8IlD8cbgiYm6M
	RsA/EjqwrnRLPRFZr/BopuDSciB456LQu2G3IG8+r9YkRS9pFDabL6+M5S2WmfFk
	YIyU3NYGGRrAGIX92IqUeURc5FSEDkV1Q5IRHo6w4QvVKS2pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716946115; x=1717032515; bh=B7nzPoEheZ64prYro48RWJsH3qkc
	1hldm9XfgJ9HjO8=; b=M4ruKhwfEKeln17/yhrDxsCZ0UZFY7R2/TSAoJ1yTM5r
	YQE/ilpWUwCQVzNl7n7/7FhHnmeJbQmyqE9DCV0ybTj5b2Sha3zAMoEFGrgJNoj8
	Sf/BunOyG7tPgBpwDI1XC/A22MlU2cS8M/xC3Jt32ooigSRkrU3sct66Vmo3mtwO
	35aHyi1hskz3juk+YsEG6iMVPG5yAhI5cLHFOnA0KEgo4ApRxySRFZzmNoPDRcPU
	ZDHNDhdTatx2JDCwIYvEri5ZPrJ9hKI8K0rpVQsJzj3Zw50v7XRmJuQ7OXnhg1fs
	oMTIfV4peEmTgcvy+tubIPi/6oJFPIy4UpZEf2+9/A==
X-ME-Sender: <xms:w4RWZjEJuP1xzh0gW4hdIge9oXgAuh9MF7FiaIDRzQI_nur_rWm6vg>
    <xme:w4RWZgUMwJ6U2n6AHmrP7_if4S8ASR5PwV70NXZoufJIv9aKzr134aWG1lBKegF5K
    0YmyEqkq4yNtSL5-28>
X-ME-Received: <xmr:w4RWZlL0jYQ1lkwrLuoCBC7D4CR9I8vvAdc4KNrgz6DSRvZzvNFFc7Bxst7f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdehkeeigeeggfelkeeufeefjeduvd
    ejveduvdehtdegveeftdeugeetvdeltdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:w4RWZhEfbpYPus4Hi4zvXX60nVxb0hquqXuDP73MNBaqLqDdNmViBg>
    <xmx:w4RWZpVEvJpLncFDrDCVWB4JnsU1nRdPyFwW0D3AMJy_JT5mukWlVw>
    <xmx:w4RWZsOtCfjb92otYYnATiJtrJZ2S_7iMIL3zTqXooFKgjE1S48l4Q>
    <xmx:w4RWZo2_nQpdP31d4Dg05K-B_K-6gUVui5GWeQjifHnbz8lTrd2fWg>
    <xmx:w4RWZlqVynADFDu5dJ2cNnX5FjV-5aO09vVlWoRzpA3C0jS4y15kZfa3>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 21:28:32 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
Date: Wed, 29 May 2024 13:28:25 +1200
Message-ID: <20240529012827.146005-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- v1
  - Split the patch in two
  - Move function body to asus-wmi and export
  - Use array of names and for loops

History:
- https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u

Luke D. Jones (2):
  hid-asus: use hid for brightness control on keyboard
  hid-asus: change the report_id used for HID LED control

 drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
 3 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.45.1


