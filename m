Return-Path: <linux-input+bounces-8833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BF9FF442
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 16:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917891881A51
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 15:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92A31E1C36;
	Wed,  1 Jan 2025 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="GazSQofG"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F71773A;
	Wed,  1 Jan 2025 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735744758; cv=none; b=pxNv4u3Q8Kt2W9q5vO4XD/hMWtfg5dAQ6uULd4Ds2yzWw2xQxPA8UBLRTsEPtLJgUM69d9CCP/aZOlctBRSDxUl8qb7MNFYasHm5piXeoZVYJLoSPudaPeFMTc+uZ+yeGkESd3BncZG9M/auzjEIa6YFOveSCUxGk+S8Izx9J28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735744758; c=relaxed/simple;
	bh=PH7KoEklMA4bvqCUSnFpCq4dn0tScIL6ENdt8ibtYcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fguMSRUI5N1HWuQKLcBgNXjLDKyEKfyFw01Cmy8JVMHzOIrP+VpEHamGxqq4hJV6ZnlrHGUVnyVW+ymdSxYgQGgD+KkaCE2cKOg1MpnoolYeyxhuN8c4hpRZ1x8xHfaEWT6fjKs4ZKibGaurD8IWO/xQn+vlcBjUl9bUMkJqHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=GazSQofG; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4YNYHr62Fqz81tp;
	Wed,  1 Jan 2025 16:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1735744392; bh=PH7KoEklMA4bvqCUSnFpCq4dn0tScIL6ENdt8ibtYcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GazSQofGiLLDx++JN2CAFv9kXnmG3/zIssdadqijO+0OciqYkUPgcgYVKAhIERIIx
	 Ux0XOdUJRrRFtyiBGVDshwExel5MjdEko2+xKixF7j/w5pwYK0470HA3W94d9nwTaz
	 8wiBvFEIkFfrlXwC/vxNp2aqWwjqooIN/M3gTiHPAV0V15vEcLsobQD/9rISS2hw+9
	 QKVVd6vMm7n7uPw1+C3/8rbVkg8ZWI+Kq9fjfTb9/BH2Lspl/gJdTsvgKv6HLXbiTo
	 YGHeQrRk2gZRwQUoKnhtj51h6YPBIMBsAwGafd/pW9DqcaQXZVL0RJOvv0e6wr7Dh0
	 gOt5iZgBNeEtQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4YNYHr5d32z4xYq;
	Wed,  1 Jan 2025 16:13:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YNYHr2W9Gz8tXZ;
	Wed,  1 Jan 2025 16:13:12 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id A97DE1C0130;
	Wed,  1 Jan 2025 16:13:07 +0100 (CET)
Authentication-Results: mxe85d;
	spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=git@mayer-bgk.de smtp.helo=localhost.localdomain
Received-SPF: pass (mxe85d: connection is authenticated)
From: Christian Mayer <git@mayer-bgk.de>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 0/3] HID: steelseries: add SteelSeries Arctis 9 support
Date: Wed,  1 Jan 2025 15:11:31 +0000
Message-ID: <20250101151209.100072-1-git@mayer-bgk.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173574438805.16895.14945212797904668144@mxe85d.netcup.net>
X-Rspamd-Queue-Id: A97DE1C0130
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: 38F5Fpchtv/0VxcqGE5Y660vWGsyGzrvUxq/YpnEGwXOekypVDw=

Hi,

i added support for the SteelSeries Arctis 9 headset.

HID: steelseries: add SteelSeries Arctis 9 support
HID: steelseries: export charging state for the SteelSeries Arctis 9 headset
HID: steelseries: export model and manufacturer

drivers/hid/hid-steelseries.c | 138 ++++++++++++++++++++++++++++++++++++------
1 file changed, 120 insertions(+), 18 deletions(-)

Christian


