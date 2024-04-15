Return-Path: <linux-input+bounces-3041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B38A58B8
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 19:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D843AB24BCD
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 17:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B805585272;
	Mon, 15 Apr 2024 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="eW4pnujL"
X-Original-To: linux-input@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A18249B
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713200752; cv=none; b=WfaaLcb3tmnD7lsXS2pBXa7Idyy50CKHxnk6IpMDrk6G2Aiij3Ik8YjRKiksqMP59JoCOjvhE5Dix4yH/vkINxtAKwNg1HK2WBVEzDJYBQG3qm87Xj2WN6hQfMRaDehhkPP/D9uiljCFMvkUsNDuUDCk5dfDGvd1MSG8j2+67fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713200752; c=relaxed/simple;
	bh=vYtZG9K1Trvb7w2cPdmyV/p+et001gDB2BFj0NoQYVo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mtHcZrjs18Cz1fJDifAz4Ldl863ZRJunAf6Qhv5ulrP9I4TCjTKDpRnnHf8PMV7GjPaNlAkIc0WWC7oy0RkAw5KPMcw0OIa5pLxX0l3kMcaclRoUuH6WWcGxke+nzwOheOr+dS0pDgItLbiZAUdx12VG1DPmdNHyXutOprRqX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=eW4pnujL; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1713200748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vYtZG9K1Trvb7w2cPdmyV/p+et001gDB2BFj0NoQYVo=;
	b=eW4pnujLvEmq/veRjZlBygY2zWbBi3iK/Y+GkE6aY9pZ52UPg+ikzZK0IRNA+7IKdNBhJu
	NGl3ZoPgYQmCTN2rWfW7hCBKI+be1OfHgUFjpUvMDxNrzHXTG3EV6SqOAszMEtU/lO7kuQ
	z2SfDVN2jrCNm4KfmlXC14TAfpdX0EtE2+rcKTi+fJ3I0hwlILSirKylPZkLCjvaLHZbeA
	fYC9RRhrSwt++2sib0AVdikbj2JU6+S72jmV/LXWqRRc7+iAneu7ZT63H5s5eMOjXG/4uw
	H3QHDTgXLeLUfBvDTuGEl9aROiXJwmBtr0dNC6J6Jw57ya86DwCJ3E9PbdY4SQ==
From: Kenny Levinsen <kl@kl.wtf>
To: Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dtor@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radoslaw Biernacki <rad@chromium.org>,
	Lukasz Majczak <lma@chromium.org>
Subject: [PATCH 0/3] HID: i2c-hid: Probe and wake device with HID descriptor fetch
Date: Mon, 15 Apr 2024 19:04:10 +0200
Message-ID: <20240415170517.18780-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This is in response to
https://lore.kernel.org/all/Zh0qKeI-YPDE-NVT@hovoldconsulting.com/

Instead of extending the existing smbus probe to include a retry loop,
this patch takes the same approach as i2c_hid_set_power() by retrying on
EREMOTEIO.

This maintains the "silent" error in case no device is present without
having to send any dummy commands. Tested with a disconnected touchpad
on a Dell XPS 13.

I left out the particular sleep. If one is needed, it should also be
added to i2c_hid_set_power() which is where we'd wake the device after
resuming from suspend.

Lukasz and Radoslaw, can you please test if this still does the trick?



