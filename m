Return-Path: <linux-input+bounces-8886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECEA0183D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 06:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E01883A56
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 05:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC9F1F5E6;
	Sun,  5 Jan 2025 05:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BvswI5Sp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8695258;
	Sun,  5 Jan 2025 05:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736054984; cv=none; b=eDRSZTosYjj8wk4TyZ1+fbjgxQmaawPqErT0lDhSmlL2Vgg5zbbsgDT2Vtrf0APpRWqfFmPf8aLq1o9KOt4CFZYqTVva85mBlJQ6osMeXPb4Nb/Oqh720/FnxXMymTxalDQs47IjmGoWlc7iOQK6+fmFchGfkpM7ly98oAXYkBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736054984; c=relaxed/simple;
	bh=3+aXKmSJa1vA6Nj6dNiD+VTq/v4iLaLyHjTsUM6oeQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfJ0J1mdqyZSwCXV+thqhMb3O4kfiyFwC+7nQO5ap/J3tx+jZwttWjxuExKQIQtWIaoEUyzFpv2iVLLtZmYTBjdEtQ8BQh03WvhIUjfYozX1ddxtGkC7qW0/On+mt0yzjLv05v4A3UI7xOjBlR1mYCBW0obZR48w7u8wU+t2nDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BvswI5Sp; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736054927;
	bh=iJBH/rWcA6n0NFOxMnbEQ52WIKdl8GuxBGXvixDF30Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BvswI5SpgIKDNPNlDOOMCSvMgCEaIr/ZQOnosQ0P6l7jdX/Gq4dv4k7M+ZsOxsMhW
	 nifhQnJyl+YWJfWtxuBY2WrfF1Wat2aq82+v9nT+MELs6pJUlcivXFPNjw0jcezea9
	 1c2exUHrqsdz9VBYdL3dLJqDjErclED5L9NLEwmc=
X-QQ-mid: bizesmtpip2t1736054894tonekog
X-QQ-Originating-IP: ug+22WN7oLZZ3F4oHP2SIEDDzO4ZvMMkvvDd16Dlqfw=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 05 Jan 2025 13:28:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3374724279645508141
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.tissoires@enac.fr,
	chatty@enac.fr,
	jkosina@suse.cz,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND PATCH] HID: multitouch: Remove useless comment
Date: Sun,  5 Jan 2025 13:28:09 +0800
Message-ID: <6F21EA8D646C3D04+20250105052809.204703-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NJT5C3zFSytJXUBJVJvQi8wEJ5nwKu+B5cWW0/9nB3ifJVLxrFsyFun0
	Dd0Folsd0UHzfLTYzfVKRwt4+IkE2xCW/bqAJKMgP18IkeKeZg/u5zT/3SUhGDsdUwKl7la
	V4LdhYkom7dYgiM4tZY39A0tvD024x4m19ziSCU+NUTqiAihEW7Ls43Wwoko9UbWNz/KANd
	cNN8O1aG6F5DR6b0vfUPonhTQcQnhp0iQvpsuIO9hml7rfeSsvVxES268enGF3VwmqGs6ql
	vuZ5z3JwxrXXv1RgKdkGemVHEE4hyHXFIDxPsHY1CvKQrjFtFFotiLhnY3wxeEz/Pj9w4Sy
	QtpFA7tR04O1SELgiVn1G3xvvUxhx7ifJOQsbOQGDWHdbMvXaHTqfjI8SODAQlLDbmlARwb
	egcxzgOL4Y+AEF/EkIcSrOuFXNXqzi9iC7L9fODfvVCLkuX4U+qS6NXYdD1DB6GdH02xbi/
	EvlTj4aWQixPxJHR3ys5lInWjUBVb0jhhd2GsQCnyVXMbEDWYfqJJI30j57jVtsS1nbSLVP
	upg9UlviuzgAYaKK7U7Tn3GAunAGnBWIsmuPfatYx5fVcT+9PmR8NyiHFf+mWMZg0mnChMy
	wIO0IyXS20/T86tgCI++ZX0WCZP5Q7WFtxsItpss1AFTctHqi9hes8XnOJ0z9gutV2Nu5Tj
	so7OLPc/ZoQU4BxF2Yjk2gV5PnM6gEFSf39mBHnjQsxKi0Kcbr8hv9/dH1s5GHR6Q0cNTuF
	sx3TiNpxCBXUs6+eUKNvqa/qOnipfaLVfieij6i2TvQaBORJ15L/vNPnIlYYNhemvRlUViy
	659mX2qeKwKlPPILIRqP2MpVJ/GtRwKElaQ0qyCFHbI4Fr0B3baIvSZpHMdhQgr8HJhzDPK
	+46BAesBN2VVpkij3OhmtKFpN0yil/umDyS1R3ORO0Xcmvxq15qbt4yFM0h6dZxiCPqgphi
	qytxxENLDoHH39n/zFQjaMcZAZJpZ4wGpgOKYi+cpMic2NYwcQJSMXS2SYPt7KNHZt+aRMo
	MSfZytz93z9zgzgHshelPd/oS+Cws=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

There's an empty comment at the beginning of hid-multitoch.c.
Just discard it.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/hid-multitouch.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 785743036647..5985ea843194 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -20,9 +20,6 @@
  *  Copyright (c) 2010      Canonical, Ltd.
  */
 
-/*
- */
-
 /*
  * This driver is regularly tested thanks to the test suite in hid-tools[1].
  * Please run these regression tests before patching this module so that
-- 
2.45.2


