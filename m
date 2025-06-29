Return-Path: <linux-input+bounces-13161-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2381AECB4F
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 06:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30E91895CCA
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 04:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87D1BC9F4;
	Sun, 29 Jun 2025 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xXvTpMLd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B71AF0B5
	for <linux-input@vger.kernel.org>; Sun, 29 Jun 2025 04:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172690; cv=none; b=Gwz7bnU9Yqmg3tSR4taFMiuuA0KfFYuar0xlH3zZWujVwcFWcKtkENqzlDDxCKrFACOdqIkWz8V0L/Xy6c0GeoLYUuxJvJ1UqucUBqdUq5+myJOCgEC+SGdYR2Iggnn8X0Ze6xuiKCFj9RP7voTb037ock+1Tt/qVSZwvwic/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172690; c=relaxed/simple;
	bh=Mj7SO4tqmYZznwN0Rq6W8ehsUpN5BBmAX/n/sUh0nkE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kE09EJdctcMZB13bsJBv4/GnLvvy9nEXhRGCD8OCXyzNU1XNASQkVZmXMEPjOdsX6bvPdwxAyXNKBeIgghFrO2Eh3OUhwgqTcCgJ4ZI0hE2Bo8aoviJfZuEqcBu7J1TjQ5k1gT8a5ZQ74sh20w/BlQ/vwLKIpqM9dBq5HViwiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=xXvTpMLd; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751172673; x=1751431873;
	bh=hXW9jkr8lqMaLGY2z0MH+sluarRt7NCbYJGIyuwPVk4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xXvTpMLd5g7la6UAbH3Hm27ZnvgfgrB8qvDvuMy4rcZin9E94Qk02h9oo16OO030F
	 HjAUzrr+N7N+D7uVlPCQcB01whB9b9kT3RQ0DE7mb3D4WRoj4swcdq210OhwuCBb0/
	 LdUTBa9QaRiSgva+LLtxKeMnFCYDqKy32LsiIrFuQtyOj+zqZcR1Wix+HqTbNUMko3
	 hjC6y1Gq+oL49o0P799SHBWcsg0QQ8wTxT6ncohwTv1tSAnKnWeeNpqXRvnFLUiFVj
	 ufOtvcUVbCLoWc3GUTiE5o0wa1q0CPg5IwolulUET2VfpBRlQqfCoL/qeWxsY1uWs0
	 lAT46AaCetdtA==
Date: Sun, 29 Jun 2025 04:51:07 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Brooks <db48x@db48x.net>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v1 1/3] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250629045031.92358-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250629045031.92358-2-sergeantsagara@protonmail.com>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 73f27f073a7bb02c70ce0f2be48430df9cdda8e0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

name is never mutated by the core HID stack. Making name a const char*
simplifies passing the string from Rust to C. Otherwise, it becomes difficu=
lt to
pass a 'static lifetime CStr from Rust to a char*, rather than a const char=
*,
due to lack of guarantee that the underlying data of the CStr will not be
mutated by the C code.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749b..d65c202783da 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -816,7 +816,7 @@ struct hid_usage_id {
  * zero from them.
  */
 struct hid_driver {
-=09char *name;
+=09const char *name;
 =09const struct hid_device_id *id_table;
=20
 =09struct list_head dyn_list;
--=20
2.49.0



