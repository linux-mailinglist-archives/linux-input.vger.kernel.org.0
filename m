Return-Path: <linux-input+bounces-6811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B798852E
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 14:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252352838CD
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 12:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6229A18BC1E;
	Fri, 27 Sep 2024 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Xv+VZeJn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21465165EE3;
	Fri, 27 Sep 2024 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440956; cv=none; b=Z8sxgFSaVk6djR8yuJZy0KfMDoKqnRH0Qa6M5ujFT0v4QTP3yLeaa4W/MVsA/U0lb2QGRmSdP0M9DpZC5N47SDQ0yeLLARorsExqX7f2uiqjXBEssEyCavYJkXKwj2uvWM3ACJeb2ORXDwfLdMSBLmz697ETBHU0aDRukwBw7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440956; c=relaxed/simple;
	bh=bm1zVihqPcp9z9Pw3Z8O0bwACDuNziWL5b4WCJs0Gt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nPp1c4xLbOL0C3gdsY5GCvL3xFpIQsbkJfwOQqm5ZRwOCA0F+Ocr7OzFEqHm88TNJuZJaB9c13bK/hUyvn7NIGfnqw+T4nkV9fFjoSfR/J1AJZOPVCG7Lk+zhPil2wJSWq+oJ7ZzJhRAYlLWNY+lGLJ3/V91Qx+v8bX9SlyQWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Xv+VZeJn; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse.fritz.box (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 8C1AC2FC004A;
	Fri, 27 Sep 2024 14:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727440951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bm1zVihqPcp9z9Pw3Z8O0bwACDuNziWL5b4WCJs0Gt0=;
	b=Xv+VZeJnYZA7QDELPYapYvf/DbI4wJRChAZmyFHl8UsUjNuL1W6cdj5+MtOLBEJe9Wz9VF
	dtgNb795gCfEKTP3H+nVKcYHwPYjZzhEhYN8MFVV9EBnE13k/R3kyMtFYi1Dss1QfYdxmi
	5d96FCr6RthY4YmCLAXzYl0mIgLD9lg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: 
Cc: bentiss@kernel.org,
	dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com,
	jelle@vdwaa.nl,
	jikos@kernel.org,
	lee@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	onitake@gmail.com,
	pavel@ucw.cz,
	cs@tuxedo.de
Subject: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
Date: Fri, 27 Sep 2024 14:41:51 +0200
Message-Id: <20240927124152.139099-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
first revision integrating Armins feedback.

Stuff I did not yet change and did not comment on previously:
- Still have to ask Christoffer why the mutex is required
- Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
- Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables

Let me know if my reasoning is flawed

Kind regards,
Werner



