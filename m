Return-Path: <linux-input+bounces-3614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD608BFF8E
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8241F22809
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 13:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D4184DE8;
	Wed,  8 May 2024 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sChzYj2r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99284DF8
	for <linux-input@vger.kernel.org>; Wed,  8 May 2024 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715176485; cv=none; b=hR8w31pV5BYCh4dva8w207e3fzhmmTNrYpl2PFdlgcshLa2uMPnpPZSESclPK+v0YCPtTXVmTQ4PB+eolajCZsDVuJsQOv7KCRytCIH8ngv5YtGdWyS+iog6j4xB1IdQBWwzzulK6cidfNDniPnig3XmMWXPN811r9nNRKjG+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715176485; c=relaxed/simple;
	bh=c4rrNnRvo0cBlTP42xOOVWUGWry3TUGUYL7wXej88eM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G/j83NMMEw9nB2lSaS0wfEucalWwXFc6gq81Nhb6lOVDlwnulIpUGVeoqowkzL6kpVDBShseAOX4tH2hScWmkGInJ9MxeNtizQ91sEnXRSmV0VYbESo4k8tHlklvjtOuUpb1D+UeGn2PawGEFWEWTZJToLuw5j30IJVHkxPK6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sChzYj2r; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so5314113276.2
        for <linux-input@vger.kernel.org>; Wed, 08 May 2024 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715176482; x=1715781282; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrxifLi18HwIXN/paZijnWPdESXfJJzxe/+u8UtVff4=;
        b=sChzYj2rtzH+m82eJTwVi4o6/zZb4Tlo57BCb+n1FPzSPtq6p6xORd6/DYyI7qb5wx
         UIAsEztjkkh7Kk0ZcUkYVI7Keczqp57Eoy2dlm1HhY+gT7XI9MskBF90x3ohX5x57RMr
         /K6Em/fk4vBVDRGJLDa1BUOO5qbYbAJqvbq+reXWKTlKMSiyIaiF3vsAJTmdOeaR2wHU
         1plsfxD3xB3uD6q0MIa/idAEY33bOCWrKRLQylsaNnDzG2mFjvkjkHlW0BU3ZPWU9lcf
         hAI4kR0t1rm3WCfEMP/R+Doq90LDP6FOZ6/hdOBJRWc/btr+nMEmQ0RQQfu7qVl5XQ0n
         1k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715176482; x=1715781282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrxifLi18HwIXN/paZijnWPdESXfJJzxe/+u8UtVff4=;
        b=s/qGEvkKJjnHTn1xcOAwnpahFzbJ331t3+Up43+RLRFu1wHll5kbi/HER7S2BD4AmI
         5eX6Fi1a864hjFajl7/QBk/eNoqhDGDpIXPnaX/c524IChAlC4RxoZUdLWoHBSdmdjhl
         R05VDRgvWEtWI3L8cd2W69VIdU7NeWWX/bFx54K2R6CTU8hAKnWDtszLO7H8emYCZ+5R
         skbOfsjCnG+GrbO6vQIDDPT7z3Xswu5iPus/Wt5uFtYzRvQrs6GSu6MU8vwKaX4es9ix
         OkTvZ55kNg/KIcHJ+JdiCqzuxyul0nrdFS0pZyWxgQSj+SvQRRbw5EkyS8wyYdYyo7yO
         75iw==
X-Forwarded-Encrypted: i=1; AJvYcCV5DfIjdHxc6I+RJs5D9fvEfkyn6JWuNepjW7qzjBZQx5Bk4UqwNK7SLfp8BpJOk/TYHN5QclOyalGKTjJ5XdaaBLPmNUmFH2Sb7vo=
X-Gm-Message-State: AOJu0YziKwmulo2QXlPGxgw32a2g8Q82UGYaaAgU4dmmV3biKOO+oMLW
	Uvi+rYyOW9eqwvsfD8L40Vqu6rC51efS9ueAgrdeUCmCn6j915dA9ScCf9Y35K2HWFS1ln6WXGV
	VOw==
X-Google-Smtp-Source: AGHT+IGJRBi1UvMX9yVwIeeKPJ5i4MXrMA7fvNEnU0sh0JI0w6+2/9z2FlMIObyx5JUsUOMhiA6kQPpm0zI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18c8:b0:dd9:2789:17fb with SMTP id
 3f1490d57ef6-debb9cfd19bmr223701276.3.1715176481930; Wed, 08 May 2024
 06:54:41 -0700 (PDT)
Date: Wed, 8 May 2024 06:54:40 -0700
In-Reply-To: <20240507214254.2787305-5-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <20240507214254.2787305-5-edliaw@google.com>
Message-ID: <ZjuEILj0SZRuTL9I@google.com>
Subject: Re: [PATCH v2 4/5] selftests: Drop define _GNU_SOURCE
From: Sean Christopherson <seanjc@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, "=?utf-8?B?QW5kcsOp?= Almeida" <andrealmeid@igalia.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Seth Forshee <sforshee@kernel.org>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"Andreas =?utf-8?Q?F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, May 07, 2024, Edward Liaw wrote:
> _GNU_SOURCE is provided by KHDR_INCLUDES, so it should be dropped to
> prevent _GNU_SOURCE redefined warnings.

...

> diff --git a/tools/testing/selftests/x86/test_syscall_vdso.c b/tools/testing/selftests/x86/test_syscall_vdso.c
> index 8965c311bd65..5cd13279bba5 100644
> --- a/tools/testing/selftests/x86/test_syscall_vdso.c
> +++ b/tools/testing/selftests/x86/test_syscall_vdso.c
> @@ -8,10 +8,6 @@
>   * Can be built statically:
>   * gcc -Os -Wall -static -m32 test_syscall_vdso.c thunks_32.S
>   */
> -#undef _GNU_SOURCE
> -#define _GNU_SOURCE 1
> -#undef __USE_GNU
> -#define __USE_GNU 1

AFAICT, manually defining __USE_GNU is frowned upon, so I'm guessing the __USE_GNU
stuff is just the result of misguided copy+paste.  But it would be nice to get
confirmation that this test isn't doing something clever.  Or at the very least,
explain the removal of __USE_GNU in the changelog.

>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <string.h>

