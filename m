Return-Path: <linux-input+bounces-3350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84D8B8B29
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 15:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED69D2837E4
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B8812EBC4;
	Wed,  1 May 2024 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTNPffqV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF012EBC0
	for <linux-input@vger.kernel.org>; Wed,  1 May 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570022; cv=none; b=pk8UUYpFZJ3uk/6Msq8l+S4DhjBNLS8q1rRD5pLNC32ULLIfvNua7QRTIiz6vZjBRpIr1EMxh3GzB5O67TjYaGA+/xF0sQPj8RUIbK/dCvLK2VQ2MQ1W4FqeHYRHVXJsE9BBYVpDTfVECEBC3fA8K8VEmxd2JYVweYNaCksrE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570022; c=relaxed/simple;
	bh=ehw6SAG+kbHsliF4OQ8Xm50055J6yx3+DlaZFnM29tg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lbcFPOdnPxlHQRAjhhFA/aBs5PSk/beujFLB0tJ/aG7CJsnEz4LUGPpfom3ovoGaHbkAkOO3TEISmN/uwgmbV5TC7SuPq4PNaR1TLCUH7Vjayxf+hO8kHva/QGBdRSZ6wUCshZtlEYNONVeTTS78oh3CpGXBS6jSQE8s9FTgQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTNPffqV; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61b028ae5easo130276777b3.3
        for <linux-input@vger.kernel.org>; Wed, 01 May 2024 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714570019; x=1715174819; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DBcVje7sQJG8s2uu2fApbOLUVVFcT0/1pZS1Vx+f9Y=;
        b=uTNPffqVlUqLjz+4jQmUnI5a0s4/9svKkZ7q3Xq9K4igc+YHeaqeK0fL+B55w91y6B
         Ws0eQFfS7SutYbDXBRzID+gUIKuRL9pQjQ9uCDf52iQLC5EoxTcofh3DGKsfZENz8Kqd
         ynpzjhOsyW7G1MWnMADNHCQ02mwVaxZ6qm7EFcgTs6SCsLvawFiHjVKx6/omS5TNXCx4
         nlzgLixhCgvllAHX067FwE2iVs1riNyLNT7R8Sow1HE5fl4Vm1dbDYCdIPGS29H9g7/u
         cxh2tbc/Gl3qn/BMWHz+kxJDx68QhRb6ZMdQjW6KKxvI9ZudKygzgHDzOaujEEU4Wu3r
         fteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570019; x=1715174819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DBcVje7sQJG8s2uu2fApbOLUVVFcT0/1pZS1Vx+f9Y=;
        b=jn0YJxRHlj+mKiPidMYoN8lv0T5iaHKVWgwTEOlZu/dT3ogDUVM89O6gC17c9ZFmmm
         2Ucph0BzzaSfW9ifZum80hboyaUioZxZkAP8sQdr12Sg2Qg1ISpCeWcpMu5MHopJUxbU
         snPr/c8kmt4GYR+rOiitkB8TMHDNhfaMSp74w/ORBY4ziu05V9PGLB5WP9Nd3TFQN9So
         3RTASb72mwdwRZ6Wqkrgriv7UoLkHl7sIbTHXDVFOAgDMVX+Fc3qfrLQqMsyNkI6Z83j
         SyLGm9s7fYgiyRQ2rvvZFqG/pVR4Y8Q7XOKs/CmwdVxSwCK7X+S3goKKNgIK4zNJyNUG
         5OFA==
X-Forwarded-Encrypted: i=1; AJvYcCVq8Rl7b4wYzWvJ/33XSyGM5/4vFYESfuHLE5Blq3byKzFH4QqXvzygTo0Qj9qX6DhAD0TMiFE5fZd9q0f5VpNM2QWVP4BGgxqJ5Ls=
X-Gm-Message-State: AOJu0YzVNNSDud0ZL6NpwkLFMtsVTGfHxXHz7prgm73J/t8h4lLHxmAU
	9o+02Qimpma7XdUatEbVFdG6NEewGHbsZ/c5pJSGDF46KRbr+gg0bO76ko4lpJlnF+e5BPbh8A+
	wyQ==
X-Google-Smtp-Source: AGHT+IEJWGpbrUgjXt0agMfxl6uH0KA2xXXQIskrVStdJjQn0+KbWAVgSKalUCRrBzWfmm3VN3uGF/mvoZE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:74d1:0:b0:de5:9ebb:bfc9 with SMTP id
 p200-20020a2574d1000000b00de59ebbbfc9mr716769ybc.9.1714570019532; Wed, 01 May
 2024 06:26:59 -0700 (PDT)
Date: Wed, 1 May 2024 06:26:58 -0700
In-Reply-To: <20240430235057.1351993-5-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com> <20240430235057.1351993-5-edliaw@google.com>
Message-ID: <ZjJDIlQCkzIjP189@google.com>
Subject: Re: [PATCH v1 04/10] selftests/kvm: Define _GNU_SOURCE
From: Sean Christopherson <seanjc@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 30, 2024, Edward Liaw wrote:
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c | 2 ++
>  1 file changed, 2 insertions(+)

Regardless of where this series ends up going, this patch can be dropped as I
already have a fix applied for all KVM selftests[*].

Thanks!

[*] https://lore.kernel.org/all/20240423190308.2883084-1-seanjc@google.com

