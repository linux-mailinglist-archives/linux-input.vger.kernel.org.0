Return-Path: <linux-input+bounces-13611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15FB0B9E0
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 04:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90AE5176D05
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 02:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E13F13D246;
	Mon, 21 Jul 2025 02:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UJc1DpeD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46A1288AD
	for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753063445; cv=none; b=YZroC6O+8bsXlKBvGbg1a23rgJHjcN0OmSfFzuU24oICvK6nZqkvuE3qWjxdzfPBDKCjbeODlYVXA0QWRNYXVHaIK65ceBYJ69IPaLsttyzGunlbAGNrGxUqAQrId16e4hP7cZRZF4tGN/aT4b/vG+aaI5g6qD6jHroxGXxcNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753063445; c=relaxed/simple;
	bh=MuOPTDgQU29247DLgY8+Lmyrxez7rrt9iyp3vKghqp0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKgu+EeVi/p/MZslu1ni7Z2ahbJ0H16CZidzEnqcwkqqu1QJahxcENVoJwHqU2uWMlWXda5vfsxPtM4ywoCD8e46wMfow5fa30x8sAv/TZq/I6AVqIbzDJaRKGJlT6CaJG4PMvbLl9+8MjIK7s/8sSI9qKERe8SJ+qdsf6nzHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UJc1DpeD; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753063441; x=1753322641;
	bh=DVoGha/incWcNsAyXcYxtSakFRN5uHI6li9pSOPUlhc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UJc1DpeDgXyi3vpoJDdoDZH8foIb9DgN6J4RUseF+GT4sJOcZWn+oA0ijMWOWVMEg
	 Hdpzn1RYHvsiXGmRhUGJk7OgExHig5dEnbyBxeD0ujRt1FZ0cBNwMeb99Lb7RZFP17
	 GWubMu3B2Io9WSQi9eZZ61lMlzcQTbllYXrkc3Tcwxa0n52Ws12Nr/DLu9kDUlW1cu
	 8G3sOWHdyaWbIc97c+r7JTVUzGGSRw+S/0XeeEUVLpmDpfXLVvx/4hxf2jFuakK1g4
	 hNpVBqVip4RcVNgewa2MzIAB02+1gPQFvrUCJgZ2rjiVikCylrzmQDkZ7Dkc0VwPTV
	 lHZOKnwC3OqGg==
Date: Mon, 21 Jul 2025 02:03:55 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 1/3] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250721020211.196394-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250721020211.196394-2-sergeantsagara@protonmail.com>
References: <20250721020211.196394-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 99781fe6b89aba0b964ec5d3474b3a36ab5492ff
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



