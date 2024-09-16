Return-Path: <linux-input+bounces-6557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2701979C6B
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 10:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60A0B28451C
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 08:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185FE2F2A;
	Mon, 16 Sep 2024 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mathisart.org header.i=diego@mathisart.org header.b="aPbY5Xdk"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9B256D
	for <linux-input@vger.kernel.org>; Mon, 16 Sep 2024 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726473754; cv=pass; b=E0Odtmb+G1jsjnPSMF/ricv2VYvBtpnvAW86njxUa4vrzF+1wQ/K5L4V6yYz92Ar64Aki8QSWhmVijfavhkthRQO4bEJE9MM6qav8PU2ZqRrluO6LN3xQjH7mYgHrmk/8SHfKvDRh/P9ELqf6dx/uEL4SKwuaye5jpbeIcfMimA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726473754; c=relaxed/simple;
	bh=i+/OXrIVNfH2zj1fssAg7GmOiyxaMKSpnJjJRJx4XmY=;
	h=From:To:Message-ID:Subject:Date; b=Xsehkg8gxoVg7MSevzgk0eo2ChB3q7DYYcxPOyL1qF+LzsZCbW9q8tEyC+V+sLbYstAhcyZpL8OTl4VT/roNnkqFq5qWIL0jom0zJNancUt/nBUCJLLsn4lJKjGHeGvVs6IpKgevDb+kHUZ5/NIPrnIJIsYFKkN08rhLN1ueOx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mathisart.org; spf=pass smtp.mailfrom=mathisart.org; dkim=pass (1024-bit key) header.d=mathisart.org header.i=diego@mathisart.org header.b=aPbY5Xdk; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mathisart.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mathisart.org
ARC-Seal: i=1; a=rsa-sha256; t=1726473750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SgP01Crl1yypzzGRDTG9IJeNnShZV8pMsg36vM9Sm7hKTrUmMZ3yJwubeVqfjf7XXqp1hNp3v1xOCOG+WgtGIyJ0HdvfccQkRR7T0grIcsFimzXHWMBcu6uAJvm+bOcIvEejUrQhq5Vx2gq3wx6v12gVquq5zlyUdwsQ9GY7JFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726473750; h=Date:Date:From:From:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=i+/OXrIVNfH2zj1fssAg7GmOiyxaMKSpnJjJRJx4XmY=; 
	b=Z1b+5eXgMBo74Y+C1k5aqV5IBG1Z0Vk7lJw7k1uf4SH3EeO/Y84wk5jo+6aWFEibh0/U4oVYc01Iup5wFayyPN0EYJl0L2gxK4V0JliPtrvj16dB7mzBQtcEIIMOxIk0WFGsRQx1/ZrHFOorH/e41sOqDgrrFltfSVRONGHKDZc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mathisart.org;
	spf=pass  smtp.mailfrom=diego@mathisart.org;
	dmarc=pass header.from=<diego@mathisart.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726473750;
	s=zoho; d=mathisart.org; i=diego@mathisart.org;
	h=From:From:To:To:Message-ID:Subject:Subject:Date:Date:Message-Id:Reply-To:Cc;
	bh=i+/OXrIVNfH2zj1fssAg7GmOiyxaMKSpnJjJRJx4XmY=;
	b=aPbY5Xdk2Bj7tilrXITODEaeUnsXmEB5KCMJTyJH5QNlFxb8xFuCA+P/6FjV1Skk
	YLUAJKH4d4Lofrn6EITNLBFCGXrdx0zr7MmfMt6LPdbrWWO3p474s77gk0d3K4icWdH
	HKNodCJS6u3eiMxn73rcHe+T3jfkOu4ewK3nkjOs=
Received: by mx.zohomail.com with SMTPS id 1726473748673308.2574269253877;
	Mon, 16 Sep 2024 01:02:28 -0700 (PDT)
From: mathisart.org <diego@mathisart.org>
To: linux-input@vger.kernel.org
Message-ID: <191f9dac0c2.2e194f4b1032616022.-8522403087218563043@zoho.com>
Subject: USB HID Usage Page 0x10 in evdev?
Date: Mon, 16 Sep 2024 01:02:28 -0700 (PDT)
X-ZohoMailClient: External
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

I'm writing USB HID device firmware and I can get evdev to detect HID keycodes in HID Usage Pages 0x07 (Keyboard/Keypad), 0x01 (Generic Desktop), and 0x0c (Consumer), where the scancode reported by evdev (MSC_SCAN) seems to be `p<<16 | k`, for `p` the Usage Page (specified in the Report Descriptor) and `k` the HID keycode; eg. AC Search has evdev scancode 0xc0201 (HID keycode 0x0201).

However I can't get evdev to detect Usage Page 0x10 (Unicode), which is just UCS-2 in the spec (eg. the evdev scancode for `a` in USC-2 should be 0x100061, where the USB device would send 0x61 and the Report Descriptor would be indicate Usage Page 0x10).

Perhaps this is because evdev only likes the keycodes in linux/input-event-codes.h?

However, /dev/hidraw* sees the Unicode data I'm sending just fine.
evdev seems to have no trouble with 16-bit keycodes either, as in the AC Search example above.

So can evdev detect keycodes in HID Usage Page 0x10 (and under what Usage)?

