Return-Path: <linux-input+bounces-13867-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE248B1E203
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 08:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3191722DBA
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA34224B06;
	Fri,  8 Aug 2025 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="E0AnhSy0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6921FF53
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633625; cv=none; b=Ag5H/71eH+KpkxEqaRdxefXLb7NMfx1r0XWZ9iMXyjqcLxaOCfsvgZmzFn0Mz97VZblg0oCMpY0KYIpZiOwp0suIUNKD0Pnl+tEJUF6iFUIb0/lEG3WUbFl68idvO1I/kTsbFOt53+hGf+3OOyQWwezaxBUnyC8EDY8eYzWJoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633625; c=relaxed/simple;
	bh=MuOPTDgQU29247DLgY8+Lmyrxez7rrt9iyp3vKghqp0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5ZqkcXmYg9ZcfryrPz9BYiReK3sezbB0/y41fiTluL4r0zmGgZM+YGpBCaIMkXlofOZcBKOvccAWVZe6Y4wK8GL6Kg3fNFC0b1/fEuLzqOlQUXvlwAyDdd4bG5aJIc/eNOWv/ha7y9xMJvdQfo2kf8VwsqjI17VR8I/xXsHmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=E0AnhSy0; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1754633608; x=1754892808;
	bh=DVoGha/incWcNsAyXcYxtSakFRN5uHI6li9pSOPUlhc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E0AnhSy0hEoEfPK0zzuXvXFjJZ8CZFo06MDlyy+nRGDCXhrcQ3qxRrjDrLI3G3zDi
	 E4kI7ZXsOZ3ICsOGBo9HqhVRWZvmLxNO8RGz3AGrl8369pXo07hx1LrGQSggUi8AAf
	 aIH6+DrYxhodHKKXXjPtsv6GNclPFKuDXDGlgcF6YZ31nJAXtA2THhVnN0uhKz56Gl
	 qLHW88NODPg6NQluxu2KZVKZlV2HRtkVNDc2Kd6OC5L4RR7huHeAwno79zk7MF3HjS
	 lGP8fi32bcSbVsiTtxN/W8q+mvqD53ObtQ62yiUScBkR0g38BGKovLKmgO4VD2/Lui
	 ac2ae11zrZSww==
Date: Fri, 08 Aug 2025 06:13:22 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 RESEND 1/3] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250808061223.3770-2-sergeantsagara@protonmail.com>
In-Reply-To: <20250808061223.3770-1-sergeantsagara@protonmail.com>
References: <20250808061223.3770-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 3c9259ab252a89170e4c977dbb40d846bf2ca300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

name is never mutated by the core HID stack. Making name a const char*
simplifies passing the string from Rust to C. Otherwise, it becomes
difficult to pass a 'static lifetime CStr from Rust to a char*, rather than
a const char*, due to lack of guarantee that the underlying data of the
CStr will not be mutated by the C code.

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
2.47.2



