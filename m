Return-Path: <linux-input+bounces-3753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E38CAD71
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 13:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC80D1F233E2
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0774B74418;
	Tue, 21 May 2024 11:37:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail78-58.sinamail.sina.com.cn (mail78-58.sinamail.sina.com.cn [219.142.78.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B096CDCA
	for <linux-input@vger.kernel.org>; Tue, 21 May 2024 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716291438; cv=none; b=YFJ1wgAX5wo2PJtUBwPyUhnpAjxeJpFUjh5peuAZxpGGYFaBFzvtfcYIoUUYVcczfmxJZ7c4eAzhyFqpHCviqMb+MZl5QzY/8wWbwn3TZE6XXlzV5g39xFbymdPrSGhHaT3f1NSKrd6mUxdrhPuQb4Jm7d2xr/VhQtJDJ4qCSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716291438; c=relaxed/simple;
	bh=ZQWoLegHRDJ0koVC50FV1ML2VQhF1kSaOq31Kd87KlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PyTvkOLcgwN5e9LnIk/ycrH/4wXog2DsWlunGjJmHJUrF4lqbaKv8twAQtKhWdHgMkJPnHh6JXOTPB85clfnNdmBQa9iV2JK5hHidxTIDWe4x0pWONUQagxwCMXKi8s7kGenKa/pawggj8kxB2CexY3gj6nSGZMyB4Llhx0C1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=219.142.78.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.25.117.69])
	by sina.com (172.16.235.25) with ESMTP
	id 664C873B00002956; Tue, 21 May 2024 19:36:29 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 82644934209900
X-SMAIL-UIID: 995FF44FBFCE461097C881061510F556-20240521-193629-1
From: Hillf Danton <hdanton@sina.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Input: uinput - race after request submit tiemout
Date: Tue, 21 May 2024 19:36:19 +0800
Message-Id: <20240521113619.2092-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	uinput_request_submit()		uinput_ioctl_handler()
	---				---
	wait_for_completion_timeout()	case UI_END_FF_ERASE:
					req = uinput_request_find()
	uinput_request_release_slot()
					req->retval = ff_erase.retval;
					complete(&req->done);

Given the race between request submit and ioctl handler, memory corruption
could happen after releasing request slot.

