Return-Path: <linux-input+bounces-8850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD99FFD3B
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 18:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 309177A19A1
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 17:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C318FBE65;
	Thu,  2 Jan 2025 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tBQiddaq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1F18871A
	for <linux-input@vger.kernel.org>; Thu,  2 Jan 2025 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840572; cv=none; b=cC4e5KKsWNNEVd9hCq+Z0ani0LayDFtrMU7a5r37FHIpi0eS+jHtlccp5ddLBkivA1HUAIgbAMkBGeLojeDtm/K/8PKThm4zsn8KokS5m5fxrT3JtrSd1lPjjb/0SwNjEnKZPYAv3Mh0hK2KT2eA0Rn8UDxIDMRCSmWoK+/LPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840572; c=relaxed/simple;
	bh=jwqn7hkBn/MM0uQyBUMUFlw8aFCtUD5BZfa5hzb9rHI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ijjQDHMrEs3DsUQT9aCtAUXHJR8nA+6WXg6RA72kxjiZhN5GkLhII8+Tpq1GWVfGEYbrW9Y4hIYImj1c+8UKI9dlzJsYxXZxHOny3c+GdZcn4ISTmzCive8ry+toZDk9AKXK/qJria15WEgdJzbh9wUCBmgsf6GRfVIw5jptamc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=tBQiddaq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e5946e.dip0.t-ipconnect.de [217.229.148.110])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E57142FC005B
	for <linux-input@vger.kernel.org>; Thu,  2 Jan 2025 18:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1735840188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z0gQ8OZYeLxLa1nQz36oAI5VvMWEr0zmr+ye/kc82ts=;
	b=tBQiddaqC32S9IqrVmu1qPcrUB6q/qqcUnNLsOtav7YSrzFhkjqvZFDdIAcfVcJ3Eib1Js
	SDZB67qGT6xhC3Ed+82A8ly5ciq8uEDFhS9vOPnDjYNsMYxY/5jQ2PyhTddSTDT4KtqssP
	06rb1z2wZKIGGmPssISHn1XX3utPvKk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <75f6f0bd-084d-48a2-b7d9-b8a05fa80f55@tuxedocomputers.com>
Date: Thu, 2 Jan 2025 18:49:48 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Fix strange media key for PS/2 keyboard in a driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

TongFang/Uniwill Notebook barebones have their internal keyboard connected via 
PS/2 and pressing the touchpad toggle media key sends the 3 key combo 
KEY_LEFTMETA + KEY_LEFTCTRL + KEY_ZENKAKUHANKAKU.

If it were a HID keyboard I could use a HID-BPF program to remap this 3 key 
combo to a singular press of F21 which seems to be the default for touchpad 
toggle and now I wonder if something similar is possible for PS/2 keyboards?

Kind regards,

Werner


