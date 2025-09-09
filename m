Return-Path: <linux-input+bounces-14575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF3B50933
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 01:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AE7417B5B4
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 23:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFD4DDC3;
	Tue,  9 Sep 2025 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIf+b974"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01326CE06
	for <linux-input@vger.kernel.org>; Tue,  9 Sep 2025 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757460300; cv=none; b=G+Cq4NQYr4lXXItvT9lfevlAzUlHHN9uKgGxcb7CAiyIwj+uq+rk+UKz0UZBuKQy+EcUf3HkNSnAcBnBuPrlBht1Rdz3d9PrmTWEv0k18OgzbTxgMYUFVUnbxqZKDyfLlvPLlDXvt7S12NIRisaLQ+V+rHFimnMh1IAy70lCMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757460300; c=relaxed/simple;
	bh=U6rhzIQoLr5l4huw1E6UMiaK90AfFdQHuzu0H/oSbck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHYIZrBih8XznWPMyHUJGiChDp7I/2nLmd1eXL2qt/uy4nQtj+aVy5q/4CbeUdjfGroxolR/cx8Jo4jKdpFcrpBDuIDGFqstpfDrH8YOv2VUWXrptjHnGT1XHRi+Vbpbvez1LufwbNVp71x/+/DTUdXSbbeMPqbntsuvghCBH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIf+b974; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3dae49b117bso5458721f8f.1
        for <linux-input@vger.kernel.org>; Tue, 09 Sep 2025 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757460297; x=1758065097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6rhzIQoLr5l4huw1E6UMiaK90AfFdQHuzu0H/oSbck=;
        b=EIf+b974dhqUa2wQlRCAdN8twBk56xLsDa7pvkgDlEO/QgKdgEM1yyK0qalJW773fx
         SsFo07HURKLkzuFzHwBCqLOg0HT0QAoCUf7CxrHEw19+rcovEiDYHyFPNFgdGleqqd9B
         uD33UtyPjY005dfas8JkmnKeNv8Mpb5Ph84VlaI6vU1cqwk9xlQBYPIsAgYSfOrDX/4m
         azKK/HtQEnHkPWJgRtc7i7oaeFNEKFnITMHDJyjhGwbNx3KoEVMgUGANsWndTVUqZ4pX
         nK6t4sb9XoevpCcHjPT4tpYXoMf9eLJI761/JVgEVODw4ZGWlFdp0bhy+E0KAPowuwLB
         cnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757460297; x=1758065097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6rhzIQoLr5l4huw1E6UMiaK90AfFdQHuzu0H/oSbck=;
        b=k9pxiBlYwcoIpmedgOLIHXsJODDv++UpkkigGHmv1j4Xm1EEdMr1/Zeyo2529Obrqi
         NbSQCSW0U5jiym5kVQ7I1ypzkTQgxFU76roy7saG9c1F+ion8QKESj7XyhijmNph11iY
         uhRchtEdcCoHp6ERgOb/J+sGepzegb1Q8bAlTseJFd1WdleE2wCfbRrEoSKsrQtUDdqn
         RxK2+z4lD5Nz1g34DUarptkce58ODMsq/Fs1g7jxLn8qrgNJ13gifMDvtbwnrQMvbZMH
         hHXC/JVfo60Bd18SXm0+JATduVXVNNrJPCzQUXHe2tNLCyMtB/x0wxvBBN/1c/fUv5rJ
         YuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuOT0QyTMAleiTIHs3ynToR0TnJhWe54a6TQgZr1snsnJPojh1hpBpsuv+xgVOUf8Ony/IMElgCu7GAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySNN/vAXXK1CKQyV/6ljr8InVFUHNpLGt7jg3I1/7sxgd3ap86
	ljMINp3tBtndRZdBXpwD2OidfTWcXkp5eVYXu10+NxmPQnlwUNtjb+eZckEGKWtFzGkSiph7soc
	1NT1MZSRPFmAVYj98T1Ez3MaN1TGqOtc=
X-Gm-Gg: ASbGnctTjglIjLsA4owLyP6PC+AfIqEQTAooKpdutBzA/ZvG4wziJT3U2L4fNlEO11d
	K3QMYJ0NLSMP+UI/Vgkp5Cp5PUqb0UsWwe+fSPkvfSWm98/22qjuFCCuyx4dpBY0nOhT12sG8mb
	BM2WAxmyNmixD5JPtcy287n+fSaRedpEfG72Njz1A8ezpkX24dguC4F0MfQouixme/5kiqXOYCR
	XXq4zOjUpyURfIP+T2qK/LJ99CoGVWV5ldd8HanVNkTPNBPqlA=
X-Google-Smtp-Source: AGHT+IH1ANyGsEL3rF7MA4hn+rNsXfh3YSt/io6rGhgKmgsXRJtusS9P8O1z4OeA+d7I/8qB0ZdvJ0Qdnhd6yJrTZHM=
X-Received: by 2002:a5d:5f46:0:b0:3d1:61f0:d26c with SMTP id
 ffacd0b85a97d-3e64cb6c629mr10595692f8f.54.1757460297393; Tue, 09 Sep 2025
 16:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
 <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
 <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
 <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
 <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
 <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com>
In-Reply-To: <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Wed, 10 Sep 2025 00:24:46 +0100
X-Gm-Features: AS18NWCl8qYhZtbtdqZzQ_1rrYzHRPCi2fm5ZsAtNGULeQrLHJ_ynsZBp9BIHeg
Message-ID: <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

> Can you try applying the following?

Yep, this on top of the v4 patch works as expected.
Thank you for getting this working.

Tested-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks,
Stuart

