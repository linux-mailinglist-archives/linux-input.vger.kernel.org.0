Return-Path: <linux-input+bounces-14681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C357B56228
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 18:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA6791B27385
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 16:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D4E2ECE96;
	Sat, 13 Sep 2025 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="b+dgBnBA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038E2C21F0
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757779984; cv=none; b=VykIyC3Ebf/tExb74Wx9EKyI+ffO2vUwX3w0PiD23KVA+CqXNoZtckMSEsRvqOHkXzsM0RQtfFw3JOwXzC7BER3JAMDzME4hcZAJGbb7CuBeh6SPzGoG5x039H+pOehdZEGvAUp/BWiCjf1fYExNHB91cUBsER1Kp/+TmIrzHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757779984; c=relaxed/simple;
	bh=MuOPTDgQU29247DLgY8+Lmyrxez7rrt9iyp3vKghqp0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNLMzV7000UvHDqwmryrRcFD+o9EakrbWfyXY8/uW+r/12LREg4daX56PcZrD+St61Yr88J3lPAVHHhzRad8o9SsexDCuid8PS45s1ev8fDBZ17A21N8sjr7+eLTYsG8ILFN7hyzBxBzgwTouf+OGlT6k5nP89GMNSEqetfSdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=b+dgBnBA; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757779979; x=1758039179;
	bh=DVoGha/incWcNsAyXcYxtSakFRN5uHI6li9pSOPUlhc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b+dgBnBAdYiEhr2DzQXP1fBwGw6setLzJEDt6Y0B9frePGdlbmbDVPNh3TCtzrL52
	 c5xiB0t7ivjft+feyicAo/q1RvFsDfcw/rhik8h2fossuurd/srH3FlfVeK8taQ3kT
	 crU0CRpUi3vLKml+y/qbptXIOj1MnJOng5QhL0HVXbT6Z0N1qPWLEwHd88wVwaykYf
	 sdQBMKih/UwzKMDiUDptBPoU4OQ3mXy1zmwjIpZO3zaA9n9BmcRT/lGHFB+EgBdeB1
	 dUUavY81+/KIOroFS2OAdRhl9vbVrsWq5GSCQ6cOxgK+tK2w0z98SRmiLeN4Xr2JVA
	 NBGIAy5JAO/jw==
Date: Sat, 13 Sep 2025 16:12:54 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 RESEND RESEND 1/3] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250913161222.3889-2-sergeantsagara@protonmail.com>
In-Reply-To: <20250913161222.3889-1-sergeantsagara@protonmail.com>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 7a44fdbd84a01e3d90b6cdc77a694e065a18ca5d
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



