Return-Path: <linux-input+bounces-13506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5DB032FB
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE79D3A9FA9
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35AE1D63E6;
	Sun, 13 Jul 2025 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gNlgGDBM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A21D6193;
	Sun, 13 Jul 2025 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441108; cv=none; b=nDbade+vdPn6fG5fVK6OkBWQJueUqlqHr/wc/1UUt3SBqvI7lYajeV0IJJYOPwilZdr0Ke8Z3hqWOHLtrBw/0d/uy7lc7OrDVjL/bshbsJoMHDXzIZnw03rAK9xwm8gZMLCWLMLenEebISYXGMeqiRtBFjQyw7RZKeBcP1pDeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441108; c=relaxed/simple;
	bh=+qEhIEjz1UZnOBxpOKQhWwzvM5wk0kSPm/RSmYb628U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjcPrIl9RpRH+IebV+w+LMJshJXwKmD9K6NrXfm0BzFTu62zdjt+fokE5ENmAszmMltAGQXovqGQoBXasQa8HgipdBLrkhNEoBVKz6t7aTOYFuDQQZkIe8gobi0xqiC4snXL+HZV0cRCxj07CadzwoGv1UrKDy/9tFZYUirIo2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gNlgGDBM; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752441105; x=1752700305;
	bh=dyAXM5Qm1c/s8zVkjf8HD+Yu5rnPUGlAkthR0Bho1I4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gNlgGDBMwLP3FbhcX/k89ZFPEU2uXGtUifskb1l/DqD+O1pY04vZQ7uEMfD84yvUa
	 pE1G6NaPB7wDGy8lbGg/n7LNU5KKStGn3Hk1i/QCekKpP5SPteJPf0/a2IAaqGxOpJ
	 Y4ZRJWGex92sTmYymFRyjmK+9VLgvyoN8IryjBs827VtUOu64Hr+uMu4mHQiND+DaT
	 WC9uE0pePW3CHJ1ndO5mH/gtRfGxNWDx7x5DpOBKwCHKqF4oPq7fYxtJQpupGxGZB5
	 LtUTG7Fo77KA9znLmOx5XIgvKrZj+cuNO9ka9OtHyednNnqQWg6CR2lPI2OyHxJbSZ
	 SHlYNFF+WS3ew==
Date: Sun, 13 Jul 2025 21:11:38 +0000
To: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2 1/4] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250713211012.101476-6-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-4-sergeantsagara@protonmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 46359259541548f07b024f55a7f4367c44c886b8
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
2.47.2



