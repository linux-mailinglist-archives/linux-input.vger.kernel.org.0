Return-Path: <linux-input+bounces-14379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E024B3BA17
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 13:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC20756497C
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 11:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8FC238C0A;
	Fri, 29 Aug 2025 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="tZOwSSsg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-107163.simplelogin.co (mail-107163.simplelogin.co [79.135.107.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE22D23B6
	for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756467881; cv=pass; b=RoWdZpVT4zStp/bGJOVy3LvfePgkefa/Km42p9RCwn/g3TmyUztn7+MHDmh2CnENfKBPZrewTVbsf2QTPwUq7uXKQtjSpG1qPXxPXyhXRkXY6eEDv1MlKYYexSvdBNqDCCS14nZKPSbvtHIrFWNXt7opv7MYbeJUvTlqyT6JZc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756467881; c=relaxed/simple;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Cc:Message-ID; b=ejfJXkkL+ltRpkVjbVp6u/o8wCZCc7EnV9LVhk/R+4E43vdqrUaV+ZG42mOSDfr5eb5LFTO9rwfmbgQfM0uZWZ+2u4/jxKJK6rXVMdWeiJtWZu8pKAoU8BM9RAGxVa6WUYWDg3z00P6Ikv46w8Zr1lNx0j01cv5v7CSJyASlOpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=tZOwSSsg; arc=pass smtp.client-ip=79.135.107.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1756467386;
	cv=none; b=eg+7Hmgpi8kkWdkOVShX05+BH1zQKMYH1FdWay5T7Ghg34cOLAGJzHcuW+lMFZVjhWDcAbxfR1jv1FS0FLZhPrBpyMH4q4u3mKshwnTBZh23k+HupKEmIl1KhS2+0C+1CX9XMmwLxzn6gdUWVy+1NGu/8vUENKQIv0PfBbrDDvoFmLXCtawLTwC6QY2C+sxFGaIXlyD534PYVe6zFY2Ve8n2/O/QZKpkyE8tOL0U9UA+6pxcttc9szKAuK5XkfbL5FPlO0tGpsSYlYpp9+9d0PyBjtn41zKa+uPhPPofzGQEqs8LEfP5MoYuYab3Gs8IFV0rOuJ4Mxq8nfDrXOhl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1756467386; c=relaxed/simple;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	h=Date:Subject:From:To:Cc; b=ZA14LfaVkc9ZJSIdA3JvzyDgwAStkmFyQInymtb3fJkxvpfumsuo0/jhPUEi1KOC+vJk4D7yP8fAQz2LiK/kLhGJbTdes/ExfzpLE1g/J7w3EPgZUEIqg6HiSdSv71e5DrU/8C5u746DOyzUw0VE9Igl1sLB+n7hDRGNV5UACL/XGx41zfZxynrxMmQhdtnbZ7yhl5evxilbPWpmYhonabxWhi2s3OvKB6+dss/bS+rYl1c/9qhmhi3OyNRZUAVVWfp2gs/tdKYiy4lj8lvbyrJrYAuNvzENya64AVoCFka65LQUH80IcoUlE1CEVZ+PHCCUtwQ/PWQexjGDpKZYtw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1756467385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	b=tZOwSSsgfy8absNd70V+JrivExQ6dR+NX5OiLxQIWQk1mNBx9tumT2CHuQCJlXet1yeoCR
	m2HLNmK4MH4nBrT6P07xO+LJM0MPlg8/ugaqrLdCHHpdqoN+hczGbKCa5AUdsXBmox7tgv
	mDzVOffzaUjNOEmL7SB6R4WXLpX8sk4=
Date: Fri, 29 Aug 2025 11:36:18 +0000
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055";
 charset=utf-8
Content-Transfer-Encoding: 7bit
From: Mathieu <mathieug.rsbog@slmail.me>
To: stable@vger.kernel.org
Cc: 
 regressions@lists.linux.dev,dmitry.torokhov@gmail.com,linux-input@vger.kernel.org
Message-ID: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 877606795
X-SimpleLogin-Want-Signing: yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055
Content-Type: multipart/mixed;boundary=---------------------2a429f09b9a235ef4171a0b772069893

-----------------------2a429f09b9a235ef4171a0b772069893
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Note:
The issue looks like it's from tty directly but I don't see who is the mai=
ntainer, so I email the closest I can get

Description:
In command line, sticky keys reset only when typing ASCII and ISO-8859-1 c=
haracters.
Tested with the QWERTY Lafayette layout: https://codeberg.org/Alerymin/kbd=
-qwerty-lafayette

Observed Behaviour:
When the layout is loaded in ISO-8859-15, most characters typed don't rese=
t the sticky key, unless it's basic ASCII characters or Unicode
When the layout is loaded in ISO-8859-1, the sticky key works fine.

Expected behaviour:
Sticky key working in ISO-8859-1 and ISO-8859-15

System used:
Arch Linux, kernel 6.16.3-arch1-1
-----------------------2a429f09b9a235ef4171a0b772069893--

--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmixkKQJkOLfGQMiQb0dRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfTkqPJNkGeCHWxoJzCDGaTeoq+AMlCzt0LqPcI
IlruHRYhBA/2MWvcJ0ye/0b56OLfGQMiQb0dAABIgAD+NuL4jcK/RKvUdskM
n6FkZTldQiUuCyUrX4G4YHVuyfoBALiduiZYfYIiL1itze8hd9zWWXnCF7HV
3bIzIlVhQQ8C
=BCRE
-----END PGP SIGNATURE-----


--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055--



