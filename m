Return-Path: <linux-input+bounces-8062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E49C77E3
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 16:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7EA3B36D82
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC1E43ABC;
	Wed, 13 Nov 2024 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Qa7xk9HC"
X-Original-To: linux-input@vger.kernel.org
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7D1C695;
	Wed, 13 Nov 2024 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731510094; cv=none; b=EZ5xWnwjD246pCz2GCRO/UQVZiaTMdzaLHqFZtElBLHOOo5P6iIPwg01oVw3BQX+hzlOeOpQQcC2W8OFgqvJzVFuSWPBmSblWJ9Ro2CKwzyqfuNb9e6ARmkvpc5PE/FV4+Po85c+umX9kSPARi+aIED8GsiMYyzDE1NFEavatqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731510094; c=relaxed/simple;
	bh=kNfBfrpv+RMFQKJp/cs7yD+wTK29G7PJUIoh/Mw9tFk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pWLQl4O7fandd4H7Wzu/1wAaB1gWAsKlpeNdZnodh6fEik9ZuBigE1PZsjLHK1EVa6gk3lnLpaAGmuS/H5cKG4BTvaQ2AXKwWi6BMVyCIZ6H4mJjck67bsqdMNMKgkv6kQ3/tF0tn2ZmJgILWsqK6Quo/CfFaN1zNgtlG0bJk+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Qa7xk9HC; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1731510079;
	bh=ZqibbowZ3xqsN65J9BXl90mVsJZElGVT3wkPqqzm0NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qa7xk9HCiDys+9lce2A+lA6oiInFlYMTXML+ixQ/UwLgd3FjaaRBL/euXO2yJl186
	 6b4J+aiw+vun1pLDE31XpnMbn6+BHzOOfisqYSQHZgMtQ/hFwchweRgX4e31i1UiSG
	 IiHPBDZl0cGm2W+BnAGqwzy50MXfo+aAKEmst3FY=
Received: from xp-virtual-machine.. ([119.39.76.12])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id EF497EEA; Wed, 13 Nov 2024 22:59:52 +0800
X-QQ-mid: xmsmtpt1731509992tmizo1w9j
Message-ID: <tencent_E8A1B94A44CC713F5139410A79159CC4CD0A@qq.com>
X-QQ-XMAILINFO: NRN3UPsLzYKVUC0sdpESWOKDTSKXbPXm0pR8FNPDLt2CTVCa1FwKY86btYlXLB
	 YJmYMugcNtSUGSS1y+EzXwPAcsWFjsYUzFCzUHPA2pj0uzIy2LrP74m/TVjzlMshwx87gHPS85Cz
	 ROV4ZcUMk1+dTeMmW2bUZMfNqQIQzh3MpHZqQEdy7jdWCP5cu7VsDtiiB2ZRdepRwJORzeDLKOkw
	 7z0T8rdgZjsF7REcbWT6/GKQI2jWcwci/7lrWd8DnHgyJJ1gN8O1cFSfZLLf2G+nYqn0DyJEMJec
	 I4U3SA+AVECI0OX5KFB7EzalKoylCTPKbTx8u+TWJw8S9t8JL5H1jfK+ydFVY5Jm3ThIMiTLRx2m
	 Gq/4wW+GFAkPs39Tbur7StGUIssdu5e9W5t4GG7g8Pu4bggmR8eXnSgOsQAlqN64U6VBbRgtS2u2
	 YbGDj3tfOZ2fO5XC9HMhwP9aGsTvVZiC5yOm76B+N6G4XSvDcOat4GfJNaAmyfqXwwuX3UhlCLgm
	 CXTM91X6ZUdqm4iWz5XGtSaI6vn+aow6fEnfFBnsRhoXx603jAOI2ODiu4l6gLtLv1QYpqfJTYpL
	 eOJMeEubP8tSKi3r5RpDzTWDbHBezzmG5zCG6YrSM/OJgmvUP1muvJEJFqDv+B7qssEqnDwHdIOp
	 tj0CFNmJVk3MEm9HwUUCIUWObgpkbYETaGNeIghn2E5felV56Rr1Fx7Un5pT3luEmfNobOdB3bQF
	 jGC0xNohf2gzRq42c/IbVLa4Fvb3BjK9HhUP0gttLGmB5hhn0xsLDANJU+lenI0y2/i4m70ewCO2
	 KyyNeLch7wEF+1M4BRf9NEY2Q6TYxow+1iJHAQ2obHqsg/JueTMDxSihUWqVEuspu9utCf3O6ldT
	 VD5qsmyHzK3QVRTcKkNgb/VyFJDdymdhzZjGBOVcY7yss+A4yalbSYVmmODFywldBdKBU7SJ9XIp
	 8mXKx3s0f/zekN/H5XQvtkg7yGZNNoUvP8lINtJE8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: xiaopeitux@foxmail.com
To: syzbot+3fa2af55f15bd21cada9@syzkaller.appspotmail.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	xiaopeitux@foxmail.com,
	xiaopei01@kylinos.cn
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton
Date: Wed, 13 Nov 2024 22:59:52 +0800
X-OQ-MSGID: <20241113145952.27197-1-xiaopeitux@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <67321ded.050a0220.a83d0.0016.GAE@google.com>
References: <67321ded.050a0220.a83d0.0016.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks!

patch[1]: https://lore.kernel.org/all/f74754f0d7d870ac8301eb8f5760d473bdd0270b.1731492709.git.xiaopei01@kylinos.cn/

 


